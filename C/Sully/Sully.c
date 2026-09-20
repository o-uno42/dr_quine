#include <stdio.h>
#include <stdlib.h>
#define PROGRAM int main() { \
    const char* dna_str="#include <stdio.h>%c#include <stdlib.h>%c#define PROGRAM int main() { %c%c    const char* dna_str=%c%s%c; %c%c    int i=%d; %c%c    char filename[10]; %c%c    char dna[4096]; %c%c    const char *name=%cSully_%c; %c%c    const char *extension=%c.c%c; %c%c    i--; %c%c    sprintf(filename,%c%%s%%d%%s%c,name,i,extension); %c%c    sprintf(dna,dna_str,10,10,92,10,34,dna_str,34,92,10,i,92,10,92,10,92,10,34,34,92,10,34,34,92,10,92,10,34,34,92,10,92,10,34,34,92,10,34,34,92,10,92,10,34,34,92,10,92,10,10,10); %c%c    FILE* sully=fopen(filename,%cw%c); %c%c    fprintf(sully, %c%%s%c, dna); %c%c    fclose(sully); %c%c    if(i>0){char cmd[4096];sprintf(cmd,%cclang -Wall -Wextra -Werror Sully_%%d.c -o Sully; ./Sully%c,i);system(cmd);}; %c%c    return 0; } %c%c%cPROGRAM%c"; \
    int i=5; \
    char filename[10]; \
    char dna[4096]; \
    const char *name="Sully_"; \
    const char *extension=".c"; \
    i--; \
    sprintf(filename,"%s%d%s",name,i,extension); \
    sprintf(dna,dna_str,10,10,92,10,34,dna_str,34,92,10,i,92,10,92,10,92,10,34,34,92,10,34,34,92,10,92,10,34,34,92,10,92,10,34,34,92,10,34,34,92,10,92,10,34,34,92,10,92,10,10,10); \
    FILE* sully=fopen(filename,"w"); \
    fprintf(sully, "%s", dna); \
    fclose(sully); \
    if(i>0){char cmd[4096];sprintf(cmd,"clang -Wall -Wextra -Werror Sully_%d.c -o Sully; ./Sully",i);system(cmd);}; \
    return 0; } \

PROGRAM
