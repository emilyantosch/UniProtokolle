/*
Mikroprozessortechnik - Praktikum 1 Aufgabe 3
Blinking LED mit Taster
Autoren: Emily Antosch und Florian Tietjen
Beschreibung: Dieses Programm greift auf die Ports N, F und J zu, um ein
Blinkmuster mit Tastern zu realisieren
*/

#include <stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

int main(int argc, char const *argv[])
{
    int i = 0;                      // => Deklaration und Initalisierung der Warte-Variable i
    unsigned char state;            // => Deklaration der State-Variable zum Abfragen des Schalterstandes
    SYSCTL_RCGCGPIO_R = 0x00001120; // => Aktivieren der Ports N, J und F
    while ((SYSCTL_PRGPIO_R & 0x00001120) == 0)
        ;                        // => Warten bis Clocksignal anliegt
    i++;                         // => ???
    GPIO_PORTN_DEN_R = 0x03;     // => Enablen der Pins N 0 und 1
    GPIO_PORTN_DIR_R = 0x03;     // => Richtung der Pins N 0 und 1 auf Ausgang
    GPIO_PORTJ_AHB_DEN_R = 0x03; // => Enablen der Pins J 0 und 1
    GPIO_PORTJ_AHB_PUR_R = 0x03; // => Weak-Pull-Up aktivieren für die Pins J 0 und 1
    GPIO_PORTF_AHB_DEN_R = 0x11; // => Enablen der Pins F 0 und 4
    GPIO_PORTF_AHB_DIR_R = 0x11; // => Richtung der Pins F 0 und 4 auf Ausgang
    // => Dauerschleife zum Ausgeben der Blinkmuster
    while (1)
    {
        state = GPIO_PORTJ_AHB_DATA_R; // Abfragen des Schalterstandes
        while ((state & 0x02) == 0x02)
        {                                // Schalter 1 gedrückt
            GPIO_PORTN_DATA_R = 0x01;    // LED 1 leuchtet
            for (i = 0; i < 500000; i++) // Warten
                ;
            GPIO_PORTN_DATA_R = 0x02;    // LED 2 leuchtet
            for (i = 0; i < 500000; i++) // Warten
                ;
            state = GPIO_PORTJ_AHB_DATA_R;
        }
        while ((state & 0x01) == 0x01)
        {                                 // Schalter 2 gedrückt
            GPIO_PORTF_AHB_DATA_R = 0x01; // LED 3 leuchtet
            for (i = 0; i < 500000; i++)  // Warten
                ;
            GPIO_PORTF_AHB_DATA_R = 0x01; // LED 4 leuchtet
            for (i = 0; i < 500000; i++)  // Warten
                ;
            state = GPIO_PORTJ_AHB_DATA_R;
        }
        while ((state & 0x00) == 0x00)
        {                                 // Beide Schalter gedrückt
            GPIO_PORTN_DATA_R = 0x01;     // LED 1 leuchtet
            GPIO_PORTF_AHB_DATA_R = 0x01; // LED 3 leuchtet
            for (i = 0; i < 500000; i++)  // Warten
                ;
            GPIO_PORTN_DATA_R = 0x02;     // LED 2 leuchtet
            GPIO_PORTF_AHB_DATA_R = 0x02; // LED 4 leuchtet
            for (i = 0; i < 500000; i++)  // Warten
                ;
            state = GPIO_PORTJ_AHB_DATA_R;
        }
        GPIO_PORTN_DATA_R = 0x00;     // Reset der LEDs 1 und 2
        GPIO_PORTF_AHB_DATA_R = 0x00; // Reset der LEDs 3 und 4
    }
    return 0;
}
