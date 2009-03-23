#include "agps-download.h"
#include "datalogger.h"
#include "lowlevel.h"
#include <stdlib.h>

int main(int argc, char *argv[])  {
    int fd;
    int speed;
    agps_data data;

    fd = open_port("/dev/ttyUSB0");
    speed =   skytraq_determine_speed(fd);

    printf("opened device with %d bit/s\n", speed);

    if ( skytraq_download_agps_data(&data) ) {
        printf("sending data...\n");
        skytraq_send_agps_data( fd, &data );
        free(data.memory);
    }


    close(fd);

    return 0;
}

