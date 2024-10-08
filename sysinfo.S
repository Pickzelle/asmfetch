.lcomm memtotal, 8
.lcomm days, 8
.lcomm hours, 8
.lcomm minutes, 8

.lcomm sysinfo_buf, 128

populate_sysinfo:
	mov rax, SYS_SYSINFO
	mov rdi, offset sysinfo_buf
	syscall

	mov rax, sysinfo_buf
	mov rbx, 86400
	xor rdx, rdx
	div rbx
	mov days, rax

	mov rax, rdx
	xor rdx, rdx
	mov rbx, 3600
	div rbx
	mov hours, rax

	mov rax, rdx
	xor rdx, rdx
	mov rbx, 60
	div rbx
	mov minutes, rax

	mov rax, [sysinfo_buf + 32]
	mov rbx, 1024
	xor rdx, rdx
	div rbx
	mov memtotal, rax

	ret
