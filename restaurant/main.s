	.file	"main.c"
	.text
	.globl	cus
	.bss
	.align 32
	.type	cus, @object
	.size	cus, 48
cus:
	.zero	48
	.globl	emp
	.align 32
	.type	emp, @object
	.size	emp, 52
emp:
	.zero	52
	.globl	owner
	.data
	.align 32
	.type	owner, @object
	.size	owner, 40
owner:
	.string	"Arin"
	.zero	10
	.string	"CelMare"
	.zero	7
	.zero	2
	.long	12
	.long	1000
	.globl	rest
	.align 32
	.type	rest, @object
	.size	rest, 56
rest:
	.string	"Arin"
	.zero	10
	.string	"Grigoras"
	.zero	6
	.string	"3rd Avenue"
	.zero	4
	.zero	11
	.section	.rodata
	.align 8
.LC0:
	.string	"####################################"
.LC1:
	.string	"#\t  Arin's Rest.\t\t   #"
	.text
	.globl	mainMesage
	.type	mainMesage, @function
mainMesage:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mainMesage, .-mainMesage
	.section	.rodata
.LC2:
	.string	"Enter password: "
.LC3:
	.string	"%d"
	.text
	.globl	try_password
	.type	try_password, @function
try_password:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L3
.L4:
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L3:
	movl	-12(%rbp), %eax
	cmpl	$1122334455, %eax
	jne	.L4
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	try_password, .-try_password
	.section	.rodata
.LC4:
	.string	"a"
.LC5:
	.string	"Good_Reviews.txt"
.LC6:
	.string	"\nReview : %d by %s"
	.text
	.globl	g_reviews
	.type	g_reviews, @function
g_reviews:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	48+rest(%rip), %edx
	movq	-8(%rbp), %rax
	leaq	4+cus(%rip), %rcx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	g_reviews, .-g_reviews
	.section	.rodata
.LC7:
	.string	"Bad_Reviews.txt"
	.text
	.globl	b_reviews
	.type	b_reviews, @function
