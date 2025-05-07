#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void LetGo(void) {
    char* her = malloc(16);
    if (!her) return;

    strcpy(her, "you");
    printf("Miss %s\n", her);

    asm volatile (
        "movq %1, %%rax\n\t"
        "movq $0, (%0)"
        : "=r" (her)
        : "r" (her)
        : "rax", "memory"
    );

    if (her) {
        free(her);
        her = NULL;
    }

    printf("Memory says: %s\n", her ? "Still here" : "She's gone...");
    printf("But in heart: Unforgettable...\n");
}

int main(void) {
    LetGo();
    return 0;
}
