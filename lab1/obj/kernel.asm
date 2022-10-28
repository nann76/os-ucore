
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 b9 2d 00 00       	call   102de5 <memset>

    cons_init();                // init the console
  10002c:	e8 5e 15 00 00       	call   10158f <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 35 10 00 	movl   $0x1035e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 35 10 00 	movl   $0x1035fc,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8e 00 00 00       	call   1000e3 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 60 2a 00 00       	call   102aba <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 6f 16 00 00       	call   1016ce <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 cf 17 00 00       	call   101833 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 07 0d 00 00       	call   100d70 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 9a 17 00 00       	call   101808 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6b 01 00 00       	call   1001de <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 c7 0c 00 00       	call   100d5e <mon_backtrace>
}
  100097:	90                   	nop
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	53                   	push   %ebx
  10009e:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b4 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 ba ff ff ff       	call   10009a <grade_backtrace1>
}
  1000e0:	90                   	nop
  1000e1:	c9                   	leave  
  1000e2:	c3                   	ret    

001000e3 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e3:	55                   	push   %ebp
  1000e4:	89 e5                	mov    %esp,%ebp
  1000e6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ee:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f5:	ff 
  1000f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100101:	e8 c2 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100106:	90                   	nop
  100107:	c9                   	leave  
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 01 36 10 00 	movl   $0x103601,(%esp)
  100138:	e8 2f 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 1d 36 10 00 	movl   $0x10361d,(%esp)
  100176:	e8 f1 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  100195:	e8 d2 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 39 36 10 00 	movl   $0x103639,(%esp)
  1001b4:	e8 b3 00 00 00       	call   10026c <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	90                   	nop
  1001c5:	c9                   	leave  
  1001c6:	c3                   	ret    

001001c7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c7:	55                   	push   %ebp
  1001c8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
        asm volatile(
  1001ca:	83 ec 08             	sub    $0x8,%esp
  1001cd:	cd 78                	int    $0x78
  1001cf:	89 ec                	mov    %ebp,%esp
		    "int %0 \n"
		    "movl %%ebp, %%esp \n"
		    :
		    :"i"(T_SWITCH_TOU)
		);
}
  1001d1:	90                   	nop
  1001d2:	5d                   	pop    %ebp
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
        asm volatile(
  1001d7:	cd 79                	int    $0x79
  1001d9:	89 ec                	mov    %ebp,%esp
		    "int %0 \n"
		    "movl %%ebp, %%esp \n"
		    :
		    :"i"(T_SWITCH_TOK)
		);
}
  1001db:	90                   	nop
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 20 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  1001f0:	e8 77 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 cd ff ff ff       	call   1001c7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0a ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100206:	e8 61 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c4 ff ff ff       	call   1001d4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f4 fe ff ff       	call   100109 <lab1_print_cur_status>
}
  100215:	90                   	nop
  100216:	c9                   	leave  
  100217:	c3                   	ret    

00100218 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021e:	8b 45 08             	mov    0x8(%ebp),%eax
  100221:	89 04 24             	mov    %eax,(%esp)
  100224:	e8 93 13 00 00       	call   1015bc <cons_putc>
    (*cnt) ++;
  100229:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022c:	8b 00                	mov    (%eax),%eax
  10022e:	8d 50 01             	lea    0x1(%eax),%edx
  100231:	8b 45 0c             	mov    0xc(%ebp),%eax
  100234:	89 10                	mov    %edx,(%eax)
}
  100236:	90                   	nop
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 18 02 10 00 	movl   $0x100218,(%esp)
  100262:	e8 d1 2e 00 00       	call   103138 <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 19 13 00 00       	call   1015bc <cons_putc>
}
  1002a3:	90                   	nop
  1002a4:	c9                   	leave  
  1002a5:	c3                   	ret    

001002a6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a6:	55                   	push   %ebp
  1002a7:	89 e5                	mov    %esp,%ebp
  1002a9:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b3:	eb 13                	jmp    1002c8 <cputs+0x22>
        cputch(c, &cnt);
  1002b5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bc:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002c0:	89 04 24             	mov    %eax,(%esp)
  1002c3:	e8 50 ff ff ff       	call   100218 <cputch>
    while ((c = *str ++) != '\0') {
  1002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cb:	8d 50 01             	lea    0x1(%eax),%edx
  1002ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d1:	0f b6 00             	movzbl (%eax),%eax
  1002d4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002db:	75 d8                	jne    1002b5 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002eb:	e8 28 ff ff ff       	call   100218 <cputch>
    return cnt;
  1002f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f3:	c9                   	leave  
  1002f4:	c3                   	ret    

001002f5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f5:	55                   	push   %ebp
  1002f6:	89 e5                	mov    %esp,%ebp
  1002f8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fb:	e8 e6 12 00 00       	call   1015e6 <cons_getc>
  100300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100303:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100307:	74 f2                	je     1002fb <getchar+0x6>
        /* do nothing */;
    return c;
  100309:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030c:	c9                   	leave  
  10030d:	c3                   	ret    

0010030e <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030e:	55                   	push   %ebp
  10030f:	89 e5                	mov    %esp,%ebp
  100311:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100314:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100318:	74 13                	je     10032d <readline+0x1f>
        cprintf("%s", prompt);
  10031a:	8b 45 08             	mov    0x8(%ebp),%eax
  10031d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100321:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100328:	e8 3f ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100334:	e8 bc ff ff ff       	call   1002f5 <getchar>
  100339:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100340:	79 07                	jns    100349 <readline+0x3b>
            return NULL;
  100342:	b8 00 00 00 00       	mov    $0x0,%eax
  100347:	eb 78                	jmp    1003c1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100349:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034d:	7e 28                	jle    100377 <readline+0x69>
  10034f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100356:	7f 1f                	jg     100377 <readline+0x69>
            cputchar(c);
  100358:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035b:	89 04 24             	mov    %eax,(%esp)
  10035e:	e8 2f ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100363:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100366:	8d 50 01             	lea    0x1(%eax),%edx
  100369:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100375:	eb 45                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100377:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037b:	75 16                	jne    100393 <readline+0x85>
  10037d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100381:	7e 10                	jle    100393 <readline+0x85>
            cputchar(c);
  100383:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100386:	89 04 24             	mov    %eax,(%esp)
  100389:	e8 04 ff ff ff       	call   100292 <cputchar>
            i --;
  10038e:	ff 4d f4             	decl   -0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x91>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 95                	jne    100334 <readline+0x26>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb3>
        c = getchar();
  1003bc:	e9 73 ff ff ff       	jmp    100334 <readline+0x26>
        }
    }
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	75 5b                	jne    10042d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003d2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003d9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f0:	c7 04 24 8a 36 10 00 	movl   $0x10368a,(%esp)
  1003f7:	e8 70 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100403:	8b 45 10             	mov    0x10(%ebp),%eax
  100406:	89 04 24             	mov    %eax,(%esp)
  100409:	e8 2b fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  10040e:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100415:	e8 52 fe ff ff       	call   10026c <cprintf>
    
    cprintf("stack trackback:\n");
  10041a:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100421:	e8 46 fe ff ff       	call   10026c <cprintf>
    print_stackframe();
  100426:	e8 32 06 00 00       	call   100a5d <print_stackframe>
  10042b:	eb 01                	jmp    10042e <__panic+0x6b>
        goto panic_dead;
  10042d:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10042e:	e8 dc 13 00 00       	call   10180f <intr_disable>
    while (1) {
        kmonitor(NULL);
  100433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10043a:	e8 52 08 00 00       	call   100c91 <kmonitor>
  10043f:	eb f2                	jmp    100433 <__panic+0x70>

00100441 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100441:	55                   	push   %ebp
  100442:	89 e5                	mov    %esp,%ebp
  100444:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100447:	8d 45 14             	lea    0x14(%ebp),%eax
  10044a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10044d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100450:	89 44 24 08          	mov    %eax,0x8(%esp)
  100454:	8b 45 08             	mov    0x8(%ebp),%eax
  100457:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045b:	c7 04 24 ba 36 10 00 	movl   $0x1036ba,(%esp)
  100462:	e8 05 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100467:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10046a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10046e:	8b 45 10             	mov    0x10(%ebp),%eax
  100471:	89 04 24             	mov    %eax,(%esp)
  100474:	e8 c0 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100479:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100480:	e8 e7 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100485:	90                   	nop
  100486:	c9                   	leave  
  100487:	c3                   	ret    

00100488 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100488:	55                   	push   %ebp
  100489:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10048b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100490:	5d                   	pop    %ebp
  100491:	c3                   	ret    

00100492 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100492:	55                   	push   %ebp
  100493:	89 e5                	mov    %esp,%ebp
  100495:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100498:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049b:	8b 00                	mov    (%eax),%eax
  10049d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004af:	e9 ca 00 00 00       	jmp    10057e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004b4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004ba:	01 d0                	add    %edx,%eax
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	c1 ea 1f             	shr    $0x1f,%edx
  1004c1:	01 d0                	add    %edx,%eax
  1004c3:	d1 f8                	sar    %eax
  1004c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004cb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004ce:	eb 03                	jmp    1004d3 <stab_binsearch+0x41>
            m --;
  1004d0:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d9:	7c 1f                	jl     1004fa <stab_binsearch+0x68>
  1004db:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004de:	89 d0                	mov    %edx,%eax
  1004e0:	01 c0                	add    %eax,%eax
  1004e2:	01 d0                	add    %edx,%eax
  1004e4:	c1 e0 02             	shl    $0x2,%eax
  1004e7:	89 c2                	mov    %eax,%edx
  1004e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f2:	0f b6 c0             	movzbl %al,%eax
  1004f5:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004f8:	75 d6                	jne    1004d0 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100500:	7d 09                	jge    10050b <stab_binsearch+0x79>
            l = true_m + 1;
  100502:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100505:	40                   	inc    %eax
  100506:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100509:	eb 73                	jmp    10057e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10050b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100512:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100515:	89 d0                	mov    %edx,%eax
  100517:	01 c0                	add    %eax,%eax
  100519:	01 d0                	add    %edx,%eax
  10051b:	c1 e0 02             	shl    $0x2,%eax
  10051e:	89 c2                	mov    %eax,%edx
  100520:	8b 45 08             	mov    0x8(%ebp),%eax
  100523:	01 d0                	add    %edx,%eax
  100525:	8b 40 08             	mov    0x8(%eax),%eax
  100528:	39 45 18             	cmp    %eax,0x18(%ebp)
  10052b:	76 11                	jbe    10053e <stab_binsearch+0xac>
            *region_left = m;
  10052d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100535:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100538:	40                   	inc    %eax
  100539:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10053c:	eb 40                	jmp    10057e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10053e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100541:	89 d0                	mov    %edx,%eax
  100543:	01 c0                	add    %eax,%eax
  100545:	01 d0                	add    %edx,%eax
  100547:	c1 e0 02             	shl    $0x2,%eax
  10054a:	89 c2                	mov    %eax,%edx
  10054c:	8b 45 08             	mov    0x8(%ebp),%eax
  10054f:	01 d0                	add    %edx,%eax
  100551:	8b 40 08             	mov    0x8(%eax),%eax
  100554:	39 45 18             	cmp    %eax,0x18(%ebp)
  100557:	73 14                	jae    10056d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100559:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10055f:	8b 45 10             	mov    0x10(%ebp),%eax
  100562:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100564:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100567:	48                   	dec    %eax
  100568:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10056b:	eb 11                	jmp    10057e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10056d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100570:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100573:	89 10                	mov    %edx,(%eax)
            l = m;
  100575:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100578:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10057b:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10057e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100581:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100584:	0f 8e 2a ff ff ff    	jle    1004b4 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10058a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058e:	75 0f                	jne    10059f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100590:	8b 45 0c             	mov    0xc(%ebp),%eax
  100593:	8b 00                	mov    (%eax),%eax
  100595:	8d 50 ff             	lea    -0x1(%eax),%edx
  100598:	8b 45 10             	mov    0x10(%ebp),%eax
  10059b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059d:	eb 3e                	jmp    1005dd <stab_binsearch+0x14b>
        l = *region_right;
  10059f:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a2:	8b 00                	mov    (%eax),%eax
  1005a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a7:	eb 03                	jmp    1005ac <stab_binsearch+0x11a>
  1005a9:	ff 4d fc             	decl   -0x4(%ebp)
  1005ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005af:	8b 00                	mov    (%eax),%eax
  1005b1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005b4:	7e 1f                	jle    1005d5 <stab_binsearch+0x143>
  1005b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b9:	89 d0                	mov    %edx,%eax
  1005bb:	01 c0                	add    %eax,%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	c1 e0 02             	shl    $0x2,%eax
  1005c2:	89 c2                	mov    %eax,%edx
  1005c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c7:	01 d0                	add    %edx,%eax
  1005c9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cd:	0f b6 c0             	movzbl %al,%eax
  1005d0:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005d3:	75 d4                	jne    1005a9 <stab_binsearch+0x117>
        *region_left = l;
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005db:	89 10                	mov    %edx,(%eax)
}
  1005dd:	90                   	nop
  1005de:	c9                   	leave  
  1005df:	c3                   	ret    

001005e0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	c7 00 d8 36 10 00    	movl   $0x1036d8,(%eax)
    info->eip_line = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fc:	c7 40 08 d8 36 10 00 	movl   $0x1036d8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100603:	8b 45 0c             	mov    0xc(%ebp),%eax
  100606:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100610:	8b 55 08             	mov    0x8(%ebp),%edx
  100613:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100616:	8b 45 0c             	mov    0xc(%ebp),%eax
  100619:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100620:	c7 45 f4 4c 3f 10 00 	movl   $0x103f4c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100627:	c7 45 f0 d0 bd 10 00 	movl   $0x10bdd0,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062e:	c7 45 ec d1 bd 10 00 	movl   $0x10bdd1,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100635:	c7 45 e8 a5 de 10 00 	movl   $0x10dea5,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100642:	76 0b                	jbe    10064f <debuginfo_eip+0x6f>
  100644:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100647:	48                   	dec    %eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	84 c0                	test   %al,%al
  10064d:	74 0a                	je     100659 <debuginfo_eip+0x79>
        return -1;
  10064f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100654:	e9 b7 02 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100660:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100663:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100666:	29 c2                	sub    %eax,%edx
  100668:	89 d0                	mov    %edx,%eax
  10066a:	c1 f8 02             	sar    $0x2,%eax
  10066d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100673:	48                   	dec    %eax
  100674:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100677:	8b 45 08             	mov    0x8(%ebp),%eax
  10067a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10067e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100685:	00 
  100686:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100689:	89 44 24 08          	mov    %eax,0x8(%esp)
  10068d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100690:	89 44 24 04          	mov    %eax,0x4(%esp)
  100694:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100697:	89 04 24             	mov    %eax,(%esp)
  10069a:	e8 f3 fd ff ff       	call   100492 <stab_binsearch>
    if (lfile == 0)
  10069f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a2:	85 c0                	test   %eax,%eax
  1006a4:	75 0a                	jne    1006b0 <debuginfo_eip+0xd0>
        return -1;
  1006a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006ab:	e9 60 02 00 00       	jmp    100910 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ca:	00 
  1006cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dc:	89 04 24             	mov    %eax,(%esp)
  1006df:	e8 ae fd ff ff       	call   100492 <stab_binsearch>

    if (lfun <= rfun) {
  1006e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006ea:	39 c2                	cmp    %eax,%edx
  1006ec:	7f 7c                	jg     10076a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f1:	89 c2                	mov    %eax,%edx
  1006f3:	89 d0                	mov    %edx,%eax
  1006f5:	01 c0                	add    %eax,%eax
  1006f7:	01 d0                	add    %edx,%eax
  1006f9:	c1 e0 02             	shl    $0x2,%eax
  1006fc:	89 c2                	mov    %eax,%edx
  1006fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100701:	01 d0                	add    %edx,%eax
  100703:	8b 00                	mov    (%eax),%eax
  100705:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100708:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10070b:	29 d1                	sub    %edx,%ecx
  10070d:	89 ca                	mov    %ecx,%edx
  10070f:	39 d0                	cmp    %edx,%eax
  100711:	73 22                	jae    100735 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100713:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	8b 10                	mov    (%eax),%edx
  10072a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10072d:	01 c2                	add    %eax,%edx
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100735:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100738:	89 c2                	mov    %eax,%edx
  10073a:	89 d0                	mov    %edx,%eax
  10073c:	01 c0                	add    %eax,%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	c1 e0 02             	shl    $0x2,%eax
  100743:	89 c2                	mov    %eax,%edx
  100745:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100748:	01 d0                	add    %edx,%eax
  10074a:	8b 50 08             	mov    0x8(%eax),%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100753:	8b 45 0c             	mov    0xc(%ebp),%eax
  100756:	8b 40 10             	mov    0x10(%eax),%eax
  100759:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10075c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100762:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100765:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100768:	eb 15                	jmp    10077f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10076a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076d:	8b 55 08             	mov    0x8(%ebp),%edx
  100770:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100776:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100779:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10077c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10077f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100782:	8b 40 08             	mov    0x8(%eax),%eax
  100785:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10078c:	00 
  10078d:	89 04 24             	mov    %eax,(%esp)
  100790:	e8 cc 24 00 00       	call   102c61 <strfind>
  100795:	89 c2                	mov    %eax,%edx
  100797:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079a:	8b 40 08             	mov    0x8(%eax),%eax
  10079d:	29 c2                	sub    %eax,%edx
  10079f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a2:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007ac:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007b3:	00 
  1007b4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c5:	89 04 24             	mov    %eax,(%esp)
  1007c8:	e8 c5 fc ff ff       	call   100492 <stab_binsearch>
    if (lline <= rline) {
  1007cd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	39 c2                	cmp    %eax,%edx
  1007d5:	7f 23                	jg     1007fa <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007da:	89 c2                	mov    %eax,%edx
  1007dc:	89 d0                	mov    %edx,%eax
  1007de:	01 c0                	add    %eax,%eax
  1007e0:	01 d0                	add    %edx,%eax
  1007e2:	c1 e0 02             	shl    $0x2,%eax
  1007e5:	89 c2                	mov    %eax,%edx
  1007e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ea:	01 d0                	add    %edx,%eax
  1007ec:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007f0:	89 c2                	mov    %eax,%edx
  1007f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f8:	eb 11                	jmp    10080b <debuginfo_eip+0x22b>
        return -1;
  1007fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ff:	e9 0c 01 00 00       	jmp    100910 <debuginfo_eip+0x330>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100804:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100807:	48                   	dec    %eax
  100808:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10080b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100811:	39 c2                	cmp    %eax,%edx
  100813:	7c 56                	jl     10086b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	89 c2                	mov    %eax,%edx
  10081a:	89 d0                	mov    %edx,%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	01 d0                	add    %edx,%eax
  100820:	c1 e0 02             	shl    $0x2,%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082e:	3c 84                	cmp    $0x84,%al
  100830:	74 39                	je     10086b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100832:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100835:	89 c2                	mov    %eax,%edx
  100837:	89 d0                	mov    %edx,%eax
  100839:	01 c0                	add    %eax,%eax
  10083b:	01 d0                	add    %edx,%eax
  10083d:	c1 e0 02             	shl    $0x2,%eax
  100840:	89 c2                	mov    %eax,%edx
  100842:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100845:	01 d0                	add    %edx,%eax
  100847:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084b:	3c 64                	cmp    $0x64,%al
  10084d:	75 b5                	jne    100804 <debuginfo_eip+0x224>
  10084f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100852:	89 c2                	mov    %eax,%edx
  100854:	89 d0                	mov    %edx,%eax
  100856:	01 c0                	add    %eax,%eax
  100858:	01 d0                	add    %edx,%eax
  10085a:	c1 e0 02             	shl    $0x2,%eax
  10085d:	89 c2                	mov    %eax,%edx
  10085f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100862:	01 d0                	add    %edx,%eax
  100864:	8b 40 08             	mov    0x8(%eax),%eax
  100867:	85 c0                	test   %eax,%eax
  100869:	74 99                	je     100804 <debuginfo_eip+0x224>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10086b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100871:	39 c2                	cmp    %eax,%edx
  100873:	7c 46                	jl     1008bb <debuginfo_eip+0x2db>
  100875:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100878:	89 c2                	mov    %eax,%edx
  10087a:	89 d0                	mov    %edx,%eax
  10087c:	01 c0                	add    %eax,%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	c1 e0 02             	shl    $0x2,%eax
  100883:	89 c2                	mov    %eax,%edx
  100885:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100888:	01 d0                	add    %edx,%eax
  10088a:	8b 00                	mov    (%eax),%eax
  10088c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100892:	29 d1                	sub    %edx,%ecx
  100894:	89 ca                	mov    %ecx,%edx
  100896:	39 d0                	cmp    %edx,%eax
  100898:	73 21                	jae    1008bb <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10089a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089d:	89 c2                	mov    %eax,%edx
  10089f:	89 d0                	mov    %edx,%eax
  1008a1:	01 c0                	add    %eax,%eax
  1008a3:	01 d0                	add    %edx,%eax
  1008a5:	c1 e0 02             	shl    $0x2,%eax
  1008a8:	89 c2                	mov    %eax,%edx
  1008aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ad:	01 d0                	add    %edx,%eax
  1008af:	8b 10                	mov    (%eax),%edx
  1008b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b4:	01 c2                	add    %eax,%edx
  1008b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008be:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008c1:	39 c2                	cmp    %eax,%edx
  1008c3:	7d 46                	jge    10090b <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c8:	40                   	inc    %eax
  1008c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008cc:	eb 16                	jmp    1008e4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d1:	8b 40 14             	mov    0x14(%eax),%eax
  1008d4:	8d 50 01             	lea    0x1(%eax),%edx
  1008d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008da:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e0:	40                   	inc    %eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c3                	je     1008ce <debuginfo_eip+0x2ee>
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 df 35 10 	movl   $0x1035df,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 13 37 10 00 	movl   $0x103713,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 43 37 10 00 	movl   $0x103743,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	90                   	nop
  1009a7:	c9                   	leave  
  1009a8:	c3                   	ret    

001009a9 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a9:	55                   	push   %ebp
  1009aa:	89 e5                	mov    %esp,%ebp
  1009ac:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bc:	89 04 24             	mov    %eax,(%esp)
  1009bf:	e8 1c fc ff ff       	call   1005e0 <debuginfo_eip>
  1009c4:	85 c0                	test   %eax,%eax
  1009c6:	74 15                	je     1009dd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009cf:	c7 04 24 86 37 10 00 	movl   $0x103786,(%esp)
  1009d6:	e8 91 f8 ff ff       	call   10026c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009db:	eb 6c                	jmp    100a49 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e4:	eb 1b                	jmp    100a01 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ec:	01 d0                	add    %edx,%eax
  1009ee:	0f b6 00             	movzbl (%eax),%eax
  1009f1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009fa:	01 ca                	add    %ecx,%edx
  1009fc:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fe:	ff 45 f4             	incl   -0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a07:	7c dd                	jl     1009e6 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 a2 37 10 00 	movl   $0x1037a2,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
}
  100a49:	90                   	nop
  100a4a:	c9                   	leave  
  100a4b:	c3                   	ret    

00100a4c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4c:	55                   	push   %ebp
  100a4d:	89 e5                	mov    %esp,%ebp
  100a4f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a52:	8b 45 04             	mov    0x4(%ebp),%eax
  100a55:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5b:	c9                   	leave  
  100a5c:	c3                   	ret    

00100a5d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5d:	55                   	push   %ebp
  100a5e:	89 e5                	mov    %esp,%ebp
  100a60:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a63:	89 e8                	mov    %ebp,%eax
  100a65:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a68:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp=read_ebp();
  100a6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip=read_eip();
  100a6e:	e8 d9 ff ff ff       	call   100a4c <read_eip>
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
      for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++){
  100a76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7d:	e9 90 00 00 00       	jmp    100b12 <print_stackframe+0xb5>
        cprintf("ebp=: 0x%08x | eip=: 0x%08x ",ebp,eip);
  100a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a85:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a90:	c7 04 24 b4 37 10 00 	movl   $0x1037b4,(%esp)
  100a97:	e8 d0 f7 ff ff       	call   10026c <cprintf>
        uint32_t *arguments=(uint32_t *)ebp +2;
  100a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a9f:	83 c0 08             	add    $0x8,%eax
  100aa2:	89 45 e4             	mov    %eax,-0x1c(%ebp)

        cprintf("args=: ");
  100aa5:	c7 04 24 d1 37 10 00 	movl   $0x1037d1,(%esp)
  100aac:	e8 bb f7 ff ff       	call   10026c <cprintf>
        for(int j=0;j<4;j++){
  100ab1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ab8:	eb 24                	jmp    100ade <print_stackframe+0x81>
            cprintf("0x%08x  ",arguments[j]);
  100aba:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100abd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ac4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100ac7:	01 d0                	add    %edx,%eax
  100ac9:	8b 00                	mov    (%eax),%eax
  100acb:	89 44 24 04          	mov    %eax,0x4(%esp)
  100acf:	c7 04 24 d9 37 10 00 	movl   $0x1037d9,(%esp)
  100ad6:	e8 91 f7 ff ff       	call   10026c <cprintf>
        for(int j=0;j<4;j++){
  100adb:	ff 45 e8             	incl   -0x18(%ebp)
  100ade:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100ae2:	7e d6                	jle    100aba <print_stackframe+0x5d>

        }

        cprintf("\n");
  100ae4:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  100aeb:	e8 7c f7 ff ff       	call   10026c <cprintf>
        print_debuginfo(eip-1);
  100af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100af3:	48                   	dec    %eax
  100af4:	89 04 24             	mov    %eax,(%esp)
  100af7:	e8 ad fe ff ff       	call   1009a9 <print_debuginfo>
        eip=((uint32_t *)ebp)[1];
  100afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aff:	83 c0 04             	add    $0x4,%eax
  100b02:	8b 00                	mov    (%eax),%eax
  100b04:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp=((uint32_t *)ebp)[0];
  100b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b0a:	8b 00                	mov    (%eax),%eax
  100b0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++){
  100b0f:	ff 45 ec             	incl   -0x14(%ebp)
  100b12:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b16:	7f 0a                	jg     100b22 <print_stackframe+0xc5>
  100b18:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b1c:	0f 85 60 ff ff ff    	jne    100a82 <print_stackframe+0x25>

      }
}
  100b22:	90                   	nop
  100b23:	c9                   	leave  
  100b24:	c3                   	ret    

