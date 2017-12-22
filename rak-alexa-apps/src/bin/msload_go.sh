#!/bin/sh
#cd /usr/bin
NABTO_CONFIG_FILE=/etc/wiskey/nabtonat.conf
NET_IF=ra0

#
# set Nabto ID
if [ -f $NABTO_CONFIG_FILE ]; then
NABTO_UUID=`awk '{if ($1=="nabto_id") {print $2}}' $NABTO_CONFIG_FILE`
NABTO_KEY=`awk '{if ($1=="nabto_key") {print $2}}' $NABTO_CONFIG_FILE`
fi

SetNatP2p()
{
	if [ -f "/sys/class/net/$NET_IF/address" ]; then
		HWaddr=`cat "/sys/class/net/$NET_IF/address" | awk -F: '{print $4 $5 $6}' | awk '{print $1}'`
	
	else
		return 1
	
	fi
	if [ ! -f $NABTO_CONFIG_FILE ]; then
		NABTO_UUID=wisap.$HWaddr.p2p.rakwireless.com
		echo "nabto_id $NABTO_UUID" > $NABTO_CONFIG_FILE
		echo "nabto_key $NABTO_KEY" >> $NABTO_CONFIG_FILE
	fi
	sync
	IsProcRun=`ps | grep "unabto_tunnel" | grep -v "grep" | sed -n '1P' | awk '{print $1}'`
	if [ "$IsProcRun" != "" ]; then kill $IsProcRun; fi	#kill ID
	if [ -f $NABTO_CONFIG_FILE ]; then
		if [ "$NABTO_KEY" == "" ]; then
			unabto_tunnel -d $NABTO_UUID -s > /dev/console 2>&1 &

		else
			unabto_tunnel -d $NABTO_UUID -k $NABTO_KEY -s > /dev/console 2>&1 &
		fi
	else
		echo "Can't find $NABTO_CONFIG_FILE" > /dev/console 2>&1
	fi

	return 0

}	#SetNatP2p

# set pin for zl38062 reset pin
echo "36" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio36/direction
echo "1" > /sys/class/gpio/gpio36/value

MODULES="zl38067tw"
for module in $MODULES
do
	DRIVER=""$module".ko"
	RUN=`lsmod | grep $module`
	if [ "$RUN" == "" ]; then
		insmod $DRIVER
	fi
done

luci_service -p 9999 > /dev/console 2>&1 &

alexa_run_demo > /dev/console 2>&1 &

cd /mnt

while [ 1 ] 
do 
	lo_status=`ifconfig lo | grep "UP"`
	ra0_status=`ifconfig ra0 | grep "UP"`
	if [ "$lo_status" != "" ] && [ "$ra0_status" != "" ]
	then
		echo $lo_status > /dev/console 2>&1
		SetNatP2p
		if [ $? == 0 ]; then break; fi
	fi
	sleep 1
done

