.SUFFIXES : .x .o .c .s

LIB += -L$(STAGING_DIR)/usr/lib -L../lib -Lled  -L./
INC += -I$(STAGING_DIR)/usr/include -I../include -I../../common/include -Iled
CC = $(GCC) -O2 -g -D_LARGEFILE64_SOURCE=1 $(INC)
LDFLAGS=$(LIB)

TARGET = alexa_run_demo
SRCS := plugin_alexa.c \
		audio_player.c \
		capture/audio_capture.c \
		capture/audio_queue.c \
		../../common/src/RKIoctrlApi.c \
		../../common/src/RKGpioApi.c
	
EXT_LIBS= -lpthread -lcurl -lcJSON -lcJSON_utils -lrkaudio -lavio -lzl380tw -lcrypto -lssl -lnmedia -lm -Wl,-dn -lavs-full -lRKLed -Wl,-dy

all:
	$(CC) $(LDFLAGS) -o $(TARGET) $(SRCS) $(EXT_LIBS)
	$(STRIP) $(TARGET) 

clean:
	@rm -f $(TARGET) *.o -v  
	@make clean -C led	
