/*
    This program will print its own source when run.
*/
#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define DNA "..."
#define PROGRAM int main() { \
    const char *kid = "/*%c    This program will print its own source when run.%c*/%c#include <stdio.h>%c#define FILENAME %cGrace_kid.c%c%c#define DNA %c...%c%c#define PROGRAM int main() { %c%c    const char *kid = %c%s%c; %c%c    FILE *file = fopen(FILENAME, %cw%c); %c%c    fprintf(file, kid, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 92, 10, 34, kid, 34, 92, 10, 34, 34, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10); %c%c    fclose(file); %c%c    return 0; } %c%c%cPROGRAM%c"; \
    FILE *file = fopen(FILENAME, "w"); \
    fprintf(file, kid, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 92, 10, 34, kid, 34, 92, 10, 34, 34, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10); \
    fclose(file); \
    return 0; } \

PROGRAM
