/*
Mikroprozessortechnik - Praktikum 1 Aufgabe 1
Print to Console
Autoren: Emily Antosch und Florian Tietjen
Beschreibung: Dieses Programm gibt eine geordnete Ausgabe eines Zählers, eines Namens und einer Matrikelnummer in der Konsole aus.
*/


#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"
#include <stdio.h>
#include <stdint.h>

int main(void)
{
    int i, cnt; // Initalisierung der Varibalen

    cnt = 0; // cnt beginnt bei 0
    char B, C, D;
    char A[] = {0xAA,
                0xBB,
                0xCD,
                0xFE};
    char *p = &A[1];

    B = *(p--) & 0x78;
    C = *(p + 2) & ~((1 << 3) | (1 << 7));
    D = *(p + 1) | 23;
    printf("%hx\n", B);
    printf("%hx\n", C);
    printf("%hx\n", *p);
    printf("%hx\n", D);
    // Dauerschleife für den Zähler
    // while (1)
    // {
    //     printf("%05d\n", cnt); // Ausgabe des Zählers
    //     printf("Name: Emily Antosch \n"); // Ausgabe des Namens
    //     printf("Matr.No: 2519935 \n"); // Ausgabe der Matrikelnummer
    //     cnt++; // Zähler erhöhen um 1
    //     for (i = 0; i < 500000; i++) // Warteschleife
    //         ;
    // }
}
