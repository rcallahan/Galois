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
.globl cmm_lzcnt
.type cmm_lzcnt, @object
cmm_lzcnt:
.Lc1:
	notq %rbx
	jmp *(%rbp)
	.size cmm_lzcnt, .-cmm_lzcnt
.text
	.align 8
.globl gf2m_cmm_mul1x1
.type gf2m_cmm_mul1x1, @object
gf2m_cmm_mul1x1:
.Lcu:
	movq 888(%r13),%rax
	cmpq $0,16(%rax)
	je .Lcd
.Lcf:
	movq g0,%rax
	movq 56(%rax),%rax
	cmpq large_alloc_lim,%rax
	jae .Lcd
.Ln5D:
	movq %rbx,%rax
	movq %r14,%rbx
.Lch:
	leaq -120(%rbp),%rcx
	cmpq %r15,%rcx
	jb .Lcj
.Lck:
	leaq -128(%rbp),%rcx
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
	movq $0,(%rcx)
	movq %rax,8(%rcx)
	movq %rsi,16(%rcx)
	movq %rax,%r9
	xorq %rsi,%r9
	movq %r9,24(%rcx)
	movq %rdi,32(%rcx)
	movq %rax,%r9
	xorq %rdi,%r9
	movq %r9,40(%rcx)
	movq %rsi,%r9
	xorq %rdi,%r9
	movq %r9,48(%rcx)
	movq %rsi,%r9
	xorq %rdi,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,56(%rcx)
	movq %r8,64(%rcx)
	movq %rax,%r9
	xorq %r8,%r9
	movq %r9,72(%rcx)
	movq %rsi,%r9
	xorq %r8,%r9
	movq %r9,80(%rcx)
	movq %rsi,%r9
	xorq %r8,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,88(%rcx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %r9,96(%rcx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %rax,%r10
	xorq %r9,%r10
	movq %r10,104(%rcx)
	movq %rdi,%r9
	xorq %r8,%r9
	movq %rsi,%r10
	xorq %r9,%r10
	movq %r10,112(%rcx)
	xorq %r8,%rdi
	xorq %rdi,%rsi
	xorq %rsi,%rax
	movq %rax,120(%rcx)
	movq %rbx,%rax
	andq $15,%rax
	movq (%rcx,%rax,8),%rax
	movq %rbx,%rsi
	shrq $4,%rsi
	andq $15,%rsi
	movq (%rcx,%rsi,8),%rsi
	movq %rsi,%rdi
	shlq $4,%rdi
	xorq %rdi,%rax
	shrq $60,%rsi
	movq %rbx,%rdi
	shrq $8,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $8,%r8
	xorq %r8,%rax
	shrq $56,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $12,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $12,%r8
	xorq %r8,%rax
	shrq $52,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $16,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $16,%r8
	xorq %r8,%rax
	shrq $48,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $20,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $20,%r8
	xorq %r8,%rax
	shrq $44,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $24,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $24,%r8
	xorq %r8,%rax
	shrq $40,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $28,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $28,%r8
	xorq %r8,%rax
	shrq $36,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $32,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $32,%r8
	xorq %r8,%rax
	shrq $32,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $36,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $36,%r8
	xorq %r8,%rax
	shrq $28,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $40,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $40,%r8
	xorq %r8,%rax
	shrq $24,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $44,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $44,%r8
	xorq %r8,%rax
	shrq $20,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $48,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $48,%r8
	xorq %r8,%rax
	shrq $16,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $52,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $52,%r8
	xorq %r8,%rax
	shrq $12,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $56,%rdi
	andq $15,%rdi
	movq (%rcx,%rdi,8),%rdi
	movq %rdi,%r8
	shlq $56,%r8
	xorq %r8,%rax
	shrq $8,%rdi
	xorq %rdi,%rsi
	movq %rbx,%rdi
	shrq $60,%rdi
	movq (%rcx,%rdi,8),%rcx
	movq %rcx,%rdi
	shlq $60,%rdi
	xorq %rdi,%rax
	shrq $4,%rcx
	xorq %rcx,%rsi
	testq $1,%rdx
	jbe .Lcm
.Lcl:
	movq %rbx,%rcx
	shlq $61,%rcx
	xorq %rcx,%rax
	movq %rbx,%rcx
	shrq $3,%rcx
	xorq %rcx,%rsi
.Lcm:
	testq $2,%rdx
	jbe .Lcp
.Lco:
	movq %rbx,%rcx
	shlq $62,%rcx
	xorq %rcx,%rax
	movq %rbx,%rcx
	shrq $2,%rcx
	xorq %rcx,%rsi
.Lcp:
	testq $4,%rdx
	jbe .Lcs
.Lcr:
	movq %rbx,%rcx
	shlq $63,%rcx
	xorq %rcx,%rax
	shrq $1,%rbx
	xorq %rbx,%rsi
.Lcs:
	movq %rax,%r14
	movq %rsi,%rbx
	jmp *(%rbp)
.Lcd:
	movq $0,904(%r13)
	movq %r14,%rax
	movl $gf2m_cmm_mul1x1,%r14d
	andq %rax,%rbx
	jmp stg_gc_prim_n
.text
	.align 8
	.quad	194
	.quad	32
ci_info:
.Lci:
	movq 8(%rbp),%rax
	movq 16(%rbp),%rbx
.Luv:
	addq $24,%rbp
	jmp .Lch
.Lcj:
	movq $ci_info,-24(%rbp)
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	addq $-24,%rbp
	jmp stg_gc_noregs
	.size gf2m_cmm_mul1x1, .-gf2m_cmm_mul1x1
.text
	.align 8
.globl gf2m_cmm_sqr
.type gf2m_cmm_sqr, @object
gf2m_cmm_sqr:
.LcJ:
	movq %rbx,%rax
	shlq $1,%rax
	movq %rax,%rcx
	shlq $3,%rcx
	addq $16,%rcx
	addq %rcx,%r12
	cmpq 856(%r13),%r12
	ja .LcC
.LcE:
	leaq -1(%rax),%rcx
	shlq $3,%rcx
	leaq -16(%r12),%rdx
	subq %rcx,%rdx
	movq $stg_ARR_WORDS_info,(%rdx)
	movq %rax,%rcx
	shlq $3,%rcx
	movq %rcx,8(%rdx)
	leaq 16(%rdx),%rcx
	addq $16,%r14
	xorl %esi,%esi
.LcF:
	cmpq %rbx,%rsi
	jb .LcG
.LcI:
	movq %rdx,%r14
	movq %rax,%rbx
	jmp *(%rbp)
.LcC:
	shlq $3,%rax
	addq $16,%rax
	movq %rax,904(%r13)
	movq %r14,%rax
	movl $gf2m_cmm_sqr,%r14d
	movq %rax,%rbx
	jmp stg_gc_prim_p
.LcG:
	movq (%r14,%rsi,8),%rdi
	shrq $32,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	movq (%r14,%rsi,8),%r8
	shrq $36,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $8,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $40,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $16,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $44,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $24,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $48,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $32,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $52,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $40,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $56,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $48,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $60,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $56,%r8
	orq %rdi,%r8
	movq %rsi,%rdi
	shlq $1,%rdi
	incq %rdi
	movq %r8,(%rcx,%rdi,8)
	movq (%r14,%rsi,8),%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	movq (%r14,%rsi,8),%r8
	shrq $4,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $8,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $8,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $16,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $12,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $24,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $16,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $32,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $20,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $40,%r8
	orq %rdi,%r8
	movq (%r14,%rsi,8),%rdi
	shrq $24,%rdi
	andq $15,%rdi
	movsbq sqr_tb(%rdi),%rdi
	shlq $48,%rdi
	orq %r8,%rdi
	movq (%r14,%rsi,8),%r8
	shrq $28,%r8
	andq $15,%r8
	movsbq sqr_tb(%r8),%r8
	shlq $56,%r8
	orq %rdi,%r8
	movq %rsi,%rdi
	shlq $1,%rdi
	movq %r8,(%rcx,%rdi,8)
	incq %rsi
	jmp .LcF
	.size gf2m_cmm_sqr, .-gf2m_cmm_sqr
.text
	.align 8
.globl gf2m_cmm_mod
.type gf2m_cmm_mod, @object
gf2m_cmm_mod:
.Lc1J:
	movq %rbx,%rax
	shlq $3,%rax
	addq $16,%rax
	addq %rax,%r12
	cmpq 856(%r13),%r12
	ja .LcN
.LcP:
	leaq -1(%rbx),%rax
	shlq $3,%rax
	leaq -16(%r12),%rcx
	subq %rax,%rcx
	movq $stg_ARR_WORDS_info,(%rcx)
	movq %rbx,%rax
	shlq $3,%rax
	movq %rax,8(%rcx)
	movq 8(%rsi),%rax
	shrq $3,%rax
	addq $16,%r14
	addq $16,%rsi
	addq $16,%rcx
	xorl %edx,%edx
.LcV:
	cmpq %rbx,%rdx
	jb .LcW
.LcY:
	movq (%rsi),%rdx
	movq %rdx,%rdi
	shrq $6,%rdi
	leaq -1(%rbx),%r8
.Lc16:
	cmpq %rdi,%r8
	ja .Lc17
.Lc19:
	cmpq %rdi,%r8
	jne .Lc1E
.Lc1m:
	decq %rax
.Lc1n:
	movl $64,%r8d
	movq %rax,%r9
	movq %rdx,%rax
	movq %rdx,%r10
	xorq %rdx,%rdx
	divq %r8
	movq (%rcx,%rdi,8),%rax
	movq %rcx,%r8
	movq %rdx,%rcx
	shrq %cl,%rax
	testq %rax,%rax
	je .Ln7E
.Lc1q:
	movl $64,%ecx
	subq %rdx,%rcx
	testq %rdx,%rdx
	ja .Lc1r
.Lc1t:
	movq $0,(%r8,%rdi,8)
.Lc1s:
	movq (%r8),%rcx
	xorq %rax,%rcx
	movq %rcx,(%r8)
	movl $1,%ecx
.Lc1u:
	cmpq %r9,%rcx
	jae .Ln7F
.Lc1v:
	movq (%rsi,%rcx,8),%rdx
	shrq $6,%rdx
	movl $64,%r11d
	movq %rax,%r14
	movq (%rsi,%rcx,8),%rax
	movq %rdx,96(%rsp)
	xorq %rdx,%rdx
	divq %r11
	movl $64,%eax
	subq %rdx,%rax
	movq %r14,%r11
	movq %rcx,104(%rsp)
	movq %rdx,%rcx
	shlq %cl,%r11
	movq 96(%rsp),%rcx
	movq (%r8,%rcx,8),%rcx
	xorq %r11,%rcx
	movq 96(%rsp),%r11
	movq %rcx,(%r8,%r11,8)
	movq %r14,%rcx
	movq %rcx,112(%rsp)
	movq %rax,%rcx
	movq 112(%rsp),%rax
	shrq %cl,%rax
	testq %rdx,%rdx
	jbe .Lc1z
.Lc1y:
	testq %rax,%rax
	jbe .Lc1z
.Lc1B:
	leaq 1(%r11),%rcx
	movq (%r8,%rcx,8),%rcx
	xorq %rax,%rcx
	leaq 1(%r11),%rax
	movq %rcx,(%r8,%rax,8)
.Lc1z:
	movq 104(%rsp),%rax
	incq %rax
.Ln7G:
	movq %rax,%rcx
	movq %r14,%rax
	jmp .Lc1u
.LcN:
	shlq $3,%rbx
	leaq 16(%rbx),%rax
	movq %rax,904(%r13)
	movq %r14,%rax
	movl $gf2m_cmm_mod,%r14d
	movq %rax,%rbx
	andq %rsi,%rbx
	jmp stg_gc_prim_p
.LcW:
	movq (%r14,%rdx,8),%rdi
	movq %rdi,(%rcx,%rdx,8)
	incq %rdx
	jmp .LcV
.Lc1a:
	decq %r8
	jmp .Lc16
.Lc17:
	movq (%rcx,%r8,8),%r9
	testq %r9,%r9
	je .Lc1a
.Lc1c:
	movq $0,(%rcx,%r8,8)
	movl $1,%r10d
.Lc1d:
	cmpq %rax,%r10
	jae .Lc16
.Lc1e:
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
	movq %rbx,88(%rsp)
	movq 80(%rsp),%rbx
	movq (%rbx,%rcx,8),%rcx
	xorq %r14,%rcx
	movq %r8,%r14
	subq %r11,%r14
	movq %rcx,(%rbx,%r14,8)
	testq %rdx,%rdx
	jbe .Lc1i
.Lc1h:
	movq %r9,%rcx
	movq %rcx,%rdx
	movq %rax,%rcx
	shlq %cl,%rdx
	movq %r8,%rax
	subq %r11,%rax
	decq %rax
	movq (%rbx,%rax,8),%rax
	xorq %rdx,%rax
	movq %r8,%rcx
	subq %r11,%rcx
	decq %rcx
	movq %rax,(%rbx,%rcx,8)
.Lc1i:
	incq %r10
.Ln7D:
	movq 72(%rsp),%rdx
	movq 64(%rsp),%rax
	movq %rbx,%rcx
	movq 88(%rsp),%rbx
	jmp .Lc1d
.Ln7F:
	movq %r10,%rdx
	movq %r9,%rax
	movq %r8,%rcx
	jmp .Lc1n
.Lc1r:
	movq (%r8,%rdi,8),%rdx
	movq %rcx,%r11
	shlq %cl,%rdx
	movq %r11,%rcx
	shrq %cl,%rdx
	movq %rdx,(%r8,%rdi,8)
	jmp .Lc1s
.Ln7E:
	movq %r8,%rcx
.Lc1E:
	leaq -1(%rbx),%rax
.Lc1F:
	cmpq $0,(%rcx,%rax,8)
	je .Lc1G
.Lc1I:
	leaq -16(%rcx),%r14
	leaq 1(%rax),%rbx
	jmp *(%rbp)
.Lc1G:
	decq %rax
	jmp .Lc1F
	.size gf2m_cmm_mod, .-gf2m_cmm_mod
.text
	.align 8
.globl gf2m_cmm_div
.type gf2m_cmm_div, @object
gf2m_cmm_div:
.Lc3e:
	movq %r9,%rax
	movq %rdi,%rcx
	movq %r14,%rdx
	movq %r8,%r10
	shlq $3,%r10
	leaq 16(%r10),%r11
	addq %r11,%r12
	cmpq 856(%r13),%r12
	ja .Lc1R
.Lc1T:
	addq $16,%rax
	addq $16,%rcx
	addq $16,%rdx
	leaq 16(%r9),%rax
	leaq 16(%rdi),%rcx
	leaq 16(%r14),%rdx
	movl $8,%edi
	subq %r10,%rdi
	leaq -16(%r12),%r9
	addq %rdi,%r9
	movq $stg_ARR_WORDS_info,(%r9)
	movq %r10,8(%r9)
	movq 888(%r13),%rdi
	cmpq $0,16(%rdi)
	je .Lc20
.Lc22:
	movq g0,%rdi
	movq 56(%rdi),%rdi
	cmpq large_alloc_lim,%rdi
	jae .Lc20
.Ln8B:
	movq %rax,%rdi
	movq %rbx,%rax
	movq %rdx,%rbx
	movq %rcx,%rdx
	movq %rsi,%rcx
	movq %r8,%rsi
	movq %r10,%r8
.Lc24:
	movq %r8,%r10
	imulq $3,%r10
	leaq 8(%rbp),%r11
	subq %r10,%r11
	cmpq %r15,%r11
	jb .Lc26
.Lc27:
	movq %rbp,%r10
	subq %r8,%r10
	movq %r10,%r11
	subq %r8,%r11
	movq %r11,%r14
	subq %r8,%r14
	leaq 16(%r9),%r8
	movq %rax,64(%rsp)
	xorl %eax,%eax
.Lc2b:
	cmpq %rsi,%rax
	jb .Lc2c
.Lc2e:
	xorl %eax,%eax
	leaq -1(%rsi),%rbx
.Lc2l:
	testq %rbx,%rbx
	jb .Lc2s
.Lc2m:
	movq (%r14,%rbx,8),%rcx
	notq %rcx
	addq %rcx,%rax
	cmpq $64,%rcx
	je .Lc2p
.Lc2r:
	movq %rsi,%rbx
	shlq $6,%rbx
	subq %rax,%rbx
.Ln8E:
	movq %rbx,%rax
.Lc2s:
	xorl %ebx,%ebx
	leaq -1(%rsi),%rcx
.Lc2t:
	testq %rcx,%rcx
	jb .Lc2F
.Lc2u:
	movq (%r11,%rcx,8),%rdx
	notq %rdx
	addq %rdx,%rbx
	cmpq $64,%rdx
	je .Lc2x
.Lc2z:
	movq %rsi,%rcx
	shlq $6,%rcx
	subq %rbx,%rcx
.Ln8F:
	movq %rcx,%rbx
.Lc2F:
	movq (%r11),%rcx
	testq %rbx,%rbx
	jbe .Lc2H
.Lc2G:
	testq $1,%rcx
	jne .Lc2H
.Lc2J:
	movq (%r8),%rdx
	movq %rsi,104(%rsp)
	movq %rdx,%rsi
	andq $1,%rsi
	movq %rdi,112(%rsp)
	xorl %edi,%edi
	subq %rsi,%rdi
	movq 112(%rsp),%rsi
	movq (%rsi),%rsi
	andq %rdi,%rsi
	xorq %rsi,%rdx
	xorl %esi,%esi
.Lc2M:
	movq %r9,120(%rsp)
	movq 104(%rsp),%r9
	decq %r9
	cmpq %r9,%rsi
	jb .Lc2N
.Lc2P:
	shrq $1,%rcx
	movq %rcx,(%r11,%rsi,8)
	shrq $1,%rdx
	movq %rdx,(%r8,%rsi,8)
	decq %rbx
.Ln8H:
	movq 120(%rsp),%r9
	movq 112(%rsp),%rdi
	movq 104(%rsp),%rsi
	jmp .Lc2F
.Lc1R:
	leaq 16(%r10),%rbx
	movq %rbx,904(%r13)
	movl $gf2m_cmm_div,%r14d
	andq %rax,%rcx
	movq %rdx,%rbx
	andq %rcx,%rbx
	jmp stg_gc_prim_p
.Lc20:
	movq $0,904(%r13)
	movl $gf2m_cmm_div,%r14d
	movl $R4_PTR,%ebx
	andq $R2_PTR,%rbx
	andq $R6_PTR,%rbx
	jmp stg_gc_prim_n
.text
	.align 8
	.quad	13640
	.quad	32
c25_info:
.Lc25:
	movq 8(%rbp),%rax
	movq 16(%rbp),%rbx
	movq 24(%rbp),%rcx
	movq 32(%rbp),%rdx
	movq 40(%rbp),%rsi
	movq 48(%rbp),%rdi
	movq 56(%rbp),%r8
	movq 64(%rbp),%r9
.Lu3f:
	addq $72,%rbp
	jmp .Lc24
.Lc26:
	movq $c25_info,-72(%rbp)
	movq %rax,-64(%rbp)
	movq %rbx,-56(%rbp)
	movq %rcx,-48(%rbp)
	movq %rdx,-40(%rbp)
	movq %rsi,-32(%rbp)
	movq %rdi,-24(%rbp)
	movq %r8,-16(%rbp)
	movq %r9,-8(%rbp)
	addq $-72,%rbp
	jmp stg_gc_noregs
.Lc2c:
	movq %rbx,72(%rsp)
	movq 64(%rsp),%rbx
	cmpq %rbx,%rax
	jb .Lc2f
.Lc2h:
	movq $0,(%r8,%rax,8)
.Lc2g:
	movq $0,(%r10,%rax,8)
	cmpq %rcx,%rax
	jb .Lc2i
.Lc2k:
	movq $0,(%r11,%rax,8)
.Lc2j:
	movq (%rdi,%rax,8),%rbx
	movq %rbx,(%r14,%rax,8)
	incq %rax
.Ln8D:
	movq 72(%rsp),%rbx
	jmp .Lc2b
.Lc2f:
	movq 72(%rsp),%rbx
	movq (%rbx,%rax,8),%rbx
	movq %rbx,(%r8,%rax,8)
	jmp .Lc2g
.Lc2i:
	movq (%rdx,%rax,8),%rbx
	movq %rbx,(%r11,%rax,8)
	jmp .Lc2j
.Lc2p:
	decq %rbx
	jmp .Lc2l
.Lc2x:
	decq %rcx
	jmp .Lc2t
.Lc2N:
	leaq 1(%rsi),%r9
	movq (%r11,%r9,8),%r9
	movq %r8,128(%rsp)
	movq %r9,%r8
	shlq $63,%r8
	shrq $1,%rcx
	orq %r8,%rcx
	movq %rcx,(%r11,%rsi,8)
	leaq 1(%rsi),%rcx
	movq 112(%rsp),%r8
	movq (%r8,%rcx,8),%rcx
	andq %rdi,%rcx
	leaq 1(%rsi),%r8
	movq %r10,88(%rsp)
	movq 128(%rsp),%r10
	movq (%r10,%r8,8),%r8
	xorq %rcx,%r8
	movq %r8,%rcx
	shlq $63,%rcx
	shrq $1,%rdx
	orq %rcx,%rdx
	movq %rdx,(%r10,%rsi,8)
	incq %rsi
.Ln8I:
	movq %r9,%rcx
	movq 120(%rsp),%r9
	movq %r8,%rdx
	movq %r10,%r8
	movq 88(%rsp),%r10
	jmp .Lc2M
.Lc30:
	movq (%r11,%rcx,8),%rdx
	xorq (%r14,%rcx,8),%rdx
	movq %rdx,(%r11,%rcx,8)
	movq (%r8,%rcx,8),%rdx
	xorq (%r10,%rcx,8),%rdx
	movq %rdx,(%r8,%rcx,8)
	incq %rcx
.Lc2Z:
	cmpq %rsi,%rcx
	jb .Lc30
.Lc32:
	cmpq %rax,%rbx
	je .Lc2s
	jmp .Lc2F
.Lc2R:
	cmpq %rax,%rbx
	jae .Lc2X
.Lc2W:
.Ln8G:
	movq %r11,80(%rsp)
	movq %r14,%r11
	movq 80(%rsp),%r14
	movq %r8,88(%rsp)
	movq %r10,%r8
	movq 88(%rsp),%r10
	movq %rax,96(%rsp)
	movq %rbx,%rax
	movq 96(%rsp),%rbx
.Lc2X:
	xorl %ecx,%ecx
	jmp .Lc2Z
.Lc2H:
	cmpq $64,%rbx
	ja .Lc2R
.Lc2Q:
	cmpq $1,(%r11)
	jne .Lc2R
.Lc2T:
	leaq -16(%r8),%rax
	cmpq %r9,%rax
	je .Lc38
.Lc37:
	xorl %eax,%eax
.Lc3a:
	cmpq %rsi,%rax
	jae .Lc38
.Lc3b:
	movq (%r8,%rax,8),%rbx
	movq %rbx,(%r10,%rax,8)
	incq %rax
	jmp .Lc3a
.Lc38:
	movq %r9,%r14
	movq %rsi,%rbx
	jmp *(%rbp)
	.size gf2m_cmm_div, .-gf2m_cmm_div
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.7.20131212"
