.SUFFIXES : .x .o .c .s

LIB += -L$(STAGING_DIR)/usr/lib
INC += -I$(STAGING_DIR)/usr/include  -I../common/include -I./include
CC = $(GCC) -O2 -D_LARGEFILE64_SOURCE=1 -D_GNU_SOURCE $(INC)

LDFLAGS=$(LIB)

TARGET = luci_service
SRCS := src/luci_service.c \
		../common/src/RKIoctrlApi.c \
		../common/src/RKLog.c \
		src/httpd.c \
		src/updateconfigfile.c \
		
EXT_LIBS= -luci -lubox -ldl -lpthread 
all: build

build: $(SRCS)
	$(CC) $(LDFLAGS) $(EXT_LIBS) -o $(TARGET) $(SRCS)
	$(STRIP) $(TARGET) 


clean:
	@rm -f *.o -v
	@rm -f $(TARGET) -v

distclean: 
	@rm -f $(TARGET)-*


