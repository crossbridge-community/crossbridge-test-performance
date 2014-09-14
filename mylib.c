//
// =BEGIN MIT LICENSE
// 
// The MIT License (MIT)
//
// Copyright (c) 2013 Adobe Systems Inc
// Copyright (c) 2014 The CrossBridge Team
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 
// =END MIT LICENSE
//

#include "mylib.h"
#include <stdlib.h>
#include <string.h>

int ccfibonacci(int n)
{
	if (n<2) {
		return n;
	}
	return ccfibonacci(n-2)+ccfibonacci(n-1);
}

double min(double a, double b)
{
    if(a < b)
        return a;
    return b;
}

double ccfloat(double nr, double ng, double nv, double nb)
{
    double m = min (nr, min (ng, nb));
    double nm = nv-m;
    double ns = ns = nm / nv ;
    double r1 = (nv - nr) / nm ;
    double g1 = (nv - ng) / nm ;
    double b1 = (nv - nb) / nm ;
    double nh;

    if (nv == nr)
    {
        if (m == ng)
            nh = 5.0 + b1 ;
        else
            nh = 1.0 - g1 ;
    }

    else if (nv == ng)
    {
        if (m == nb)
            nh = 1.0 + r1 ;
        else
            nh = 3.0 - b1 ;
    }

    else if (nv == nb)
    {
        if (m == nr)
            nh = 3.0 + g1 ;
        else
            nh = 5.0 - r1 ;
    }

    return nh;
}

int plus(int a, int b){
	return a + b;
}

int plusPtr(int* a, int* b){
	return *a + *b;
}

int stringLength(char* str){
	int i;

	for(i = 0; *(str) != '\0'; i++){
		str++;
	}

	return i;
}

int stringLength2(char str[]){
	int i;

	for(i = 0; str[i] != '\0'; i++){
		// just increment i
	}

	return i;
}

int sumArray(int numbers[4]){
	int i;
	int sum = 0;

	for(i = 0; i < 4; i++){
		sum += numbers[i];
	}

	return sum;
}

void changeStats(HockeyPlayer* p){
	p->jersey = 5;
	p->goals = 60;
}

void incrementEachCharacter(char* str){
	while ((*str) != '\0'){
		*str = *str + 1;
		str++;
	}
	return;
}

int examineBytes(const unsigned char* buffer, int bufferSize){
	int i;
	int stupidSum = 0;
	
	for (i = 0; i < bufferSize; i++){
		stupidSum += *buffer;
		buffer++;
	}
	return stupidSum;
}

int sumGrid(int grid[3][3]){
	int i, j;
	int sum = 0;
	
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sum += grid[i][j];
			
	return sum;
}

void encode(char** out, int* outsize, char* input){
	char* additional = " world";
	char* str = malloc(strlen(input) + strlen(additional));

	int i;
	for (i = 0; i < strlen(input); i++){
		str[i] = input[i];
	}
	int j;

	for (j=0; j < strlen(additional); j++){
		str[i] = additional[j];
		i++;
	}

	*out = str;
	*outsize = strlen(str);
}