b_reviews:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC4(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	52+rest(%rip), %edx
	movq	-8(%rbp), %rax
	leaq	4+cus(%rip), %rcx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	b_reviews, .-b_reviews
	.section	.rodata
	.align 8
.LC8:
	.string	"\n\tDo you want to review the restaurant? (yes/no) "
.LC9:
	.string	"%s"
.LC10:
	.string	"yes"
	.align 8
.LC11:
	.string	"\t1 for a good review and 0 for a bad review: "
.LC12:
	.string	"Error"
	.text
	.globl	review
	.type	review, @function
review:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-23(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-23(%rbp), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jne	.L14
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %eax
	cmpl	$1, %eax
	jne	.L10
	movl	48+rest(%rip), %eax
	addl	$1, %eax
	movl	%eax, 48+rest(%rip)
	movl	$0, %eax
	call	g_reviews
	jmp	.L14
.L10:
	movl	-32(%rbp), %eax
	testl	%eax, %eax
	jne	.L12
	movl	52+rest(%rip), %eax
	addl	$1, %eax
	movl	%eax, 52+rest(%rip)
	movl	$0, %eax
	call	b_reviews
	jmp	.L14
.L12:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L14:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	review, .-review
	.section	.rodata
.LC13:
	.string	"Orders.txt"
	.align 8
.LC14:
	.string	"Order : %s, Table : %d, Name %s\n"
	.text
	.globl	customer_history
	.type	customer_history, @function
customer_history:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC4(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	40+cus(%rip), %edx
	movq	-8(%rbp), %rax
	leaq	4+cus(%rip), %r8
	movl	%edx, %ecx
	leaq	24+cus(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	customer_history, .-customer_history
	.section	.rodata
.LC15:
	.string	"#\t  Main Menu\t\t   #"
.LC16:
	.string	"\n\t1. Food 1($10)"
.LC17:
	.string	"\t2. food 2 ($15)"
.LC18:
	.string	"\t3. food 3 ($5)"
.LC19:
	.string	"\t4. food 4 ($11)"
.LC20:
	.string	"\t5. food 5 ($13)"
.LC21:
	.string	"\t0. EXIT"
.LC22:
	.string	"\tYour order> "
	.align 8
.LC23:
	.string	"\tYou sure you want to order food 1 (1/0) ?"
.LC24:
	.string	"\tYour balance: %d\n"
	.align 8
.LC25:
	.string	"\tDo you want to order anything else (1/0) ? "
	.align 8
.LC26:
	.string	"\tYou sure you want to order food 2 (1/0) ?"
	.align 8
.LC27:
	.string	"\tYou sure you want to order food 3 (1/0) ?"
	.align 8
.LC28:
	.string	"\tYou sure you want to order food 4 (1/0) ?"
	.align 8
.LC29:
	.string	"\tYou sure you want to order food 5 (1/0) ?"
	.text
	.globl	normal_menu
	.type	normal_menu, @function
normal_menu:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L30:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	ja	.L17
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L19(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L19(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L19:
	.long	.L17-.L19
	.long	.L23-.L19
	.long	.L22-.L19
	.long	.L21-.L19
	.long	.L20-.L19
	.long	.L18-.L19
	.text
.L23:
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L32
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movl	$1685024614, 24+cus(%rip)
	movw	$12576, 28+cus(%rip)
	movb	$0, 30+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L17
.L22:
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L33
	movl	44+cus(%rip), %eax
	subl	$15, %eax
	movl	%eax, 44+cus(%rip)
	movl	$1685024614, 24+cus(%rip)
	movw	$12832, 28+cus(%rip)
	movb	$0, 30+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L17
.L21:
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L34
	movl	44+cus(%rip), %eax
	subl	$5, %eax
	movl	%eax, 44+cus(%rip)
	movl	$1685024614, 24+cus(%rip)
	movw	$13088, 28+cus(%rip)
	movb	$0, 30+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L17
.L20:
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L35
	movl	44+cus(%rip), %eax
	subl	$11, %eax
	movl	%eax, 44+cus(%rip)
	movl	$1685024614, 24+cus(%rip)
	movw	$13344, 28+cus(%rip)
	movb	$0, 30+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L17
.L18:
	leaq	.LC29(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L36
	movl	44+cus(%rip), %eax
	subl	$13, %eax
	movl	%eax, 44+cus(%rip)
	movl	$1685024614, 24+cus(%rip)
	movw	$13600, 28+cus(%rip)
	movb	$0, 30+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L17
.L32:
	nop
	jmp	.L17
.L33:
	nop
	jmp	.L17
.L34:
	nop
	jmp	.L17
.L35:
	nop
	jmp	.L17
.L36:
	nop
.L17:
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L29
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L30
.L29:
	movl	$0, %eax
	call	start
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	normal_menu, .-normal_menu
	.section	.rodata
.LC30:
	.string	"\n\tVegan Menu\n"
.LC31:
	.string	"\n\t1. Vegan food 1($10)."
.LC32:
	.string	"\t2. Vegan food 2($10)."
.LC33:
	.string	"\t3. Vegan food 3($10)."
.LC34:
	.string	"\t4. Vegan food 4($10)."
.LC35:
	.string	"\t5. Vegan food 5($10)"
.LC36:
	.string	"Choice> "
	.align 8
.LC37:
	.string	"\tYou sure you want to order Vegan food 1 (1/0) ?"
	.align 8
.LC38:
	.string	"\tYou sure you want to order Vegan food 2 (1/0) ?"
	.align 8
.LC39:
	.string	"\tYou sure you want to order Vegan food 3 (1/0) ?"
	.align 8
.LC40:
	.string	"\tYou sure you want to order Vegan food 4 (1/0) ?"
	.align 8
.LC41:
	.string	"\tYou sure you want to order Vegan food 5 (1/0) ?"
	.text
	.globl	vegan_menu
	.type	vegan_menu, @function
vegan_menu:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L51:
	leaq	.LC30(%rip), %rdi
	call	puts@PLT
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	leaq	.LC32(%rip), %rdi
	call	puts@PLT
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
	leaq	.LC34(%rip), %rdi
	call	puts@PLT
	leaq	.LC35(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	ja	.L38
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L40(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L40(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L40:
	.long	.L38-.L40
	.long	.L44-.L40
	.long	.L43-.L40
	.long	.L42-.L40
	.long	.L41-.L40
	.long	.L39-.L40
	.text
.L44:
	leaq	.LC37(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L53
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8027139044287145302, %rax
	movq	%rax, 24+cus(%rip)
	movl	$824206447, 32+cus(%rip)
	movb	$0, 36+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L38
.L43:
	leaq	.LC38(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L54
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8027139044287145302, %rax
	movq	%rax, 24+cus(%rip)
	movl	$840983663, 32+cus(%rip)
	movb	$0, 36+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L38
.L42:
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L55
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8027139044287145302, %rax
	movq	%rax, 24+cus(%rip)
	movl	$857760879, 32+cus(%rip)
	movb	$0, 36+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L38
.L41:
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L56
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8027139044287145302, %rax
	movq	%rax, 24+cus(%rip)
	movl	$874538095, 32+cus(%rip)
	movb	$0, 36+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L38
.L39:
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L57
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8027139044287145302, %rax
	movq	%rax, 24+cus(%rip)
	movl	$891315311, 32+cus(%rip)
	movb	$0, 36+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L38
.L53:
	nop
	jmp	.L38
.L54:
	nop
	jmp	.L38
.L55:
	nop
	jmp	.L38
.L56:
	nop
	jmp	.L38
.L57:
	nop
.L38:
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L50
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L51
.L50:
	movl	$0, %eax
	call	start
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L52
	call	__stack_chk_fail@PLT
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	vegan_menu, .-vegan_menu
	.section	.rodata
.LC42:
	.string	"\n\tKeto Menu\n"
.LC43:
	.string	"\n\t1. Keto food 1($10)."
.LC44:
	.string	"\t2. Keto food 2($10)."
.LC45:
	.string	"\t3. Keto food 3($10)."
.LC46:
	.string	"\t4. Keto food 4($10)."
.LC47:
	.string	"\t5. Keto food 5($10)"
	.align 8
.LC48:
	.string	"\tYou sure you want to order Keto food 1 (1/0) ?"
	.align 8
.LC49:
	.string	"\tYou sure you want to order Keto food 2 (1/0) ?"
	.align 8
.LC50:
	.string	"\tYou sure you want to order Keto food 3 (1/0) ?"
	.align 8
.LC51:
	.string	"\tYou sure you want to order Keto food 4 (1/0) ?"
	.align 8
.LC52:
	.string	"\tYou sure you want to order Keto food 5 (1/0) ?"
	.text
	.globl	keto_menu
	.type	keto_menu, @function
keto_menu:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L72:
	leaq	.LC42(%rip), %rdi
	call	puts@PLT
	leaq	.LC43(%rip), %rdi
	call	puts@PLT
	leaq	.LC44(%rip), %rdi
	call	puts@PLT
	leaq	.LC45(%rip), %rdi
	call	puts@PLT
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	ja	.L59
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L61(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L61(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L61:
	.long	.L59-.L61
	.long	.L65-.L61
	.long	.L64-.L61
	.long	.L63-.L61
	.long	.L62-.L61
	.long	.L60-.L61
	.text
.L65:
	leaq	.LC48(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L74
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950119769419, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3219556, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L59
.L64:
	leaq	.LC49(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L75
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950119769419, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3285092, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L59
.L63:
	leaq	.LC50(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L76
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950119769419, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3350628, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L59
.L62:
	leaq	.LC51(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L77
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950119769419, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3416164, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L59
.L60:
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L78
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950119769419, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3481700, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L59
.L74:
	nop
	jmp	.L59
.L75:
	nop
	jmp	.L59
.L76:
	nop
	jmp	.L59
.L77:
	nop
	jmp	.L59
.L78:
	nop
.L59:
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L71
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L72
.L71:
	movl	$0, %eax
	call	start
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L73
	call	__stack_chk_fail@PLT
.L73:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	keto_menu, .-keto_menu
	.section	.rodata
.LC53:
	.string	"\n\tMini Menu\n"
.LC54:
	.string	"\n\t1. Mini food 1($10)."
.LC55:
	.string	"\t2. Mini food 2($10)."
.LC56:
	.string	"\t3. Mini food 3($10)."
.LC57:
	.string	"\t4. Mini food 4($10)."
.LC58:
	.string	"\t5. Mini food 5($10)"
	.align 8
.LC59:
	.string	"\tYou sure you want to order Mini food 1 (1/0) ?"
	.align 8
.LC60:
	.string	"\tYou sure you want to order Mini food 2 (1/0) ?"
	.align 8
.LC61:
	.string	"\tYou sure you want to order Mini food 3 (1/0) ?"
	.align 8
.LC62:
	.string	"\tYou sure you want to order Mini food 4 (1/0) ?"
	.align 8
.LC63:
	.string	"\tYou sure you want to order Mini food 5 (1/0) ?"
	.text
	.globl	Mini_menu
	.type	Mini_menu, @function
Mini_menu:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L93:
	leaq	.LC53(%rip), %rdi
	call	puts@PLT
	leaq	.LC54(%rip), %rdi
	call	puts@PLT
	leaq	.LC55(%rip), %rdi
	call	puts@PLT
	leaq	.LC56(%rip), %rdi
	call	puts@PLT
	leaq	.LC57(%rip), %rdi
	call	puts@PLT
	leaq	.LC58(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	ja	.L80
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L82(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L82(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L82:
	.long	.L80-.L82
	.long	.L86-.L82
	.long	.L85-.L82
	.long	.L84-.L82
	.long	.L83-.L82
	.long	.L81-.L82
	.text
.L86:
	leaq	.LC59(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L95
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950018713933, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3219556, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L80
.L85:
	leaq	.LC60(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L96
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950018713933, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3285092, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L80
.L84:
	leaq	.LC61(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L97
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950018713933, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3350628, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L80
.L83:
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L98
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950018713933, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3416164, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L80
.L81:
	leaq	.LC63(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L99
	movl	44+cus(%rip), %eax
	subl	$10, %eax
	movl	%eax, 44+cus(%rip)
	movabsq	$8029748950018713933, %rax
	movq	%rax, 24+cus(%rip)
	movl	$3481700, 32+cus(%rip)
	movl	44+cus(%rip), %eax
	movl	%eax, %esi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	review
	movl	$1, cus(%rip)
	movl	$0, %eax
	call	customer_history
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L80
.L95:
	nop
	jmp	.L80
.L96:
	nop
	jmp	.L80
.L97:
	nop
	jmp	.L80
.L98:
	nop
	jmp	.L80
.L99:
	nop
.L80:
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L92
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L93
.L92:
	movl	$0, %eax
	call	start
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L94
	call	__stack_chk_fail@PLT
.L94:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	Mini_menu, .-Mini_menu
	.section	.rodata
.LC64:
	.string	"\nFirst name: "
.LC65:
	.string	"Last name: "
.LC66:
	.string	"Monthly salary: "
	.align 8
.LC67:
	.string	"Date of birth in dd/mm/yyyy format:  "
.LC68:
	.string	"%d/%d/%d"
.LC69:
	.string	"Date is valid."
.LC70:
	.string	"Day is invalid."
.LC71:
	.string	"Month is not valid."
.LC72:
	.string	"Year is not valid."
.LC73:
	.string	"1. For Dishwasher"
.LC74:
	.string	"2. For Waiter"
.LC75:
	.string	"3. For Cook"
.LC76:
	.string	"4. For Chef"
.LC77:
	.string	"5. For Manager"
	.text
	.globl	new_employee
	.type	new_employee, @function
new_employee:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC64(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	emp(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC65(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	15+emp(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC66(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	32+emp(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC67(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	48+emp(%rip), %rcx
	leaq	44+emp(%rip), %rdx
	leaq	40+emp(%rip), %rsi
	leaq	.LC68(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	48+emp(%rip), %eax
	cmpl	$1899, %eax
	jle	.L101
	movl	48+emp(%rip), %eax
	cmpl	$9999, %eax
	jg	.L101
	movl	44+emp(%rip), %eax
	testl	%eax, %eax
	jle	.L102
	movl	44+emp(%rip), %eax
	cmpl	$12, %eax
	jg	.L102
	movl	40+emp(%rip), %eax
	testl	%eax, %eax
	jle	.L103
	movl	40+emp(%rip), %eax
	cmpl	$31, %eax
	jg	.L103
	movl	44+emp(%rip), %eax
	cmpl	$1, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$3, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$5, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$7, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$8, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$10, %eax
	je	.L104
	movl	44+emp(%rip), %eax
	cmpl	$12, %eax
	jne	.L103
.L104:
	leaq	.LC69(%rip), %rdi
	call	puts@PLT
	jmp	.L105
.L103:
	movl	40+emp(%rip), %eax
	testl	%eax, %eax
	jle	.L106
	movl	40+emp(%rip), %eax
	cmpl	$30, %eax
	jg	.L106
	movl	40+emp(%rip), %eax
	cmpl	$4, %eax
	je	.L107
	movl	40+emp(%rip), %eax
	cmpl	$6, %eax
	je	.L107
	movl	40+emp(%rip), %eax
	cmpl	$9, %eax
	je	.L107
	movl	40+emp(%rip), %eax
	cmpl	$11, %eax
	jne	.L106
.L107:
	leaq	.LC69(%rip), %rdi
	call	puts@PLT
	jmp	.L105
.L106:
	movl	40+emp(%rip), %eax
	testl	%eax, %eax
	jle	.L108
	movl	40+emp(%rip), %eax
	cmpl	$28, %eax
	jg	.L108
	movl	44+emp(%rip), %eax
	cmpl	$2, %eax
	jne	.L108
	leaq	.LC69(%rip), %rdi
	call	puts@PLT
	jmp	.L105
.L108:
	movl	40+emp(%rip), %eax
	cmpl	$29, %eax
	jne	.L109
	movl	44+emp(%rip), %eax
	cmpl	$2, %eax
	jne	.L109
	movl	48+emp(%rip), %edx
	movslq	%edx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	sarl	$7, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$400, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	je	.L110
	movl	48+emp(%rip), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L109
	movl	48+emp(%rip), %edx
	movslq	%edx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	sarl	$5, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	je	.L109
.L110:
	leaq	.LC69(%rip), %rdi
	call	puts@PLT
	jmp	.L105
.L109:
	leaq	.LC70(%rip), %rdi
	call	puts@PLT
	jmp	.L111
.L105:
	jmp	.L111
.L102:
	leaq	.LC71(%rip), %rdi
	call	puts@PLT
	jmp	.L112
.L111:
	jmp	.L112
.L101:
	leaq	.LC72(%rip), %rdi
	call	puts@PLT
.L112:
	movl	$0, %eax
	call	try_password
	leaq	.LC73(%rip), %rdi
	call	puts@PLT
	leaq	.LC74(%rip), %rdi
	call	puts@PLT
	leaq	.LC75(%rip), %rdi
	call	puts@PLT
	leaq	.LC76(%rip), %rdi
	call	puts@PLT
	leaq	.LC77(%rip), %rdi
	call	puts@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L113
	movl	$0, -12(%rbp)
	jmp	.L119
.L113:
	movl	-16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L115
	movl	$1, -12(%rbp)
	jmp	.L119
.L115:
	movl	-16(%rbp), %eax
	cmpl	$3, %eax
	jne	.L116
	movl	$2, -12(%rbp)
	jmp	.L119
.L116:
	movl	-16(%rbp), %eax
	cmpl	$4, %eax
	jne	.L117
	movl	$3, -12(%rbp)
	jmp	.L119
.L117:
	movl	-16(%rbp), %eax
	cmpl	$5, %eax
	jne	.L119
	movl	$4, -12(%rbp)
.L119:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L118
	call	__stack_chk_fail@PLT
.L118:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	new_employee, .-new_employee
	.globl	get_address
	.type	get_address, @function
get_address:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	30+rest(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	get_address, .-get_address
	.section	.rodata
.LC78:
	.string	"Arin's Rest."
	.text
	.globl	get_name
	.type	get_name, @function
get_name:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC78(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	get_name, .-get_name
	.section	.rodata
.LC79:
	.string	"r"
	.text
	.globl	get_g_reviews
	.type	get_g_reviews, @function
get_g_reviews:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC79(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	je	.L130
	jmp	.L126
.L127:
	movq	stdout(%rip), %rcx
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
.L126:
	movq	-1056(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -1048(%rbp)
	cmpq	$0, -1048(%rbp)
	jne	.L127
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L128
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L128:
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L130:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L129
	call	__stack_chk_fail@PLT
.L129:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	get_g_reviews, .-get_g_reviews
	.globl	get_b_reviews
	.type	get_b_reviews, @function
get_b_reviews:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC79(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	je	.L136
	jmp	.L133
.L134:
	movq	stdout(%rip), %rcx
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
.L133:
	movq	-1056(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -1048(%rbp)
	cmpq	$0, -1048(%rbp)
	jne	.L134
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L136
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L136:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L135
	call	__stack_chk_fail@PLT
.L135:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	get_b_reviews, .-get_b_reviews
	.section	.rodata
.LC80:
	.string	"\n\n1. New Employee"
.LC81:
	.string	"2. Get Address"
.LC82:
	.string	"3. Get Rest. Name"
.LC83:
	.string	"4. Check Good Reviews"
.LC84:
	.string	"5. Check Bad Reviews"
	.text
	.globl	staff_menu
	.type	staff_menu, @function
staff_menu:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC80(%rip), %rdi
	call	puts@PLT
	leaq	.LC81(%rip), %rdi
	call	puts@PLT
	leaq	.LC82(%rip), %rdi
	call	puts@PLT
	leaq	.LC83(%rip), %rdi
	call	puts@PLT
	leaq	.LC84(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$5, %eax
	ja	.L146
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L140(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L140(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L140:
	.long	.L146-.L140
	.long	.L144-.L140
	.long	.L143-.L140
	.long	.L142-.L140
	.long	.L141-.L140
	.long	.L139-.L140
	.text
.L144:
	movl	$0, %eax
	call	try_password
	movl	$0, %eax
	call	new_employee
	jmp	.L138
.L143:
	movl	$0, %eax
	call	try_password
	movl	$0, %eax
	call	get_address
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L138
.L142:
	movl	$0, %eax
	call	try_password
	movl	$0, %eax
	call	get_name
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L138
.L141:
	movl	$0, %eax
	call	try_password
	movl	$0, %eax
	call	get_g_reviews
	jmp	.L138
.L139:
	movl	$0, %eax
	call	try_password
	nop
.L138:
.L146:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L145
	call	__stack_chk_fail@PLT
.L145:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	staff_menu, .-staff_menu
	.section	.rodata
	.align 8
.LC85:
	.string	"\nHello there, what's your name? "
.LC86:
	.string	"%s, nice to meet you %s\n"
	.align 8
.LC87:
	.string	"If I may ask, what's your budget for the night? "
	.align 8
.LC88:
	.string	"Now, choose a table to stay at from 1 to 15: "
.LC89:
	.string	"Alright, here's the menu"
	.text
	.globl	customer
	.type	customer, @function
customer:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	mainMesage
	leaq	.LC85(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	4+cus(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	4+cus(%rip), %rdx
	leaq	4+cus(%rip), %rsi
	leaq	.LC86(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC87(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	44+cus(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC88(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	40+cus(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC89(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	start
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	customer, .-customer
	.section	.rodata
.LC90:
	.string	"\n1. Normal Menu"
.LC91:
	.string	"2. Vegan menu"
.LC92:
	.string	"3. Keto Diets"
.LC93:
	.string	"4. Mini Foods"
.LC94:
	.string	"PetrikIsTheBest"
	.text
	.globl	start
	.type	start, @function
start:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$2, %edi
	call	sleep@PLT
	leaq	.LC90(%rip), %rdi
	call	puts@PLT
	leaq	.LC91(%rip), %rdi
	call	puts@PLT
	leaq	.LC92(%rip), %rdi
	call	puts@PLT
	leaq	.LC93(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %eax
	cmpl	$1, %eax
	jne	.L149
	movl	$0, %eax
	call	normal_menu
	jmp	.L156
.L149:
	movl	-32(%rbp), %eax
	cmpl	$2, %eax
	jne	.L151
	movl	$0, %eax
	call	vegan_menu
	jmp	.L156
.L151:
	movl	-32(%rbp), %eax
	cmpl	$3, %eax
	jne	.L152
	movl	$0, %eax
	call	keto_menu
	jmp	.L156
.L152:
	movl	-32(%rbp), %eax
	cmpl	$4, %eax
	jne	.L153
	movl	$0, %eax
	call	Mini_menu
	jmp	.L156
.L153:
	movl	-32(%rbp), %eax
	cmpl	$1122334455, %eax
	jne	.L156
	leaq	-23(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-23(%rbp), %rax
	leaq	.LC94(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jne	.L156
	movl	$0, %eax
	call	staff_menu
.L156:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L155
	call	__stack_chk_fail@PLT
.L155:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	start, .-start
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	customer
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.2.0-13ubuntu1) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