00100b25 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b25:	55                   	push   %ebp
  100b26:	89 e5                	mov    %esp,%ebp
  100b28:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b32:	eb 0c                	jmp    100b40 <parse+0x1b>
            *buf ++ = '\0';
  100b34:	8b 45 08             	mov    0x8(%ebp),%eax
  100b37:	8d 50 01             	lea    0x1(%eax),%edx
  100b3a:	89 55 08             	mov    %edx,0x8(%ebp)
  100b3d:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b40:	8b 45 08             	mov    0x8(%ebp),%eax
  100b43:	0f b6 00             	movzbl (%eax),%eax
  100b46:	84 c0                	test   %al,%al
  100b48:	74 1d                	je     100b67 <parse+0x42>
  100b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4d:	0f b6 00             	movzbl (%eax),%eax
  100b50:	0f be c0             	movsbl %al,%eax
  100b53:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b57:	c7 04 24 64 38 10 00 	movl   $0x103864,(%esp)
  100b5e:	e8 cc 20 00 00       	call   102c2f <strchr>
  100b63:	85 c0                	test   %eax,%eax
  100b65:	75 cd                	jne    100b34 <parse+0xf>
        }
        if (*buf == '\0') {
  100b67:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6a:	0f b6 00             	movzbl (%eax),%eax
  100b6d:	84 c0                	test   %al,%al
  100b6f:	74 65                	je     100bd6 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b71:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b75:	75 14                	jne    100b8b <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b77:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b7e:	00 
  100b7f:	c7 04 24 69 38 10 00 	movl   $0x103869,(%esp)
  100b86:	e8 e1 f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8e:	8d 50 01             	lea    0x1(%eax),%edx
  100b91:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b94:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b9e:	01 c2                	add    %eax,%edx
  100ba0:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba3:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ba5:	eb 03                	jmp    100baa <parse+0x85>
            buf ++;
  100ba7:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100baa:	8b 45 08             	mov    0x8(%ebp),%eax
  100bad:	0f b6 00             	movzbl (%eax),%eax
  100bb0:	84 c0                	test   %al,%al
  100bb2:	74 8c                	je     100b40 <parse+0x1b>
  100bb4:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb7:	0f b6 00             	movzbl (%eax),%eax
  100bba:	0f be c0             	movsbl %al,%eax
  100bbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bc1:	c7 04 24 64 38 10 00 	movl   $0x103864,(%esp)
  100bc8:	e8 62 20 00 00       	call   102c2f <strchr>
  100bcd:	85 c0                	test   %eax,%eax
  100bcf:	74 d6                	je     100ba7 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bd1:	e9 6a ff ff ff       	jmp    100b40 <parse+0x1b>
            break;
  100bd6:	90                   	nop
        }
    }
    return argc;
  100bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bda:	c9                   	leave  
  100bdb:	c3                   	ret    

00100bdc <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bdc:	55                   	push   %ebp
  100bdd:	89 e5                	mov    %esp,%ebp
  100bdf:	53                   	push   %ebx
  100be0:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100be3:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100be6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bea:	8b 45 08             	mov    0x8(%ebp),%eax
  100bed:	89 04 24             	mov    %eax,(%esp)
  100bf0:	e8 30 ff ff ff       	call   100b25 <parse>
  100bf5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bf8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bfc:	75 0a                	jne    100c08 <runcmd+0x2c>
        return 0;
  100bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  100c03:	e9 83 00 00 00       	jmp    100c8b <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c0f:	eb 5a                	jmp    100c6b <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c11:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c17:	89 d0                	mov    %edx,%eax
  100c19:	01 c0                	add    %eax,%eax
  100c1b:	01 d0                	add    %edx,%eax
  100c1d:	c1 e0 02             	shl    $0x2,%eax
  100c20:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c25:	8b 00                	mov    (%eax),%eax
  100c27:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c2b:	89 04 24             	mov    %eax,(%esp)
  100c2e:	e8 5f 1f 00 00       	call   102b92 <strcmp>
  100c33:	85 c0                	test   %eax,%eax
  100c35:	75 31                	jne    100c68 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c37:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c3a:	89 d0                	mov    %edx,%eax
  100c3c:	01 c0                	add    %eax,%eax
  100c3e:	01 d0                	add    %edx,%eax
  100c40:	c1 e0 02             	shl    $0x2,%eax
  100c43:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c48:	8b 10                	mov    (%eax),%edx
  100c4a:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c4d:	83 c0 04             	add    $0x4,%eax
  100c50:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c53:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c56:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c59:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c61:	89 1c 24             	mov    %ebx,(%esp)
  100c64:	ff d2                	call   *%edx
  100c66:	eb 23                	jmp    100c8b <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c68:	ff 45 f4             	incl   -0xc(%ebp)
  100c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c6e:	83 f8 02             	cmp    $0x2,%eax
  100c71:	76 9e                	jbe    100c11 <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c73:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c76:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c7a:	c7 04 24 87 38 10 00 	movl   $0x103887,(%esp)
  100c81:	e8 e6 f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c86:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8b:	83 c4 64             	add    $0x64,%esp
  100c8e:	5b                   	pop    %ebx
  100c8f:	5d                   	pop    %ebp
  100c90:	c3                   	ret    

00100c91 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c91:	55                   	push   %ebp
  100c92:	89 e5                	mov    %esp,%ebp
  100c94:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c97:	c7 04 24 a0 38 10 00 	movl   $0x1038a0,(%esp)
  100c9e:	e8 c9 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100ca3:	c7 04 24 c8 38 10 00 	movl   $0x1038c8,(%esp)
  100caa:	e8 bd f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100caf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cb3:	74 0b                	je     100cc0 <kmonitor+0x2f>
        print_trapframe(tf);
  100cb5:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb8:	89 04 24             	mov    %eax,(%esp)
  100cbb:	e8 2a 0d 00 00       	call   1019ea <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cc0:	c7 04 24 ed 38 10 00 	movl   $0x1038ed,(%esp)
  100cc7:	e8 42 f6 ff ff       	call   10030e <readline>
  100ccc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ccf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cd3:	74 eb                	je     100cc0 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100cd5:	8b 45 08             	mov    0x8(%ebp),%eax
  100cd8:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cdf:	89 04 24             	mov    %eax,(%esp)
  100ce2:	e8 f5 fe ff ff       	call   100bdc <runcmd>
  100ce7:	85 c0                	test   %eax,%eax
  100ce9:	78 02                	js     100ced <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100ceb:	eb d3                	jmp    100cc0 <kmonitor+0x2f>
                break;
  100ced:	90                   	nop
            }
        }
    }
}
  100cee:	90                   	nop
  100cef:	c9                   	leave  
  100cf0:	c3                   	ret    

00100cf1 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cf1:	55                   	push   %ebp
  100cf2:	89 e5                	mov    %esp,%ebp
  100cf4:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cfe:	eb 3d                	jmp    100d3d <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d00:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d03:	89 d0                	mov    %edx,%eax
  100d05:	01 c0                	add    %eax,%eax
  100d07:	01 d0                	add    %edx,%eax
  100d09:	c1 e0 02             	shl    $0x2,%eax
  100d0c:	05 04 e0 10 00       	add    $0x10e004,%eax
  100d11:	8b 08                	mov    (%eax),%ecx
  100d13:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d16:	89 d0                	mov    %edx,%eax
  100d18:	01 c0                	add    %eax,%eax
  100d1a:	01 d0                	add    %edx,%eax
  100d1c:	c1 e0 02             	shl    $0x2,%eax
  100d1f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d24:	8b 00                	mov    (%eax),%eax
  100d26:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2e:	c7 04 24 f1 38 10 00 	movl   $0x1038f1,(%esp)
  100d35:	e8 32 f5 ff ff       	call   10026c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d3a:	ff 45 f4             	incl   -0xc(%ebp)
  100d3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d40:	83 f8 02             	cmp    $0x2,%eax
  100d43:	76 bb                	jbe    100d00 <mon_help+0xf>
    }
    return 0;
  100d45:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d4a:	c9                   	leave  
  100d4b:	c3                   	ret    

00100d4c <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d4c:	55                   	push   %ebp
  100d4d:	89 e5                	mov    %esp,%ebp
  100d4f:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d52:	e8 bb fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d57:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d5c:	c9                   	leave  
  100d5d:	c3                   	ret    

00100d5e <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d5e:	55                   	push   %ebp
  100d5f:	89 e5                	mov    %esp,%ebp
  100d61:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d64:	e8 f4 fc ff ff       	call   100a5d <print_stackframe>
    return 0;
  100d69:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d6e:	c9                   	leave  
  100d6f:	c3                   	ret    

00100d70 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d70:	55                   	push   %ebp
  100d71:	89 e5                	mov    %esp,%ebp
  100d73:	83 ec 28             	sub    $0x28,%esp
  100d76:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d7c:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d80:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d84:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d88:	ee                   	out    %al,(%dx)
  100d89:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d8f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d93:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d97:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d9b:	ee                   	out    %al,(%dx)
  100d9c:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100da2:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100da6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100daa:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dae:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100daf:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100db6:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db9:	c7 04 24 fa 38 10 00 	movl   $0x1038fa,(%esp)
  100dc0:	e8 a7 f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dcc:	e8 ca 08 00 00       	call   10169b <pic_enable>
}
  100dd1:	90                   	nop
  100dd2:	c9                   	leave  
  100dd3:	c3                   	ret    

00100dd4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dd4:	55                   	push   %ebp
  100dd5:	89 e5                	mov    %esp,%ebp
  100dd7:	83 ec 10             	sub    $0x10,%esp
  100dda:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100de0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100de4:	89 c2                	mov    %eax,%edx
  100de6:	ec                   	in     (%dx),%al
  100de7:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dea:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100df4:	89 c2                	mov    %eax,%edx
  100df6:	ec                   	in     (%dx),%al
  100df7:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dfa:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e00:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e04:	89 c2                	mov    %eax,%edx
  100e06:	ec                   	in     (%dx),%al
  100e07:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e0a:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e10:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e14:	89 c2                	mov    %eax,%edx
  100e16:	ec                   	in     (%dx),%al
  100e17:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e1a:	90                   	nop
  100e1b:	c9                   	leave  
  100e1c:	c3                   	ret    

00100e1d <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e1d:	55                   	push   %ebp
  100e1e:	89 e5                	mov    %esp,%ebp
  100e20:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e23:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2d:	0f b7 00             	movzwl (%eax),%eax
  100e30:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e37:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e3f:	0f b7 00             	movzwl (%eax),%eax
  100e42:	0f b7 c0             	movzwl %ax,%eax
  100e45:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e4a:	74 12                	je     100e5e <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e4c:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e53:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e5a:	b4 03 
  100e5c:	eb 13                	jmp    100e71 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e61:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e65:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e68:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e6f:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e71:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e78:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e7c:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e80:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e84:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e88:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e89:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e90:	40                   	inc    %eax
  100e91:	0f b7 c0             	movzwl %ax,%eax
  100e94:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e98:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e9c:	89 c2                	mov    %eax,%edx
  100e9e:	ec                   	in     (%dx),%al
  100e9f:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100ea2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ea6:	0f b6 c0             	movzbl %al,%eax
  100ea9:	c1 e0 08             	shl    $0x8,%eax
  100eac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100eaf:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb6:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100eba:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ebe:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ec2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ec6:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ec7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ece:	40                   	inc    %eax
  100ecf:	0f b7 c0             	movzwl %ax,%eax
  100ed2:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed6:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eda:	89 c2                	mov    %eax,%edx
  100edc:	ec                   	in     (%dx),%al
  100edd:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100ee0:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ee4:	0f b6 c0             	movzbl %al,%eax
  100ee7:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eea:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eed:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef5:	0f b7 c0             	movzwl %ax,%eax
  100ef8:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100efe:	90                   	nop
  100eff:	c9                   	leave  
  100f00:	c3                   	ret    

00100f01 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f01:	55                   	push   %ebp
  100f02:	89 e5                	mov    %esp,%ebp
  100f04:	83 ec 48             	sub    $0x48,%esp
  100f07:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f0d:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f11:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f15:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f19:	ee                   	out    %al,(%dx)
  100f1a:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f20:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  100f24:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f28:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f2c:	ee                   	out    %al,(%dx)
  100f2d:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f33:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  100f37:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f3b:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f3f:	ee                   	out    %al,(%dx)
  100f40:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f46:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f4a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f4e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f52:	ee                   	out    %al,(%dx)
  100f53:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f59:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  100f5d:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f61:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f65:	ee                   	out    %al,(%dx)
  100f66:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f6c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  100f70:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f74:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f78:	ee                   	out    %al,(%dx)
  100f79:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f7f:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  100f83:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f87:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f8b:	ee                   	out    %al,(%dx)
  100f8c:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f92:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f96:	89 c2                	mov    %eax,%edx
  100f98:	ec                   	in     (%dx),%al
  100f99:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f9c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fa0:	3c ff                	cmp    $0xff,%al
  100fa2:	0f 95 c0             	setne  %al
  100fa5:	0f b6 c0             	movzbl %al,%eax
  100fa8:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fad:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fb3:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fb7:	89 c2                	mov    %eax,%edx
  100fb9:	ec                   	in     (%dx),%al
  100fba:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fbd:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fc3:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fc7:	89 c2                	mov    %eax,%edx
  100fc9:	ec                   	in     (%dx),%al
  100fca:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fcd:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fd2:	85 c0                	test   %eax,%eax
  100fd4:	74 0c                	je     100fe2 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fd6:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fdd:	e8 b9 06 00 00       	call   10169b <pic_enable>
    }
}
  100fe2:	90                   	nop
  100fe3:	c9                   	leave  
  100fe4:	c3                   	ret    

00100fe5 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fe5:	55                   	push   %ebp
  100fe6:	89 e5                	mov    %esp,%ebp
  100fe8:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100feb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100ff2:	eb 08                	jmp    100ffc <lpt_putc_sub+0x17>
        delay();
  100ff4:	e8 db fd ff ff       	call   100dd4 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff9:	ff 45 fc             	incl   -0x4(%ebp)
  100ffc:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101002:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101006:	89 c2                	mov    %eax,%edx
  101008:	ec                   	in     (%dx),%al
  101009:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10100c:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101010:	84 c0                	test   %al,%al
  101012:	78 09                	js     10101d <lpt_putc_sub+0x38>
  101014:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10101b:	7e d7                	jle    100ff4 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  10101d:	8b 45 08             	mov    0x8(%ebp),%eax
  101020:	0f b6 c0             	movzbl %al,%eax
  101023:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101029:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10102c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101030:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101034:	ee                   	out    %al,(%dx)
  101035:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10103b:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10103f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101043:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101047:	ee                   	out    %al,(%dx)
  101048:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10104e:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  101052:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101056:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10105a:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10105b:	90                   	nop
  10105c:	c9                   	leave  
  10105d:	c3                   	ret    

0010105e <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10105e:	55                   	push   %ebp
  10105f:	89 e5                	mov    %esp,%ebp
  101061:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101064:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101068:	74 0d                	je     101077 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10106a:	8b 45 08             	mov    0x8(%ebp),%eax
  10106d:	89 04 24             	mov    %eax,(%esp)
  101070:	e8 70 ff ff ff       	call   100fe5 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101075:	eb 24                	jmp    10109b <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101077:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10107e:	e8 62 ff ff ff       	call   100fe5 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101083:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10108a:	e8 56 ff ff ff       	call   100fe5 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10108f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101096:	e8 4a ff ff ff       	call   100fe5 <lpt_putc_sub>
}
  10109b:	90                   	nop
  10109c:	c9                   	leave  
  10109d:	c3                   	ret    

0010109e <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10109e:	55                   	push   %ebp
  10109f:	89 e5                	mov    %esp,%ebp
  1010a1:	53                   	push   %ebx
  1010a2:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a8:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010ad:	85 c0                	test   %eax,%eax
  1010af:	75 07                	jne    1010b8 <cga_putc+0x1a>
        c |= 0x0700;
  1010b1:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010bb:	0f b6 c0             	movzbl %al,%eax
  1010be:	83 f8 0a             	cmp    $0xa,%eax
  1010c1:	74 55                	je     101118 <cga_putc+0x7a>
  1010c3:	83 f8 0d             	cmp    $0xd,%eax
  1010c6:	74 63                	je     10112b <cga_putc+0x8d>
  1010c8:	83 f8 08             	cmp    $0x8,%eax
  1010cb:	0f 85 94 00 00 00    	jne    101165 <cga_putc+0xc7>
    case '\b':
        if (crt_pos > 0) {
  1010d1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d8:	85 c0                	test   %eax,%eax
  1010da:	0f 84 af 00 00 00    	je     10118f <cga_putc+0xf1>
            crt_pos --;
  1010e0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010e7:	48                   	dec    %eax
  1010e8:	0f b7 c0             	movzwl %ax,%eax
  1010eb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f4:	98                   	cwtl   
  1010f5:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010fa:	98                   	cwtl   
  1010fb:	83 c8 20             	or     $0x20,%eax
  1010fe:	98                   	cwtl   
  1010ff:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  101105:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10110c:	01 c9                	add    %ecx,%ecx
  10110e:	01 ca                	add    %ecx,%edx
  101110:	0f b7 c0             	movzwl %ax,%eax
  101113:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101116:	eb 77                	jmp    10118f <cga_putc+0xf1>
    case '\n':
        crt_pos += CRT_COLS;
  101118:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10111f:	83 c0 50             	add    $0x50,%eax
  101122:	0f b7 c0             	movzwl %ax,%eax
  101125:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10112b:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101132:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101139:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10113e:	89 c8                	mov    %ecx,%eax
  101140:	f7 e2                	mul    %edx
  101142:	c1 ea 06             	shr    $0x6,%edx
  101145:	89 d0                	mov    %edx,%eax
  101147:	c1 e0 02             	shl    $0x2,%eax
  10114a:	01 d0                	add    %edx,%eax
  10114c:	c1 e0 04             	shl    $0x4,%eax
  10114f:	29 c1                	sub    %eax,%ecx
  101151:	89 c8                	mov    %ecx,%eax
  101153:	0f b7 c0             	movzwl %ax,%eax
  101156:	29 c3                	sub    %eax,%ebx
  101158:	89 d8                	mov    %ebx,%eax
  10115a:	0f b7 c0             	movzwl %ax,%eax
  10115d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101163:	eb 2b                	jmp    101190 <cga_putc+0xf2>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101165:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10116b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101172:	8d 50 01             	lea    0x1(%eax),%edx
  101175:	0f b7 d2             	movzwl %dx,%edx
  101178:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10117f:	01 c0                	add    %eax,%eax
  101181:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101184:	8b 45 08             	mov    0x8(%ebp),%eax
  101187:	0f b7 c0             	movzwl %ax,%eax
  10118a:	66 89 02             	mov    %ax,(%edx)
        break;
  10118d:	eb 01                	jmp    101190 <cga_putc+0xf2>
        break;
  10118f:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101190:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101197:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10119c:	76 5d                	jbe    1011fb <cga_putc+0x15d>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10119e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a3:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011a9:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011ae:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011b5:	00 
  1011b6:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011ba:	89 04 24             	mov    %eax,(%esp)
  1011bd:	e8 63 1c 00 00       	call   102e25 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c2:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011c9:	eb 14                	jmp    1011df <cga_putc+0x141>
            crt_buf[i] = 0x0700 | ' ';
  1011cb:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011d3:	01 d2                	add    %edx,%edx
  1011d5:	01 d0                	add    %edx,%eax
  1011d7:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011dc:	ff 45 f4             	incl   -0xc(%ebp)
  1011df:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011e6:	7e e3                	jle    1011cb <cga_putc+0x12d>
        }
        crt_pos -= CRT_COLS;
  1011e8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ef:	83 e8 50             	sub    $0x50,%eax
  1011f2:	0f b7 c0             	movzwl %ax,%eax
  1011f5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011fb:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101202:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101206:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  10120a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10120e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101212:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101213:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10121a:	c1 e8 08             	shr    $0x8,%eax
  10121d:	0f b7 c0             	movzwl %ax,%eax
  101220:	0f b6 c0             	movzbl %al,%eax
  101223:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10122a:	42                   	inc    %edx
  10122b:	0f b7 d2             	movzwl %dx,%edx
  10122e:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101232:	88 45 e9             	mov    %al,-0x17(%ebp)
  101235:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101239:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10123d:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10123e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101245:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101249:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  10124d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101251:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101255:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101256:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10125d:	0f b6 c0             	movzbl %al,%eax
  101260:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101267:	42                   	inc    %edx
  101268:	0f b7 d2             	movzwl %dx,%edx
  10126b:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10126f:	88 45 f1             	mov    %al,-0xf(%ebp)
  101272:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101276:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10127a:	ee                   	out    %al,(%dx)
}
  10127b:	90                   	nop
  10127c:	83 c4 34             	add    $0x34,%esp
  10127f:	5b                   	pop    %ebx
  101280:	5d                   	pop    %ebp
  101281:	c3                   	ret    

00101282 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101282:	55                   	push   %ebp
  101283:	89 e5                	mov    %esp,%ebp
  101285:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101288:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10128f:	eb 08                	jmp    101299 <serial_putc_sub+0x17>
        delay();
  101291:	e8 3e fb ff ff       	call   100dd4 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101296:	ff 45 fc             	incl   -0x4(%ebp)
  101299:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10129f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012a3:	89 c2                	mov    %eax,%edx
  1012a5:	ec                   	in     (%dx),%al
  1012a6:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012a9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012ad:	0f b6 c0             	movzbl %al,%eax
  1012b0:	83 e0 20             	and    $0x20,%eax
  1012b3:	85 c0                	test   %eax,%eax
  1012b5:	75 09                	jne    1012c0 <serial_putc_sub+0x3e>
  1012b7:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012be:	7e d1                	jle    101291 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c3:	0f b6 c0             	movzbl %al,%eax
  1012c6:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012cc:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012cf:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012d3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012d7:	ee                   	out    %al,(%dx)
}
  1012d8:	90                   	nop
  1012d9:	c9                   	leave  
  1012da:	c3                   	ret    

