crossbridge-test-performance
============================

[![Build Status](https://travis-ci.org/crossbridge-community/crossbridge-test-performance.svg?branch=master)](https://travis-ci.org/crossbridge-community/crossbridge-test-performance)

Performance tests for CrossBridgeSDK

Results:

    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    crossbridge.PassDataPT (24 iterations)                                  
    Player version: WIN 15,0,0,152 (debug)
    Tests performance of ByteArray sum.                                     
    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    method...................................................ttl ms...avg ms
    examineBytesFL                                             1333    55.54
    examineBytesCB                                              459    19.13
    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    crossbridge.FibonacciPT (10 iterations)                                 
    Player version: WIN 15,0,0,152 (debug)
    Tests performance of Fibonacci.                                         
    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    method...................................................ttl ms...avg ms
    fibonacciFL                                                 784    78.40
    fibonacciCB                                                1153   115.30
    ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

