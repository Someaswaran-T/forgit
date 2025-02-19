#include <stdio.h>
#include <stdlib.h>

int main() {
    int n, flag = 0, valid = 0;
    char v[10], t[10], e[50], ch;

    printf("Enter the total number of variables: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("Variable[%d] name: ", i + 1);
        scanf(" %c", &v[i]);
        printf("Variable[%d] type (f for float, i for int): ", i + 1);
        scanf(" %c", &t[i]);
    }

    printf("Enter the expression (end with $): ");
    int i = 0;
    while ((ch = getchar()) != '$') 
        if (ch != '\n') e[i++] = ch;
    e[i] = '\0';

    flag = (strchr(e, '/') != NULL); // Check for division operator

    for (i = 0; i < n; i++) {
        if (e[0] == v[i]) {
            valid = 1;
            if (flag && t[i] != 'f') 
                printf("Data type of variable '%c' should be float.\n", v[i]);
            else 
                printf("Type is consistent.\n");
            break;
        }
    }

    if (!valid) 
        printf("The variable '%c' is not declared.\n", e[0]);

    return 0;
}
