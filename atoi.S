atoi:
	xor rax, rax

atoi_convert:
	mov   bl, [rsi]
	inc   rsi
	movzx rdi, bl

	test rdi, rdi
	je   done

	cmp rdi, '0'
	jl  error

	sub  rdi, '0'
	imul rax, 10
	add  rax, rdi

	jmp atoi_convert

error:
	mov rax, -1

done:
	ret
