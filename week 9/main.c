#include <stdio.h>

unsigned int cshld5(unsigned int a, unsigned int b)
{
    unsigned int result;
    result = (a << 5) |( b>>(32-5));
    return result;
}

unsigned int shld5(unsigned int a, unsigned int b)
{
    unsigned int result;
    
    asm("shldl %3,%1,%0"
        :"=r"(result)
        :"r"(b),"0"(a),"i"(5));
    
    return result;
}

int main(){
    unsigned int a,b,c;
    a=6943;
    b=3223;
    
    c=cshld5(a,b);
    printf("%x\n",c);
    c=shld5(a,b);
    printf("%x\n",c);
    
    return 0;
}