﻿/* The MIT License (MIT) Copyright 2014 Andras Csizmadia (www.vpmedia.eu) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */package crossbridge {public class FloatNumberPT {    // optional property specifying the default number of iterations to run each test in the suite.    public var iterations:uint = 1;    // optional property specifying a description to be used when reporting on this test suite:    public var description:String = "Tests performance of Floating Point Numbers."    public var methods:Array = ["floatFL", "floatCB"];    public var methodLabels:Array = ["Flash", "CrossBridge"];    public function floatFL():void {        var sum:Number = 0;        for (var i:int = 0; i < 1024*1024; i++)            sum += _floatFL();    }    public function floatCB():void {        var sum:Number = 0;        for (var i:int = 0; i < 1024*1024; i++)            sum += _floatCB();    }    public function _floatFL(nr:Number = 1.12121, ng:Number = 3.141213453, nv:Number = 237842342.2213, nb:Number = 23742.24219):Number {        var m:Number = (nr < ng) ? ((nr < nb) ? nr : nb) : ((ng < nb) ? ng : nb);        var mm:Number = (nv - m);        var ns:Number = mm / nv;        var r1:Number = (nv - nr) / mm;        var g1:Number = (nv - ng) / mm;        var b1:Number = (nv - nb) / mm;        var nh:Number =                (nv == nb)                        ? ((m == nr) ? (3.0 + g1) : (5.0 - r1))                        : ((nv == ng)                        ? ((m == nb) ? (1.0 + r1) : (3.0 - b1))                        : ((m == ng) ? (5.0 + b1) : (1.0 - g1)));        return nh;    }    public function _floatCB(nr:Number = 1.12121, ng:Number = 3.141213453, nv:Number = 237842342.2213, nb:Number = 23742.24219):int {        return MyLib.ccfloat(nr, ng, nv, nb);    }}}