#include <stdio.h>

void countDown() {
    int x = 0;
    while(x<10) {
        x++;
    }
}

int addFunc(int a, int b) {
    return a+b;
}

int main() {
    printf("5+2=%i\n", addFunc(5,2));
    countDown();
    return 0;
}