opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 3 "D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	dw 0X3F3A ;#
	FNCALL	_main,_lcd
	FNCALL	_main,_wait
	FNROOT	_main
	global	main@F528
	global	main@F526
	global	main@F524
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	32

;initializer for main@F528
	retlw	045h
	retlw	04Eh
	retlw	044h
	retlw	020h
	retlw	057h
	retlw	049h
	retlw	054h
	retlw	048h
	retlw	020h
	retlw	02Ch
	retlw	0
	line	31

;initializer for main@F526
	retlw	04Ch
	retlw	04Fh
	retlw	04Eh
	retlw	047h
	retlw	049h
	retlw	054h
	retlw	055h
	retlw	044h
	retlw	045h
	retlw	0
	line	30

;initializer for main@F524
	retlw	04Ch
	retlw	041h
	retlw	054h
	retlw	049h
	retlw	054h
	retlw	055h
	retlw	044h
	retlw	045h
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RCIF
_RCIF	set	101
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_TXSTA
_TXSTA	set	152
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISD0
_TRISD0	set	1088
	global	_TRISD1
_TRISD1	set	1089
	file	"CC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	32
main@F528:
       ds      11

psect	dataBANK1
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	31
main@F526:
       ds      10

psect	dataBANK1
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	30
main@F524:
       ds      9

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+30)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd
?_lcd:	; 0 bytes @ 0x0
	global	?_wait
?_wait:	; 0 bytes @ 0x0
	global	??_wait
??_wait:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	lcd@b
lcd@b:	; 2 bytes @ 0x0
	ds	1
	global	wait@c
wait@c:	; 1 bytes @ 0x1
	ds	1
	global	??_lcd
??_lcd:	; 0 bytes @ 0x2
	global	wait@c1
wait@c1:	; 1 bytes @ 0x2
	ds	2
	global	lcd@a
lcd@a:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@arr3
main@arr3:	; 11 bytes @ 0x0
	ds	11
	global	main@arr2
main@arr2:	; 10 bytes @ 0xB
	ds	10
	global	main@arr1
main@arr1:	; 9 bytes @ 0x15
	ds	9
	global	main@LATITUDE
main@LATITUDE:	; 20 bytes @ 0x1E
	ds	20
	global	main@LONGITUDE
main@LONGITUDE:	; 20 bytes @ 0x32
	ds	20
	global	main@c
main@c:	; 1 bytes @ 0x46
	ds	1
	global	main@i
main@i:	; 2 bytes @ 0x47
	ds	2
;;Data sizes: Strings 0, constant 0, data 30, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80     73      73
;; BANK1           80      0      30
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                77    77      0     504
;;                                              5 COMMON     4     4      0
;;                                              0 BANK0     73    73      0
;;                                _lcd
;;                               _wait
;; ---------------------------------------------------------------------------------
;; (1) _lcd                                                  5     3      2      44
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (1) _wait                                                 3     3      0      45
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd
;;   _wait
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      1E       7       37.5%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      71      12        0.0%
;;ABS                  0      0      70       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50     49      49       5       91.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 25 in file "D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  LONGITUDE      20   50[BANK0 ] unsigned char [20]
;;  LATITUDE       20   30[BANK0 ] unsigned char [20]
;;  arr3           11    0[BANK0 ] unsigned char [11]
;;  arr2           10   11[BANK0 ] unsigned char [10]
;;  arr1            9   21[BANK0 ] unsigned char [9]
;;  i               2   71[BANK0 ] int 
;;  c               1   70[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      73       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      73       0       0       0
;;Total ram usage:       77 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd
;;		_wait
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	25
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l1876:	
;Untitled.c: 26: int i;
;Untitled.c: 27: char c;
;Untitled.c: 28: char LATITUDE[20];
;Untitled.c: 29: char LONGITUDE[20];
;Untitled.c: 30: char arr1[]="LATITUDE";
	movlw	(main@arr1)&0ffh
	movwf	fsr0
	movlw	low(main@F524)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	9
	movwf	((??_main+0)+0+2)
u2330:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2330
	line	31
;Untitled.c: 31: char arr2[]="LONGITUDE";
	movlw	(main@arr2)&0ffh
	movwf	fsr0
	movlw	low(main@F526)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2340:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2340
	line	32
;Untitled.c: 32: char arr3[]="END WITH ,";
	movlw	(main@arr3)&0ffh
	movwf	fsr0
	movlw	low(main@F528)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	11
	movwf	((??_main+0)+0+2)
u2350:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2350
	line	33
	
l1878:	
;Untitled.c: 33: TRISD0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1088/8)^080h,(1088)&7
	line	34
	
