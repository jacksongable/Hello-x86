section .text	; the section of the program containing executable instructions

	global _start

	_start:
		
		mov eax, 0x4			; set the system call to 'sys_write'
		mov ebx, 0x1			; set stdout (the console) as the output
		mov ecx, msg			; move the message ('Hello world!') to register ECX
		mov edx, len			; move the length of the message to register EDX
		
		
		int K_CALL			; fire interrupt to notify kernel to execute system call in register EAX 


		mov eax, 0x1			; set the system call to 'sys_exit'
		mov ebx, 0x0			; set the exit code to '0' to indicate normal termination
		

		int K_CALL			; fire interrupt to notify kernel to execute system call in register EAX

section .data	; the section of the program containing initialized data

		msg	db	"Hello world!", 0xA	; set "Hello world!" as the message to print (0xA appends a newline)
	
		len	equ	$ - msg			; 'length of msg' = 'current address' - 'address of msg'

		K_CALL	equ	0x80			; the software interrupt to fire. Interrupt 0x80 notifies the Linux kernel to 
							; execute the system call set in register EAX using the arguments 
							; found in other registers as necessary
