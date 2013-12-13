.section .rodata
	.align 8
.align 1
.globl sqr_tb
.type sqr_tb, @object
sqr_tb:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	16
	.byte	17
	.byte	20
	.byte	21
	.byte	64
	.byte	65
	.byte	68
	.byte	69
	.byte	80
	.byte	81
	.byte	84
	.byte	85
	.byte	0
.text
	.align 8
.globl gf2m_cmm_mul1x1
.type gf2m_cmm_mul1x1, @object
gf2m_cmm_mul1x1:
.Lc1J:
	movq %rbx,%rax
	movq %r14,%rcx
	movq 176(%r13),%rdx
	cmpq $0,16(%rdx)
	je .Lc1K
	movq g0,%rdx
	movq 56(%rdx),%rdx
	cmpq large_alloc_lim,%rdx
	jae .Lc1K
.Lc1L:
	leaq -128(%rbp),%rdx
	cmpq %r15,%rdx
	jb .Lc1M
	leaq -128(%rbp),%rbx
	movq %rax,%rdx
	shrq $61,%rdx
	movq $2305843009213693951,%rsi
	andq %rsi,%rax
	movq %rax,%rsi
	shlq $1,%rsi
	movq %rsi,%rdi
	shlq $1,%rdi
	movq %rdi,%r8
	shlq $1,%r8
	movq $0,0(%rbx)
	movq %rax,8(%rbx)
	movq %rsi,16(%rbx)
	movq %rax,%r9
	xorq %rsi,%r9
	movq %r9,24(%rbx)
	movq %rdi,32(%rbx)
	movq %rax,%r9
	xorq %rdi,%r9
	movq %r9,40(%rbx)
	movq %rsi,%r9
	xorq %rdi,%r9
	movq %r9,48(%rbx)
	movq %rsi,%r9
	xorq %rdi,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,56(%rbx)
	movq %r8,64(%rbx)
	movq %rax,%r9
	xorq %r8,%r9
	movq %r9,72(%rbx)
	movq %rsi,%r9
	xorq %r8,%r9
	movq %r9,80(%rbx)
	movq %rsi,%r9
	xorq %r8,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,88(%rbx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %r9,96(%rbx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,104(%rbx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %rsi,%r10
	xorq %r9,%r10
	movq %r10,112(%rbx)
	xorq %r8,%rdi
	xorq %rdi,%rsi
	xorq %rsi,%rax
	movq %rax,120(%rbx)
	movq %rcx,%rax
	andq $15,%rax
	movq (%rbx,%rax,8),%rax
	movq %rcx,%rsi
	shrq $4,%rsi
	andq $15,%rsi
	movq (%rbx,%rsi,8),%rsi
	movq %rsi,%rdi
	shlq $4,%rdi
	xorq %rdi,%rax
	shrq $60,%rsi
	movq %rcx,%rdi
	shrq $8,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $8,%r8
	xorq %r8,%rax
	shrq $56,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $12,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $12,%r8
	xorq %r8,%rax
	shrq $52,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $16,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $16,%r8
	xorq %r8,%rax
	shrq $48,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $20,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $20,%r8
	xorq %r8,%rax
	shrq $44,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $24,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $24,%r8
	xorq %r8,%rax
	shrq $40,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $28,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $28,%r8
	xorq %r8,%rax
	shrq $36,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $32,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $32,%r8
	xorq %r8,%rax
	shrq $32,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $36,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $36,%r8
	xorq %r8,%rax
	shrq $28,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $40,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $40,%r8
	xorq %r8,%rax
	shrq $24,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $44,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $44,%r8
	xorq %r8,%rax
	shrq $20,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $48,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $48,%r8
	xorq %r8,%rax
	shrq $16,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $52,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $52,%r8
	xorq %r8,%rax
	shrq $12,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $56,%rdi
	andq $15,%rdi
	movq (%rbx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $56,%r8
	xorq %r8,%rax
	shrq $8,%rdi
	xorq %rdi,%rsi
	movq %rcx,%rdi
	shrq $60,%rdi
	movq (%rbx,%rdi,8),%rbx
	movq %rbx,%rdi
	shlq $60,%rdi
	xorq %rdi,%rax
	shrq $4,%rbx
	xorq %rbx,%rsi
	testq $1,%rdx
	ja .Lc1N
.Lc1O:
	testq $2,%rdx
	ja .Lc1P
.Lc1Q:
	testq $4,%rdx
	ja .Lc1R
.Lc1S:
	movq %rsi,%rbx
	movq %rax,%r14
	jmp *0(%rbp)
.Lc1K:
	movq $255,64(%r13)
	movq $gf2m_cmm_mul1x1,72(%r13)
	movq $0,192(%r13)
	jmp stg_gc_gen_hp
.Lc1M:
	movq $255,64(%r13)
	movq $gf2m_cmm_mul1x1,72(%r13)
	jmp stg_gc_gen
.Lc1N:
	movq %rcx,%rbx
	shlq $61,%rbx
	xorq %rbx,%rax
	movq %rcx,%rbx
	shrq $3,%rbx
	xorq %rbx,%rsi
	jmp .Lc1O
.Lc1P:
	movq %rcx,%rbx
	shlq $62,%rbx
	xorq %rbx,%rax
	movq %rcx,%rbx
	shrq $2,%rbx
	xorq %rbx,%rsi
	jmp .Lc1Q
.Lc1R:
	movq %rcx,%rbx
	shlq $63,%rbx
	xorq %rbx,%rax
	shrq $1,%rcx
	xorq %rcx,%rsi
	jmp .Lc1S
	.size gf2m_cmm_mul1x1, .-gf2m_cmm_mul1x1
.text
	.align 8
.globl gf2m_cmm_sqr
.type gf2m_cmm_sqr, @object
gf2m_cmm_sqr:
.Lc4l:
	movq %rbx,%rax
	movq %rbx,%rcx
	shlq $1,%rcx
	movq %rcx,%rdx
	shlq $3,%rdx
	addq $16,%rdx
	addq %rdx,%r12
	cmpq 144(%r13),%r12
	ja .Lc4n
	leaq -1(%rcx),%rbx
	shlq $3,%rbx
	leaq -16(%r12),%rdx
	subq %rbx,%rdx
	movq $stg_ARR_WORDS_info,(%rdx)
	movq %rcx,%rbx
	shlq $3,%rbx
	movq %rbx,8(%rdx)
	leaq 16(%rdx),%rbx
	leaq 16(%r14),%rsi
	xorl %edi,%edi
.Lc4o:
	cmpq %rax,%rdi
	jb .Lc4p
.Lc4q:
	movq %rcx,%rbx
	movq %rdx,%r14
	jmp *0(%rbp)
.Lc4n:
	shlq $3,%rcx
	leaq 16(%rcx),%rax
	movq %rax,192(%r13)
.Lc4m:
	movq $253,64(%r13)
	movq $gf2m_cmm_sqr,72(%r13)
	jmp stg_gc_gen
.Lc4p:
	movq (%rsi,%rdi,8),%r8
	shrq $32,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	movq (%rsi,%rdi,8),%r9
	shrq $36,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $8,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $40,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $16,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $44,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $24,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $48,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $32,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $52,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $40,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $56,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $48,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $60,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $56,%r9
	orq %r8,%r9
	movq %rdi,%r8
	shlq $1,%r8
	incq %r8
	movq %r9,(%rbx,%r8,8)
	movq (%rsi,%rdi,8),%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	movq (%rsi,%rdi,8),%r9
	shrq $4,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $8,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $8,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $16,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $12,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $24,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $16,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $32,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $20,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $40,%r9
	orq %r8,%r9
	movq (%rsi,%rdi,8),%r8
	shrq $24,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $48,%r8
	orq %r9,%r8
	movq (%rsi,%rdi,8),%r9
	shrq $28,%r9
	andq $15,%r9
	movsbq sqr_tb(%r9),%r9
	shlq $56,%r9
	orq %r8,%r9
	movq %rdi,%r8
	shlq $1,%r8
	movq %r9,(%rbx,%r8,8)
	incq %rdi
	jmp .Lc4o
	.size gf2m_cmm_sqr, .-gf2m_cmm_sqr
.text
	.align 8
.globl gf2m_cmm_mod
.type gf2m_cmm_mod, @object
gf2m_cmm_mod:
.Lc5I:
	movq %rbx,%rax
	movq %rbx,%rcx
	shlq $3,%rcx
	addq $16,%rcx
	addq %rcx,%r12
	cmpq 144(%r13),%r12
	ja .Lc5K
	leaq -1(%rax),%rbx
	shlq $3,%rbx
	leaq -16(%r12),%rcx
	subq %rbx,%rcx
	movq $stg_ARR_WORDS_info,(%rcx)
	shlq $3,%rbx
	movq %rbx,8(%rcx)
	movq 8(%rsi),%rbx
	shrq $3,%rbx
	leaq 16(%r14),%rdx
	addq $16,%rsi
	addq $16,%rcx
	xorl %edi,%edi
.Lc5L:
	cmpq %rax,%rdi
	jb .Lc5M
.Lc5N:
	movq 0(%rsi),%rdx
	movq %rdx,%rdi
	shrq $6,%rdi
	leaq -1(%rax),%r8
.Lc5O:
	cmpq %rdi,%r8
	ja .Lc5P
.Lc5X:
	cmpq %rdi,%r8
	jne .Lc5Y
.Lc5Z:
	decq %rbx
.Lc60:
	movl $64,%r8d
	movq %rax,64(%rsp)
	movq %rdx,%rax
	movq %rdx,72(%rsp)
	xorq %rdx,%rdx
	divq %r8
	movq (%rcx,%rdi,8),%rax
	movq %rcx,80(%rsp)
	movq %rdx,%rcx
	shrq %cl,%rax
	testq %rax,%rax
	je .Lc61
.Lc62:
	movl $64,%ecx
	subq %rdx,%rcx
	testq %rdx,%rdx
	ja .Lc63
	movq 80(%rsp),%rcx
	movq $0,(%rcx,%rdi,8)
.Lc64:
	movq 0(%rcx),%rdx
	xorq %rax,%rdx
	movq %rdx,0(%rcx)
	movl $1,%edx
.Lc65:
	cmpq %rbx,%rdx
	jb .Lc66
.Lc6b:
.Ln7i:
	movq 72(%rsp),%rdx
	movq 64(%rsp),%rax
	jmp .Lc60
.Lc5K:
	shlq $3,%rax
	addq $16,%rax
	movq %rax,192(%r13)
.Lc5J:
	movq $249,64(%r13)
	movq $gf2m_cmm_mod,72(%r13)
	jmp stg_gc_gen
.Lc5M:
	movq (%rdx,%rdi,8),%r8
	movq %r8,(%rcx,%rdi,8)
	incq %rdi
	jmp .Lc5L
.Lc5U:
	movq %r9,%rcx
	movq %rcx,96(%rsp)
	movq %rax,%rcx
	movq 96(%rsp),%rax
	shlq %cl,%rax
	movq 88(%rsp),%rcx
	movq %rcx,%rdx
	subq %r11,%rdx
	decq %rdx
	movq (%r14,%rdx,8),%rdx
	xorq %rax,%rdx
	movq %rcx,%rax
	subq %r11,%rax
	decq %rax
	movq %rdx,(%r14,%rax,8)
.Ln7d:
	movq %r14,80(%rsp)
.Lc5V:
	incq %r10
.Ln7e:
	movq 88(%rsp),%r8
	movq 72(%rsp),%rdx
	movq 64(%rsp),%rax
	movq %r14,%rcx
.Lc5S:
	cmpq %rbx,%r10
	jb .Lc5T
.Lc5W:
	jmp .Lc5O
.Lc5T:
	movq %rdx,%r11
	subq (%rsi,%r10,8),%r11
	movl $64,%r14d
	movq %rax,64(%rsp)
	movq %r11,%rax
	movq %rdx,72(%rsp)
	xorq %rdx,%rdx
	divq %r14
	movl $64,%eax
	subq %rdx,%rax
	shrq $6,%r11
	movq %r9,%r14
	movq %rcx,80(%rsp)
	movq %rdx,%rcx
	shrq %cl,%r14
	movq %r8,%rcx
	subq %r11,%rcx
	movq %r8,88(%rsp)
	movq 80(%rsp),%r8
	movq (%r8,%rcx,8),%rcx
	xorq %r14,%rcx
	movq 88(%rsp),%r14
	movq %r14,%r8
	subq %r11,%r8
	movq 80(%rsp),%r14
	movq %rcx,(%r14,%r8,8)
	testq %rdx,%rdx
	ja .Lc5U
	jmp .Lc5V
.Lc5P:
	movq (%rcx,%r8,8),%r9
	testq %r9,%r9
	je .Lc5Q
.Lc5R:
	movq $0,(%rcx,%r8,8)
	movl $1,%r10d
	jmp .Lc5S
.Lc5Q:
	decq %r8
	jmp .Lc5O
.Lc5Y:
.Lc6c:
	decq %rax
.Lc6d:
	cmpq $0,(%rcx,%rax,8)
	je .Lc6e
.Lc6f:
	leaq 1(%rax),%rbx
	leaq -16(%rcx),%r14
	jmp *0(%rbp)
.Lc68:
	leaq 1(%r8),%rax
	movq 80(%rsp),%rcx
	movq (%rcx,%rax,8),%rax
	xorq %r10,%rax
	leaq 1(%r8),%rdx
	movq %rax,(%rcx,%rdx,8)
.Ln7g:
	movq %r9,112(%rsp)
.Lc69:
.Lc6a:
	movq 120(%rsp),%rax
	incq %rax
.Ln7h:
	movq 80(%rsp),%rcx
	movq %rax,%rdx
	movq %r9,%rax
	jmp .Lc65
.Lc67:
	testq %r10,%r10
	ja .Lc68
	jmp .Lc69
.Lc66:
	movq (%rsi,%rdx,8),%r8
	shrq $6,%r8
	movl $64,%r9d
	movq %rax,112(%rsp)
	movq (%rsi,%rdx,8),%rax
	movq %rdx,120(%rsp)
	xorq %rdx,%rdx
	divq %r9
	movl $64,%eax
	subq %rdx,%rax
	movq 112(%rsp),%r9
	movq %r9,%r10
	movq %rdx,%rcx
	shlq %cl,%r10
	movq 80(%rsp),%rcx
	movq (%rcx,%r8,8),%r11
	xorq %r10,%r11
	movq %r11,(%rcx,%r8,8)
	movq %r9,%r10
	movq %rax,%rcx
	shrq %cl,%r10
	testq %rdx,%rdx
	ja .Lc67
	jmp .Lc6a
.Lc63:
	movq 80(%rsp),%rdx
	movq (%rdx,%rdi,8),%r8
	movq %rcx,104(%rsp)
	shlq %cl,%r8
	movq 104(%rsp),%rcx
	shrq %cl,%r8
	movq %r8,(%rdx,%rdi,8)
.Ln7f:
	movq %rdx,%rcx
	movq %rdx,80(%rsp)
	jmp .Lc64
.Lc61:
.Ln7j:
	movq 80(%rsp),%rcx
	movq 64(%rsp),%rax
	jmp .Lc6c
.Lc6e:
	decq %rax
	jmp .Lc6d
	.size gf2m_cmm_mod, .-gf2m_cmm_mod
.text
	.align 8
.globl gf2m_cmm_div
.type gf2m_cmm_div, @object
gf2m_cmm_div:
.Lc8k:
	movq %r8,%rax
	movq %r8,%rcx
	shlq $3,%rcx
	leaq 16(%rcx),%rdx
	addq %rdx,%r12
	cmpq 144(%r13),%r12
	ja .Lc8m
	movl $8,%edx
	subq %rcx,%rdx
	leaq -16(%r12),%r10
	addq %rdx,%r10
	movq $stg_ARR_WORDS_info,(%r10)
	movq %rcx,8(%r10)
	movq 176(%r13),%rdx
	cmpq $0,16(%rdx)
	je .Lc8n
	movq g0,%rdx
	movq 56(%rdx),%rdx
	cmpq large_alloc_lim,%rdx
	jae .Lc8n
.Lc8o:
	movq %rcx,%rdx
	imulq $3,%rdx
	movq %rbp,%r11
	subq %rdx,%r11
	cmpq %r15,%r11
	jb .Lc8p
	leaq 16(%r9),%rdx
	addq $16,%rdi
	leaq 16(%r14),%r8
	movq %rbp,%r9
	subq %rcx,%r9
	movq %r9,%r11
	subq %rcx,%r11
	movq %r11,%r14
	subq %rcx,%r14
	leaq 16(%r10),%rcx
	movq %r10,64(%rsp)
	xorl %r10d,%r10d
.Lc8q:
	cmpq %rax,%r10
	jb .Lc8r
.Lc8w:
	xorl %ebx,%ebx
	leaq -1(%rax),%rsi
.Lc8x:
	testq %rsi,%rsi
	jae .Lc8y
.Lc8B:
.Lc8C:
	xorl %esi,%esi
	leaq -1(%rax),%rdi
.Lc8D:
	testq %rdi,%rdi
	jae .Lc8E
.Lc8H:
.Lc8I:
	movq 0(%r11),%rdi
	testq %rsi,%rsi
	ja .Lc8J
.Lc8P:
	cmpq $64,%rsi
	jbe .Lc8Q
.Lc8T:
	cmpq %rbx,%rsi
	jb .Lc8U
.Lc8V:
	xorl %edi,%edi
.Lc8W:
	cmpq %rax,%rdi
	jb .Lc8X
.Lc8Y:
	cmpq %rbx,%rsi
	je .Lc8Z
.Lc90:
	jmp .Lc8I
.Lc8m:
	leaq 16(%rcx),%rax
	movq %rax,192(%r13)
.Lc8l:
	movq $213,64(%r13)
	movq $gf2m_cmm_div,72(%r13)
	jmp stg_gc_gen
.Lc8n:
	movq $213,64(%r13)
	movq $gf2m_cmm_div,72(%r13)
	movq $0,192(%r13)
	jmp stg_gc_gen_hp
.Lc8p:
	movq $213,64(%r13)
	movq $gf2m_cmm_div,72(%r13)
	jmp stg_gc_gen
.Lc8u:
	movq %rax,72(%rsp)
	movq (%rdi,%r10,8),%rax
	movq %rax,(%r11,%r10,8)
.Lnaf:
	movq 72(%rsp),%rax
.Lc8v:
	movq %rax,72(%rsp)
	movq (%rdx,%r10,8),%rax
	movq %rax,(%r14,%r10,8)
	incq %r10
.Lnag:
	movq 72(%rsp),%rax
	jmp .Lc8q
.Lc8s:
	movq %rax,72(%rsp)
	movq (%r8,%r10,8),%rax
	movq %rax,(%rcx,%r10,8)
.Lnae:
	movq 72(%rsp),%rax
.Lc8t:
	movq $0,(%r9,%r10,8)
	cmpq %rsi,%r10
	jb .Lc8u
	movq $0,(%r11,%r10,8)
	jmp .Lc8v
.Lc8r:
	cmpq %rbx,%r10
	jb .Lc8s
	movq $0,(%rcx,%r10,8)
	jmp .Lc8t
.Lc8z:
	decq %rsi
	jmp .Lc8x
.Lc8y:
	movq (%r14,%rsi,8),%rdi
	lzcnt %rdi,%rdi
	addq %rdi,%rbx
	cmpq $64,%rdi
	je .Lc8z
	movq %rax,%rsi
	shlq $6,%rsi
	subq %rbx,%rsi
.Lc8A:
.Lnah:
	movq %rsi,%rbx
	jmp .Lc8B
.Lc8Z:
	jmp .Lc8C
.Lc8F:
	decq %rdi
	jmp .Lc8D
.Lc8E:
	movq (%r11,%rdi,8),%r8
	lzcnt %r8,%r8
	addq %r8,%rsi
	cmpq $64,%r8
	je .Lc8F
	movq %rax,%rdi
	shlq $6,%rdi
	subq %rsi,%rdi
.Lc8G:
.Lnai:
	movq %rdi,%rsi
	jmp .Lc8H
.Lc8M:
	leaq 1(%r10),%rsi
	movq (%r11,%rsi,8),%rsi
	movq %rbx,88(%rsp)
	movq %rsi,%rbx
	shlq $63,%rbx
	shrq $1,%rdi
	orq %rbx,%rdi
	movq %rdi,(%r11,%r10,8)
	leaq 1(%r10),%rbx
	movq (%rdx,%rbx,8),%rbx
	andq %rax,%rbx
	leaq 1(%r10),%rdi
	movq (%rcx,%rdi,8),%rdi
	xorq %rbx,%rdi
	movq %rdi,%rbx
	shlq $63,%rbx
	shrq $1,%r8
	orq %rbx,%r8
	movq %r8,(%rcx,%r10,8)
	incq %r10
.Lnaj:
	movq 88(%rsp),%rbx
	movq %rdi,%r8
	movq %rsi,%rdi
	movq 80(%rsp),%rsi
.Lc8L:
	movq %rsi,80(%rsp)
	movq 72(%rsp),%rsi
	decq %rsi
	cmpq %rsi,%r10
	jb .Lc8M
.Lc8N:
	shrq $1,%rdi
	movq %rdi,(%r11,%r10,8)
	shrq $1,%r8
	movq %r8,(%rcx,%r10,8)
	movq 80(%rsp),%rax
	decq %rax
.Lnak:
	movq %rax,%rsi
	movq 72(%rsp),%rax
	jmp .Lc8I
.Lc8K:
	movq 0(%rcx),%r8
	movq %r8,%r10
	andq $1,%r10
	movq %rax,72(%rsp)
	xorl %eax,%eax
	subq %r10,%rax
	movq 0(%rdx),%r10
	andq %rax,%r10
	xorq %r10,%r8
	xorl %r10d,%r10d
	jmp .Lc8L
.Lc8X:
	movq (%r11,%rdi,8),%r8
	xorq (%r14,%rdi,8),%r8
	movq %r8,(%r11,%rdi,8)
	movq (%rcx,%rdi,8),%r8
	xorq (%r9,%rdi,8),%r8
	movq %r8,(%rcx,%rdi,8)
	incq %rdi
	jmp .Lc8W
.Lc8U:
.Lnal:
	movq %r11,96(%rsp)
	movq %r14,%r11
	movq 96(%rsp),%r14
	movq %rcx,104(%rsp)
	movq %r9,%rcx
	movq 104(%rsp),%r9
	movq %rbx,80(%rsp)
	movq %rsi,%rbx
	movq 80(%rsp),%rsi
	jmp .Lc8V
.Lc8Q:
	cmpq $1,0(%r11)
	je .Lc8R
.Lc8S:
	jmp .Lc8T
.Lc8J:
	testq $1,%rdi
	je .Lc8K
.Lc8O:
	jmp .Lc8P
.Lc8R:
.Lc91:
	leaq -16(%rcx),%rbx
	movq 64(%rsp),%rdx
	cmpq %rdx,%rbx
	jne .Lc92
.Lc96:
	movq %rax,%rbx
	movq %rdx,%r14
	jmp *0(%rbp)
.Lc92:
	xorl %ebx,%ebx
.Lc93:
	cmpq %rax,%rbx
	jb .Lc94
.Lc95:
	jmp .Lc96
.Lc94:
	movq (%rcx,%rbx,8),%rsi
	movq %rsi,(%r9,%rbx,8)
	incq %rbx
	jmp .Lc93
	.size gf2m_cmm_div, .-gf2m_cmm_div
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.6.2"
