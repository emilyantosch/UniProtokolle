#include<stdio.h>
#include<stdlib.h>
#include<math.h>


int main(){

    int fibo = 0, N;
    int lastFibo = 1, lastlastFibo = 0;
    short isFibo = 0;

    for (int i = 0; i <= N; i++)
    {
        if (i == 0)
        {
            fibo = 0;
        }
        else if (i == 1)
        {
            fibo = 1;
        }
        else
        {
            fibo = lastFibo + lastlastFibo;
            lastlastFibo = lastFibo;
            lastFibo = fibo;
        }

        if (fibo == N)
        {
            isFibo = 1;
            break;
        }
    }

    if(isFibo){
        printf("%d is a Fibonacci number\n", N);

    }else{
        printf("%d is not a Fibonacci number\n", N);
    }
    
    return 0;
}