001012db <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012db:	55                   	push   %ebp
  1012dc:	89 e5                	mov    %esp,%ebp
  1012de:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012e1:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012e5:	74 0d                	je     1012f4 <serial_putc+0x19>
        serial_putc_sub(c);
  1012e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ea:	89 04 24             	mov    %eax,(%esp)
  1012ed:	e8 90 ff ff ff       	call   101282 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012f2:	eb 24                	jmp    101318 <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012f4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012fb:	e8 82 ff ff ff       	call   101282 <serial_putc_sub>
        serial_putc_sub(' ');
  101300:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101307:	e8 76 ff ff ff       	call   101282 <serial_putc_sub>
        serial_putc_sub('\b');
  10130c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101313:	e8 6a ff ff ff       	call   101282 <serial_putc_sub>
}
  101318:	90                   	nop
  101319:	c9                   	leave  
  10131a:	c3                   	ret    

0010131b <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10131b:	55                   	push   %ebp
  10131c:	89 e5                	mov    %esp,%ebp
  10131e:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101321:	eb 33                	jmp    101356 <cons_intr+0x3b>
        if (c != 0) {
  101323:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101327:	74 2d                	je     101356 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101329:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10132e:	8d 50 01             	lea    0x1(%eax),%edx
  101331:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101337:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10133a:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101340:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101345:	3d 00 02 00 00       	cmp    $0x200,%eax
  10134a:	75 0a                	jne    101356 <cons_intr+0x3b>
                cons.wpos = 0;
  10134c:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101353:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101356:	8b 45 08             	mov    0x8(%ebp),%eax
  101359:	ff d0                	call   *%eax
  10135b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10135e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101362:	75 bf                	jne    101323 <cons_intr+0x8>
            }
        }
    }
}
  101364:	90                   	nop
  101365:	c9                   	leave  
  101366:	c3                   	ret    

00101367 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101367:	55                   	push   %ebp
  101368:	89 e5                	mov    %esp,%ebp
  10136a:	83 ec 10             	sub    $0x10,%esp
  10136d:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101373:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101377:	89 c2                	mov    %eax,%edx
  101379:	ec                   	in     (%dx),%al
  10137a:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10137d:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101381:	0f b6 c0             	movzbl %al,%eax
  101384:	83 e0 01             	and    $0x1,%eax
  101387:	85 c0                	test   %eax,%eax
  101389:	75 07                	jne    101392 <serial_proc_data+0x2b>
        return -1;
  10138b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101390:	eb 2a                	jmp    1013bc <serial_proc_data+0x55>
  101392:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101398:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10139c:	89 c2                	mov    %eax,%edx
  10139e:	ec                   	in     (%dx),%al
  10139f:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013a2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013a6:	0f b6 c0             	movzbl %al,%eax
  1013a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013ac:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013b0:	75 07                	jne    1013b9 <serial_proc_data+0x52>
        c = '\b';
  1013b2:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013bc:	c9                   	leave  
  1013bd:	c3                   	ret    

001013be <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013be:	55                   	push   %ebp
  1013bf:	89 e5                	mov    %esp,%ebp
  1013c1:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013c4:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013c9:	85 c0                	test   %eax,%eax
  1013cb:	74 0c                	je     1013d9 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013cd:	c7 04 24 67 13 10 00 	movl   $0x101367,(%esp)
  1013d4:	e8 42 ff ff ff       	call   10131b <cons_intr>
    }
}
  1013d9:	90                   	nop
  1013da:	c9                   	leave  
  1013db:	c3                   	ret    

001013dc <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013dc:	55                   	push   %ebp
  1013dd:	89 e5                	mov    %esp,%ebp
  1013df:	83 ec 38             	sub    $0x38,%esp
  1013e2:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013eb:	89 c2                	mov    %eax,%edx
  1013ed:	ec                   	in     (%dx),%al
  1013ee:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013f1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013f5:	0f b6 c0             	movzbl %al,%eax
  1013f8:	83 e0 01             	and    $0x1,%eax
  1013fb:	85 c0                	test   %eax,%eax
  1013fd:	75 0a                	jne    101409 <kbd_proc_data+0x2d>
        return -1;
  1013ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101404:	e9 55 01 00 00       	jmp    10155e <kbd_proc_data+0x182>
  101409:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10140f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101412:	89 c2                	mov    %eax,%edx
  101414:	ec                   	in     (%dx),%al
  101415:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101418:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10141c:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10141f:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101423:	75 17                	jne    10143c <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101425:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142a:	83 c8 40             	or     $0x40,%eax
  10142d:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101432:	b8 00 00 00 00       	mov    $0x0,%eax
  101437:	e9 22 01 00 00       	jmp    10155e <kbd_proc_data+0x182>
    } else if (data & 0x80) {
  10143c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101440:	84 c0                	test   %al,%al
  101442:	79 45                	jns    101489 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101444:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101449:	83 e0 40             	and    $0x40,%eax
  10144c:	85 c0                	test   %eax,%eax
  10144e:	75 08                	jne    101458 <kbd_proc_data+0x7c>
  101450:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101454:	24 7f                	and    $0x7f,%al
  101456:	eb 04                	jmp    10145c <kbd_proc_data+0x80>
  101458:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145c:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10145f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101463:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10146a:	0c 40                	or     $0x40,%al
  10146c:	0f b6 c0             	movzbl %al,%eax
  10146f:	f7 d0                	not    %eax
  101471:	89 c2                	mov    %eax,%edx
  101473:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101478:	21 d0                	and    %edx,%eax
  10147a:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10147f:	b8 00 00 00 00       	mov    $0x0,%eax
  101484:	e9 d5 00 00 00       	jmp    10155e <kbd_proc_data+0x182>
    } else if (shift & E0ESC) {
  101489:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148e:	83 e0 40             	and    $0x40,%eax
  101491:	85 c0                	test   %eax,%eax
  101493:	74 11                	je     1014a6 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101495:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101499:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10149e:	83 e0 bf             	and    $0xffffffbf,%eax
  1014a1:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1014a6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014aa:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014b1:	0f b6 d0             	movzbl %al,%edx
  1014b4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b9:	09 d0                	or     %edx,%eax
  1014bb:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014c0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c4:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014cb:	0f b6 d0             	movzbl %al,%edx
  1014ce:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d3:	31 d0                	xor    %edx,%eax
  1014d5:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014da:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014df:	83 e0 03             	and    $0x3,%eax
  1014e2:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014e9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ed:	01 d0                	add    %edx,%eax
  1014ef:	0f b6 00             	movzbl (%eax),%eax
  1014f2:	0f b6 c0             	movzbl %al,%eax
  1014f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014f8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fd:	83 e0 08             	and    $0x8,%eax
  101500:	85 c0                	test   %eax,%eax
  101502:	74 22                	je     101526 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101504:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101508:	7e 0c                	jle    101516 <kbd_proc_data+0x13a>
  10150a:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10150e:	7f 06                	jg     101516 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101510:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101514:	eb 10                	jmp    101526 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101516:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10151a:	7e 0a                	jle    101526 <kbd_proc_data+0x14a>
  10151c:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101520:	7f 04                	jg     101526 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101522:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101526:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10152b:	f7 d0                	not    %eax
  10152d:	83 e0 06             	and    $0x6,%eax
  101530:	85 c0                	test   %eax,%eax
  101532:	75 27                	jne    10155b <kbd_proc_data+0x17f>
  101534:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10153b:	75 1e                	jne    10155b <kbd_proc_data+0x17f>
        cprintf("Rebooting!\n");
  10153d:	c7 04 24 15 39 10 00 	movl   $0x103915,(%esp)
  101544:	e8 23 ed ff ff       	call   10026c <cprintf>
  101549:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10154f:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101553:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101557:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10155a:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10155b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10155e:	c9                   	leave  
  10155f:	c3                   	ret    

00101560 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101560:	55                   	push   %ebp
  101561:	89 e5                	mov    %esp,%ebp
  101563:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101566:	c7 04 24 dc 13 10 00 	movl   $0x1013dc,(%esp)
  10156d:	e8 a9 fd ff ff       	call   10131b <cons_intr>
}
  101572:	90                   	nop
  101573:	c9                   	leave  
  101574:	c3                   	ret    

00101575 <kbd_init>:

static void
kbd_init(void) {
  101575:	55                   	push   %ebp
  101576:	89 e5                	mov    %esp,%ebp
  101578:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10157b:	e8 e0 ff ff ff       	call   101560 <kbd_intr>
    pic_enable(IRQ_KBD);
  101580:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101587:	e8 0f 01 00 00       	call   10169b <pic_enable>
}
  10158c:	90                   	nop
  10158d:	c9                   	leave  
  10158e:	c3                   	ret    

0010158f <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10158f:	55                   	push   %ebp
  101590:	89 e5                	mov    %esp,%ebp
  101592:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101595:	e8 83 f8 ff ff       	call   100e1d <cga_init>
    serial_init();
  10159a:	e8 62 f9 ff ff       	call   100f01 <serial_init>
    kbd_init();
  10159f:	e8 d1 ff ff ff       	call   101575 <kbd_init>
    if (!serial_exists) {
  1015a4:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1015a9:	85 c0                	test   %eax,%eax
  1015ab:	75 0c                	jne    1015b9 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015ad:	c7 04 24 21 39 10 00 	movl   $0x103921,(%esp)
  1015b4:	e8 b3 ec ff ff       	call   10026c <cprintf>
    }
}
  1015b9:	90                   	nop
  1015ba:	c9                   	leave  
  1015bb:	c3                   	ret    

001015bc <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015bc:	55                   	push   %ebp
  1015bd:	89 e5                	mov    %esp,%ebp
  1015bf:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c5:	89 04 24             	mov    %eax,(%esp)
  1015c8:	e8 91 fa ff ff       	call   10105e <lpt_putc>
    cga_putc(c);
  1015cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d0:	89 04 24             	mov    %eax,(%esp)
  1015d3:	e8 c6 fa ff ff       	call   10109e <cga_putc>
    serial_putc(c);
  1015d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015db:	89 04 24             	mov    %eax,(%esp)
  1015de:	e8 f8 fc ff ff       	call   1012db <serial_putc>
}
  1015e3:	90                   	nop
  1015e4:	c9                   	leave  
  1015e5:	c3                   	ret    

001015e6 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015e6:	55                   	push   %ebp
  1015e7:	89 e5                	mov    %esp,%ebp
  1015e9:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015ec:	e8 cd fd ff ff       	call   1013be <serial_intr>
    kbd_intr();
  1015f1:	e8 6a ff ff ff       	call   101560 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015f6:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015fc:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101601:	39 c2                	cmp    %eax,%edx
  101603:	74 36                	je     10163b <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  101605:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10160a:	8d 50 01             	lea    0x1(%eax),%edx
  10160d:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  101613:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  10161a:	0f b6 c0             	movzbl %al,%eax
  10161d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101620:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101625:	3d 00 02 00 00       	cmp    $0x200,%eax
  10162a:	75 0a                	jne    101636 <cons_getc+0x50>
            cons.rpos = 0;
  10162c:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101633:	00 00 00 
        }
        return c;
  101636:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101639:	eb 05                	jmp    101640 <cons_getc+0x5a>
    }
    return 0;
  10163b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101640:	c9                   	leave  
  101641:	c3                   	ret    

00101642 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101642:	55                   	push   %ebp
  101643:	89 e5                	mov    %esp,%ebp
  101645:	83 ec 14             	sub    $0x14,%esp
  101648:	8b 45 08             	mov    0x8(%ebp),%eax
  10164b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10164f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101652:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101658:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  10165d:	85 c0                	test   %eax,%eax
  10165f:	74 37                	je     101698 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101661:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101664:	0f b6 c0             	movzbl %al,%eax
  101667:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10166d:	88 45 f9             	mov    %al,-0x7(%ebp)
  101670:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101674:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101678:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101679:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10167d:	c1 e8 08             	shr    $0x8,%eax
  101680:	0f b7 c0             	movzwl %ax,%eax
  101683:	0f b6 c0             	movzbl %al,%eax
  101686:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10168c:	88 45 fd             	mov    %al,-0x3(%ebp)
  10168f:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101693:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101697:	ee                   	out    %al,(%dx)
    }
}
  101698:	90                   	nop
  101699:	c9                   	leave  
  10169a:	c3                   	ret    

0010169b <pic_enable>:

void
pic_enable(unsigned int irq) {
  10169b:	55                   	push   %ebp
  10169c:	89 e5                	mov    %esp,%ebp
  10169e:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a4:	ba 01 00 00 00       	mov    $0x1,%edx
  1016a9:	88 c1                	mov    %al,%cl
  1016ab:	d3 e2                	shl    %cl,%edx
  1016ad:	89 d0                	mov    %edx,%eax
  1016af:	98                   	cwtl   
  1016b0:	f7 d0                	not    %eax
  1016b2:	0f bf d0             	movswl %ax,%edx
  1016b5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016bc:	98                   	cwtl   
  1016bd:	21 d0                	and    %edx,%eax
  1016bf:	98                   	cwtl   
  1016c0:	0f b7 c0             	movzwl %ax,%eax
  1016c3:	89 04 24             	mov    %eax,(%esp)
  1016c6:	e8 77 ff ff ff       	call   101642 <pic_setmask>
}
  1016cb:	90                   	nop
  1016cc:	c9                   	leave  
  1016cd:	c3                   	ret    

001016ce <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016ce:	55                   	push   %ebp
  1016cf:	89 e5                	mov    %esp,%ebp
  1016d1:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016d4:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016db:	00 00 00 
  1016de:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016e4:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  1016e8:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016ec:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016f0:	ee                   	out    %al,(%dx)
  1016f1:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016f7:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  1016fb:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1016ff:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101703:	ee                   	out    %al,(%dx)
  101704:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10170a:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  10170e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101712:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101716:	ee                   	out    %al,(%dx)
  101717:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10171d:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  101721:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101725:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101729:	ee                   	out    %al,(%dx)
  10172a:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101730:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  101734:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101738:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10173c:	ee                   	out    %al,(%dx)
  10173d:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101743:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101747:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10174b:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10174f:	ee                   	out    %al,(%dx)
  101750:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101756:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  10175a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10175e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101762:	ee                   	out    %al,(%dx)
  101763:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101769:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  10176d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101771:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101775:	ee                   	out    %al,(%dx)
  101776:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  10177c:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  101780:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101784:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101788:	ee                   	out    %al,(%dx)
  101789:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10178f:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  101793:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101797:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10179b:	ee                   	out    %al,(%dx)
  10179c:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1017a2:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  1017a6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017aa:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017ae:	ee                   	out    %al,(%dx)
  1017af:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017b5:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  1017b9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017bd:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017c1:	ee                   	out    %al,(%dx)
  1017c2:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017c8:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  1017cc:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017d0:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017d4:	ee                   	out    %al,(%dx)
  1017d5:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017db:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  1017df:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017e3:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017e7:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017e8:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ef:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017f4:	74 0f                	je     101805 <pic_init+0x137>
        pic_setmask(irq_mask);
  1017f6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017fd:	89 04 24             	mov    %eax,(%esp)
  101800:	e8 3d fe ff ff       	call   101642 <pic_setmask>
    }
}
  101805:	90                   	nop
  101806:	c9                   	leave  
  101807:	c3                   	ret    

00101808 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101808:	55                   	push   %ebp
  101809:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10180b:	fb                   	sti    
    sti();
}
  10180c:	90                   	nop
  10180d:	5d                   	pop    %ebp
  10180e:	c3                   	ret    

0010180f <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10180f:	55                   	push   %ebp
  101810:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101812:	fa                   	cli    
    cli();
}
  101813:	90                   	nop
  101814:	5d                   	pop    %ebp
  101815:	c3                   	ret    

00101816 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101816:	55                   	push   %ebp
  101817:	89 e5                	mov    %esp,%ebp
  101819:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10181c:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101823:	00 
  101824:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  10182b:	e8 3c ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101830:	90                   	nop
  101831:	c9                   	leave  
  101832:	c3                   	ret    

00101833 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101833:	55                   	push   %ebp
  101834:	89 e5                	mov    %esp,%ebp
  101836:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
     extern uintptr_t __vectors[];
     for(int i=0;i<256;i++){
  101839:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101840:	e9 c4 00 00 00       	jmp    101909 <idt_init+0xd6>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101845:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101848:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10184f:	0f b7 d0             	movzwl %ax,%edx
  101852:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101855:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10185c:	00 
  10185d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101860:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101867:	00 08 00 
  10186a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186d:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101874:	00 
  101875:	80 e2 e0             	and    $0xe0,%dl
  101878:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10187f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101882:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101889:	00 
  10188a:	80 e2 1f             	and    $0x1f,%dl
  10188d:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101894:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101897:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10189e:	00 
  10189f:	80 e2 f0             	and    $0xf0,%dl
  1018a2:	80 ca 0e             	or     $0xe,%dl
  1018a5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018af:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b6:	00 
  1018b7:	80 e2 ef             	and    $0xef,%dl
  1018ba:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c4:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018cb:	00 
  1018cc:	80 e2 9f             	and    $0x9f,%dl
  1018cf:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d9:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018e0:	00 
  1018e1:	80 ca 80             	or     $0x80,%dl
  1018e4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ee:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018f5:	c1 e8 10             	shr    $0x10,%eax
  1018f8:	0f b7 d0             	movzwl %ax,%edx
  1018fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fe:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101905:	00 
     for(int i=0;i<256;i++){
  101906:	ff 45 fc             	incl   -0x4(%ebp)
  101909:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101910:	0f 8e 2f ff ff ff    	jle    101845 <idt_init+0x12>

     }
     SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101916:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10191b:	0f b7 c0             	movzwl %ax,%eax
  10191e:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101924:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  10192b:	08 00 
  10192d:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101934:	24 e0                	and    $0xe0,%al
  101936:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10193b:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101942:	24 1f                	and    $0x1f,%al
  101944:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101949:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101950:	24 f0                	and    $0xf0,%al
  101952:	0c 0e                	or     $0xe,%al
  101954:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101959:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101960:	24 ef                	and    $0xef,%al
  101962:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101967:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10196e:	0c 60                	or     $0x60,%al
  101970:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101975:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10197c:	0c 80                	or     $0x80,%al
  10197e:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101983:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101988:	c1 e8 10             	shr    $0x10,%eax
  10198b:	0f b7 c0             	movzwl %ax,%eax
  10198e:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101994:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  10199b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10199e:	0f 01 18             	lidtl  (%eax)
     lidt(&idt_pd);
}
  1019a1:	90                   	nop
  1019a2:	c9                   	leave  
  1019a3:	c3                   	ret    

001019a4 <trapname>:

static const char *
trapname(int trapno) {
  1019a4:	55                   	push   %ebp
  1019a5:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019aa:	83 f8 13             	cmp    $0x13,%eax
  1019ad:	77 0c                	ja     1019bb <trapname+0x17>
        return excnames[trapno];
  1019af:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b2:	8b 04 85 00 3d 10 00 	mov    0x103d00(,%eax,4),%eax
  1019b9:	eb 18                	jmp    1019d3 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019bb:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019bf:	7e 0d                	jle    1019ce <trapname+0x2a>
  1019c1:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019c5:	7f 07                	jg     1019ce <trapname+0x2a>
        return "Hardware Interrupt";
  1019c7:	b8 4a 39 10 00       	mov    $0x10394a,%eax
  1019cc:	eb 05                	jmp    1019d3 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019ce:	b8 5d 39 10 00       	mov    $0x10395d,%eax
}
  1019d3:	5d                   	pop    %ebp
  1019d4:	c3                   	ret    

001019d5 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019d5:	55                   	push   %ebp
  1019d6:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019db:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019df:	83 f8 08             	cmp    $0x8,%eax
  1019e2:	0f 94 c0             	sete   %al
  1019e5:	0f b6 c0             	movzbl %al,%eax
}
  1019e8:	5d                   	pop    %ebp
  1019e9:	c3                   	ret    

001019ea <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019ea:	55                   	push   %ebp
  1019eb:	89 e5                	mov    %esp,%ebp
  1019ed:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f7:	c7 04 24 9e 39 10 00 	movl   $0x10399e,(%esp)
  1019fe:	e8 69 e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  101a03:	8b 45 08             	mov    0x8(%ebp),%eax
  101a06:	89 04 24             	mov    %eax,(%esp)
  101a09:	e8 8f 01 00 00       	call   101b9d <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a0e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a11:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a15:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a19:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101a20:	e8 47 e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a25:	8b 45 08             	mov    0x8(%ebp),%eax
  101a28:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a30:	c7 04 24 c2 39 10 00 	movl   $0x1039c2,(%esp)
  101a37:	e8 30 e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3f:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a47:	c7 04 24 d5 39 10 00 	movl   $0x1039d5,(%esp)
  101a4e:	e8 19 e8 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a53:	8b 45 08             	mov    0x8(%ebp),%eax
  101a56:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a5e:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  101a65:	e8 02 e8 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6d:	8b 40 30             	mov    0x30(%eax),%eax
  101a70:	89 04 24             	mov    %eax,(%esp)
  101a73:	e8 2c ff ff ff       	call   1019a4 <trapname>
  101a78:	89 c2                	mov    %eax,%edx
  101a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7d:	8b 40 30             	mov    0x30(%eax),%eax
  101a80:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a84:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a88:	c7 04 24 fb 39 10 00 	movl   $0x1039fb,(%esp)
  101a8f:	e8 d8 e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a94:	8b 45 08             	mov    0x8(%ebp),%eax
  101a97:	8b 40 34             	mov    0x34(%eax),%eax
  101a9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a9e:	c7 04 24 0d 3a 10 00 	movl   $0x103a0d,(%esp)
  101aa5:	e8 c2 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101aaa:	8b 45 08             	mov    0x8(%ebp),%eax
  101aad:	8b 40 38             	mov    0x38(%eax),%eax
  101ab0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab4:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  101abb:	e8 ac e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ac0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ac7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101acb:	c7 04 24 2b 3a 10 00 	movl   $0x103a2b,(%esp)
  101ad2:	e8 95 e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ad7:	8b 45 08             	mov    0x8(%ebp),%eax
  101ada:	8b 40 40             	mov    0x40(%eax),%eax
  101add:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ae1:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101ae8:	e8 7f e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101af4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101afb:	eb 3d                	jmp    101b3a <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101afd:	8b 45 08             	mov    0x8(%ebp),%eax
  101b00:	8b 50 40             	mov    0x40(%eax),%edx
  101b03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b06:	21 d0                	and    %edx,%eax
  101b08:	85 c0                	test   %eax,%eax
  101b0a:	74 28                	je     101b34 <print_trapframe+0x14a>
  101b0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b0f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b16:	85 c0                	test   %eax,%eax
  101b18:	74 1a                	je     101b34 <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b24:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b28:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101b2f:	e8 38 e7 ff ff       	call   10026c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b34:	ff 45 f4             	incl   -0xc(%ebp)
  101b37:	d1 65 f0             	shll   -0x10(%ebp)
  101b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3d:	83 f8 17             	cmp    $0x17,%eax
  101b40:	76 bb                	jbe    101afd <print_trapframe+0x113>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b42:	8b 45 08             	mov    0x8(%ebp),%eax
  101b45:	8b 40 40             	mov    0x40(%eax),%eax
  101b48:	c1 e8 0c             	shr    $0xc,%eax
  101b4b:	83 e0 03             	and    $0x3,%eax
  101b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b52:	c7 04 24 51 3a 10 00 	movl   $0x103a51,(%esp)
  101b59:	e8 0e e7 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b61:	89 04 24             	mov    %eax,(%esp)
  101b64:	e8 6c fe ff ff       	call   1019d5 <trap_in_kernel>
  101b69:	85 c0                	test   %eax,%eax
  101b6b:	75 2d                	jne    101b9a <print_trapframe+0x1b0>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b70:	8b 40 44             	mov    0x44(%eax),%eax
  101b73:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b77:	c7 04 24 5a 3a 10 00 	movl   $0x103a5a,(%esp)
  101b7e:	e8 e9 e6 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b83:	8b 45 08             	mov    0x8(%ebp),%eax
  101b86:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8e:	c7 04 24 69 3a 10 00 	movl   $0x103a69,(%esp)
  101b95:	e8 d2 e6 ff ff       	call   10026c <cprintf>
    }
}
  101b9a:	90                   	nop
  101b9b:	c9                   	leave  
  101b9c:	c3                   	ret    

