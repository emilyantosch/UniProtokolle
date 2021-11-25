/*
Mikroprozessortechnik 1 - Praktikum 2: Timer und Interrupts
Aufgabe 2
Autoren: Emily Antosch, Florian Tietjen
Beschreibung: Implementierung des Timers als Zeitmessung für die Darstellung von Binaerzahlen mithilfe von LEDs auf dem Evaluation Board.
*/

#include<stdio.h>
#include<stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

void init();
void timerInit();

int main(void)
{
    // Call to the init function
    init();
    // Call to the timerInit function
    timerInit();
    // Initialization of the variables for the binary number
    int displayedValue = 0;
    int currentValue = 0;
    // Infinite loop
    while(1)
    {
        // Resetting all of the LEDs to 0
        GPIO_PORTF_AHB_DATA_R = 0x00;
        GPIO_PORTN_DATA_R = 0x00;
        // Setting currentValue to the displayedValue
        currentValue = displayedValue;
        // Calculating the binary number
        if(currentValue % 2 == 1)
        {
            GPIO_PORTF_AHB_DATA_R |= 0x10;
        }
        currentValue = currentValue / 2;
        if(currentValue % 2 == 1)
        {
            GPIO_PORTF_AHB_DATA_R |= 0x01;
        }
        currentValue = currentValue / 2;
        if(currentValue % 2 == 1)
        {
            GPIO_PORTN_DATA_R |= 0x02;
        }
        currentValue = currentValue / 2;
        if(currentValue % 2 == 1)
        {
            GPIO_PORTN_DATA_R |= 0x01;
        }
        // Incrementing the displayedValue
        if(displayedValue == 15)
        {
            displayedValue = 0;
        }
        else
        {
            displayedValue++;
        }
        //Waiting for the timer to reach timeout
        while (TIMER0_RIS_R & (1<<0) == 0);
        // Clearing the timer timeout flag
        TIMER0_ICR_R |= (1<<0);
    }
}
// Function to initialize the registers
void init(){
    // Setting the clock to both registers N and F
    SYSCTL_RCGCGPIO_R = 0x00001020;
    // Waiting for the clock to be ready
    while ((SYSCTL_PRGPIO_R & 0x00001020) == 0);
    // Setting the direction of the pins to output
    // and enabling the both registers with the pins
    GPIO_PORTF_AHB_DEN_R = 0x11;
    GPIO_PORTF_AHB_DIR_R = 0x11;
    GPIO_PORTN_DEN_R = 0x03;
    GPIO_PORTN_DIR_R = 0x03;
}
// Function to initialize the timer
void timerInit(){
    // Setting the clock to the timer
    SYSCTL_RCGCTIMER_R |= (1<<0);
    // Waiting for the clock to be ready
    while((SYSCTL_PRTIMER_R & 0x01) == 0);
    // Disabling the timer
    TIMER0_CTL_R &= ~(1<<0);
    // Setting the timer to be in 32-bit mode
    TIMER0_CFG_R = 0x00;
    // Setting the timer to be in periodic mode and match enable
    TIMER0_TAMR_R = (1<<5) | 0x02;
    // Setting the load value to be equal to about 1 second
    TIMER0_TAILR_R = 0x00FFFFFF;
    // Enabling the timer
    TIMER0_CTL_R |= (1<<0);
}
