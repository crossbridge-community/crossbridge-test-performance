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

#define A 0
#define B 1

typedef struct HockeyPlayer
{
	int jersey;
	int goals;
} HockeyPlayer;

double ccfloat(double nr, double ng, double nv, double nb);
int ccfibonacci(int n);
int plus(int a, int b);
int plusPtr(int* a, int* b);
int stringLength(char* str);
int stringLength2(char str[]);
int sumArray(int numbers[4]);
int sumGrid(int grid[3][3]);
int examineBytes(const unsigned char* buffer, int bufferSize);

void changeStats(HockeyPlayer* p);
void incrementEachCharacter(char* str);
void encode(char** out, int* outsize, char* input);
