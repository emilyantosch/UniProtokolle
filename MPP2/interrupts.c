/*
Mikroprozessortechnik 1 - Praktikum 2: Timer und Interrupts
Aufgabe 2
Autoren: Emily Antosch, Florian Tietjen
Beschreibung: Implementierung eines Interrupts durch einen Timer auf der NVIC-Ebene. Darstellung eines Laufmusters mithilfe der LEDs.
*/

#include<stdio.h>
#include<stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

// Function prototypes
void init();
void timerInit(unsigned long period);
void interruptHandler();
void delay();

// main function
int main(void){
    // Call init function
    init();
    // Call timerInit function
    timerInit(0x01EFFFFF);
    // Enable timer
    TIMER2_CTL_R |= 0x00000001;
    // Empty while loop
    while(1)
    {
        
    }
}
// Function to initialize the GPIO pins
void init(){
    SYSCTL_RCGCGPIO_R |= 0x00001020;
    while((SYSCTL_PRGPIO_R&0x00001020)==0);
    GPIO_PORTF_AHB_DEN_R |= 0x11;
    GPIO_PORTF_AHB_DIR_R |= 0x11;
    GPIO_PORTN_DEN_R |= 0x03;
    GPIO_PORTN_DIR_R |= 0x03;
}
// Function to initialize the timer
void timerInit(unsigned long period){
    SYSCTL_RCGCTIMER_R |= 0x04;
    while((SYSCTL_PRTIMER_R&0x04)==0);

    TIMER2_CTL_R &= ~0x01;
    TIMER2_CFG_R = 0x00;
    TIMER2_TAMR_R = 0x02;
    
    TIMER2_TAILR_R = period-1;
    TIMER2_ICR_R = 0x01;
    TIMER2_IMR_R = 0x01;
    NVIC_EN0_R |= (1<<23);
}

// Function to handle the interrupt
// TODO: Edit startup file to enable interrupts
void Timer2A_Handler(){
    TIMER2_ICR_R |= 0x01;

    GPIO_PORTN_DATA_R = 0x03;
    GPIO_PORTF_AHB_DATA_R = 0x11;
    delay(1000000);
    GPIO_PORTN_DATA_R = 0x00;
    GPIO_PORTF_AHB_DATA_R = 0x00;
}

// Simple delay function for bit pattern
void delay(int n){
    for(int i=0;i<n;i++);
}
