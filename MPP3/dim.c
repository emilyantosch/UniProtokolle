#include<stdio.h>
#include<stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

void init_port(void);
void init_adc(void);
unsigned int read_adc();

int main(void){
    
    unsigned short int da_increase = 0;
    unsigned int adc_value = 0;
    unsigned int last_adc_value = 0;
    while (1)
    {
        ADC0_PSSI_R = 0x0001;
        adc_value = read_adc();
        printf("Spannung: %d\n",adc_value);
        
        if(GPIO_PORTM_DATA_R &= (1<<1)){
            // If the button is not pressed
            
        }
        else{
            // If the button is pressed
            da_increase = 0;
        }
    }
}


void init_port(void){

    SYSCTL_RCGCGPIO_R |= (1 << 4) | (1 << 12);
    while((SYSCTL_PRGPIO_R & 0x0E08) == 0){}
    SYSCTL_RCGCADC_R |= 0x01;
    while((SYSCTL_PRADC_R & 0x01) == 0){}

    GPIO_PORTD_AHB_AFSEL_R |= 0x01;
    GPIO_PORTD_AHB_DEN_R &= ~0x01;
    GPIO_PORTD_AHB_AMSEL_R |= 0x01;
    
    GPIO_PORTM_DEN_R = 0x03;
    GPIO_PORTM_AFSEL_R = 0x01;
    GPIO_PORTM_PCTL_R = 0x03;
    GPIO_PORTM_DATA_R &= ~(1<<0);
    

    GPIO_PORTM_PUR_R = 0x02;
}

void init_timer(void){
    SYSCTL_RCGCTIMER_R |= (1<<2);
    while (!(SYSCTL_PRTIMER_R & (1<<2))){}
    TIMER2_CTL_R &= ~(1<<0);
    TIMER2_CFG_R = 0x04;

    TIMER2_TAMR_R = (1<<3) | 0x02;

    TIMER2_TAILR_R = 0xFFFF;
    TIMER2_TAMATCHR_R = 0xFFFF/2;
    GPIO_PORTM_DATA_R |= (1<<0);
    TIMER2_CTL_R |= (1<<0);
}

void init_adc(void){
    ADC0_ACTSS_R &= ~0x0F;
    ADC0_SSMUX0_R |= 0x0F;
    ADC0_SSCTL0_R |= 0x02;
    ADC0_ACTSS_R |= 0x01;
}

unsigned int read_adc(){
    unsigned int result = 0;
    while((ADC0_SSFSTAT0_R & (1<<8)) == 0){}

    result = (unsigned int)ADC0_SSFIFO0_R * 5000 / 4095;
    return result;
}