00101b9d <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b9d:	55                   	push   %ebp
  101b9e:	89 e5                	mov    %esp,%ebp
  101ba0:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba6:	8b 00                	mov    (%eax),%eax
  101ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bac:	c7 04 24 7c 3a 10 00 	movl   $0x103a7c,(%esp)
  101bb3:	e8 b4 e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbb:	8b 40 04             	mov    0x4(%eax),%eax
  101bbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc2:	c7 04 24 8b 3a 10 00 	movl   $0x103a8b,(%esp)
  101bc9:	e8 9e e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bce:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd1:	8b 40 08             	mov    0x8(%eax),%eax
  101bd4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd8:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101bdf:	e8 88 e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101be4:	8b 45 08             	mov    0x8(%ebp),%eax
  101be7:	8b 40 0c             	mov    0xc(%eax),%eax
  101bea:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bee:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101bf5:	e8 72 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfd:	8b 40 10             	mov    0x10(%eax),%eax
  101c00:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c04:	c7 04 24 b8 3a 10 00 	movl   $0x103ab8,(%esp)
  101c0b:	e8 5c e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c10:	8b 45 08             	mov    0x8(%ebp),%eax
  101c13:	8b 40 14             	mov    0x14(%eax),%eax
  101c16:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1a:	c7 04 24 c7 3a 10 00 	movl   $0x103ac7,(%esp)
  101c21:	e8 46 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c26:	8b 45 08             	mov    0x8(%ebp),%eax
  101c29:	8b 40 18             	mov    0x18(%eax),%eax
  101c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c30:	c7 04 24 d6 3a 10 00 	movl   $0x103ad6,(%esp)
  101c37:	e8 30 e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3f:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c42:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c46:	c7 04 24 e5 3a 10 00 	movl   $0x103ae5,(%esp)
  101c4d:	e8 1a e6 ff ff       	call   10026c <cprintf>
}
  101c52:	90                   	nop
  101c53:	c9                   	leave  
  101c54:	c3                   	ret    

00101c55 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c55:	55                   	push   %ebp
  101c56:	89 e5                	mov    %esp,%ebp
  101c58:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5e:	8b 40 30             	mov    0x30(%eax),%eax
  101c61:	83 f8 2f             	cmp    $0x2f,%eax
  101c64:	77 21                	ja     101c87 <trap_dispatch+0x32>
  101c66:	83 f8 2e             	cmp    $0x2e,%eax
  101c69:	0f 83 64 02 00 00    	jae    101ed3 <trap_dispatch+0x27e>
  101c6f:	83 f8 21             	cmp    $0x21,%eax
  101c72:	0f 84 88 00 00 00    	je     101d00 <trap_dispatch+0xab>
  101c78:	83 f8 24             	cmp    $0x24,%eax
  101c7b:	74 5a                	je     101cd7 <trap_dispatch+0x82>
  101c7d:	83 f8 20             	cmp    $0x20,%eax
  101c80:	74 1c                	je     101c9e <trap_dispatch+0x49>
  101c82:	e9 17 02 00 00       	jmp    101e9e <trap_dispatch+0x249>
  101c87:	83 f8 78             	cmp    $0x78,%eax
  101c8a:	0f 84 5b 01 00 00    	je     101deb <trap_dispatch+0x196>
  101c90:	83 f8 79             	cmp    $0x79,%eax
  101c93:	0f 84 b4 01 00 00    	je     101e4d <trap_dispatch+0x1f8>
  101c99:	e9 00 02 00 00       	jmp    101e9e <trap_dispatch+0x249>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101c9e:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101ca3:	40                   	inc    %eax
  101ca4:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks == TICK_NUM ) {
  101ca9:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cae:	83 f8 64             	cmp    $0x64,%eax
  101cb1:	0f 85 1f 02 00 00    	jne    101ed6 <trap_dispatch+0x281>
            ticks=0;
  101cb7:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101cbe:	00 00 00 
            cprintf("arrive 100 ticks ");
  101cc1:	c7 04 24 f4 3a 10 00 	movl   $0x103af4,(%esp)
  101cc8:	e8 9f e5 ff ff       	call   10026c <cprintf>
            print_ticks();
  101ccd:	e8 44 fb ff ff       	call   101816 <print_ticks>
        }
        break;
  101cd2:	e9 ff 01 00 00       	jmp    101ed6 <trap_dispatch+0x281>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cd7:	e8 0a f9 ff ff       	call   1015e6 <cons_getc>
  101cdc:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cdf:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ce3:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ce7:	89 54 24 08          	mov    %edx,0x8(%esp)
  101ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cef:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101cf6:	e8 71 e5 ff ff       	call   10026c <cprintf>

        break;
  101cfb:	e9 e0 01 00 00       	jmp    101ee0 <trap_dispatch+0x28b>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d00:	e8 e1 f8 ff ff       	call   1015e6 <cons_getc>
  101d05:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d08:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d0c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d10:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d14:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d18:	c7 04 24 18 3b 10 00 	movl   $0x103b18,(%esp)
  101d1f:	e8 48 e5 ff ff       	call   10026c <cprintf>
        if(c == '0' && (tf->tf_cs & 3) != 0)
  101d24:	80 7d f7 30          	cmpb   $0x30,-0x9(%ebp)
  101d28:	75 52                	jne    101d7c <trap_dispatch+0x127>
  101d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d31:	83 e0 03             	and    $0x3,%eax
  101d34:	85 c0                	test   %eax,%eax
  101d36:	74 44                	je     101d7c <trap_dispatch+0x127>
        {
                cprintf("Input 0......switch to kernel\n");
  101d38:	c7 04 24 28 3b 10 00 	movl   $0x103b28,(%esp)
  101d3f:	e8 28 e5 ff ff       	call   10026c <cprintf>
                tf->tf_cs = KERNEL_CS;
  101d44:	8b 45 08             	mov    0x8(%ebp),%eax
  101d47:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
                tf->tf_ds = tf->tf_es = KERNEL_DS;
  101d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d50:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101d56:	8b 45 08             	mov    0x8(%ebp),%eax
  101d59:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101d5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d60:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                tf->tf_eflags &= ~FL_IOPL_MASK;
  101d64:	8b 45 08             	mov    0x8(%ebp),%eax
  101d67:	8b 40 40             	mov    0x40(%eax),%eax
  101d6a:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101d6f:	89 c2                	mov    %eax,%edx
  101d71:	8b 45 08             	mov    0x8(%ebp),%eax
  101d74:	89 50 40             	mov    %edx,0x40(%eax)
                cprintf("Input 3......switch to user\n");
                tf->tf_cs = USER_CS;
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
                tf->tf_eflags |= FL_IOPL_MASK;
        }
        break;
  101d77:	e9 5d 01 00 00       	jmp    101ed9 <trap_dispatch+0x284>
        else if (c == '3' && (tf->tf_cs & 3) != 3)
  101d7c:	80 7d f7 33          	cmpb   $0x33,-0x9(%ebp)
  101d80:	0f 85 53 01 00 00    	jne    101ed9 <trap_dispatch+0x284>
  101d86:	8b 45 08             	mov    0x8(%ebp),%eax
  101d89:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d8d:	83 e0 03             	and    $0x3,%eax
  101d90:	83 f8 03             	cmp    $0x3,%eax
  101d93:	0f 84 40 01 00 00    	je     101ed9 <trap_dispatch+0x284>
                cprintf("Input 3......switch to user\n");
  101d99:	c7 04 24 47 3b 10 00 	movl   $0x103b47,(%esp)
  101da0:	e8 c7 e4 ff ff       	call   10026c <cprintf>
                tf->tf_cs = USER_CS;
  101da5:	8b 45 08             	mov    0x8(%ebp),%eax
  101da8:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
  101dae:	8b 45 08             	mov    0x8(%ebp),%eax
  101db1:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101db7:	8b 45 08             	mov    0x8(%ebp),%eax
  101dba:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101dbe:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc1:	66 89 50 28          	mov    %dx,0x28(%eax)
  101dc5:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc8:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101dcc:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcf:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                tf->tf_eflags |= FL_IOPL_MASK;
  101dd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd6:	8b 40 40             	mov    0x40(%eax),%eax
  101dd9:	0d 00 30 00 00       	or     $0x3000,%eax
  101dde:	89 c2                	mov    %eax,%edx
  101de0:	8b 45 08             	mov    0x8(%ebp),%eax
  101de3:	89 50 40             	mov    %edx,0x40(%eax)
        break;
  101de6:	e9 ee 00 00 00       	jmp    101ed9 <trap_dispatch+0x284>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if(tf->tf_cs != USER_CS)	//检查是不是用户态，不是就操作
  101deb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dee:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101df2:	83 f8 1b             	cmp    $0x1b,%eax
  101df5:	0f 84 e1 00 00 00    	je     101edc <trap_dispatch+0x287>
        {
            	cprintf("...to user\n");
  101dfb:	c7 04 24 64 3b 10 00 	movl   $0x103b64,(%esp)
  101e02:	e8 65 e4 ff ff       	call   10026c <cprintf>
                // 设置用户态对应的cs,ds,es,ss四个寄存器
            	tf->tf_cs = USER_CS;
  101e07:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0a:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
  101e10:	8b 45 08             	mov    0x8(%ebp),%eax
  101e13:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101e19:	8b 45 08             	mov    0x8(%ebp),%eax
  101e1c:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101e20:	8b 45 08             	mov    0x8(%ebp),%eax
  101e23:	66 89 50 28          	mov    %dx,0x28(%eax)
  101e27:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2a:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e31:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                // 用户态,I/O
                tf->tf_eflags |= FL_IOPL_MASK;
  101e35:	8b 45 08             	mov    0x8(%ebp),%eax
  101e38:	8b 40 40             	mov    0x40(%eax),%eax
  101e3b:	0d 00 30 00 00       	or     $0x3000,%eax
  101e40:	89 c2                	mov    %eax,%edx
  101e42:	8b 45 08             	mov    0x8(%ebp),%eax
  101e45:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101e48:	e9 8f 00 00 00       	jmp    101edc <trap_dispatch+0x287>
    case T_SWITCH_TOK:
        if(tf->tf_cs != KERNEL_CS)	//检查是不是内核态，不是就操作
  101e4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e50:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e54:	83 f8 08             	cmp    $0x8,%eax
  101e57:	0f 84 82 00 00 00    	je     101edf <trap_dispatch+0x28a>
        {
            	cprintf("...to kernel\n");
  101e5d:	c7 04 24 70 3b 10 00 	movl   $0x103b70,(%esp)
  101e64:	e8 03 e4 ff ff       	call   10026c <cprintf>
            	// 设置内核态对应的cs,ds,es三个寄存器
                tf->tf_cs = KERNEL_CS;
  101e69:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6c:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
                tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e72:	8b 45 08             	mov    0x8(%ebp),%eax
  101e75:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7e:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e82:	8b 45 08             	mov    0x8(%ebp),%eax
  101e85:	66 89 50 2c          	mov    %dx,0x2c(%eax)
		// 剥夺I/O
                tf->tf_eflags &= ~FL_IOPL_MASK;
  101e89:	8b 45 08             	mov    0x8(%ebp),%eax
  101e8c:	8b 40 40             	mov    0x40(%eax),%eax
  101e8f:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101e94:	89 c2                	mov    %eax,%edx
  101e96:	8b 45 08             	mov    0x8(%ebp),%eax
  101e99:	89 50 40             	mov    %edx,0x40(%eax)
        }
        //panic("T_SWITCH_** ??\n");
        break;
  101e9c:	eb 41                	jmp    101edf <trap_dispatch+0x28a>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ea5:	83 e0 03             	and    $0x3,%eax
  101ea8:	85 c0                	test   %eax,%eax
  101eaa:	75 34                	jne    101ee0 <trap_dispatch+0x28b>
            print_trapframe(tf);
  101eac:	8b 45 08             	mov    0x8(%ebp),%eax
  101eaf:	89 04 24             	mov    %eax,(%esp)
  101eb2:	e8 33 fb ff ff       	call   1019ea <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101eb7:	c7 44 24 08 7e 3b 10 	movl   $0x103b7e,0x8(%esp)
  101ebe:	00 
  101ebf:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
  101ec6:	00 
  101ec7:	c7 04 24 9a 3b 10 00 	movl   $0x103b9a,(%esp)
  101ece:	e8 f0 e4 ff ff       	call   1003c3 <__panic>
        break;
  101ed3:	90                   	nop
  101ed4:	eb 0a                	jmp    101ee0 <trap_dispatch+0x28b>
        break;
  101ed6:	90                   	nop
  101ed7:	eb 07                	jmp    101ee0 <trap_dispatch+0x28b>
        break;
  101ed9:	90                   	nop
  101eda:	eb 04                	jmp    101ee0 <trap_dispatch+0x28b>
        break;
  101edc:	90                   	nop
  101edd:	eb 01                	jmp    101ee0 <trap_dispatch+0x28b>
        break;
  101edf:	90                   	nop
        }
    }
}
  101ee0:	90                   	nop
  101ee1:	c9                   	leave  
  101ee2:	c3                   	ret    

00101ee3 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ee3:	55                   	push   %ebp
  101ee4:	89 e5                	mov    %esp,%ebp
  101ee6:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ee9:	8b 45 08             	mov    0x8(%ebp),%eax
  101eec:	89 04 24             	mov    %eax,(%esp)
  101eef:	e8 61 fd ff ff       	call   101c55 <trap_dispatch>
}
  101ef4:	90                   	nop
  101ef5:	c9                   	leave  
  101ef6:	c3                   	ret    

00101ef7 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ef7:	6a 00                	push   $0x0
  pushl $0
  101ef9:	6a 00                	push   $0x0
  jmp __alltraps
  101efb:	e9 69 0a 00 00       	jmp    102969 <__alltraps>

00101f00 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f00:	6a 00                	push   $0x0
  pushl $1
  101f02:	6a 01                	push   $0x1
  jmp __alltraps
  101f04:	e9 60 0a 00 00       	jmp    102969 <__alltraps>

00101f09 <vector2>:
.globl vector2
vector2:
  pushl $0
  101f09:	6a 00                	push   $0x0
  pushl $2
  101f0b:	6a 02                	push   $0x2
  jmp __alltraps
  101f0d:	e9 57 0a 00 00       	jmp    102969 <__alltraps>

00101f12 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f12:	6a 00                	push   $0x0
  pushl $3
  101f14:	6a 03                	push   $0x3
  jmp __alltraps
  101f16:	e9 4e 0a 00 00       	jmp    102969 <__alltraps>

00101f1b <vector4>:
.globl vector4
vector4:
  pushl $0
  101f1b:	6a 00                	push   $0x0
  pushl $4
  101f1d:	6a 04                	push   $0x4
  jmp __alltraps
  101f1f:	e9 45 0a 00 00       	jmp    102969 <__alltraps>

00101f24 <vector5>:
.globl vector5
vector5:
  pushl $0
  101f24:	6a 00                	push   $0x0
  pushl $5
  101f26:	6a 05                	push   $0x5
  jmp __alltraps
  101f28:	e9 3c 0a 00 00       	jmp    102969 <__alltraps>

00101f2d <vector6>:
.globl vector6
vector6:
  pushl $0
  101f2d:	6a 00                	push   $0x0
  pushl $6
  101f2f:	6a 06                	push   $0x6
  jmp __alltraps
  101f31:	e9 33 0a 00 00       	jmp    102969 <__alltraps>

00101f36 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f36:	6a 00                	push   $0x0
  pushl $7
  101f38:	6a 07                	push   $0x7
  jmp __alltraps
  101f3a:	e9 2a 0a 00 00       	jmp    102969 <__alltraps>

00101f3f <vector8>:
.globl vector8
vector8:
  pushl $8
  101f3f:	6a 08                	push   $0x8
  jmp __alltraps
  101f41:	e9 23 0a 00 00       	jmp    102969 <__alltraps>

00101f46 <vector9>:
.globl vector9
vector9:
  pushl $0
  101f46:	6a 00                	push   $0x0
  pushl $9
  101f48:	6a 09                	push   $0x9
  jmp __alltraps
  101f4a:	e9 1a 0a 00 00       	jmp    102969 <__alltraps>

00101f4f <vector10>:
.globl vector10
vector10:
  pushl $10
  101f4f:	6a 0a                	push   $0xa
  jmp __alltraps
  101f51:	e9 13 0a 00 00       	jmp    102969 <__alltraps>

00101f56 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f56:	6a 0b                	push   $0xb
  jmp __alltraps
  101f58:	e9 0c 0a 00 00       	jmp    102969 <__alltraps>

00101f5d <vector12>:
.globl vector12
vector12:
  pushl $12
  101f5d:	6a 0c                	push   $0xc
  jmp __alltraps
  101f5f:	e9 05 0a 00 00       	jmp    102969 <__alltraps>

00101f64 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f64:	6a 0d                	push   $0xd
  jmp __alltraps
  101f66:	e9 fe 09 00 00       	jmp    102969 <__alltraps>

00101f6b <vector14>:
.globl vector14
vector14:
  pushl $14
  101f6b:	6a 0e                	push   $0xe
  jmp __alltraps
  101f6d:	e9 f7 09 00 00       	jmp    102969 <__alltraps>

00101f72 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f72:	6a 00                	push   $0x0
  pushl $15
  101f74:	6a 0f                	push   $0xf
  jmp __alltraps
  101f76:	e9 ee 09 00 00       	jmp    102969 <__alltraps>

00101f7b <vector16>:
.globl vector16
vector16:
  pushl $0
  101f7b:	6a 00                	push   $0x0
  pushl $16
  101f7d:	6a 10                	push   $0x10
  jmp __alltraps
  101f7f:	e9 e5 09 00 00       	jmp    102969 <__alltraps>

00101f84 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f84:	6a 11                	push   $0x11
  jmp __alltraps
  101f86:	e9 de 09 00 00       	jmp    102969 <__alltraps>

00101f8b <vector18>:
.globl vector18
vector18:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $18
  101f8d:	6a 12                	push   $0x12
  jmp __alltraps
  101f8f:	e9 d5 09 00 00       	jmp    102969 <__alltraps>

00101f94 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $19
  101f96:	6a 13                	push   $0x13
  jmp __alltraps
  101f98:	e9 cc 09 00 00       	jmp    102969 <__alltraps>

00101f9d <vector20>:
.globl vector20
vector20:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $20
  101f9f:	6a 14                	push   $0x14
  jmp __alltraps
  101fa1:	e9 c3 09 00 00       	jmp    102969 <__alltraps>

00101fa6 <vector21>:
.globl vector21
vector21:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $21
  101fa8:	6a 15                	push   $0x15
  jmp __alltraps
  101faa:	e9 ba 09 00 00       	jmp    102969 <__alltraps>

00101faf <vector22>:
.globl vector22
vector22:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $22
  101fb1:	6a 16                	push   $0x16
  jmp __alltraps
  101fb3:	e9 b1 09 00 00       	jmp    102969 <__alltraps>

00101fb8 <vector23>:
.globl vector23
vector23:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $23
  101fba:	6a 17                	push   $0x17
  jmp __alltraps
  101fbc:	e9 a8 09 00 00       	jmp    102969 <__alltraps>

00101fc1 <vector24>:
.globl vector24
vector24:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $24
  101fc3:	6a 18                	push   $0x18
  jmp __alltraps
  101fc5:	e9 9f 09 00 00       	jmp    102969 <__alltraps>

00101fca <vector25>:
.globl vector25
vector25:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $25
  101fcc:	6a 19                	push   $0x19
  jmp __alltraps
  101fce:	e9 96 09 00 00       	jmp    102969 <__alltraps>

00101fd3 <vector26>:
.globl vector26
vector26:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $26
  101fd5:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fd7:	e9 8d 09 00 00       	jmp    102969 <__alltraps>

00101fdc <vector27>:
.globl vector27
vector27:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $27
  101fde:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fe0:	e9 84 09 00 00       	jmp    102969 <__alltraps>

00101fe5 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $28
  101fe7:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fe9:	e9 7b 09 00 00       	jmp    102969 <__alltraps>

00101fee <vector29>:
.globl vector29
vector29:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $29
  101ff0:	6a 1d                	push   $0x1d
  jmp __alltraps
  101ff2:	e9 72 09 00 00       	jmp    102969 <__alltraps>

00101ff7 <vector30>:
.globl vector30
vector30:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $30
  101ff9:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ffb:	e9 69 09 00 00       	jmp    102969 <__alltraps>

00102000 <vector31>:
.globl vector31
vector31:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $31
  102002:	6a 1f                	push   $0x1f
  jmp __alltraps
  102004:	e9 60 09 00 00       	jmp    102969 <__alltraps>

00102009 <vector32>:
.globl vector32
vector32:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $32
  10200b:	6a 20                	push   $0x20
  jmp __alltraps
  10200d:	e9 57 09 00 00       	jmp    102969 <__alltraps>

00102012 <vector33>:
.globl vector33
vector33:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $33
  102014:	6a 21                	push   $0x21
  jmp __alltraps
  102016:	e9 4e 09 00 00       	jmp    102969 <__alltraps>

0010201b <vector34>:
.globl vector34
vector34:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $34
  10201d:	6a 22                	push   $0x22
  jmp __alltraps
  10201f:	e9 45 09 00 00       	jmp    102969 <__alltraps>

00102024 <vector35>:
.globl vector35
vector35:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $35
  102026:	6a 23                	push   $0x23
  jmp __alltraps
  102028:	e9 3c 09 00 00       	jmp    102969 <__alltraps>

0010202d <vector36>:
.globl vector36
vector36:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $36
  10202f:	6a 24                	push   $0x24
  jmp __alltraps
  102031:	e9 33 09 00 00       	jmp    102969 <__alltraps>

00102036 <vector37>:
.globl vector37
vector37:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $37
  102038:	6a 25                	push   $0x25
  jmp __alltraps
  10203a:	e9 2a 09 00 00       	jmp    102969 <__alltraps>

0010203f <vector38>:
.globl vector38
vector38:
  pushl $0
  10203f:	6a 00                	push   $0x0
  pushl $38
  102041:	6a 26                	push   $0x26
  jmp __alltraps
  102043:	e9 21 09 00 00       	jmp    102969 <__alltraps>

00102048 <vector39>:
.globl vector39
vector39:
  pushl $0
  102048:	6a 00                	push   $0x0
  pushl $39
  10204a:	6a 27                	push   $0x27
  jmp __alltraps
  10204c:	e9 18 09 00 00       	jmp    102969 <__alltraps>

00102051 <vector40>:
.globl vector40
vector40:
  pushl $0
  102051:	6a 00                	push   $0x0
  pushl $40
  102053:	6a 28                	push   $0x28
  jmp __alltraps
  102055:	e9 0f 09 00 00       	jmp    102969 <__alltraps>

0010205a <vector41>:
.globl vector41
vector41:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $41
  10205c:	6a 29                	push   $0x29
  jmp __alltraps
  10205e:	e9 06 09 00 00       	jmp    102969 <__alltraps>

00102063 <vector42>:
.globl vector42
vector42:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $42
  102065:	6a 2a                	push   $0x2a
  jmp __alltraps
  102067:	e9 fd 08 00 00       	jmp    102969 <__alltraps>

0010206c <vector43>:
.globl vector43
vector43:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $43
  10206e:	6a 2b                	push   $0x2b
  jmp __alltraps
  102070:	e9 f4 08 00 00       	jmp    102969 <__alltraps>

00102075 <vector44>:
.globl vector44
vector44:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $44
  102077:	6a 2c                	push   $0x2c
  jmp __alltraps
  102079:	e9 eb 08 00 00       	jmp    102969 <__alltraps>

0010207e <vector45>:
.globl vector45
vector45:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $45
  102080:	6a 2d                	push   $0x2d
  jmp __alltraps
  102082:	e9 e2 08 00 00       	jmp    102969 <__alltraps>

00102087 <vector46>:
.globl vector46
vector46:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $46
  102089:	6a 2e                	push   $0x2e
  jmp __alltraps
  10208b:	e9 d9 08 00 00       	jmp    102969 <__alltraps>

00102090 <vector47>:
.globl vector47
vector47:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $47
  102092:	6a 2f                	push   $0x2f
  jmp __alltraps
  102094:	e9 d0 08 00 00       	jmp    102969 <__alltraps>

