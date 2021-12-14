/*
Mikroprozessortechnik P3 - Aufgabe 1
Autoren: Emily Antosch, Florian Tietjen
Beschreibung: Dieses Programm approximiert den Spannungswert der Spannung UE vom Komparator durch das Treppenverfahren.
*/
#include<stdio.h>
#include<stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

// Prototypes
void init_port(void);
void init_adc(void);
unsigned int read_adc();


int main(void){
    // Initilization of the varibales    
    unsigned short int da_increase = 0;
    unsigned int adc_value = 0;
    unsigned int last_adc_value = da_increase-1;
    
    while (1)
    {
        // ADC start
        ADC0_PSSI_R = 0x0001;
        // Save last value
        adc_value = read_adc();
        //delay(480);
        // If adc detectes a near zero value
        if(adc_value <= 0.1){
            //GPIO_PORTM_DATA_R = (last_adc_value % 10) | (((last_adc_value / 10) % 10) << 4);
            //GPIO_PORTL_DATA_R = ((last_adc_value / 100) % 10) & 0x03;
            GPIO_PORTL_DATA_R |= 0x04;
            GPIO_PORTL_DATA_R = 0x02;
            GPIO_PORTM_DATA_R = ((int)(last_adc_value * 19.53125) / 1000 % 10) << 4 | ((((int)(last_adc_value * 19.53125) / 100) % 10));
            GPIO_PORTL_DATA_R = 0x01;
            GPIO_PORTM_DATA_R = ((int)(last_adc_value * 19.53125) / 10 % 10) << 4;
        }
        // If the button is not pressed
        if(GPIO_PORTD_AHB_DATA_R & 0x02 == 1){
            // Continue operation
            GPIO_PORTK_DATA_R = da_increase;
            da_increase++;
        }
        GPIO_PORTL_DATA_R = 0x00;
    }
}


void init_port(void){
    // Wait for clock for GPIO to be ready
    SYSCTL_RCGCGPIO_R |= 0x0E08;
    while((SYSCTL_PRGPIO_R & 0x0E08) == 0){}
    
    // Initilization of the port D with ADC
    GPIO_PORTD_AHB_DEN_R = 0x02;
    GPIO_PORTD_AHB_AFSEL_R |= 0x01;
    GPIO_PORTD_AHB_DEN_R &= ~0x01;
    GPIO_PORTD_AHB_AMSEL_R |= 0x01;
    GPIO_PORTD_AHB_PUR_R = 0x02;

    // Initilization of the port K with the output
    GPIO_PORTK_DEN_R = 0xFF;
    GPIO_PORTK_DIR_R = 0xFF;
    // Initilization of the port M for the BCD display
    GPIO_PORTM_DEN_R = 0xFF;
    GPIO_PORTM_DIR_R = 0xFF;
    // Initilization of the port L for the BCD display and trigger pulse
    GPIO_PORTL_DEN_R = 0x07;
    GPIO_PORTL_DIR_R = 0x07;
    GPIO_PORTL_DATA_R = 0x00;
}


void init_adc(void){
    // Wait for clock for ADC to be ready
    SYSCTL_RCGCADC_R |= 0x01;
    while((SYSCTL_PRADC_R & 0x01) == 0){}
    // Disable the ADC
    ADC0_ACTSS_R &= ~0x0F;
    // Set the corresponding Sequencer
    ADC0_SSMUX0_R |= 0x0F;
    // Set the corresponding Sequencer 0, length = 1
    ADC0_SSCTL0_R |= 0x02;
    // Enable the ADC
    ADC0_ACTSS_R |= 0x01;
}
// Unused function for now
unsigned int read_adc(){
    unsigned int result = 0;
    while((ADC0_SSFSTAT0_R & (1<<8)) == 0){}

    result = (unsigned int)ADC0_SSFIFO0_R * 5000 / 4095;
    return result;
}
