
CC=$(GCC)
AR=mipsel-openwrt-linux-ar


all: libRKLed.a libRKLed.so
	@rm *.o -rf




libRKLed.so: RKLed.o RKLedio.o 
	$(CC) -Os --shared -fPIC -o $@ $^ ../../../common/src/RKGpioApi.c -I. -I../../../common/include/ -lpthread


libRKLed.a: RKLed.o RKLedio.o
	$(AR) rc $@  $^ 

RKLed.o: RKLed.c
	$(CC) -Os -fPIC $^ -I. -I../../../common/include/ -c -o $@

RKLedio.o: RKLedio.c
	$(CC) -Os -fPIC $^ -I. -I../../../common/include/ -c -o $@


clean: 
	@rm *.so *.a -rvf