00102099 <vector48>:
.globl vector48
vector48:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $48
  10209b:	6a 30                	push   $0x30
  jmp __alltraps
  10209d:	e9 c7 08 00 00       	jmp    102969 <__alltraps>

001020a2 <vector49>:
.globl vector49
vector49:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $49
  1020a4:	6a 31                	push   $0x31
  jmp __alltraps
  1020a6:	e9 be 08 00 00       	jmp    102969 <__alltraps>

001020ab <vector50>:
.globl vector50
vector50:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $50
  1020ad:	6a 32                	push   $0x32
  jmp __alltraps
  1020af:	e9 b5 08 00 00       	jmp    102969 <__alltraps>

001020b4 <vector51>:
.globl vector51
vector51:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $51
  1020b6:	6a 33                	push   $0x33
  jmp __alltraps
  1020b8:	e9 ac 08 00 00       	jmp    102969 <__alltraps>

001020bd <vector52>:
.globl vector52
vector52:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $52
  1020bf:	6a 34                	push   $0x34
  jmp __alltraps
  1020c1:	e9 a3 08 00 00       	jmp    102969 <__alltraps>

001020c6 <vector53>:
.globl vector53
vector53:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $53
  1020c8:	6a 35                	push   $0x35
  jmp __alltraps
  1020ca:	e9 9a 08 00 00       	jmp    102969 <__alltraps>

001020cf <vector54>:
.globl vector54
vector54:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $54
  1020d1:	6a 36                	push   $0x36
  jmp __alltraps
  1020d3:	e9 91 08 00 00       	jmp    102969 <__alltraps>

001020d8 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $55
  1020da:	6a 37                	push   $0x37
  jmp __alltraps
  1020dc:	e9 88 08 00 00       	jmp    102969 <__alltraps>

001020e1 <vector56>:
.globl vector56
vector56:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $56
  1020e3:	6a 38                	push   $0x38
  jmp __alltraps
  1020e5:	e9 7f 08 00 00       	jmp    102969 <__alltraps>

001020ea <vector57>:
.globl vector57
vector57:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $57
  1020ec:	6a 39                	push   $0x39
  jmp __alltraps
  1020ee:	e9 76 08 00 00       	jmp    102969 <__alltraps>

001020f3 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $58
  1020f5:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020f7:	e9 6d 08 00 00       	jmp    102969 <__alltraps>

001020fc <vector59>:
.globl vector59
vector59:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $59
  1020fe:	6a 3b                	push   $0x3b
  jmp __alltraps
  102100:	e9 64 08 00 00       	jmp    102969 <__alltraps>

00102105 <vector60>:
.globl vector60
vector60:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $60
  102107:	6a 3c                	push   $0x3c
  jmp __alltraps
  102109:	e9 5b 08 00 00       	jmp    102969 <__alltraps>

0010210e <vector61>:
.globl vector61
vector61:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $61
  102110:	6a 3d                	push   $0x3d
  jmp __alltraps
  102112:	e9 52 08 00 00       	jmp    102969 <__alltraps>

00102117 <vector62>:
.globl vector62
vector62:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $62
  102119:	6a 3e                	push   $0x3e
  jmp __alltraps
  10211b:	e9 49 08 00 00       	jmp    102969 <__alltraps>

00102120 <vector63>:
.globl vector63
vector63:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $63
  102122:	6a 3f                	push   $0x3f
  jmp __alltraps
  102124:	e9 40 08 00 00       	jmp    102969 <__alltraps>

00102129 <vector64>:
.globl vector64
vector64:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $64
  10212b:	6a 40                	push   $0x40
  jmp __alltraps
  10212d:	e9 37 08 00 00       	jmp    102969 <__alltraps>

00102132 <vector65>:
.globl vector65
vector65:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $65
  102134:	6a 41                	push   $0x41
  jmp __alltraps
  102136:	e9 2e 08 00 00       	jmp    102969 <__alltraps>

0010213b <vector66>:
.globl vector66
vector66:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $66
  10213d:	6a 42                	push   $0x42
  jmp __alltraps
  10213f:	e9 25 08 00 00       	jmp    102969 <__alltraps>

00102144 <vector67>:
.globl vector67
vector67:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $67
  102146:	6a 43                	push   $0x43
  jmp __alltraps
  102148:	e9 1c 08 00 00       	jmp    102969 <__alltraps>

0010214d <vector68>:
.globl vector68
vector68:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $68
  10214f:	6a 44                	push   $0x44
  jmp __alltraps
  102151:	e9 13 08 00 00       	jmp    102969 <__alltraps>

00102156 <vector69>:
.globl vector69
vector69:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $69
  102158:	6a 45                	push   $0x45
  jmp __alltraps
  10215a:	e9 0a 08 00 00       	jmp    102969 <__alltraps>

0010215f <vector70>:
.globl vector70
vector70:
  pushl $0
  10215f:	6a 00                	push   $0x0
  pushl $70
  102161:	6a 46                	push   $0x46
  jmp __alltraps
  102163:	e9 01 08 00 00       	jmp    102969 <__alltraps>

00102168 <vector71>:
.globl vector71
vector71:
  pushl $0
  102168:	6a 00                	push   $0x0
  pushl $71
  10216a:	6a 47                	push   $0x47
  jmp __alltraps
  10216c:	e9 f8 07 00 00       	jmp    102969 <__alltraps>

00102171 <vector72>:
.globl vector72
vector72:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $72
  102173:	6a 48                	push   $0x48
  jmp __alltraps
  102175:	e9 ef 07 00 00       	jmp    102969 <__alltraps>

0010217a <vector73>:
.globl vector73
vector73:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $73
  10217c:	6a 49                	push   $0x49
  jmp __alltraps
  10217e:	e9 e6 07 00 00       	jmp    102969 <__alltraps>

00102183 <vector74>:
.globl vector74
vector74:
  pushl $0
  102183:	6a 00                	push   $0x0
  pushl $74
  102185:	6a 4a                	push   $0x4a
  jmp __alltraps
  102187:	e9 dd 07 00 00       	jmp    102969 <__alltraps>

0010218c <vector75>:
.globl vector75
vector75:
  pushl $0
  10218c:	6a 00                	push   $0x0
  pushl $75
  10218e:	6a 4b                	push   $0x4b
  jmp __alltraps
  102190:	e9 d4 07 00 00       	jmp    102969 <__alltraps>

00102195 <vector76>:
.globl vector76
vector76:
  pushl $0
  102195:	6a 00                	push   $0x0
  pushl $76
  102197:	6a 4c                	push   $0x4c
  jmp __alltraps
  102199:	e9 cb 07 00 00       	jmp    102969 <__alltraps>

0010219e <vector77>:
.globl vector77
vector77:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $77
  1021a0:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021a2:	e9 c2 07 00 00       	jmp    102969 <__alltraps>

001021a7 <vector78>:
.globl vector78
vector78:
  pushl $0
  1021a7:	6a 00                	push   $0x0
  pushl $78
  1021a9:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021ab:	e9 b9 07 00 00       	jmp    102969 <__alltraps>

001021b0 <vector79>:
.globl vector79
vector79:
  pushl $0
  1021b0:	6a 00                	push   $0x0
  pushl $79
  1021b2:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021b4:	e9 b0 07 00 00       	jmp    102969 <__alltraps>

001021b9 <vector80>:
.globl vector80
vector80:
  pushl $0
  1021b9:	6a 00                	push   $0x0
  pushl $80
  1021bb:	6a 50                	push   $0x50
  jmp __alltraps
  1021bd:	e9 a7 07 00 00       	jmp    102969 <__alltraps>

001021c2 <vector81>:
.globl vector81
vector81:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $81
  1021c4:	6a 51                	push   $0x51
  jmp __alltraps
  1021c6:	e9 9e 07 00 00       	jmp    102969 <__alltraps>

001021cb <vector82>:
.globl vector82
vector82:
  pushl $0
  1021cb:	6a 00                	push   $0x0
  pushl $82
  1021cd:	6a 52                	push   $0x52
  jmp __alltraps
  1021cf:	e9 95 07 00 00       	jmp    102969 <__alltraps>

001021d4 <vector83>:
.globl vector83
vector83:
  pushl $0
  1021d4:	6a 00                	push   $0x0
  pushl $83
  1021d6:	6a 53                	push   $0x53
  jmp __alltraps
  1021d8:	e9 8c 07 00 00       	jmp    102969 <__alltraps>

001021dd <vector84>:
.globl vector84
vector84:
  pushl $0
  1021dd:	6a 00                	push   $0x0
  pushl $84
  1021df:	6a 54                	push   $0x54
  jmp __alltraps
  1021e1:	e9 83 07 00 00       	jmp    102969 <__alltraps>

001021e6 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $85
  1021e8:	6a 55                	push   $0x55
  jmp __alltraps
  1021ea:	e9 7a 07 00 00       	jmp    102969 <__alltraps>

001021ef <vector86>:
.globl vector86
vector86:
  pushl $0
  1021ef:	6a 00                	push   $0x0
  pushl $86
  1021f1:	6a 56                	push   $0x56
  jmp __alltraps
  1021f3:	e9 71 07 00 00       	jmp    102969 <__alltraps>

001021f8 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021f8:	6a 00                	push   $0x0
  pushl $87
  1021fa:	6a 57                	push   $0x57
  jmp __alltraps
  1021fc:	e9 68 07 00 00       	jmp    102969 <__alltraps>

00102201 <vector88>:
.globl vector88
vector88:
  pushl $0
  102201:	6a 00                	push   $0x0
  pushl $88
  102203:	6a 58                	push   $0x58
  jmp __alltraps
  102205:	e9 5f 07 00 00       	jmp    102969 <__alltraps>

0010220a <vector89>:
.globl vector89
vector89:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $89
  10220c:	6a 59                	push   $0x59
  jmp __alltraps
  10220e:	e9 56 07 00 00       	jmp    102969 <__alltraps>

00102213 <vector90>:
.globl vector90
vector90:
  pushl $0
  102213:	6a 00                	push   $0x0
  pushl $90
  102215:	6a 5a                	push   $0x5a
  jmp __alltraps
  102217:	e9 4d 07 00 00       	jmp    102969 <__alltraps>

0010221c <vector91>:
.globl vector91
vector91:
  pushl $0
  10221c:	6a 00                	push   $0x0
  pushl $91
  10221e:	6a 5b                	push   $0x5b
  jmp __alltraps
  102220:	e9 44 07 00 00       	jmp    102969 <__alltraps>

00102225 <vector92>:
.globl vector92
vector92:
  pushl $0
  102225:	6a 00                	push   $0x0
  pushl $92
  102227:	6a 5c                	push   $0x5c
  jmp __alltraps
  102229:	e9 3b 07 00 00       	jmp    102969 <__alltraps>

0010222e <vector93>:
.globl vector93
vector93:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $93
  102230:	6a 5d                	push   $0x5d
  jmp __alltraps
  102232:	e9 32 07 00 00       	jmp    102969 <__alltraps>

00102237 <vector94>:
.globl vector94
vector94:
  pushl $0
  102237:	6a 00                	push   $0x0
  pushl $94
  102239:	6a 5e                	push   $0x5e
  jmp __alltraps
  10223b:	e9 29 07 00 00       	jmp    102969 <__alltraps>

00102240 <vector95>:
.globl vector95
vector95:
  pushl $0
  102240:	6a 00                	push   $0x0
  pushl $95
  102242:	6a 5f                	push   $0x5f
  jmp __alltraps
  102244:	e9 20 07 00 00       	jmp    102969 <__alltraps>

00102249 <vector96>:
.globl vector96
vector96:
  pushl $0
  102249:	6a 00                	push   $0x0
  pushl $96
  10224b:	6a 60                	push   $0x60
  jmp __alltraps
  10224d:	e9 17 07 00 00       	jmp    102969 <__alltraps>

00102252 <vector97>:
.globl vector97
vector97:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $97
  102254:	6a 61                	push   $0x61
  jmp __alltraps
  102256:	e9 0e 07 00 00       	jmp    102969 <__alltraps>

0010225b <vector98>:
.globl vector98
vector98:
  pushl $0
  10225b:	6a 00                	push   $0x0
  pushl $98
  10225d:	6a 62                	push   $0x62
  jmp __alltraps
  10225f:	e9 05 07 00 00       	jmp    102969 <__alltraps>

00102264 <vector99>:
.globl vector99
vector99:
  pushl $0
  102264:	6a 00                	push   $0x0
  pushl $99
  102266:	6a 63                	push   $0x63
  jmp __alltraps
  102268:	e9 fc 06 00 00       	jmp    102969 <__alltraps>

0010226d <vector100>:
.globl vector100
vector100:
  pushl $0
  10226d:	6a 00                	push   $0x0
  pushl $100
  10226f:	6a 64                	push   $0x64
  jmp __alltraps
  102271:	e9 f3 06 00 00       	jmp    102969 <__alltraps>

00102276 <vector101>:
.globl vector101
vector101:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $101
  102278:	6a 65                	push   $0x65
  jmp __alltraps
  10227a:	e9 ea 06 00 00       	jmp    102969 <__alltraps>

0010227f <vector102>:
.globl vector102
vector102:
  pushl $0
  10227f:	6a 00                	push   $0x0
  pushl $102
  102281:	6a 66                	push   $0x66
  jmp __alltraps
  102283:	e9 e1 06 00 00       	jmp    102969 <__alltraps>

00102288 <vector103>:
.globl vector103
vector103:
  pushl $0
  102288:	6a 00                	push   $0x0
  pushl $103
  10228a:	6a 67                	push   $0x67
  jmp __alltraps
  10228c:	e9 d8 06 00 00       	jmp    102969 <__alltraps>

00102291 <vector104>:
.globl vector104
vector104:
  pushl $0
  102291:	6a 00                	push   $0x0
  pushl $104
  102293:	6a 68                	push   $0x68
  jmp __alltraps
  102295:	e9 cf 06 00 00       	jmp    102969 <__alltraps>

0010229a <vector105>:
.globl vector105
vector105:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $105
  10229c:	6a 69                	push   $0x69
  jmp __alltraps
  10229e:	e9 c6 06 00 00       	jmp    102969 <__alltraps>

001022a3 <vector106>:
.globl vector106
vector106:
  pushl $0
  1022a3:	6a 00                	push   $0x0
  pushl $106
  1022a5:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022a7:	e9 bd 06 00 00       	jmp    102969 <__alltraps>

001022ac <vector107>:
.globl vector107
vector107:
  pushl $0
  1022ac:	6a 00                	push   $0x0
  pushl $107
  1022ae:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022b0:	e9 b4 06 00 00       	jmp    102969 <__alltraps>

001022b5 <vector108>:
.globl vector108
vector108:
  pushl $0
  1022b5:	6a 00                	push   $0x0
  pushl $108
  1022b7:	6a 6c                	push   $0x6c
  jmp __alltraps
  1022b9:	e9 ab 06 00 00       	jmp    102969 <__alltraps>

001022be <vector109>:
.globl vector109
vector109:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $109
  1022c0:	6a 6d                	push   $0x6d
  jmp __alltraps
  1022c2:	e9 a2 06 00 00       	jmp    102969 <__alltraps>

001022c7 <vector110>:
.globl vector110
vector110:
  pushl $0
  1022c7:	6a 00                	push   $0x0
  pushl $110
  1022c9:	6a 6e                	push   $0x6e
  jmp __alltraps
  1022cb:	e9 99 06 00 00       	jmp    102969 <__alltraps>

001022d0 <vector111>:
.globl vector111
vector111:
  pushl $0
  1022d0:	6a 00                	push   $0x0
  pushl $111
  1022d2:	6a 6f                	push   $0x6f
  jmp __alltraps
  1022d4:	e9 90 06 00 00       	jmp    102969 <__alltraps>

001022d9 <vector112>:
.globl vector112
vector112:
  pushl $0
  1022d9:	6a 00                	push   $0x0
  pushl $112
  1022db:	6a 70                	push   $0x70
  jmp __alltraps
  1022dd:	e9 87 06 00 00       	jmp    102969 <__alltraps>

001022e2 <vector113>:
.globl vector113
vector113:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $113
  1022e4:	6a 71                	push   $0x71
  jmp __alltraps
  1022e6:	e9 7e 06 00 00       	jmp    102969 <__alltraps>

001022eb <vector114>:
.globl vector114
vector114:
  pushl $0
  1022eb:	6a 00                	push   $0x0
  pushl $114
  1022ed:	6a 72                	push   $0x72
  jmp __alltraps
  1022ef:	e9 75 06 00 00       	jmp    102969 <__alltraps>

001022f4 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022f4:	6a 00                	push   $0x0
  pushl $115
  1022f6:	6a 73                	push   $0x73
  jmp __alltraps
  1022f8:	e9 6c 06 00 00       	jmp    102969 <__alltraps>

001022fd <vector116>:
.globl vector116
vector116:
  pushl $0
  1022fd:	6a 00                	push   $0x0
  pushl $116
  1022ff:	6a 74                	push   $0x74
  jmp __alltraps
  102301:	e9 63 06 00 00       	jmp    102969 <__alltraps>

00102306 <vector117>:
.globl vector117
vector117:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $117
  102308:	6a 75                	push   $0x75
  jmp __alltraps
  10230a:	e9 5a 06 00 00       	jmp    102969 <__alltraps>

0010230f <vector118>:
.globl vector118
vector118:
  pushl $0
  10230f:	6a 00                	push   $0x0
  pushl $118
  102311:	6a 76                	push   $0x76
  jmp __alltraps
  102313:	e9 51 06 00 00       	jmp    102969 <__alltraps>

00102318 <vector119>:
.globl vector119
vector119:
  pushl $0
  102318:	6a 00                	push   $0x0
  pushl $119
  10231a:	6a 77                	push   $0x77
  jmp __alltraps
  10231c:	e9 48 06 00 00       	jmp    102969 <__alltraps>

00102321 <vector120>:
.globl vector120
vector120:
  pushl $0
  102321:	6a 00                	push   $0x0
  pushl $120
  102323:	6a 78                	push   $0x78
  jmp __alltraps
  102325:	e9 3f 06 00 00       	jmp    102969 <__alltraps>

0010232a <vector121>:
.globl vector121
vector121:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $121
  10232c:	6a 79                	push   $0x79
  jmp __alltraps
  10232e:	e9 36 06 00 00       	jmp    102969 <__alltraps>

00102333 <vector122>:
.globl vector122
vector122:
  pushl $0
  102333:	6a 00                	push   $0x0
  pushl $122
  102335:	6a 7a                	push   $0x7a
  jmp __alltraps
  102337:	e9 2d 06 00 00       	jmp    102969 <__alltraps>

0010233c <vector123>:
.globl vector123
vector123:
  pushl $0
  10233c:	6a 00                	push   $0x0
  pushl $123
  10233e:	6a 7b                	push   $0x7b
  jmp __alltraps
  102340:	e9 24 06 00 00       	jmp    102969 <__alltraps>

00102345 <vector124>:
.globl vector124
vector124:
  pushl $0
  102345:	6a 00                	push   $0x0
  pushl $124
  102347:	6a 7c                	push   $0x7c
  jmp __alltraps
  102349:	e9 1b 06 00 00       	jmp    102969 <__alltraps>

0010234e <vector125>:
.globl vector125
vector125:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $125
  102350:	6a 7d                	push   $0x7d
  jmp __alltraps
  102352:	e9 12 06 00 00       	jmp    102969 <__alltraps>

00102357 <vector126>:
.globl vector126
vector126:
  pushl $0
  102357:	6a 00                	push   $0x0
  pushl $126
  102359:	6a 7e                	push   $0x7e
  jmp __alltraps
  10235b:	e9 09 06 00 00       	jmp    102969 <__alltraps>

00102360 <vector127>:
.globl vector127
vector127:
  pushl $0
  102360:	6a 00                	push   $0x0
  pushl $127
  102362:	6a 7f                	push   $0x7f
  jmp __alltraps
  102364:	e9 00 06 00 00       	jmp    102969 <__alltraps>

00102369 <vector128>:
.globl vector128
vector128:
  pushl $0
  102369:	6a 00                	push   $0x0
  pushl $128
  10236b:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102370:	e9 f4 05 00 00       	jmp    102969 <__alltraps>

00102375 <vector129>:
.globl vector129
vector129:
  pushl $0
  102375:	6a 00                	push   $0x0
  pushl $129
  102377:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10237c:	e9 e8 05 00 00       	jmp    102969 <__alltraps>

00102381 <vector130>:
.globl vector130
vector130:
  pushl $0
  102381:	6a 00                	push   $0x0
  pushl $130
  102383:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102388:	e9 dc 05 00 00       	jmp    102969 <__alltraps>

0010238d <vector131>:
.globl vector131
vector131:
  pushl $0
  10238d:	6a 00                	push   $0x0
  pushl $131
  10238f:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102394:	e9 d0 05 00 00       	jmp    102969 <__alltraps>

00102399 <vector132>:
.globl vector132
vector132:
  pushl $0
  102399:	6a 00                	push   $0x0
  pushl $132
  10239b:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023a0:	e9 c4 05 00 00       	jmp    102969 <__alltraps>

001023a5 <vector133>:
.globl vector133
vector133:
  pushl $0
  1023a5:	6a 00                	push   $0x0
  pushl $133
  1023a7:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023ac:	e9 b8 05 00 00       	jmp    102969 <__alltraps>

001023b1 <vector134>:
.globl vector134
vector134:
  pushl $0
  1023b1:	6a 00                	push   $0x0
  pushl $134
  1023b3:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1023b8:	e9 ac 05 00 00       	jmp    102969 <__alltraps>

001023bd <vector135>:
.globl vector135
vector135:
  pushl $0
  1023bd:	6a 00                	push   $0x0
  pushl $135
  1023bf:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1023c4:	e9 a0 05 00 00       	jmp    102969 <__alltraps>

001023c9 <vector136>:
.globl vector136
vector136:
  pushl $0
  1023c9:	6a 00                	push   $0x0
  pushl $136
  1023cb:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1023d0:	e9 94 05 00 00       	jmp    102969 <__alltraps>

001023d5 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $137
  1023d7:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023dc:	e9 88 05 00 00       	jmp    102969 <__alltraps>

001023e1 <vector138>:
.globl vector138
vector138:
  pushl $0
  1023e1:	6a 00                	push   $0x0
  pushl $138
  1023e3:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023e8:	e9 7c 05 00 00       	jmp    102969 <__alltraps>

001023ed <vector139>:
.globl vector139
vector139:
  pushl $0
  1023ed:	6a 00                	push   $0x0
  pushl $139
  1023ef:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023f4:	e9 70 05 00 00       	jmp    102969 <__alltraps>

001023f9 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023f9:	6a 00                	push   $0x0
  pushl $140
  1023fb:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102400:	e9 64 05 00 00       	jmp    102969 <__alltraps>

00102405 <vector141>:
.globl vector141
vector141:
  pushl $0
  102405:	6a 00                	push   $0x0
  pushl $141
  102407:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10240c:	e9 58 05 00 00       	jmp    102969 <__alltraps>

00102411 <vector142>:
.globl vector142
vector142:
  pushl $0
  102411:	6a 00                	push   $0x0
  pushl $142
  102413:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102418:	e9 4c 05 00 00       	jmp    102969 <__alltraps>

0010241d <vector143>:
.globl vector143
vector143:
  pushl $0
  10241d:	6a 00                	push   $0x0
  pushl $143
  10241f:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102424:	e9 40 05 00 00       	jmp    102969 <__alltraps>

00102429 <vector144>:
.globl vector144
vector144:
  pushl $0
  102429:	6a 00                	push   $0x0
  pushl $144
  10242b:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102430:	e9 34 05 00 00       	jmp    102969 <__alltraps>

00102435 <vector145>:
.globl vector145
vector145:
  pushl $0
  102435:	6a 00                	push   $0x0
  pushl $145
  102437:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10243c:	e9 28 05 00 00       	jmp    102969 <__alltraps>

00102441 <vector146>:
.globl vector146
vector146:
  pushl $0
  102441:	6a 00                	push   $0x0
  pushl $146
  102443:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102448:	e9 1c 05 00 00       	jmp    102969 <__alltraps>

