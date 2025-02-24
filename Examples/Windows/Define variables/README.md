## What is this program do?
This is just a simple program that initilize three variables with size of 1-byte.


## How to run code?
First you need to **assemble** the code with this command in your `cmd`:

> ⚠ You must have [NASM](https://www.nasm.us) installed on your device before run this command.

```bash
nasm -f win main.asm -o main.obj
```
Now you have a object file. Then you can link your program(craete executable) using `ld` command:
```bash
ld main.obj -o main.exe
``` 
And this command create **`main.exe`** for you that you can run it, But in out code we don't do anything so you it will run and close very fast. If you want to see your program you can use reverse engeneering tools like [`radare2`](https://rada.re/n/) or [`ghidra`](https://ghidra-sre.org) or anything that you comfort.