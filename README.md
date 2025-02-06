# **ASM_86**
This is a self study notebook of assembly x86.

## Content list

[1. Introduction](#introduction) <br />
[2. Registers](#registers) <br />
&emsp; [2.1. General purpose registers](#general-purpose-registers)

## [Introduction](https://en.wikipedia.org/wiki/X86_assembly_language)
x86 assembly language is a family of low-level programming languages that are used to produce object code for the x86 class of processors. 
These languages provide backward compatibility with CPUs dating back to the Intel 8008 microprocessor, introduced in April 1972. As assembly languages, they are closely tied to the architecture's machine code instructions, allowing for precise control over hardware.

In x86 assembly languages, mnemonics are used to represent fundamental CPU instructions, making the code more human-readable compared to raw machine code. 
Each mnemonics corresponds to a basic operation performed by the processor, such as **arithmetic calculations**, **data movement**, or **control flow decisions**. Assembly languages are most commonly used in applications where **performance and efficiency** are critical. 
This includes **real-time embedded systems**, **operating-system kernels**, and **device drivers**, all of which may require direct manipulation of hardware resources.

Additionally, **compilers** for high-level programming languages sometimes generate assembly code as an intermediate step during the compilation process. 
This allows for optimization at the assembly level before producing the final machine code that the processor executes


## [Registers](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)

Registers are a type of computer memory built directly into the processor or CPU (Central Processing Unit) that is used to store and manipulate data during the execution of instructions. A register may hold an instruction, a storage address, or any kind of data (such as a bit sequence or individual characters).

In x86 processors, we can store at most **32-bit** of data in a register. Modern x86 processors have **eight** 32-bit general-purpose registers. Here are all eight registers:

- **EAX**
- **EBX**
- **ECX**
- **EDX**
- **ESI**
- **EDI**
- **ESP** (Stack pointer)
- **EBP** (Base pointer)

Additionally, there are other types of registers such as segment registers, control registers, status registers, and the instruction pointer. However, there are only eight general-purpose registers.

## General purpose registers
As mentioned earlier, the **EAX, EBX, ECX, and EDX** registers can store **32 bit** of data, but their structure is more granular. Each of these registers is divided into three sections, allowing for flexible data manipulation.  

For example, **EAX** consists of:  
- **AX**: The lower **16-bit** portion of `EAX`.  
- **AL**: The **least significant 8 bit** of `AX`.  
- **AH**: The **most significant 8 bit** of `AX`.  

This means that while `EAX` holds **32 bit** of data, programmers can also access and modify smaller portions (`AX`, `AL`, or `AH`) independently, making assembly programming more efficient and precise.

For example if you define **`EAX with 0x12345678 value`**, **`AX will be 0x5678`**, **`AH will be 0x56`** and **`AL will be 0x78`**.

**EAX** = 0x12345678 <br />
**AX**  = 0x5678 <br />
**AH**  = 0x56 <br />
**AL**  = 0x78 <br />

When referring to registers in assembly language, the names are not case-sensitive. For example, the names `EAX` and `eax` refer to the same register.