0010244d <vector147>:
.globl vector147
vector147:
  pushl $0
  10244d:	6a 00                	push   $0x0
  pushl $147
  10244f:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102454:	e9 10 05 00 00       	jmp    102969 <__alltraps>

00102459 <vector148>:
.globl vector148
vector148:
  pushl $0
  102459:	6a 00                	push   $0x0
  pushl $148
  10245b:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102460:	e9 04 05 00 00       	jmp    102969 <__alltraps>

00102465 <vector149>:
.globl vector149
vector149:
  pushl $0
  102465:	6a 00                	push   $0x0
  pushl $149
  102467:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10246c:	e9 f8 04 00 00       	jmp    102969 <__alltraps>

00102471 <vector150>:
.globl vector150
vector150:
  pushl $0
  102471:	6a 00                	push   $0x0
  pushl $150
  102473:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102478:	e9 ec 04 00 00       	jmp    102969 <__alltraps>

0010247d <vector151>:
.globl vector151
vector151:
  pushl $0
  10247d:	6a 00                	push   $0x0
  pushl $151
  10247f:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102484:	e9 e0 04 00 00       	jmp    102969 <__alltraps>

00102489 <vector152>:
.globl vector152
vector152:
  pushl $0
  102489:	6a 00                	push   $0x0
  pushl $152
  10248b:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102490:	e9 d4 04 00 00       	jmp    102969 <__alltraps>

00102495 <vector153>:
.globl vector153
vector153:
  pushl $0
  102495:	6a 00                	push   $0x0
  pushl $153
  102497:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10249c:	e9 c8 04 00 00       	jmp    102969 <__alltraps>

001024a1 <vector154>:
.globl vector154
vector154:
  pushl $0
  1024a1:	6a 00                	push   $0x0
  pushl $154
  1024a3:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024a8:	e9 bc 04 00 00       	jmp    102969 <__alltraps>

001024ad <vector155>:
.globl vector155
vector155:
  pushl $0
  1024ad:	6a 00                	push   $0x0
  pushl $155
  1024af:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024b4:	e9 b0 04 00 00       	jmp    102969 <__alltraps>

001024b9 <vector156>:
.globl vector156
vector156:
  pushl $0
  1024b9:	6a 00                	push   $0x0
  pushl $156
  1024bb:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1024c0:	e9 a4 04 00 00       	jmp    102969 <__alltraps>

001024c5 <vector157>:
.globl vector157
vector157:
  pushl $0
  1024c5:	6a 00                	push   $0x0
  pushl $157
  1024c7:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1024cc:	e9 98 04 00 00       	jmp    102969 <__alltraps>

001024d1 <vector158>:
.globl vector158
vector158:
  pushl $0
  1024d1:	6a 00                	push   $0x0
  pushl $158
  1024d3:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024d8:	e9 8c 04 00 00       	jmp    102969 <__alltraps>

001024dd <vector159>:
.globl vector159
vector159:
  pushl $0
  1024dd:	6a 00                	push   $0x0
  pushl $159
  1024df:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024e4:	e9 80 04 00 00       	jmp    102969 <__alltraps>

001024e9 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024e9:	6a 00                	push   $0x0
  pushl $160
  1024eb:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024f0:	e9 74 04 00 00       	jmp    102969 <__alltraps>

001024f5 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024f5:	6a 00                	push   $0x0
  pushl $161
  1024f7:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024fc:	e9 68 04 00 00       	jmp    102969 <__alltraps>

00102501 <vector162>:
.globl vector162
vector162:
  pushl $0
  102501:	6a 00                	push   $0x0
  pushl $162
  102503:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102508:	e9 5c 04 00 00       	jmp    102969 <__alltraps>

0010250d <vector163>:
.globl vector163
vector163:
  pushl $0
  10250d:	6a 00                	push   $0x0
  pushl $163
  10250f:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102514:	e9 50 04 00 00       	jmp    102969 <__alltraps>

00102519 <vector164>:
.globl vector164
vector164:
  pushl $0
  102519:	6a 00                	push   $0x0
  pushl $164
  10251b:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102520:	e9 44 04 00 00       	jmp    102969 <__alltraps>

00102525 <vector165>:
.globl vector165
vector165:
  pushl $0
  102525:	6a 00                	push   $0x0
  pushl $165
  102527:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10252c:	e9 38 04 00 00       	jmp    102969 <__alltraps>

00102531 <vector166>:
.globl vector166
vector166:
  pushl $0
  102531:	6a 00                	push   $0x0
  pushl $166
  102533:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102538:	e9 2c 04 00 00       	jmp    102969 <__alltraps>

0010253d <vector167>:
.globl vector167
vector167:
  pushl $0
  10253d:	6a 00                	push   $0x0
  pushl $167
  10253f:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102544:	e9 20 04 00 00       	jmp    102969 <__alltraps>

00102549 <vector168>:
.globl vector168
vector168:
  pushl $0
  102549:	6a 00                	push   $0x0
  pushl $168
  10254b:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102550:	e9 14 04 00 00       	jmp    102969 <__alltraps>

00102555 <vector169>:
.globl vector169
vector169:
  pushl $0
  102555:	6a 00                	push   $0x0
  pushl $169
  102557:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10255c:	e9 08 04 00 00       	jmp    102969 <__alltraps>

00102561 <vector170>:
.globl vector170
vector170:
  pushl $0
  102561:	6a 00                	push   $0x0
  pushl $170
  102563:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102568:	e9 fc 03 00 00       	jmp    102969 <__alltraps>

0010256d <vector171>:
.globl vector171
vector171:
  pushl $0
  10256d:	6a 00                	push   $0x0
  pushl $171
  10256f:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102574:	e9 f0 03 00 00       	jmp    102969 <__alltraps>

00102579 <vector172>:
.globl vector172
vector172:
  pushl $0
  102579:	6a 00                	push   $0x0
  pushl $172
  10257b:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102580:	e9 e4 03 00 00       	jmp    102969 <__alltraps>

00102585 <vector173>:
.globl vector173
vector173:
  pushl $0
  102585:	6a 00                	push   $0x0
  pushl $173
  102587:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10258c:	e9 d8 03 00 00       	jmp    102969 <__alltraps>

00102591 <vector174>:
.globl vector174
vector174:
  pushl $0
  102591:	6a 00                	push   $0x0
  pushl $174
  102593:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102598:	e9 cc 03 00 00       	jmp    102969 <__alltraps>

0010259d <vector175>:
.globl vector175
vector175:
  pushl $0
  10259d:	6a 00                	push   $0x0
  pushl $175
  10259f:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025a4:	e9 c0 03 00 00       	jmp    102969 <__alltraps>

001025a9 <vector176>:
.globl vector176
vector176:
  pushl $0
  1025a9:	6a 00                	push   $0x0
  pushl $176
  1025ab:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025b0:	e9 b4 03 00 00       	jmp    102969 <__alltraps>

001025b5 <vector177>:
.globl vector177
vector177:
  pushl $0
  1025b5:	6a 00                	push   $0x0
  pushl $177
  1025b7:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1025bc:	e9 a8 03 00 00       	jmp    102969 <__alltraps>

001025c1 <vector178>:
.globl vector178
vector178:
  pushl $0
  1025c1:	6a 00                	push   $0x0
  pushl $178
  1025c3:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1025c8:	e9 9c 03 00 00       	jmp    102969 <__alltraps>

001025cd <vector179>:
.globl vector179
vector179:
  pushl $0
  1025cd:	6a 00                	push   $0x0
  pushl $179
  1025cf:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1025d4:	e9 90 03 00 00       	jmp    102969 <__alltraps>

001025d9 <vector180>:
.globl vector180
vector180:
  pushl $0
  1025d9:	6a 00                	push   $0x0
  pushl $180
  1025db:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025e0:	e9 84 03 00 00       	jmp    102969 <__alltraps>

001025e5 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025e5:	6a 00                	push   $0x0
  pushl $181
  1025e7:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025ec:	e9 78 03 00 00       	jmp    102969 <__alltraps>

001025f1 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025f1:	6a 00                	push   $0x0
  pushl $182
  1025f3:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025f8:	e9 6c 03 00 00       	jmp    102969 <__alltraps>

001025fd <vector183>:
.globl vector183
vector183:
  pushl $0
  1025fd:	6a 00                	push   $0x0
  pushl $183
  1025ff:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102604:	e9 60 03 00 00       	jmp    102969 <__alltraps>

00102609 <vector184>:
.globl vector184
vector184:
  pushl $0
  102609:	6a 00                	push   $0x0
  pushl $184
  10260b:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102610:	e9 54 03 00 00       	jmp    102969 <__alltraps>

00102615 <vector185>:
.globl vector185
vector185:
  pushl $0
  102615:	6a 00                	push   $0x0
  pushl $185
  102617:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10261c:	e9 48 03 00 00       	jmp    102969 <__alltraps>

00102621 <vector186>:
.globl vector186
vector186:
  pushl $0
  102621:	6a 00                	push   $0x0
  pushl $186
  102623:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102628:	e9 3c 03 00 00       	jmp    102969 <__alltraps>

0010262d <vector187>:
.globl vector187
vector187:
  pushl $0
  10262d:	6a 00                	push   $0x0
  pushl $187
  10262f:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102634:	e9 30 03 00 00       	jmp    102969 <__alltraps>

00102639 <vector188>:
.globl vector188
vector188:
  pushl $0
  102639:	6a 00                	push   $0x0
  pushl $188
  10263b:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102640:	e9 24 03 00 00       	jmp    102969 <__alltraps>

00102645 <vector189>:
.globl vector189
vector189:
  pushl $0
  102645:	6a 00                	push   $0x0
  pushl $189
  102647:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10264c:	e9 18 03 00 00       	jmp    102969 <__alltraps>

00102651 <vector190>:
.globl vector190
vector190:
  pushl $0
  102651:	6a 00                	push   $0x0
  pushl $190
  102653:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102658:	e9 0c 03 00 00       	jmp    102969 <__alltraps>

0010265d <vector191>:
.globl vector191
vector191:
  pushl $0
  10265d:	6a 00                	push   $0x0
  pushl $191
  10265f:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102664:	e9 00 03 00 00       	jmp    102969 <__alltraps>

00102669 <vector192>:
.globl vector192
vector192:
  pushl $0
  102669:	6a 00                	push   $0x0
  pushl $192
  10266b:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102670:	e9 f4 02 00 00       	jmp    102969 <__alltraps>

00102675 <vector193>:
.globl vector193
vector193:
  pushl $0
  102675:	6a 00                	push   $0x0
  pushl $193
  102677:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10267c:	e9 e8 02 00 00       	jmp    102969 <__alltraps>

00102681 <vector194>:
.globl vector194
vector194:
  pushl $0
  102681:	6a 00                	push   $0x0
  pushl $194
  102683:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102688:	e9 dc 02 00 00       	jmp    102969 <__alltraps>

0010268d <vector195>:
.globl vector195
vector195:
  pushl $0
  10268d:	6a 00                	push   $0x0
  pushl $195
  10268f:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102694:	e9 d0 02 00 00       	jmp    102969 <__alltraps>

00102699 <vector196>:
.globl vector196
vector196:
  pushl $0
  102699:	6a 00                	push   $0x0
  pushl $196
  10269b:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026a0:	e9 c4 02 00 00       	jmp    102969 <__alltraps>

001026a5 <vector197>:
.globl vector197
vector197:
  pushl $0
  1026a5:	6a 00                	push   $0x0
  pushl $197
  1026a7:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026ac:	e9 b8 02 00 00       	jmp    102969 <__alltraps>

001026b1 <vector198>:
.globl vector198
vector198:
  pushl $0
  1026b1:	6a 00                	push   $0x0
  pushl $198
  1026b3:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1026b8:	e9 ac 02 00 00       	jmp    102969 <__alltraps>

001026bd <vector199>:
.globl vector199
vector199:
  pushl $0
  1026bd:	6a 00                	push   $0x0
  pushl $199
  1026bf:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1026c4:	e9 a0 02 00 00       	jmp    102969 <__alltraps>

001026c9 <vector200>:
.globl vector200
vector200:
  pushl $0
  1026c9:	6a 00                	push   $0x0
  pushl $200
  1026cb:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1026d0:	e9 94 02 00 00       	jmp    102969 <__alltraps>

001026d5 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026d5:	6a 00                	push   $0x0
  pushl $201
  1026d7:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026dc:	e9 88 02 00 00       	jmp    102969 <__alltraps>

001026e1 <vector202>:
.globl vector202
vector202:
  pushl $0
  1026e1:	6a 00                	push   $0x0
  pushl $202
  1026e3:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026e8:	e9 7c 02 00 00       	jmp    102969 <__alltraps>

001026ed <vector203>:
.globl vector203
vector203:
  pushl $0
  1026ed:	6a 00                	push   $0x0
  pushl $203
  1026ef:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026f4:	e9 70 02 00 00       	jmp    102969 <__alltraps>

001026f9 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026f9:	6a 00                	push   $0x0
  pushl $204
  1026fb:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102700:	e9 64 02 00 00       	jmp    102969 <__alltraps>

00102705 <vector205>:
.globl vector205
vector205:
  pushl $0
  102705:	6a 00                	push   $0x0
  pushl $205
  102707:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10270c:	e9 58 02 00 00       	jmp    102969 <__alltraps>

00102711 <vector206>:
.globl vector206
vector206:
  pushl $0
  102711:	6a 00                	push   $0x0
  pushl $206
  102713:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102718:	e9 4c 02 00 00       	jmp    102969 <__alltraps>

0010271d <vector207>:
.globl vector207
vector207:
  pushl $0
  10271d:	6a 00                	push   $0x0
  pushl $207
  10271f:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102724:	e9 40 02 00 00       	jmp    102969 <__alltraps>

00102729 <vector208>:
.globl vector208
vector208:
  pushl $0
  102729:	6a 00                	push   $0x0
  pushl $208
  10272b:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102730:	e9 34 02 00 00       	jmp    102969 <__alltraps>

00102735 <vector209>:
.globl vector209
vector209:
  pushl $0
  102735:	6a 00                	push   $0x0
  pushl $209
  102737:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10273c:	e9 28 02 00 00       	jmp    102969 <__alltraps>

00102741 <vector210>:
.globl vector210
vector210:
  pushl $0
  102741:	6a 00                	push   $0x0
  pushl $210
  102743:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102748:	e9 1c 02 00 00       	jmp    102969 <__alltraps>

0010274d <vector211>:
.globl vector211
vector211:
  pushl $0
  10274d:	6a 00                	push   $0x0
  pushl $211
  10274f:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102754:	e9 10 02 00 00       	jmp    102969 <__alltraps>

00102759 <vector212>:
.globl vector212
vector212:
  pushl $0
  102759:	6a 00                	push   $0x0
  pushl $212
  10275b:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102760:	e9 04 02 00 00       	jmp    102969 <__alltraps>

00102765 <vector213>:
.globl vector213
vector213:
  pushl $0
  102765:	6a 00                	push   $0x0
  pushl $213
  102767:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10276c:	e9 f8 01 00 00       	jmp    102969 <__alltraps>

00102771 <vector214>:
.globl vector214
vector214:
  pushl $0
  102771:	6a 00                	push   $0x0
  pushl $214
  102773:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102778:	e9 ec 01 00 00       	jmp    102969 <__alltraps>

0010277d <vector215>:
.globl vector215
vector215:
  pushl $0
  10277d:	6a 00                	push   $0x0
  pushl $215
  10277f:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102784:	e9 e0 01 00 00       	jmp    102969 <__alltraps>

00102789 <vector216>:
.globl vector216
vector216:
  pushl $0
  102789:	6a 00                	push   $0x0
  pushl $216
  10278b:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102790:	e9 d4 01 00 00       	jmp    102969 <__alltraps>

00102795 <vector217>:
.globl vector217
vector217:
  pushl $0
  102795:	6a 00                	push   $0x0
  pushl $217
  102797:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10279c:	e9 c8 01 00 00       	jmp    102969 <__alltraps>

001027a1 <vector218>:
.globl vector218
vector218:
  pushl $0
  1027a1:	6a 00                	push   $0x0
  pushl $218
  1027a3:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027a8:	e9 bc 01 00 00       	jmp    102969 <__alltraps>

001027ad <vector219>:
.globl vector219
vector219:
  pushl $0
  1027ad:	6a 00                	push   $0x0
  pushl $219
  1027af:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027b4:	e9 b0 01 00 00       	jmp    102969 <__alltraps>

001027b9 <vector220>:
.globl vector220
vector220:
  pushl $0
  1027b9:	6a 00                	push   $0x0
  pushl $220
  1027bb:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1027c0:	e9 a4 01 00 00       	jmp    102969 <__alltraps>

001027c5 <vector221>:
.globl vector221
vector221:
  pushl $0
  1027c5:	6a 00                	push   $0x0
  pushl $221
  1027c7:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1027cc:	e9 98 01 00 00       	jmp    102969 <__alltraps>

001027d1 <vector222>:
.globl vector222
vector222:
  pushl $0
  1027d1:	6a 00                	push   $0x0
  pushl $222
  1027d3:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027d8:	e9 8c 01 00 00       	jmp    102969 <__alltraps>

001027dd <vector223>:
.globl vector223
vector223:
  pushl $0
  1027dd:	6a 00                	push   $0x0
  pushl $223
  1027df:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027e4:	e9 80 01 00 00       	jmp    102969 <__alltraps>

001027e9 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027e9:	6a 00                	push   $0x0
  pushl $224
  1027eb:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027f0:	e9 74 01 00 00       	jmp    102969 <__alltraps>

001027f5 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027f5:	6a 00                	push   $0x0
  pushl $225
  1027f7:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027fc:	e9 68 01 00 00       	jmp    102969 <__alltraps>

00102801 <vector226>:
.globl vector226
vector226:
  pushl $0
  102801:	6a 00                	push   $0x0
  pushl $226
  102803:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102808:	e9 5c 01 00 00       	jmp    102969 <__alltraps>

0010280d <vector227>:
.globl vector227
vector227:
  pushl $0
  10280d:	6a 00                	push   $0x0
  pushl $227
  10280f:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102814:	e9 50 01 00 00       	jmp    102969 <__alltraps>

00102819 <vector228>:
.globl vector228
vector228:
  pushl $0
  102819:	6a 00                	push   $0x0
  pushl $228
  10281b:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102820:	e9 44 01 00 00       	jmp    102969 <__alltraps>

00102825 <vector229>:
.globl vector229
vector229:
  pushl $0
  102825:	6a 00                	push   $0x0
  pushl $229
  102827:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10282c:	e9 38 01 00 00       	jmp    102969 <__alltraps>

00102831 <vector230>:
.globl vector230
vector230:
  pushl $0
  102831:	6a 00                	push   $0x0
  pushl $230
  102833:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102838:	e9 2c 01 00 00       	jmp    102969 <__alltraps>

0010283d <vector231>:
.globl vector231
vector231:
  pushl $0
  10283d:	6a 00                	push   $0x0
  pushl $231
  10283f:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102844:	e9 20 01 00 00       	jmp    102969 <__alltraps>

00102849 <vector232>:
.globl vector232
vector232:
  pushl $0
  102849:	6a 00                	push   $0x0
  pushl $232
  10284b:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102850:	e9 14 01 00 00       	jmp    102969 <__alltraps>

00102855 <vector233>:
.globl vector233
vector233:
  pushl $0
  102855:	6a 00                	push   $0x0
  pushl $233
  102857:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10285c:	e9 08 01 00 00       	jmp    102969 <__alltraps>

00102861 <vector234>:
.globl vector234
vector234:
  pushl $0
  102861:	6a 00                	push   $0x0
  pushl $234
  102863:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102868:	e9 fc 00 00 00       	jmp    102969 <__alltraps>

0010286d <vector235>:
.globl vector235
vector235:
  pushl $0
  10286d:	6a 00                	push   $0x0
  pushl $235
  10286f:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102874:	e9 f0 00 00 00       	jmp    102969 <__alltraps>

00102879 <vector236>:
.globl vector236
vector236:
  pushl $0
  102879:	6a 00                	push   $0x0
  pushl $236
  10287b:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102880:	e9 e4 00 00 00       	jmp    102969 <__alltraps>

00102885 <vector237>:
.globl vector237
vector237:
  pushl $0
  102885:	6a 00                	push   $0x0
  pushl $237
  102887:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10288c:	e9 d8 00 00 00       	jmp    102969 <__alltraps>

00102891 <vector238>:
.globl vector238
vector238:
  pushl $0
  102891:	6a 00                	push   $0x0
  pushl $238
  102893:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102898:	e9 cc 00 00 00       	jmp    102969 <__alltraps>

0010289d <vector239>:
.globl vector239
vector239:
  pushl $0
  10289d:	6a 00                	push   $0x0
  pushl $239
  10289f:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028a4:	e9 c0 00 00 00       	jmp    102969 <__alltraps>

001028a9 <vector240>:
.globl vector240
vector240:
  pushl $0
  1028a9:	6a 00                	push   $0x0
  pushl $240
  1028ab:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028b0:	e9 b4 00 00 00       	jmp    102969 <__alltraps>

001028b5 <vector241>:
.globl vector241
vector241:
  pushl $0
  1028b5:	6a 00                	push   $0x0
  pushl $241
  1028b7:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1028bc:	e9 a8 00 00 00       	jmp    102969 <__alltraps>

001028c1 <vector242>:
.globl vector242
vector242:
  pushl $0
  1028c1:	6a 00                	push   $0x0
  pushl $242
  1028c3:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1028c8:	e9 9c 00 00 00       	jmp    102969 <__alltraps>

001028cd <vector243>:
.globl vector243
vector243:
  pushl $0
  1028cd:	6a 00                	push   $0x0
  pushl $243
  1028cf:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1028d4:	e9 90 00 00 00       	jmp    102969 <__alltraps>

001028d9 <vector244>:
.globl vector244
vector244:
  pushl $0
  1028d9:	6a 00                	push   $0x0
  pushl $244
  1028db:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028e0:	e9 84 00 00 00       	jmp    102969 <__alltraps>

001028e5 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028e5:	6a 00                	push   $0x0
  pushl $245
  1028e7:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028ec:	e9 78 00 00 00       	jmp    102969 <__alltraps>

001028f1 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028f1:	6a 00                	push   $0x0
  pushl $246
  1028f3:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028f8:	e9 6c 00 00 00       	jmp    102969 <__alltraps>

001028fd <vector247>:
.globl vector247
vector247:
  pushl $0
  1028fd:	6a 00                	push   $0x0
  pushl $247
  1028ff:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102904:	e9 60 00 00 00       	jmp    102969 <__alltraps>

00102909 <vector248>:
.globl vector248
vector248:
  pushl $0
  102909:	6a 00                	push   $0x0
  pushl $248
  10290b:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102910:	e9 54 00 00 00       	jmp    102969 <__alltraps>

00102915 <vector249>:
.globl vector249
vector249:
  pushl $0
  102915:	6a 00                	push   $0x0
  pushl $249
  102917:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10291c:	e9 48 00 00 00       	jmp    102969 <__alltraps>

00102921 <vector250>:
.globl vector250
vector250:
  pushl $0
  102921:	6a 00                	push   $0x0
  pushl $250
  102923:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102928:	e9 3c 00 00 00       	jmp    102969 <__alltraps>

0010292d <vector251>:
.globl vector251
vector251:
  pushl $0
  10292d:	6a 00                	push   $0x0
  pushl $251
  10292f:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102934:	e9 30 00 00 00       	jmp    102969 <__alltraps>

00102939 <vector252>:
.globl vector252
vector252:
  pushl $0
  102939:	6a 00                	push   $0x0
  pushl $252
  10293b:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102940:	e9 24 00 00 00       	jmp    102969 <__alltraps>

00102945 <vector253>:
.globl vector253
vector253:
  pushl $0
  102945:	6a 00                	push   $0x0
  pushl $253
  102947:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10294c:	e9 18 00 00 00       	jmp    102969 <__alltraps>

00102951 <vector254>:
.globl vector254
vector254:
  pushl $0
  102951:	6a 00                	push   $0x0
  pushl $254
  102953:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102958:	e9 0c 00 00 00       	jmp    102969 <__alltraps>

0010295d <vector255>:
.globl vector255
vector255:
  pushl $0
  10295d:	6a 00                	push   $0x0
  pushl $255
  10295f:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102964:	e9 00 00 00 00       	jmp    102969 <__alltraps>