l1880:	
;Untitled.c: 34: TRISD1=0;
	bcf	(1089/8)^080h,(1089)&7
	line	35
	
l1882:	
;Untitled.c: 35: TRISC0=0;
	bcf	(1080/8)^080h,(1080)&7
	line	36
	
l1884:	
;Untitled.c: 36: TRISC1=0;
	bcf	(1081/8)^080h,(1081)&7
	line	38
	
l1886:	
;Untitled.c: 38: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	39
	
l1888:	
;Untitled.c: 39: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	40
	
l1890:	
;Untitled.c: 40: TXSTA=0b00100100;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	41
	
l1892:	
;Untitled.c: 41: RCSTA=0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	42
	
l1894:	
;Untitled.c: 42: SPBRG=129;
	movlw	(081h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	43
	
l1896:	
;Untitled.c: 43: lcd(0X0E,0);
	movlw	low(0)
	movwf	(?_lcd)
	movlw	high(0)
	movwf	((?_lcd))+1
	movlw	(0Eh)
	fcall	_lcd
	line	44
	
l1898:	
;Untitled.c: 44: lcd(0X38,0);
	movlw	low(0)
	movwf	(?_lcd)
	movlw	high(0)
	movwf	((?_lcd))+1
	movlw	(038h)
	fcall	_lcd
	line	47
	
l1900:	
;Untitled.c: 47: wait('G');
	movlw	(047h)
	fcall	_wait
	line	50
	
l1902:	
;Untitled.c: 50: wait('P');
	movlw	(050h)
	fcall	_wait
	line	53
	
l1904:	
;Untitled.c: 53: wait('R');
	movlw	(052h)
	fcall	_wait
	line	56
	
l1906:	
;Untitled.c: 56: wait('M');
	movlw	(04Dh)
	fcall	_wait
	line	59
	
l1908:	
;Untitled.c: 59: wait('C');
	movlw	(043h)
	fcall	_wait
	line	62
	
l1910:	
;Untitled.c: 62: wait(',');
	movlw	(02Ch)
	fcall	_wait
	line	65
	
l1912:	
;Untitled.c: 65: wait(',');
	movlw	(02Ch)
	fcall	_wait
	line	68
	
l1914:	
;Untitled.c: 68: wait('A');
	movlw	(041h)
	fcall	_wait
	line	70
	
l1916:	
;Untitled.c: 70: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	73
	
l1918:	
;Untitled.c: 73: wait(',');
	movlw	(02Ch)
	fcall	_wait
	line	78
	
l1920:	
;Untitled.c: 78: for(i=0;;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	goto	l579
	line	79
	
l578:	
	line	80
;Untitled.c: 79: {
;Untitled.c: 80: while(RCIF==0);
	goto	l579
	
l580:	
	
l579:	
	btfss	(101/8),(101)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l579
u2360:
	
l581:	
	line	81
;Untitled.c: 81: RCIF=0;
	bcf	(101/8),(101)&7
	line	82
	
l1922:	
;Untitled.c: 82: c=RCREG;
	movf	(26),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@c)
	line	83
;Untitled.c: 83: if(c==',')
	movf	(main@c),w
	xorlw	02Ch
	skipz
	goto	u2371
	goto	u2370
u2371:
	goto	l1926
u2370:
	goto	l1930
	line	85
	
l1924:	
;Untitled.c: 84: {
;Untitled.c: 85: break;
	goto	l1930
	line	86
	
l582:	
	line	87
	
l1926:	
;Untitled.c: 86: }
;Untitled.c: 87: LATITUDE[i]=c;
	movf	(main@c),w
	movwf	(??_main+0)+0
	movf	(main@i),w
	addlw	main@LATITUDE&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	78
	
l1928:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	goto	l579
	
l583:	
	line	91
	
l1930:	
;Untitled.c: 88: }
;Untitled.c: 91: wait('N');
	movlw	(04Eh)
	fcall	_wait
	line	94
;Untitled.c: 94: wait(',');
	movlw	(02Ch)
	fcall	_wait
	line	96
	
l1932:	
;Untitled.c: 96: RD1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	100
	
l1934:	
;Untitled.c: 100: for(i=0;;i++)
	movlw	low(0)
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	goto	l585
	line	101
	
l584:	
	line	102
;Untitled.c: 101: {
;Untitled.c: 102: while(RCIF==0);
	goto	l585
	
l586:	
	
l585:	
	btfss	(101/8),(101)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l585
u2380:
	
l587:	
	line	103
;Untitled.c: 103: RCIF=0;
	bcf	(101/8),(101)&7
	line	104
	
l1936:	
;Untitled.c: 104: c=RCREG;
	movf	(26),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@c)
	line	105
;Untitled.c: 105: if(c==',')
	movf	(main@c),w
	xorlw	02Ch
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l1940
u2390:
	goto	l1944
	line	107
	
l1938:	
;Untitled.c: 106: {
;Untitled.c: 107: break;
	goto	l1944
	line	108
	
l588:	
	line	109
	
l1940:	
;Untitled.c: 108: }
;Untitled.c: 109: LONGITUDE[i]=c;
	movf	(main@c),w
	movwf	(??_main+0)+0
	movf	(main@i),w
	addlw	main@LONGITUDE&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	100
	
l1942:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	goto	l585
	
l589:	
	line	112
	
l1944:	
;Untitled.c: 110: }
;Untitled.c: 112: lcd(0x01,0);
	movlw	low(0)
	movwf	(?_lcd)
	movlw	high(0)
	movwf	((?_lcd))+1
	movlw	(01h)
	fcall	_lcd
	line	113
	
