# **ASM_86**
This is a self study notebook of assembly x86.

## Content list

[1. Introduction](#introduction) <br />
[2. Registers](#registers) <br />
&emsp; [2.1. General purpose registers](#general-purpose-registers) <br />
&emsp; [2.2. Segment registers](#segment-registers) <br />
&emsp; &emsp; [2.2.1. CS register](#cs-register) <br />
&emsp; &emsp; [2.2.2. DS register](#ds-register) <br />
&emsp; &emsp; [2.2.3. SS register](#ss-register) <br />
&emsp; &emsp; [2.2.4. Extra segment registers](#extra-segment-registers) <br />
[3. Variables](#variables) <br />
&emsp; [3.1 Variable sizes](#variable-sizes) <br />
&emsp; [3.2 Define strings](#define-strings) <br />
&emsp; [3.3 Comments](#comments) <br />
&emsp; [3.4 Uninitilized variables](#uninitilized-variables) <br />

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

Additionally, there are other types of registers such as **segment registers**, **control registers**, **status registers**, and the **instruction pointer**. However, there are only eight general-purpose registers.

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

## Segment registers
Segment registers used to access different memory addresses. There are six different segment registers that you can use them:
- **`CS`** : Code segment
- **`DS`** : Data segment
- **`SS`** : Stack segment
- **`GS`** : Extra segment
- **`FS`** : Extra segment
- **`ES`** : Extra segment

### CS register
CS register is the Code register that specifie where is the code in the memory and which code should execute. CS is a part of the **logical address**. logical address consists of two parts, **CS** and **IP**. CS is the mempry address of code and IP is a counter that specifie next line of code that should be executed. When you use this formula you can find physical address of the next line of code in the memory:

**`IP + (16 * CS) = physical address`**

| logical adr | physical adr | Assembly code |
| :---: | :---: | :---: |
| 1132:0100 | 11420 | MOV AL ,10 |
| 1132:0102 | 11422 | MOV AH ,10 |
| 1132:0104 | 11424 | MOV BL ,10 |
| 1132:0106 | 11426 | MOV BH ,10 |
| 1132:0108 | 11428 | MOV CL ,10 |

> ❓ Why IP increase by 2 not by one?


> ⚠️ You can't change value of CS directly using MOV command. You have to move your value to a register then you can mov your register value to the CS register.  

> ⚠️ Also when you are using the JMP or CALL commands you are changing the CS register.

### Example of CS usgae
When you turn on your computer it will copy bios from ROM to the RAM and change CS address to where bios code starts, Then when bios check every thins it will copy bootloader to the RAM and change CS to there, then bootloader do this again for OS, And now your system is ready to use.  

### DS register
The DS (Data Segment) register is used to **specify the base address of the memory segment where data is stored**. This helps in accessing data efficiently and safely.

In older systems **(16-bit Real Mode)**, the DS register must be **manually** set by the programmer because the operating system does not fully manage memory.

In modern operating systems **(32-bit and 64-bit Protected Mode)**, the operating system **automatically** sets the DS register, and direct manipulation of segment registers is usually unnecessary. This is because modern systems use paging and the Global Descriptor Table (GDT) for memory management, making segment registers less relevant for addressing.

Thus, while DS was crucial in older systems, it is mostly managed by the OS in modern architectures.

### SS register
The SS (Stack Segment) register is used to **define the base address of the stack in memory**. The stack is a special memory region used for storing function return addresses, local variables, and CPU registers during function calls and interrupts.

In older systems **(16-bit Real Mode)**, the SS register must be **manually** set to ensure correct stack operations.

In modern operating systems **(32-bit and 64-bit Protected Mode)**, the operating system **automatically** manages the SS register, so manual configuration is usually unnecessary. The stack is typically handled through memory paging, and modern architectures rely on virtual memory rather than direct segment manipulation.

Since the stack is essential for function execution and system stability, the SS register plays a crucial role in memory management, even though its direct usage has decreased in modern systems.


## Extra segment registers
The extra segment registers (ES, FS, GS) are used to access additional memory segments beyond the default CS (Code Segment), DS (Data Segment), and SS (Stack Segment). These registers provide more flexibility for handling different types of data and system structures.

**`ES (Extra Segment)`**: Traditionally used for **string operations and data transfers**, especially with instructions like MOVS, LODS, and STOS.

**`FS & GS`**: In modern 32-bit and 64-bit systems, these registers are often used by the operating system to store **thread-specific data** or **access system-related structures**. For example, in Windows, the FS register points to the **Thread Information Block** (TIB), while in Linux, the GS register is commonly used for **thread-local storage** (TLS).

While these registers were originally intended for segment-based memory access, modern systems primarily use them for specialized purposes, such as multi-threading and system-level optimizations.


## Variables 
Variables in assembly x86 are stored in the `.data` section and have a name and size.<br />
Unlike high-level languages, assembly **does not have strict data types**, but rather defines variables based on their **size** (e.g., byte, word, dword).  
You can access them using their name in instructions, such as `[var_name]`.  

## Variable sizes 
Here you can see different sizes:

- **`db`**: <br />
&emsp; Size: **1 byte** (8-bit)<br />
&emsp; Usage: `"myByte db 10"`

- **`dw`**: <br />
&emsp; Size: **2 byte** (16-bit)<br />
&emsp; Usage: `"myWord dw 10"`

- **`dd`**: <br />
&emsp; Size: **4 byte** (32-bit)<br />
&emsp; Usage: `"myDoubleWord dd 10"`

In other architectures like x86_64 also we can use dt and dq with 80-bit and 64-bit sizes but in x86 we have to play with this three types. (we can store two dd variable for 64-bit usages)

but wait, how to ...

## Define strings 
We have two type of strings in assembly languages (and maybe other languages), strings with **`null-terminated`** and **`non-null-terminated`**. **null-terminated** strings have a zero after the string that specified the end of the string and you can found the strings' lenght faster and easier but it needs a byte to store the zero. In **non-null-terminated** strings you don't have to use zero but it will make our process harder.

Let's create some strings. You should create your strings in **`.data`** section just like this: <br />
```nasm
myString1 db 'Hello world!', 0       ;  null-terminated string
myString2 db 'Hello', ' ', 'world!'  ;  non-null-terminated string
```

Oh i just forgot to tell you about ...

## Comments
**Comments** are pieces of text in the code that do not get compiled or executed. They are only there for the programmer to understand the code better. The assembler ignores comments entirely. <br />
In assembly language, you can use comments by placing a **`semicolon (;)`** at the beginning of the comment. Everything after the semicolon on that line is considered a comment and will not be processed by the assembler.

## Uninitilized variables
Uninitilized variables in assembly are really dangerous becuase they'll get **garbage value** that you don't know them, But we want to know everything right? So we define uninitilized variables in **`.bss`** section like this: 
```nasm
section .bss
uninitilized_var resb 4 
```
Oh what is resb? In assembly when you want to define a variable without initilize it you have to reserve a memory for that and we do this with these keywords: <br />
- **`resb`**: <br />
&emsp; Size: **1 byte** (8-bit) 

- **`resw`**: <br />
&emsp; Size: **2 bytes** (16-bit)

- **`resd`**: <br />
&emsp; Size: **4 bytes** (32-bit)