00102969 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102969:	1e                   	push   %ds
    pushl %es
  10296a:	06                   	push   %es
    pushl %fs
  10296b:	0f a0                	push   %fs
    pushl %gs
  10296d:	0f a8                	push   %gs
    pushal
  10296f:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102970:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102975:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102977:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102979:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10297a:	e8 64 f5 ff ff       	call   101ee3 <trap>

    # pop the pushed stack pointer
    popl %esp
  10297f:	5c                   	pop    %esp

00102980 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102980:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102981:	0f a9                	pop    %gs
    popl %fs
  102983:	0f a1                	pop    %fs
    popl %es
  102985:	07                   	pop    %es
    popl %ds
  102986:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102987:	83 c4 08             	add    $0x8,%esp
    iret
  10298a:	cf                   	iret   

0010298b <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10298b:	55                   	push   %ebp
  10298c:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10298e:	8b 45 08             	mov    0x8(%ebp),%eax
  102991:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102994:	b8 23 00 00 00       	mov    $0x23,%eax
  102999:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10299b:	b8 23 00 00 00       	mov    $0x23,%eax
  1029a0:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1029a2:	b8 10 00 00 00       	mov    $0x10,%eax
  1029a7:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1029a9:	b8 10 00 00 00       	mov    $0x10,%eax
  1029ae:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1029b0:	b8 10 00 00 00       	mov    $0x10,%eax
  1029b5:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1029b7:	ea be 29 10 00 08 00 	ljmp   $0x8,$0x1029be
}
  1029be:	90                   	nop
  1029bf:	5d                   	pop    %ebp
  1029c0:	c3                   	ret    

001029c1 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1029c1:	55                   	push   %ebp
  1029c2:	89 e5                	mov    %esp,%ebp
  1029c4:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029c7:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1029cc:	05 00 04 00 00       	add    $0x400,%eax
  1029d1:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1029d6:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1029dd:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029df:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029e6:	68 00 
  1029e8:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029ed:	0f b7 c0             	movzwl %ax,%eax
  1029f0:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029f6:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029fb:	c1 e8 10             	shr    $0x10,%eax
  1029fe:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102a03:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a0a:	24 f0                	and    $0xf0,%al
  102a0c:	0c 09                	or     $0x9,%al
  102a0e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a13:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a1a:	0c 10                	or     $0x10,%al
  102a1c:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a21:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a28:	24 9f                	and    $0x9f,%al
  102a2a:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a2f:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a36:	0c 80                	or     $0x80,%al
  102a38:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a3d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a44:	24 f0                	and    $0xf0,%al
  102a46:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a4b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a52:	24 ef                	and    $0xef,%al
  102a54:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a59:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a60:	24 df                	and    $0xdf,%al
  102a62:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a67:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a6e:	0c 40                	or     $0x40,%al
  102a70:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a75:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a7c:	24 7f                	and    $0x7f,%al
  102a7e:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a83:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a88:	c1 e8 18             	shr    $0x18,%eax
  102a8b:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a90:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a97:	24 ef                	and    $0xef,%al
  102a99:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a9e:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102aa5:	e8 e1 fe ff ff       	call   10298b <lgdt>
  102aaa:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102ab0:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102ab4:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102ab7:	90                   	nop
  102ab8:	c9                   	leave  
  102ab9:	c3                   	ret    

00102aba <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102aba:	55                   	push   %ebp
  102abb:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102abd:	e8 ff fe ff ff       	call   1029c1 <gdt_init>
}
  102ac2:	90                   	nop
  102ac3:	5d                   	pop    %ebp
  102ac4:	c3                   	ret    

00102ac5 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102ac5:	55                   	push   %ebp
  102ac6:	89 e5                	mov    %esp,%ebp
  102ac8:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102acb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102ad2:	eb 03                	jmp    102ad7 <strlen+0x12>
        cnt ++;
  102ad4:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102ad7:	8b 45 08             	mov    0x8(%ebp),%eax
  102ada:	8d 50 01             	lea    0x1(%eax),%edx
  102add:	89 55 08             	mov    %edx,0x8(%ebp)
  102ae0:	0f b6 00             	movzbl (%eax),%eax
  102ae3:	84 c0                	test   %al,%al
  102ae5:	75 ed                	jne    102ad4 <strlen+0xf>
    }
    return cnt;
  102ae7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102aea:	c9                   	leave  
  102aeb:	c3                   	ret    

00102aec <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102aec:	55                   	push   %ebp
  102aed:	89 e5                	mov    %esp,%ebp
  102aef:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102af2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102af9:	eb 03                	jmp    102afe <strnlen+0x12>
        cnt ++;
  102afb:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102afe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b01:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b04:	73 10                	jae    102b16 <strnlen+0x2a>
  102b06:	8b 45 08             	mov    0x8(%ebp),%eax
  102b09:	8d 50 01             	lea    0x1(%eax),%edx
  102b0c:	89 55 08             	mov    %edx,0x8(%ebp)
  102b0f:	0f b6 00             	movzbl (%eax),%eax
  102b12:	84 c0                	test   %al,%al
  102b14:	75 e5                	jne    102afb <strnlen+0xf>
    }
    return cnt;
  102b16:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b19:	c9                   	leave  
  102b1a:	c3                   	ret    

00102b1b <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102b1b:	55                   	push   %ebp
  102b1c:	89 e5                	mov    %esp,%ebp
  102b1e:	57                   	push   %edi
  102b1f:	56                   	push   %esi
  102b20:	83 ec 20             	sub    $0x20,%esp
  102b23:	8b 45 08             	mov    0x8(%ebp),%eax
  102b26:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b29:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b2f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b35:	89 d1                	mov    %edx,%ecx
  102b37:	89 c2                	mov    %eax,%edx
  102b39:	89 ce                	mov    %ecx,%esi
  102b3b:	89 d7                	mov    %edx,%edi
  102b3d:	ac                   	lods   %ds:(%esi),%al
  102b3e:	aa                   	stos   %al,%es:(%edi)
  102b3f:	84 c0                	test   %al,%al
  102b41:	75 fa                	jne    102b3d <strcpy+0x22>
  102b43:	89 fa                	mov    %edi,%edx
  102b45:	89 f1                	mov    %esi,%ecx
  102b47:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b4a:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b53:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b54:	83 c4 20             	add    $0x20,%esp
  102b57:	5e                   	pop    %esi
  102b58:	5f                   	pop    %edi
  102b59:	5d                   	pop    %ebp
  102b5a:	c3                   	ret    

00102b5b <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b5b:	55                   	push   %ebp
  102b5c:	89 e5                	mov    %esp,%ebp
  102b5e:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b61:	8b 45 08             	mov    0x8(%ebp),%eax
  102b64:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b67:	eb 1e                	jmp    102b87 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102b69:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b6c:	0f b6 10             	movzbl (%eax),%edx
  102b6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b72:	88 10                	mov    %dl,(%eax)
  102b74:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b77:	0f b6 00             	movzbl (%eax),%eax
  102b7a:	84 c0                	test   %al,%al
  102b7c:	74 03                	je     102b81 <strncpy+0x26>
            src ++;
  102b7e:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b81:	ff 45 fc             	incl   -0x4(%ebp)
  102b84:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b87:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b8b:	75 dc                	jne    102b69 <strncpy+0xe>
    }
    return dst;
  102b8d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b90:	c9                   	leave  
  102b91:	c3                   	ret    

00102b92 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b92:	55                   	push   %ebp
  102b93:	89 e5                	mov    %esp,%ebp
  102b95:	57                   	push   %edi
  102b96:	56                   	push   %esi
  102b97:	83 ec 20             	sub    $0x20,%esp
  102b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ba0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ba3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102ba6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bac:	89 d1                	mov    %edx,%ecx
  102bae:	89 c2                	mov    %eax,%edx
  102bb0:	89 ce                	mov    %ecx,%esi
  102bb2:	89 d7                	mov    %edx,%edi
  102bb4:	ac                   	lods   %ds:(%esi),%al
  102bb5:	ae                   	scas   %es:(%edi),%al
  102bb6:	75 08                	jne    102bc0 <strcmp+0x2e>
  102bb8:	84 c0                	test   %al,%al
  102bba:	75 f8                	jne    102bb4 <strcmp+0x22>
  102bbc:	31 c0                	xor    %eax,%eax
  102bbe:	eb 04                	jmp    102bc4 <strcmp+0x32>
  102bc0:	19 c0                	sbb    %eax,%eax
  102bc2:	0c 01                	or     $0x1,%al
  102bc4:	89 fa                	mov    %edi,%edx
  102bc6:	89 f1                	mov    %esi,%ecx
  102bc8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102bcb:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102bd1:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102bd4:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102bd5:	83 c4 20             	add    $0x20,%esp
  102bd8:	5e                   	pop    %esi
  102bd9:	5f                   	pop    %edi
  102bda:	5d                   	pop    %ebp
  102bdb:	c3                   	ret    

00102bdc <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bdc:	55                   	push   %ebp
  102bdd:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bdf:	eb 09                	jmp    102bea <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102be1:	ff 4d 10             	decl   0x10(%ebp)
  102be4:	ff 45 08             	incl   0x8(%ebp)
  102be7:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bee:	74 1a                	je     102c0a <strncmp+0x2e>
  102bf0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf3:	0f b6 00             	movzbl (%eax),%eax
  102bf6:	84 c0                	test   %al,%al
  102bf8:	74 10                	je     102c0a <strncmp+0x2e>
  102bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfd:	0f b6 10             	movzbl (%eax),%edx
  102c00:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c03:	0f b6 00             	movzbl (%eax),%eax
  102c06:	38 c2                	cmp    %al,%dl
  102c08:	74 d7                	je     102be1 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c0a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c0e:	74 18                	je     102c28 <strncmp+0x4c>
  102c10:	8b 45 08             	mov    0x8(%ebp),%eax
  102c13:	0f b6 00             	movzbl (%eax),%eax
  102c16:	0f b6 d0             	movzbl %al,%edx
  102c19:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c1c:	0f b6 00             	movzbl (%eax),%eax
  102c1f:	0f b6 c0             	movzbl %al,%eax
  102c22:	29 c2                	sub    %eax,%edx
  102c24:	89 d0                	mov    %edx,%eax
  102c26:	eb 05                	jmp    102c2d <strncmp+0x51>
  102c28:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c2d:	5d                   	pop    %ebp
  102c2e:	c3                   	ret    

00102c2f <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c2f:	55                   	push   %ebp
  102c30:	89 e5                	mov    %esp,%ebp
  102c32:	83 ec 04             	sub    $0x4,%esp
  102c35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c38:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c3b:	eb 13                	jmp    102c50 <strchr+0x21>
        if (*s == c) {
  102c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c40:	0f b6 00             	movzbl (%eax),%eax
  102c43:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c46:	75 05                	jne    102c4d <strchr+0x1e>
            return (char *)s;
  102c48:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4b:	eb 12                	jmp    102c5f <strchr+0x30>
        }
        s ++;
  102c4d:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c50:	8b 45 08             	mov    0x8(%ebp),%eax
  102c53:	0f b6 00             	movzbl (%eax),%eax
  102c56:	84 c0                	test   %al,%al
  102c58:	75 e3                	jne    102c3d <strchr+0xe>
    }
    return NULL;
  102c5a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c5f:	c9                   	leave  
  102c60:	c3                   	ret    

00102c61 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c61:	55                   	push   %ebp
  102c62:	89 e5                	mov    %esp,%ebp
  102c64:	83 ec 04             	sub    $0x4,%esp
  102c67:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c6d:	eb 0e                	jmp    102c7d <strfind+0x1c>
        if (*s == c) {
  102c6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c72:	0f b6 00             	movzbl (%eax),%eax
  102c75:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c78:	74 0f                	je     102c89 <strfind+0x28>
            break;
        }
        s ++;
  102c7a:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c80:	0f b6 00             	movzbl (%eax),%eax
  102c83:	84 c0                	test   %al,%al
  102c85:	75 e8                	jne    102c6f <strfind+0xe>
  102c87:	eb 01                	jmp    102c8a <strfind+0x29>
            break;
  102c89:	90                   	nop
    }
    return (char *)s;
  102c8a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c8d:	c9                   	leave  
  102c8e:	c3                   	ret    

00102c8f <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c8f:	55                   	push   %ebp
  102c90:	89 e5                	mov    %esp,%ebp
  102c92:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c95:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c9c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102ca3:	eb 03                	jmp    102ca8 <strtol+0x19>
        s ++;
  102ca5:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	0f b6 00             	movzbl (%eax),%eax
  102cae:	3c 20                	cmp    $0x20,%al
  102cb0:	74 f3                	je     102ca5 <strtol+0x16>
  102cb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb5:	0f b6 00             	movzbl (%eax),%eax
  102cb8:	3c 09                	cmp    $0x9,%al
  102cba:	74 e9                	je     102ca5 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102cbc:	8b 45 08             	mov    0x8(%ebp),%eax
  102cbf:	0f b6 00             	movzbl (%eax),%eax
  102cc2:	3c 2b                	cmp    $0x2b,%al
  102cc4:	75 05                	jne    102ccb <strtol+0x3c>
        s ++;
  102cc6:	ff 45 08             	incl   0x8(%ebp)
  102cc9:	eb 14                	jmp    102cdf <strtol+0x50>
    }
    else if (*s == '-') {
  102ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cce:	0f b6 00             	movzbl (%eax),%eax
  102cd1:	3c 2d                	cmp    $0x2d,%al
  102cd3:	75 0a                	jne    102cdf <strtol+0x50>
        s ++, neg = 1;
  102cd5:	ff 45 08             	incl   0x8(%ebp)
  102cd8:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cdf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ce3:	74 06                	je     102ceb <strtol+0x5c>
  102ce5:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ce9:	75 22                	jne    102d0d <strtol+0x7e>
  102ceb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cee:	0f b6 00             	movzbl (%eax),%eax
  102cf1:	3c 30                	cmp    $0x30,%al
  102cf3:	75 18                	jne    102d0d <strtol+0x7e>
  102cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf8:	40                   	inc    %eax
  102cf9:	0f b6 00             	movzbl (%eax),%eax
  102cfc:	3c 78                	cmp    $0x78,%al
  102cfe:	75 0d                	jne    102d0d <strtol+0x7e>
        s += 2, base = 16;
  102d00:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102d04:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102d0b:	eb 29                	jmp    102d36 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102d0d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d11:	75 16                	jne    102d29 <strtol+0x9a>
  102d13:	8b 45 08             	mov    0x8(%ebp),%eax
  102d16:	0f b6 00             	movzbl (%eax),%eax
  102d19:	3c 30                	cmp    $0x30,%al
  102d1b:	75 0c                	jne    102d29 <strtol+0x9a>
        s ++, base = 8;
  102d1d:	ff 45 08             	incl   0x8(%ebp)
  102d20:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d27:	eb 0d                	jmp    102d36 <strtol+0xa7>
    }
    else if (base == 0) {
  102d29:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d2d:	75 07                	jne    102d36 <strtol+0xa7>
        base = 10;
  102d2f:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d36:	8b 45 08             	mov    0x8(%ebp),%eax
  102d39:	0f b6 00             	movzbl (%eax),%eax
  102d3c:	3c 2f                	cmp    $0x2f,%al
  102d3e:	7e 1b                	jle    102d5b <strtol+0xcc>
  102d40:	8b 45 08             	mov    0x8(%ebp),%eax
  102d43:	0f b6 00             	movzbl (%eax),%eax
  102d46:	3c 39                	cmp    $0x39,%al
  102d48:	7f 11                	jg     102d5b <strtol+0xcc>
            dig = *s - '0';
  102d4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4d:	0f b6 00             	movzbl (%eax),%eax
  102d50:	0f be c0             	movsbl %al,%eax
  102d53:	83 e8 30             	sub    $0x30,%eax
  102d56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d59:	eb 48                	jmp    102da3 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5e:	0f b6 00             	movzbl (%eax),%eax
  102d61:	3c 60                	cmp    $0x60,%al
  102d63:	7e 1b                	jle    102d80 <strtol+0xf1>
  102d65:	8b 45 08             	mov    0x8(%ebp),%eax
  102d68:	0f b6 00             	movzbl (%eax),%eax
  102d6b:	3c 7a                	cmp    $0x7a,%al
  102d6d:	7f 11                	jg     102d80 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102d6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d72:	0f b6 00             	movzbl (%eax),%eax
  102d75:	0f be c0             	movsbl %al,%eax
  102d78:	83 e8 57             	sub    $0x57,%eax
  102d7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d7e:	eb 23                	jmp    102da3 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d80:	8b 45 08             	mov    0x8(%ebp),%eax
  102d83:	0f b6 00             	movzbl (%eax),%eax
  102d86:	3c 40                	cmp    $0x40,%al
  102d88:	7e 3b                	jle    102dc5 <strtol+0x136>
  102d8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8d:	0f b6 00             	movzbl (%eax),%eax
  102d90:	3c 5a                	cmp    $0x5a,%al
  102d92:	7f 31                	jg     102dc5 <strtol+0x136>
            dig = *s - 'A' + 10;
  102d94:	8b 45 08             	mov    0x8(%ebp),%eax
  102d97:	0f b6 00             	movzbl (%eax),%eax
  102d9a:	0f be c0             	movsbl %al,%eax
  102d9d:	83 e8 37             	sub    $0x37,%eax
  102da0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102da3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102da6:	3b 45 10             	cmp    0x10(%ebp),%eax
  102da9:	7d 19                	jge    102dc4 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102dab:	ff 45 08             	incl   0x8(%ebp)
  102dae:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102db1:	0f af 45 10          	imul   0x10(%ebp),%eax
  102db5:	89 c2                	mov    %eax,%edx
  102db7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dba:	01 d0                	add    %edx,%eax
  102dbc:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102dbf:	e9 72 ff ff ff       	jmp    102d36 <strtol+0xa7>
            break;
  102dc4:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102dc5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dc9:	74 08                	je     102dd3 <strtol+0x144>
        *endptr = (char *) s;
  102dcb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dce:	8b 55 08             	mov    0x8(%ebp),%edx
  102dd1:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102dd3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102dd7:	74 07                	je     102de0 <strtol+0x151>
  102dd9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ddc:	f7 d8                	neg    %eax
  102dde:	eb 03                	jmp    102de3 <strtol+0x154>
  102de0:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102de3:	c9                   	leave  
  102de4:	c3                   	ret    

00102de5 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102de5:	55                   	push   %ebp
  102de6:	89 e5                	mov    %esp,%ebp
  102de8:	57                   	push   %edi
  102de9:	83 ec 24             	sub    $0x24,%esp
  102dec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102def:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102df2:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102df6:	8b 55 08             	mov    0x8(%ebp),%edx
  102df9:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102dfc:	88 45 f7             	mov    %al,-0x9(%ebp)
  102dff:	8b 45 10             	mov    0x10(%ebp),%eax
  102e02:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102e05:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102e08:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102e0c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102e0f:	89 d7                	mov    %edx,%edi
  102e11:	f3 aa                	rep stos %al,%es:(%edi)
  102e13:	89 fa                	mov    %edi,%edx
  102e15:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e18:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e1b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e1e:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e1f:	83 c4 24             	add    $0x24,%esp
  102e22:	5f                   	pop    %edi
  102e23:	5d                   	pop    %ebp
  102e24:	c3                   	ret    

00102e25 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e25:	55                   	push   %ebp
  102e26:	89 e5                	mov    %esp,%ebp
  102e28:	57                   	push   %edi
  102e29:	56                   	push   %esi
  102e2a:	53                   	push   %ebx
  102e2b:	83 ec 30             	sub    $0x30,%esp
  102e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e31:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e34:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e37:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e3a:	8b 45 10             	mov    0x10(%ebp),%eax
  102e3d:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e43:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e46:	73 42                	jae    102e8a <memmove+0x65>
  102e48:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e51:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e54:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e57:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e5d:	c1 e8 02             	shr    $0x2,%eax
  102e60:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e62:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e65:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e68:	89 d7                	mov    %edx,%edi
  102e6a:	89 c6                	mov    %eax,%esi
  102e6c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e6e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e71:	83 e1 03             	and    $0x3,%ecx
  102e74:	74 02                	je     102e78 <memmove+0x53>
  102e76:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e78:	89 f0                	mov    %esi,%eax
  102e7a:	89 fa                	mov    %edi,%edx
  102e7c:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e7f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e82:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102e88:	eb 36                	jmp    102ec0 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e8d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e90:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e93:	01 c2                	add    %eax,%edx
  102e95:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e98:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e9e:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102ea1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ea4:	89 c1                	mov    %eax,%ecx
  102ea6:	89 d8                	mov    %ebx,%eax
  102ea8:	89 d6                	mov    %edx,%esi
  102eaa:	89 c7                	mov    %eax,%edi
  102eac:	fd                   	std    
  102ead:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102eaf:	fc                   	cld    
  102eb0:	89 f8                	mov    %edi,%eax
  102eb2:	89 f2                	mov    %esi,%edx
  102eb4:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102eb7:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102eba:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102ebd:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ec0:	83 c4 30             	add    $0x30,%esp
  102ec3:	5b                   	pop    %ebx
  102ec4:	5e                   	pop    %esi
  102ec5:	5f                   	pop    %edi
  102ec6:	5d                   	pop    %ebp
  102ec7:	c3                   	ret    

00102ec8 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ec8:	55                   	push   %ebp
  102ec9:	89 e5                	mov    %esp,%ebp
  102ecb:	57                   	push   %edi
  102ecc:	56                   	push   %esi
  102ecd:	83 ec 20             	sub    $0x20,%esp
  102ed0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ed6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102edc:	8b 45 10             	mov    0x10(%ebp),%eax
  102edf:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ee2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ee5:	c1 e8 02             	shr    $0x2,%eax
  102ee8:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102eea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ef0:	89 d7                	mov    %edx,%edi
  102ef2:	89 c6                	mov    %eax,%esi
  102ef4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ef6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ef9:	83 e1 03             	and    $0x3,%ecx
  102efc:	74 02                	je     102f00 <memcpy+0x38>
  102efe:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f00:	89 f0                	mov    %esi,%eax
  102f02:	89 fa                	mov    %edi,%edx
  102f04:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f07:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102f0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102f0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102f10:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102f11:	83 c4 20             	add    $0x20,%esp
  102f14:	5e                   	pop    %esi
  102f15:	5f                   	pop    %edi
  102f16:	5d                   	pop    %ebp
  102f17:	c3                   	ret    

00102f18 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f18:	55                   	push   %ebp
  102f19:	89 e5                	mov    %esp,%ebp
  102f1b:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f1e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f21:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f24:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f27:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f2a:	eb 2e                	jmp    102f5a <memcmp+0x42>
        if (*s1 != *s2) {
  102f2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f2f:	0f b6 10             	movzbl (%eax),%edx
  102f32:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f35:	0f b6 00             	movzbl (%eax),%eax
  102f38:	38 c2                	cmp    %al,%dl
  102f3a:	74 18                	je     102f54 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f3f:	0f b6 00             	movzbl (%eax),%eax
  102f42:	0f b6 d0             	movzbl %al,%edx
  102f45:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f48:	0f b6 00             	movzbl (%eax),%eax
  102f4b:	0f b6 c0             	movzbl %al,%eax
  102f4e:	29 c2                	sub    %eax,%edx
  102f50:	89 d0                	mov    %edx,%eax
  102f52:	eb 18                	jmp    102f6c <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102f54:	ff 45 fc             	incl   -0x4(%ebp)
  102f57:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f5a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f5d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f60:	89 55 10             	mov    %edx,0x10(%ebp)
  102f63:	85 c0                	test   %eax,%eax
  102f65:	75 c5                	jne    102f2c <memcmp+0x14>
    }
    return 0;
  102f67:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f6c:	c9                   	leave  
  102f6d:	c3                   	ret    

00102f6e <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f6e:	55                   	push   %ebp
  102f6f:	89 e5                	mov    %esp,%ebp
  102f71:	83 ec 58             	sub    $0x58,%esp
  102f74:	8b 45 10             	mov    0x10(%ebp),%eax
  102f77:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f7a:	8b 45 14             	mov    0x14(%ebp),%eax
  102f7d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f80:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f83:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f86:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f89:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f8c:	8b 45 18             	mov    0x18(%ebp),%eax
  102f8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f92:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f95:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f98:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f9b:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fa4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102fa8:	74 1c                	je     102fc6 <printnum+0x58>
  102faa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fad:	ba 00 00 00 00       	mov    $0x0,%edx
  102fb2:	f7 75 e4             	divl   -0x1c(%ebp)
  102fb5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102fb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fbb:	ba 00 00 00 00       	mov    $0x0,%edx
  102fc0:	f7 75 e4             	divl   -0x1c(%ebp)
  102fc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fc6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fcc:	f7 75 e4             	divl   -0x1c(%ebp)
  102fcf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fd2:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fd5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fd8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fdb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fde:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fe1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fe4:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fe7:	8b 45 18             	mov    0x18(%ebp),%eax
  102fea:	ba 00 00 00 00       	mov    $0x0,%edx
  102fef:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102ff2:	72 56                	jb     10304a <printnum+0xdc>
  102ff4:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102ff7:	77 05                	ja     102ffe <printnum+0x90>
  102ff9:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102ffc:	72 4c                	jb     10304a <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102ffe:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103001:	8d 50 ff             	lea    -0x1(%eax),%edx
  103004:	8b 45 20             	mov    0x20(%ebp),%eax
  103007:	89 44 24 18          	mov    %eax,0x18(%esp)
  10300b:	89 54 24 14          	mov    %edx,0x14(%esp)
  10300f:	8b 45 18             	mov    0x18(%ebp),%eax
  103012:	89 44 24 10          	mov    %eax,0x10(%esp)
  103016:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103019:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10301c:	89 44 24 08          	mov    %eax,0x8(%esp)
  103020:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103024:	8b 45 0c             	mov    0xc(%ebp),%eax
  103027:	89 44 24 04          	mov    %eax,0x4(%esp)
  10302b:	8b 45 08             	mov    0x8(%ebp),%eax
  10302e:	89 04 24             	mov    %eax,(%esp)
  103031:	e8 38 ff ff ff       	call   102f6e <printnum>
  103036:	eb 1b                	jmp    103053 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103038:	8b 45 0c             	mov    0xc(%ebp),%eax
  10303b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10303f:	8b 45 20             	mov    0x20(%ebp),%eax
  103042:	89 04 24             	mov    %eax,(%esp)
  103045:	8b 45 08             	mov    0x8(%ebp),%eax
  103048:	ff d0                	call   *%eax
        while (-- width > 0)
  10304a:	ff 4d 1c             	decl   0x1c(%ebp)
  10304d:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103051:	7f e5                	jg     103038 <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103053:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103056:	05 d0 3d 10 00       	add    $0x103dd0,%eax
  10305b:	0f b6 00             	movzbl (%eax),%eax
  10305e:	0f be c0             	movsbl %al,%eax
  103061:	8b 55 0c             	mov    0xc(%ebp),%edx
  103064:	89 54 24 04          	mov    %edx,0x4(%esp)
  103068:	89 04 24             	mov    %eax,(%esp)
  10306b:	8b 45 08             	mov    0x8(%ebp),%eax
  10306e:	ff d0                	call   *%eax
}
  103070:	90                   	nop
  103071:	c9                   	leave  
  103072:	c3                   	ret    