l1946:	
;Untitled.c: 113: for(i=0;i<10;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1948:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2405
	movlw	low(0Ah)
	subwf	(main@i),w
u2405:

	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l1952
u2400:
	goto	l1960
	
l1950:	
	goto	l1960
	line	114
	
l590:	
	line	115
	
l1952:	
;Untitled.c: 114: {
;Untitled.c: 115: lcd(0x80+i,0);
	movlw	low(0)
	movwf	(?_lcd)
	movlw	high(0)
	movwf	((?_lcd))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	080h
	fcall	_lcd
	line	116
	
l1954:	
;Untitled.c: 116: lcd(LATITUDE[i],1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	main@LATITUDE&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd
	line	113
	
l1956:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1958:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2415
	movlw	low(0Ah)
	subwf	(main@i),w
u2415:

	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l1952
u2410:
	goto	l1960
	
l591:	
	line	118
	
l1960:	
;Untitled.c: 117: }
;Untitled.c: 118: lcd(' ',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(020h)
	fcall	_lcd
	line	119
;Untitled.c: 119: lcd('L',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(04Ch)
	fcall	_lcd
	line	120
;Untitled.c: 120: lcd('A',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(041h)
	fcall	_lcd
	line	121
;Untitled.c: 121: lcd('T',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(054h)
	fcall	_lcd
	line	122
	
l1962:	
;Untitled.c: 122: for(i=0;i<10;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1964:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2425
	movlw	low(0Ah)
	subwf	(main@i),w
u2425:

	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l1968
u2420:
	goto	l1976
	
l1966:	
	goto	l1976
	line	123
	
l592:	
	line	124
	
l1968:	
;Untitled.c: 123: {
;Untitled.c: 124: lcd(0xc0+i,0);
	movlw	low(0)
	movwf	(?_lcd)
	movlw	high(0)
	movwf	((?_lcd))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	0C0h
	fcall	_lcd
	line	125
	
l1970:	
;Untitled.c: 125: lcd(LONGITUDE[i],1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	main@LONGITUDE&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd
	line	122
	
l1972:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1974:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2435
	movlw	low(0Ah)
	subwf	(main@i),w
u2435:

	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l1968
u2430:
	goto	l1976
	
l593:	
	line	127
	
l1976:	
;Untitled.c: 126: }
;Untitled.c: 127: lcd(' ',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(020h)
	fcall	_lcd
	line	128
;Untitled.c: 128: lcd('L',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(04Ch)
	fcall	_lcd
	line	129
;Untitled.c: 129: lcd('O',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(04Fh)
	fcall	_lcd
	line	130
;Untitled.c: 130: lcd('N',1);
	movlw	low(01h)
	movwf	(?_lcd)
	movlw	high(01h)
	movwf	((?_lcd))+1
	movlw	(04Eh)
	fcall	_lcd
	goto	l1978
	line	134
;Untitled.c: 134: while(1){
	
l594:	
	line	135
	
l1978:	
;Untitled.c: 135: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	goto	l1978
	line	136
	
l595:	
	line	134
	goto	l1978
	
l596:	
	line	139
	
l597:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function _lcd *****************
;; Defined at:
;;		line 5 in file "D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;;  b               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  a               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text109
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	5
	global	__size_of_lcd
	__size_of_lcd	equ	__end_of_lcd-_lcd
	
_lcd:	
	opt	stack 7
; Regs used in _lcd: [wreg]
;lcd@a stored from wreg
	movwf	(lcd@a)
	line	6
	
l1868:	
;Untitled.c: 6: PORTB=a;
	movf	(lcd@a),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	7
	
l1870:	
;Untitled.c: 7: RC0=b;
	btfsc	(lcd@b),0
	goto	u2311
	goto	u2310
	
u2311:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	u2324
u2310:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
u2324:
	line	8
	
l1872:	
;Untitled.c: 8: RC1=1;
	bsf	(57/8),(57)&7
	line	9
;Untitled.c: 9: _delay((unsigned long)((30)*(20000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_lcd+0)+0+1),f
	movlw	205
movwf	((??_lcd+0)+0),f
u2447:
	decfsz	((??_lcd+0)+0),f
	goto	u2447
	decfsz	((??_lcd+0)+0+1),f
	goto	u2447
opt asmopt_on

	line	10
	
l1874:	
;Untitled.c: 10: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	11
;Untitled.c: 11: _delay((unsigned long)((30)*(20000000/4000.0)));
	opt asmopt_off
movlw	195
movwf	((??_lcd+0)+0+1),f
	movlw	205
movwf	((??_lcd+0)+0),f
u2457:
	decfsz	((??_lcd+0)+0),f
	goto	u2457
	decfsz	((??_lcd+0)+0+1),f
	goto	u2457
opt asmopt_on

	line	12
	
l561:	
	return
	opt stack 0
GLOBAL	__end_of_lcd
	__end_of_lcd:
;; =============== function _lcd ends ============

	signat	_lcd,8312
	global	_wait
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function _wait *****************
;; Defined at:
;;		line 15 in file "D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[COMMON] unsigned char 
;;  c1              1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text110
	file	"D:\EMB-COURSE\PIC16F877A\SPI\TASK 5 GPS LATITUDE AND LONGITUDE\CODE\Untitled.c"
	line	15
	global	__size_of_wait
	__size_of_wait	equ	__end_of_wait-_wait
	
_wait:	
	opt	stack 7
; Regs used in _wait: [wreg]
;wait@c stored from wreg
	movwf	(wait@c)
	line	17
;Untitled.c: 16: char c1;
;Untitled.c: 17: do{
	
l564:	
	line	18
;Untitled.c: 18: while(RCIF==0);
	goto	l565
	
l566:	
	
l565:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l565
u2290:
	
l567:	
	line	19
;Untitled.c: 19: RCIF=0;
	bcf	(101/8),(101)&7
	line	20
	
l1866:	
;Untitled.c: 20: c1=RCREG;
	movf	(26),w	;volatile
	movwf	(??_wait+0)+0
	movf	(??_wait+0)+0,w
	movwf	(wait@c1)
	line	21
;Untitled.c: 21: }while(c1!=c);
	movf	(wait@c1),w
	xorwf	(wait@c),w
	skipz
	goto	u2301
	goto	u2300
u2301:
	goto	l564
u2300:
	goto	l569
	
l568:	
	line	22
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_wait
	__end_of_wait:
;; =============== function _wait ends ============

	signat	_wait,4216
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
