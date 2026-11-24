#include <stdio.h>

/*
    This program will print its own source when run.
*/

void required_func() {
}

int main() {
    /*
        This program will print its own source when run.
    */
    const char *str = "#include <stdio.h>%c%c/*%c    This program will print its own source when run.%c*/%c%cvoid required_func() {%c}%c%cint main() {%c    /*%c        This program will print its own source when run.%c    */%c    const char *str = %c%s%c;%c    required_func();%c    printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);%c    return (0);%c}%c";
    required_func();
    printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);
    return (0);
}
