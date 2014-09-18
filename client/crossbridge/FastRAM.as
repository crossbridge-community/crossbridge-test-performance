/*
 * =BEGIN MIT LICENSE
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 The CrossBridge Team
 * https://github.com/crossbridge-community
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * =END MIT LICENSE
 *
 */
package crossbridge {
import flash.system.ApplicationDomain;
import flash.utils.ByteArray;
import flash.utils.Endian;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

/*
 package avm2.intrinsics.memory
 {
 public function li8(addr:int): int;                 // Load Int 8-bit
 public function li16(addr:int): int;                // Load Int 16-bit
 public function li32(addr:int): int;                // Load Int 32-bit
 public function lf32(addr:int): Number;             // Load Float 32-bit (a.k.a. "float")
 public function lf64(addr:int): Number;             // Load Float 64-bit (a.k.a. "double")

 public function si8(value:int, addr:int): void;     // Store Int 8-bit
 public function si16(value:int, addr:int): void;    // Store Int 16-bit
 public function si32(value:int, addr:int): void;    // Store Int 32-bit
 public function sf32(value:Number, addr:int): void; // Store Float 32-bit (a.k.a. "float")
 public function sf64(value:Number, addr:int): void; // Store Float 64-bit (a.k.a. "double")

 public function sxi1(value:int): int;               // Sign eXtend 1-bit integer to 32 bits
 public function sxi8(value:int): int;               // Sign eXtend 8-bit integer to 32 bits
 public function sxi16(value:int): int;              // Sign eXtend 16-bit integer to 32 bits
 }
 */

/**
 * Inline helper class for CrossBridge CModule RAM operations.
 */
public final class FastRAM {
    /**
     * The RAM ByteArray object
     */
    public var ram_init:ByteArray;

    /**
     * Constructor
     *
     * @ram The RAM ByteArray object to bind with
     */
    public function FastRAM(ram:ByteArray) {
        ram_init = ram;
        init();
    }

    private function init():void {
        if (ram_init) {
            return;
        }
        // pre-allocate and initialize, if not set
        ram_init = new ByteArray();
        ram_init.length = 1024 * 1024;
        ram_init.endian = Endian.LITTLE_ENDIAN;
        ApplicationDomain.currentDomain.domainMemory = ram_init;
    }

    /**
     * Write the low 8 bits of <i>value</i> into domainMemory.
     * @param ptr The address of the location in domainMemory to write to
     * @param value The value to write (only the low 8 bits are written)
     */
    [Inline]
    public final function write8(ptr:int, value:int):void {
        ram_init.position = ptr;
        ram_init.writeByte(value);
    }

    /**
     * Write the low 16 bits of <i>value</i> into domainMemory.
     * @param ptr The address of the location in domainMemory to write to
     * @param value The value to write (only the low 16 bits are written)
     */
    [Inline]
    public final function write16(ptr:int, value:int):void {
        ram_init.position = ptr;
        ram_init.writeShort(value);
    }

    /**
     * Write a 32 bit value into domainMemory
     * @param ptr The address of the location in domainMemory to write to
     * @param value The value to write
     */
    [Inline]
    public final function write32(ptr:int, value:int):void {
        ram_init.position = ptr;
        ram_init.writeInt(value);
    }

    /**
     * Write a Number as a 32 bit float into domainMemory
     * @param ptr The address of the location in domainMemory to write to
     * @param value The value to write at the address (will be rounded to the nearest 32bit floating point value)
     */
    public final function writeFloat(ptr:int, value:Number):void {
        ram_init.position = ptr;
        ram_init.writeFloat(value);
    }

    /**
     * Write a Number as a 64 bit float into domainMemory
     * @param ptr The address of the location in domainMemory to write to
     * @param value The value to write at the address
     */
    [Inline]
    public final function writeDouble(ptr:int, value:Number):void {
        ram_init.position = ptr;
        ram_init.writeDouble(value);
    }

    /**
     * Copy the contents of an object that implements the IDataInput interface (ByteArray, FileStream, Socket etc) into domainMemory.
     * @param ptr The address of the location in domainMemory to start writting to
     * @param length The number of bytes to copy from the source bytearray (starting from source.position)
     * @param source The IDataInput to copy data from (the current position in this IDataInput will be used, and will increase by length)
     */
    public final function writeBytes(ptr:int, length:uint, source:IDataInput):void {
        source.readBytes(ram_init, ptr, length);
    }

    /**
     * Read an 8 bit value from domainMemory with zero padding to extend it to a 32 bit signed integer. This will always result in positive integers.
     * @param ptr The address of the location in domainMemory to read from
     * @return An 8 bit integer zero padded to 32 bit.
     */
    [Inline]
    public final function read8(ptr:int):int {
        ram_init.position = ptr;
        return ram_init.readUnsignedByte();
    }

    /**
     * Read a 16 bit value from domainMemory with zero padding to extend it to a 32 bit signed integer. This will always result in positive integers.
     * @param ptr The address of the location in domainMemory to read from
     * @return A 16 bit integer zero padded to 32 bit.
     */
    [Inline]
    public final function read16(ptr:int):int {
        ram_init.position = ptr;
        return ram_init.readUnsignedShort();
    }

    /**
     * Read a 32 bit value from domainMemory.
     * @param ptr The address of the location in domainMemory to read from
     * @return A 32 bit integer.
     */
    [Inline]
    public final function read32(ptr:int):int {
        ram_init.position = ptr;
        return ram_init.readInt();
    }

    /**
     * Read a 32 bit floating point value from domainMemory
     * @param ptr The address of the location in domainMemory to read from
     * @return A signed 32 bit floating point value
     */
    [Inline]
    public final function readFloat(ptr:int):Number {
        ram_init.position = ptr;
        return ram_init.readFloat();
    }

    /**
     * Read a 64 bit floating point value from domainMemory
     * @param ptr The address of the location in domainMemory to read from
     * @return A signed 64 bit floating point value
     */
    [Inline]
    public final function readDouble(ptr:int):Number {
        ram_init.position = ptr;
        return ram_init.readDouble();
    }

    /**
     * Copy data from domainMemory into an object implementing the IDataOutput interface (ByteArray, FileStream, Socket etc)
     * @param ptr The address of the location in domainMemory to start reading from.
     * @param length The number of bytes to copy from the domainMemory (starting from ptr)
     * @param dst The IDataOutput to copy data into (the current position in this IDataOutput will be respected and will increase by length)
     */
    [Inline]
    public final function readBytes(ptr:int, length:uint, dst:IDataOutput):void {
        dst.writeBytes(ram_init, ptr, length);
    }
}
}
