#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void){

  char cmd_uart[] = "led +1";

  char delimiter[] = " ";

  char *ptr;

  ptr = strtok(cmd_uart, delimiter);

  while(ptr != NULL){
    if(!strcmp("led", ptr)){
      printf("Befehl korrekt");
    }else{
      break;
    }
    ptr = strtok(NULL, delimiter);

    if(ptr[0] == '+' || ptr[0] == '-'){
      unsigned int cONOFF = ((ptr[0]-43)/2);
      int buffer = 0x00;
      unsigned int test = 0;
      printf("%d", cONOFF);
      if(ptr[1] == '1' || ptr[1] == '2'){
        test = (cONOFF == 1 ? test & (0x03 ^ (0xFF & ~(cONOFF<<(atoi(ptr[1])-1)))) : (test |(0x03 ^ (1<<(atoi(ptr[1])-1)))));
      }else if(ptr[1] == '3' || ptr[1] == '4'){
        test = cONOFF<<(((ptr[1]-48)-3)*4);
       }
      }
    }
  }
}