00103073 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103073:	55                   	push   %ebp
  103074:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103076:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10307a:	7e 14                	jle    103090 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10307c:	8b 45 08             	mov    0x8(%ebp),%eax
  10307f:	8b 00                	mov    (%eax),%eax
  103081:	8d 48 08             	lea    0x8(%eax),%ecx
  103084:	8b 55 08             	mov    0x8(%ebp),%edx
  103087:	89 0a                	mov    %ecx,(%edx)
  103089:	8b 50 04             	mov    0x4(%eax),%edx
  10308c:	8b 00                	mov    (%eax),%eax
  10308e:	eb 30                	jmp    1030c0 <getuint+0x4d>
    }
    else if (lflag) {
  103090:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103094:	74 16                	je     1030ac <getuint+0x39>
        return va_arg(*ap, unsigned long);
  103096:	8b 45 08             	mov    0x8(%ebp),%eax
  103099:	8b 00                	mov    (%eax),%eax
  10309b:	8d 48 04             	lea    0x4(%eax),%ecx
  10309e:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a1:	89 0a                	mov    %ecx,(%edx)
  1030a3:	8b 00                	mov    (%eax),%eax
  1030a5:	ba 00 00 00 00       	mov    $0x0,%edx
  1030aa:	eb 14                	jmp    1030c0 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1030ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1030af:	8b 00                	mov    (%eax),%eax
  1030b1:	8d 48 04             	lea    0x4(%eax),%ecx
  1030b4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030b7:	89 0a                	mov    %ecx,(%edx)
  1030b9:	8b 00                	mov    (%eax),%eax
  1030bb:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030c0:	5d                   	pop    %ebp
  1030c1:	c3                   	ret    

001030c2 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030c2:	55                   	push   %ebp
  1030c3:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030c5:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030c9:	7e 14                	jle    1030df <getint+0x1d>
        return va_arg(*ap, long long);
  1030cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ce:	8b 00                	mov    (%eax),%eax
  1030d0:	8d 48 08             	lea    0x8(%eax),%ecx
  1030d3:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d6:	89 0a                	mov    %ecx,(%edx)
  1030d8:	8b 50 04             	mov    0x4(%eax),%edx
  1030db:	8b 00                	mov    (%eax),%eax
  1030dd:	eb 28                	jmp    103107 <getint+0x45>
    }
    else if (lflag) {
  1030df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030e3:	74 12                	je     1030f7 <getint+0x35>
        return va_arg(*ap, long);
  1030e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e8:	8b 00                	mov    (%eax),%eax
  1030ea:	8d 48 04             	lea    0x4(%eax),%ecx
  1030ed:	8b 55 08             	mov    0x8(%ebp),%edx
  1030f0:	89 0a                	mov    %ecx,(%edx)
  1030f2:	8b 00                	mov    (%eax),%eax
  1030f4:	99                   	cltd   
  1030f5:	eb 10                	jmp    103107 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1030f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fa:	8b 00                	mov    (%eax),%eax
  1030fc:	8d 48 04             	lea    0x4(%eax),%ecx
  1030ff:	8b 55 08             	mov    0x8(%ebp),%edx
  103102:	89 0a                	mov    %ecx,(%edx)
  103104:	8b 00                	mov    (%eax),%eax
  103106:	99                   	cltd   
    }
}
  103107:	5d                   	pop    %ebp
  103108:	c3                   	ret    

00103109 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  103109:	55                   	push   %ebp
  10310a:	89 e5                	mov    %esp,%ebp
  10310c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  10310f:	8d 45 14             	lea    0x14(%ebp),%eax
  103112:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103115:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103118:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10311c:	8b 45 10             	mov    0x10(%ebp),%eax
  10311f:	89 44 24 08          	mov    %eax,0x8(%esp)
  103123:	8b 45 0c             	mov    0xc(%ebp),%eax
  103126:	89 44 24 04          	mov    %eax,0x4(%esp)
  10312a:	8b 45 08             	mov    0x8(%ebp),%eax
  10312d:	89 04 24             	mov    %eax,(%esp)
  103130:	e8 03 00 00 00       	call   103138 <vprintfmt>
    va_end(ap);
}
  103135:	90                   	nop
  103136:	c9                   	leave  
  103137:	c3                   	ret    

00103138 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103138:	55                   	push   %ebp
  103139:	89 e5                	mov    %esp,%ebp
  10313b:	56                   	push   %esi
  10313c:	53                   	push   %ebx
  10313d:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103140:	eb 17                	jmp    103159 <vprintfmt+0x21>
            if (ch == '\0') {
  103142:	85 db                	test   %ebx,%ebx
  103144:	0f 84 bf 03 00 00    	je     103509 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  10314a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103151:	89 1c 24             	mov    %ebx,(%esp)
  103154:	8b 45 08             	mov    0x8(%ebp),%eax
  103157:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103159:	8b 45 10             	mov    0x10(%ebp),%eax
  10315c:	8d 50 01             	lea    0x1(%eax),%edx
  10315f:	89 55 10             	mov    %edx,0x10(%ebp)
  103162:	0f b6 00             	movzbl (%eax),%eax
  103165:	0f b6 d8             	movzbl %al,%ebx
  103168:	83 fb 25             	cmp    $0x25,%ebx
  10316b:	75 d5                	jne    103142 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10316d:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103171:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103178:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10317b:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10317e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103185:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103188:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10318b:	8b 45 10             	mov    0x10(%ebp),%eax
  10318e:	8d 50 01             	lea    0x1(%eax),%edx
  103191:	89 55 10             	mov    %edx,0x10(%ebp)
  103194:	0f b6 00             	movzbl (%eax),%eax
  103197:	0f b6 d8             	movzbl %al,%ebx
  10319a:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10319d:	83 f8 55             	cmp    $0x55,%eax
  1031a0:	0f 87 37 03 00 00    	ja     1034dd <vprintfmt+0x3a5>
  1031a6:	8b 04 85 f4 3d 10 00 	mov    0x103df4(,%eax,4),%eax
  1031ad:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031af:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031b3:	eb d6                	jmp    10318b <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031b5:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031b9:	eb d0                	jmp    10318b <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031c5:	89 d0                	mov    %edx,%eax
  1031c7:	c1 e0 02             	shl    $0x2,%eax
  1031ca:	01 d0                	add    %edx,%eax
  1031cc:	01 c0                	add    %eax,%eax
  1031ce:	01 d8                	add    %ebx,%eax
  1031d0:	83 e8 30             	sub    $0x30,%eax
  1031d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031d6:	8b 45 10             	mov    0x10(%ebp),%eax
  1031d9:	0f b6 00             	movzbl (%eax),%eax
  1031dc:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031df:	83 fb 2f             	cmp    $0x2f,%ebx
  1031e2:	7e 38                	jle    10321c <vprintfmt+0xe4>
  1031e4:	83 fb 39             	cmp    $0x39,%ebx
  1031e7:	7f 33                	jg     10321c <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  1031e9:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031ec:	eb d4                	jmp    1031c2 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031ee:	8b 45 14             	mov    0x14(%ebp),%eax
  1031f1:	8d 50 04             	lea    0x4(%eax),%edx
  1031f4:	89 55 14             	mov    %edx,0x14(%ebp)
  1031f7:	8b 00                	mov    (%eax),%eax
  1031f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031fc:	eb 1f                	jmp    10321d <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  1031fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103202:	79 87                	jns    10318b <vprintfmt+0x53>
                width = 0;
  103204:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  10320b:	e9 7b ff ff ff       	jmp    10318b <vprintfmt+0x53>

        case '#':
            altflag = 1;
  103210:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103217:	e9 6f ff ff ff       	jmp    10318b <vprintfmt+0x53>
            goto process_precision;
  10321c:	90                   	nop

        process_precision:
            if (width < 0)
  10321d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103221:	0f 89 64 ff ff ff    	jns    10318b <vprintfmt+0x53>
                width = precision, precision = -1;
  103227:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10322a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10322d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103234:	e9 52 ff ff ff       	jmp    10318b <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103239:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10323c:	e9 4a ff ff ff       	jmp    10318b <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103241:	8b 45 14             	mov    0x14(%ebp),%eax
  103244:	8d 50 04             	lea    0x4(%eax),%edx
  103247:	89 55 14             	mov    %edx,0x14(%ebp)
  10324a:	8b 00                	mov    (%eax),%eax
  10324c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10324f:	89 54 24 04          	mov    %edx,0x4(%esp)
  103253:	89 04 24             	mov    %eax,(%esp)
  103256:	8b 45 08             	mov    0x8(%ebp),%eax
  103259:	ff d0                	call   *%eax
            break;
  10325b:	e9 a4 02 00 00       	jmp    103504 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103260:	8b 45 14             	mov    0x14(%ebp),%eax
  103263:	8d 50 04             	lea    0x4(%eax),%edx
  103266:	89 55 14             	mov    %edx,0x14(%ebp)
  103269:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10326b:	85 db                	test   %ebx,%ebx
  10326d:	79 02                	jns    103271 <vprintfmt+0x139>
                err = -err;
  10326f:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103271:	83 fb 06             	cmp    $0x6,%ebx
  103274:	7f 0b                	jg     103281 <vprintfmt+0x149>
  103276:	8b 34 9d b4 3d 10 00 	mov    0x103db4(,%ebx,4),%esi
  10327d:	85 f6                	test   %esi,%esi
  10327f:	75 23                	jne    1032a4 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  103281:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103285:	c7 44 24 08 e1 3d 10 	movl   $0x103de1,0x8(%esp)
  10328c:	00 
  10328d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103290:	89 44 24 04          	mov    %eax,0x4(%esp)
  103294:	8b 45 08             	mov    0x8(%ebp),%eax
  103297:	89 04 24             	mov    %eax,(%esp)
  10329a:	e8 6a fe ff ff       	call   103109 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10329f:	e9 60 02 00 00       	jmp    103504 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  1032a4:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032a8:	c7 44 24 08 ea 3d 10 	movl   $0x103dea,0x8(%esp)
  1032af:	00 
  1032b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ba:	89 04 24             	mov    %eax,(%esp)
  1032bd:	e8 47 fe ff ff       	call   103109 <printfmt>
            break;
  1032c2:	e9 3d 02 00 00       	jmp    103504 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032c7:	8b 45 14             	mov    0x14(%ebp),%eax
  1032ca:	8d 50 04             	lea    0x4(%eax),%edx
  1032cd:	89 55 14             	mov    %edx,0x14(%ebp)
  1032d0:	8b 30                	mov    (%eax),%esi
  1032d2:	85 f6                	test   %esi,%esi
  1032d4:	75 05                	jne    1032db <vprintfmt+0x1a3>
                p = "(null)";
  1032d6:	be ed 3d 10 00       	mov    $0x103ded,%esi
            }
            if (width > 0 && padc != '-') {
  1032db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032df:	7e 76                	jle    103357 <vprintfmt+0x21f>
  1032e1:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032e5:	74 70                	je     103357 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ee:	89 34 24             	mov    %esi,(%esp)
  1032f1:	e8 f6 f7 ff ff       	call   102aec <strnlen>
  1032f6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032f9:	29 c2                	sub    %eax,%edx
  1032fb:	89 d0                	mov    %edx,%eax
  1032fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103300:	eb 16                	jmp    103318 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  103302:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103306:	8b 55 0c             	mov    0xc(%ebp),%edx
  103309:	89 54 24 04          	mov    %edx,0x4(%esp)
  10330d:	89 04 24             	mov    %eax,(%esp)
  103310:	8b 45 08             	mov    0x8(%ebp),%eax
  103313:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103315:	ff 4d e8             	decl   -0x18(%ebp)
  103318:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10331c:	7f e4                	jg     103302 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10331e:	eb 37                	jmp    103357 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  103320:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103324:	74 1f                	je     103345 <vprintfmt+0x20d>
  103326:	83 fb 1f             	cmp    $0x1f,%ebx
  103329:	7e 05                	jle    103330 <vprintfmt+0x1f8>
  10332b:	83 fb 7e             	cmp    $0x7e,%ebx
  10332e:	7e 15                	jle    103345 <vprintfmt+0x20d>
                    putch('?', putdat);
  103330:	8b 45 0c             	mov    0xc(%ebp),%eax
  103333:	89 44 24 04          	mov    %eax,0x4(%esp)
  103337:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10333e:	8b 45 08             	mov    0x8(%ebp),%eax
  103341:	ff d0                	call   *%eax
  103343:	eb 0f                	jmp    103354 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  103345:	8b 45 0c             	mov    0xc(%ebp),%eax
  103348:	89 44 24 04          	mov    %eax,0x4(%esp)
  10334c:	89 1c 24             	mov    %ebx,(%esp)
  10334f:	8b 45 08             	mov    0x8(%ebp),%eax
  103352:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103354:	ff 4d e8             	decl   -0x18(%ebp)
  103357:	89 f0                	mov    %esi,%eax
  103359:	8d 70 01             	lea    0x1(%eax),%esi
  10335c:	0f b6 00             	movzbl (%eax),%eax
  10335f:	0f be d8             	movsbl %al,%ebx
  103362:	85 db                	test   %ebx,%ebx
  103364:	74 27                	je     10338d <vprintfmt+0x255>
  103366:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10336a:	78 b4                	js     103320 <vprintfmt+0x1e8>
  10336c:	ff 4d e4             	decl   -0x1c(%ebp)
  10336f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103373:	79 ab                	jns    103320 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  103375:	eb 16                	jmp    10338d <vprintfmt+0x255>
                putch(' ', putdat);
  103377:	8b 45 0c             	mov    0xc(%ebp),%eax
  10337a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10337e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103385:	8b 45 08             	mov    0x8(%ebp),%eax
  103388:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10338a:	ff 4d e8             	decl   -0x18(%ebp)
  10338d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103391:	7f e4                	jg     103377 <vprintfmt+0x23f>
            }
            break;
  103393:	e9 6c 01 00 00       	jmp    103504 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103398:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10339b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339f:	8d 45 14             	lea    0x14(%ebp),%eax
  1033a2:	89 04 24             	mov    %eax,(%esp)
  1033a5:	e8 18 fd ff ff       	call   1030c2 <getint>
  1033aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033b6:	85 d2                	test   %edx,%edx
  1033b8:	79 26                	jns    1033e0 <vprintfmt+0x2a8>
                putch('-', putdat);
  1033ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033c1:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033cb:	ff d0                	call   *%eax
                num = -(long long)num;
  1033cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033d3:	f7 d8                	neg    %eax
  1033d5:	83 d2 00             	adc    $0x0,%edx
  1033d8:	f7 da                	neg    %edx
  1033da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033e0:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033e7:	e9 a8 00 00 00       	jmp    103494 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033f3:	8d 45 14             	lea    0x14(%ebp),%eax
  1033f6:	89 04 24             	mov    %eax,(%esp)
  1033f9:	e8 75 fc ff ff       	call   103073 <getuint>
  1033fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103401:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103404:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10340b:	e9 84 00 00 00       	jmp    103494 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103410:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103413:	89 44 24 04          	mov    %eax,0x4(%esp)
  103417:	8d 45 14             	lea    0x14(%ebp),%eax
  10341a:	89 04 24             	mov    %eax,(%esp)
  10341d:	e8 51 fc ff ff       	call   103073 <getuint>
  103422:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103425:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103428:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10342f:	eb 63                	jmp    103494 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103431:	8b 45 0c             	mov    0xc(%ebp),%eax
  103434:	89 44 24 04          	mov    %eax,0x4(%esp)
  103438:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10343f:	8b 45 08             	mov    0x8(%ebp),%eax
  103442:	ff d0                	call   *%eax
            putch('x', putdat);
  103444:	8b 45 0c             	mov    0xc(%ebp),%eax
  103447:	89 44 24 04          	mov    %eax,0x4(%esp)
  10344b:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103452:	8b 45 08             	mov    0x8(%ebp),%eax
  103455:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103457:	8b 45 14             	mov    0x14(%ebp),%eax
  10345a:	8d 50 04             	lea    0x4(%eax),%edx
  10345d:	89 55 14             	mov    %edx,0x14(%ebp)
  103460:	8b 00                	mov    (%eax),%eax
  103462:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103465:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10346c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103473:	eb 1f                	jmp    103494 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103475:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103478:	89 44 24 04          	mov    %eax,0x4(%esp)
  10347c:	8d 45 14             	lea    0x14(%ebp),%eax
  10347f:	89 04 24             	mov    %eax,(%esp)
  103482:	e8 ec fb ff ff       	call   103073 <getuint>
  103487:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10348a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10348d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103494:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103498:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10349b:	89 54 24 18          	mov    %edx,0x18(%esp)
  10349f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034a2:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034a6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034b0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034b4:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034bb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c2:	89 04 24             	mov    %eax,(%esp)
  1034c5:	e8 a4 fa ff ff       	call   102f6e <printnum>
            break;
  1034ca:	eb 38                	jmp    103504 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d3:	89 1c 24             	mov    %ebx,(%esp)
  1034d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d9:	ff d0                	call   *%eax
            break;
  1034db:	eb 27                	jmp    103504 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034e4:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ee:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034f0:	ff 4d 10             	decl   0x10(%ebp)
  1034f3:	eb 03                	jmp    1034f8 <vprintfmt+0x3c0>
  1034f5:	ff 4d 10             	decl   0x10(%ebp)
  1034f8:	8b 45 10             	mov    0x10(%ebp),%eax
  1034fb:	48                   	dec    %eax
  1034fc:	0f b6 00             	movzbl (%eax),%eax
  1034ff:	3c 25                	cmp    $0x25,%al
  103501:	75 f2                	jne    1034f5 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  103503:	90                   	nop
    while (1) {
  103504:	e9 37 fc ff ff       	jmp    103140 <vprintfmt+0x8>
                return;
  103509:	90                   	nop
        }
    }
}
  10350a:	83 c4 40             	add    $0x40,%esp
  10350d:	5b                   	pop    %ebx
  10350e:	5e                   	pop    %esi
  10350f:	5d                   	pop    %ebp
  103510:	c3                   	ret    

00103511 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103511:	55                   	push   %ebp
  103512:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103514:	8b 45 0c             	mov    0xc(%ebp),%eax
  103517:	8b 40 08             	mov    0x8(%eax),%eax
  10351a:	8d 50 01             	lea    0x1(%eax),%edx
  10351d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103520:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103523:	8b 45 0c             	mov    0xc(%ebp),%eax
  103526:	8b 10                	mov    (%eax),%edx
  103528:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352b:	8b 40 04             	mov    0x4(%eax),%eax
  10352e:	39 c2                	cmp    %eax,%edx
  103530:	73 12                	jae    103544 <sprintputch+0x33>
        *b->buf ++ = ch;
  103532:	8b 45 0c             	mov    0xc(%ebp),%eax
  103535:	8b 00                	mov    (%eax),%eax
  103537:	8d 48 01             	lea    0x1(%eax),%ecx
  10353a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10353d:	89 0a                	mov    %ecx,(%edx)
  10353f:	8b 55 08             	mov    0x8(%ebp),%edx
  103542:	88 10                	mov    %dl,(%eax)
    }
}
  103544:	90                   	nop
  103545:	5d                   	pop    %ebp
  103546:	c3                   	ret    

00103547 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103547:	55                   	push   %ebp
  103548:	89 e5                	mov    %esp,%ebp
  10354a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10354d:	8d 45 14             	lea    0x14(%ebp),%eax
  103550:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103553:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103556:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10355a:	8b 45 10             	mov    0x10(%ebp),%eax
  10355d:	89 44 24 08          	mov    %eax,0x8(%esp)
  103561:	8b 45 0c             	mov    0xc(%ebp),%eax
  103564:	89 44 24 04          	mov    %eax,0x4(%esp)
  103568:	8b 45 08             	mov    0x8(%ebp),%eax
  10356b:	89 04 24             	mov    %eax,(%esp)
  10356e:	e8 08 00 00 00       	call   10357b <vsnprintf>
  103573:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103576:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103579:	c9                   	leave  
  10357a:	c3                   	ret    

0010357b <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10357b:	55                   	push   %ebp
  10357c:	89 e5                	mov    %esp,%ebp
  10357e:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103581:	8b 45 08             	mov    0x8(%ebp),%eax
  103584:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103587:	8b 45 0c             	mov    0xc(%ebp),%eax
  10358a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10358d:	8b 45 08             	mov    0x8(%ebp),%eax
  103590:	01 d0                	add    %edx,%eax
  103592:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103595:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10359c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035a0:	74 0a                	je     1035ac <vsnprintf+0x31>
  1035a2:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035a8:	39 c2                	cmp    %eax,%edx
  1035aa:	76 07                	jbe    1035b3 <vsnprintf+0x38>
        return -E_INVAL;
  1035ac:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035b1:	eb 2a                	jmp    1035dd <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035b3:	8b 45 14             	mov    0x14(%ebp),%eax
  1035b6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035ba:	8b 45 10             	mov    0x10(%ebp),%eax
  1035bd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035c1:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035c8:	c7 04 24 11 35 10 00 	movl   $0x103511,(%esp)
  1035cf:	e8 64 fb ff ff       	call   103138 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035d7:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035da:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035dd:	c9                   	leave  
  1035de:	c3                   	ret    
