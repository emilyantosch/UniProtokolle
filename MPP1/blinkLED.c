/*
Mikroprozessortechnik - Praktikum 1 Aufgabe 2
Blinking LED
Autoren: Emily Antosch und Florian Tietjen
Beschreibung: Dieses Programm greift auf die Ports N, F zu, um ein
Blinkmuster zu realisieren
*/


#include <stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

int main(int argc, char const *argv[])
{
    int i = 0;                      // => Deklaration und Initalisierung der Warte-Variable i
    SYSCTL_RCGCGPIO_R = 0x00001020; // => Aktivieren der Ports N und F
    i++;                         // => Erhoehen der Variable i um 1
    GPIO_PORTN_DEN_R = 0x03;     // => Enablen der Pins 0 und 1
    GPIO_PORTN_DIR_R = 0x03;     // => Richtung der Pins N 0 und 1 auf Ausgang
    GPIO_PORTF_AHB_DEN_R = 0x11; // => Enablen der Pins 0 und 4
    GPIO_PORTF_AHB_DIR_R = 0x11; // => Richtung der Pins F 0 und 4 auf Ausgang
    // => Dauerschleife zum Ausführen des Blinkmusters
    while (1)
    {
        GPIO_PORTN_DATA_R = 0x02;    // => Setzen der LED 2 auf ON
        for (i = 0; i < 500000; i++) // => Warten
            ;
        GPIO_PORTN_DATA_R = 0x01;    // => Setzen der LED 1 auf ON
        for (i = 0; i < 500000; i++) // => Warten
            ;
        GPIO_PORTN_DATA_R = 0x00;     // => Rücksetzen beider Ausgänge auf OFF
        GPIO_PORTF_AHB_DATA_R = 0x10; // => Setzen der LED 4 auf ON
        for (i = 0; i < 500000; i++)  // => Warten
            ;
        GPIO_PORTF_AHB_DATA_R = 0x01; // => Setzen der LED 3 auf ON
        for (i = 0; i < 500000; i++)  // => Warten
            ;
        GPIO_PORTF_AHB_DATA_R = 0x00; // Rücksetzen beider Ausgänge auf OFF
    }
    return 0;
}
