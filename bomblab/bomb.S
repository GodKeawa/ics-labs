
./bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 4f 00 00 	mov    0x4fd9(%rip),%rax        # 5fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 1a 4f 00 00    	push   0x4f1a(%rip)        # 5f40 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 1b 4f 00 00 	bnd jmp *0x4f1b(%rip)        # 5f48 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	push   $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	push   $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	push   $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	push   $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmp 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	push   $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmp 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	push   $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmp 1020 <.plt>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	push   $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmp 1020 <.plt>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	push   $0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmp 1020 <.plt>
    112f:	90                   	nop

Disassembly of section .plt.got:

0000000000001130 <__cxa_finalize@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 95 4e 00 00 	bnd jmp *0x4e95(%rip)        # 5fd0 <__cxa_finalize@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001140 <printf@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 05 4e 00 00 	bnd jmp *0x4e05(%rip)        # 5f50 <printf@GLIBC_2.2.5>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <nanosleep@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 fd 4d 00 00 	bnd jmp *0x4dfd(%rip)        # 5f58 <nanosleep@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <__cxa_atexit@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 f5 4d 00 00 	bnd jmp *0x4df5(%rip)        # 5f60 <__cxa_atexit@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <__isoc99_sscanf@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 ed 4d 00 00 	bnd jmp *0x4ded(%rip)        # 5f68 <__isoc99_sscanf@GLIBC_2.7>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001180 <fclose@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 e5 4d 00 00 	bnd jmp *0x4de5(%rip)        # 5f70 <fclose@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001190 <_Znwm@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 dd 4d 00 00 	bnd jmp *0x4ddd(%rip)        # 5f78 <_Znwm@GLIBCXX_3.4>
    119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011a0 <fflush@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 d5 4d 00 00 	bnd jmp *0x4dd5(%rip)        # 5f80 <fflush@GLIBC_2.2.5>
    11ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011b0 <fopen@plt>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	f2 ff 25 cd 4d 00 00 	bnd jmp *0x4dcd(%rip)        # 5f88 <fopen@GLIBC_2.2.5>
    11bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011c0 <exit@plt>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	f2 ff 25 c5 4d 00 00 	bnd jmp *0x4dc5(%rip)        # 5f90 <exit@GLIBC_2.2.5>
    11cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011d0 <getchar@plt>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	f2 ff 25 bd 4d 00 00 	bnd jmp *0x4dbd(%rip)        # 5f98 <getchar@GLIBC_2.2.5>
    11db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011e0 <putchar@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 b5 4d 00 00 	bnd jmp *0x4db5(%rip)        # 5fa0 <putchar@GLIBC_2.2.5>
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011f0 <strcmp@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 ad 4d 00 00 	bnd jmp *0x4dad(%rip)        # 5fa8 <strcmp@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001200 <_ZNSt8ios_base4InitC1Ev@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 a5 4d 00 00 	bnd jmp *0x4da5(%rip)        # 5fb0 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <puts@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 9d 4d 00 00 	bnd jmp *0x4d9d(%rip)        # 5fb8 <puts@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001220 <feof@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 95 4d 00 00 	bnd jmp *0x4d95(%rip)        # 5fc0 <feof@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001230 <fgetc@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 8d 4d 00 00 	bnd jmp *0x4d8d(%rip)        # 5fc8 <fgetc@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001240 <_start>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	31 ed                	xor    %ebp,%ebp
    1246:	49 89 d1             	mov    %rdx,%r9
    1249:	5e                   	pop    %rsi
    124a:	48 89 e2             	mov    %rsp,%rdx
    124d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1251:	50                   	push   %rax
    1252:	54                   	push   %rsp
    1253:	4c 8d 05 26 11 00 00 	lea    0x1126(%rip),%r8        # 2380 <__libc_csu_fini>
    125a:	48 8d 0d af 10 00 00 	lea    0x10af(%rip),%rcx        # 2310 <__libc_csu_init>
    1261:	48 8d 3d 3a 01 00 00 	lea    0x13a(%rip),%rdi        # 13a2 <main>
    1268:	ff 15 72 4d 00 00    	call   *0x4d72(%rip)        # 5fe0 <__libc_start_main@GLIBC_2.2.5>
    126e:	f4                   	hlt    
    126f:	90                   	nop

0000000000001270 <deregister_tm_clones>:
    1270:	48 8d 3d 09 51 00 00 	lea    0x5109(%rip),%rdi        # 6380 <stdout@GLIBC_2.2.5>
    1277:	48 8d 05 02 51 00 00 	lea    0x5102(%rip),%rax        # 6380 <stdout@GLIBC_2.2.5>
    127e:	48 39 f8             	cmp    %rdi,%rax
    1281:	74 15                	je     1298 <deregister_tm_clones+0x28>
    1283:	48 8b 05 4e 4d 00 00 	mov    0x4d4e(%rip),%rax        # 5fd8 <_ITM_deregisterTMCloneTable>
    128a:	48 85 c0             	test   %rax,%rax
    128d:	74 09                	je     1298 <deregister_tm_clones+0x28>
    128f:	ff e0                	jmp    *%rax
    1291:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1298:	c3                   	ret    
    1299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012a0 <register_tm_clones>:
    12a0:	48 8d 3d d9 50 00 00 	lea    0x50d9(%rip),%rdi        # 6380 <stdout@GLIBC_2.2.5>
    12a7:	48 8d 35 d2 50 00 00 	lea    0x50d2(%rip),%rsi        # 6380 <stdout@GLIBC_2.2.5>
    12ae:	48 29 fe             	sub    %rdi,%rsi
    12b1:	48 89 f0             	mov    %rsi,%rax
    12b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    12b8:	48 c1 f8 03          	sar    $0x3,%rax
    12bc:	48 01 c6             	add    %rax,%rsi
    12bf:	48 d1 fe             	sar    %rsi
    12c2:	74 14                	je     12d8 <register_tm_clones+0x38>
    12c4:	48 8b 05 25 4d 00 00 	mov    0x4d25(%rip),%rax        # 5ff0 <_ITM_registerTMCloneTable>
    12cb:	48 85 c0             	test   %rax,%rax
    12ce:	74 08                	je     12d8 <register_tm_clones+0x38>
    12d0:	ff e0                	jmp    *%rax
    12d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12d8:	c3                   	ret    
    12d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012e0 <__do_global_dtors_aux>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	80 3d 9d 50 00 00 00 	cmpb   $0x0,0x509d(%rip)        # 6388 <completed.8061>
    12eb:	75 2b                	jne    1318 <__do_global_dtors_aux+0x38>
    12ed:	55                   	push   %rbp
    12ee:	48 83 3d da 4c 00 00 	cmpq   $0x0,0x4cda(%rip)        # 5fd0 <__cxa_finalize@GLIBC_2.2.5>
    12f5:	00 
    12f6:	48 89 e5             	mov    %rsp,%rbp
    12f9:	74 0c                	je     1307 <__do_global_dtors_aux+0x27>
    12fb:	48 8b 3d 06 4d 00 00 	mov    0x4d06(%rip),%rdi        # 6008 <__dso_handle>
    1302:	e8 29 fe ff ff       	call   1130 <__cxa_finalize@plt>
    1307:	e8 64 ff ff ff       	call   1270 <deregister_tm_clones>
    130c:	c6 05 75 50 00 00 01 	movb   $0x1,0x5075(%rip)        # 6388 <completed.8061>
    1313:	5d                   	pop    %rbp
    1314:	c3                   	ret    
    1315:	0f 1f 00             	nopl   (%rax)
    1318:	c3                   	ret    
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001320 <frame_dummy>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	e9 77 ff ff ff       	jmp    12a0 <register_tm_clones>

0000000000001329 <read_line>:
    1329:	f3 0f 1e fa          	endbr64 
    132d:	55                   	push   %rbp
    132e:	48 89 e5             	mov    %rsp,%rbp
    1331:	48 83 ec 20          	sub    $0x20,%rsp
    1335:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1339:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1340:	83 7d fc 28          	cmpl   $0x28,-0x4(%rbp)
    1344:	7f 39                	jg     137f <read_line+0x56>
    1346:	e8 85 fe ff ff       	call   11d0 <getchar@plt>
    134b:	88 45 fb             	mov    %al,-0x5(%rbp)
    134e:	80 7d fb 0a          	cmpb   $0xa,-0x5(%rbp)
    1352:	75 12                	jne    1366 <read_line+0x3d>
    1354:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1357:	48 63 d0             	movslq %eax,%rdx
    135a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    135e:	48 01 d0             	add    %rdx,%rax
    1361:	c6 00 00             	movb   $0x0,(%rax)
    1364:	eb 3a                	jmp    13a0 <read_line+0x77>
    1366:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1369:	48 63 d0             	movslq %eax,%rdx
    136c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1370:	48 01 c2             	add    %rax,%rdx
    1373:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
    1377:	88 02                	mov    %al,(%rdx)
    1379:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    137d:	eb c1                	jmp    1340 <read_line+0x17>
    137f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1382:	48 63 d0             	movslq %eax,%rdx
    1385:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1389:	48 01 d0             	add    %rdx,%rax
    138c:	c6 00 00             	movb   $0x0,(%rax)
    138f:	e8 3c fe ff ff       	call   11d0 <getchar@plt>
    1394:	83 f8 0a             	cmp    $0xa,%eax
    1397:	0f 95 c0             	setne  %al
    139a:	84 c0                	test   %al,%al
    139c:	74 02                	je     13a0 <read_line+0x77>
    139e:	eb ef                	jmp    138f <read_line+0x66>
    13a0:	c9                   	leave  
    13a1:	c3                   	ret    

00000000000013a2 <main>:
    13a2:	f3 0f 1e fa          	endbr64 
    13a6:	55                   	push   %rbp
    13a7:	48 89 e5             	mov    %rsp,%rbp
    13aa:	48 83 ec 30          	sub    $0x30,%rsp
    13ae:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    13b5:	00 
    13b6:	48 8d 3d 4b 1c 00 00 	lea    0x1c4b(%rip),%rdi        # 3008 <_IO_stdin_used+0x8>
    13bd:	e8 4e fe ff ff       	call   1210 <puts@plt>
    13c2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    13c6:	48 89 c7             	mov    %rax,%rdi
    13c9:	e8 5b ff ff ff       	call   1329 <read_line>
    13ce:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    13d2:	48 89 c7             	mov    %rax,%rdi
    13d5:	e8 7e 01 00 00       	call   1558 <phase_1>
    13da:	48 8d 3d 6f 1c 00 00 	lea    0x1c6f(%rip),%rdi        # 3050 <_IO_stdin_used+0x50>
    13e1:	e8 2a fe ff ff       	call   1210 <puts@plt>
    13e6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    13ea:	48 89 c7             	mov    %rax,%rdi
    13ed:	e8 37 ff ff ff       	call   1329 <read_line>
    13f2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    13f6:	48 89 c7             	mov    %rax,%rdi
    13f9:	e8 a2 01 00 00       	call   15a0 <phase_2>
    13fe:	48 8d 3d 74 1c 00 00 	lea    0x1c74(%rip),%rdi        # 3079 <_IO_stdin_used+0x79>
    1405:	e8 06 fe ff ff       	call   1210 <puts@plt>
    140a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    140e:	48 89 c7             	mov    %rax,%rdi
    1411:	e8 13 ff ff ff       	call   1329 <read_line>
    1416:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    141a:	48 89 c7             	mov    %rax,%rdi
    141d:	e8 0c 02 00 00       	call   162e <phase_3>
    1422:	48 8d 3d 6d 1c 00 00 	lea    0x1c6d(%rip),%rdi        # 3096 <_IO_stdin_used+0x96>
    1429:	e8 e2 fd ff ff       	call   1210 <puts@plt>
    142e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1432:	48 89 c7             	mov    %rax,%rdi
    1435:	e8 ef fe ff ff       	call   1329 <read_line>
    143a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    143e:	48 89 c7             	mov    %rax,%rdi
    1441:	e8 c1 03 00 00       	call   1807 <phase_4>
    1446:	48 8d 3d 5b 1c 00 00 	lea    0x1c5b(%rip),%rdi        # 30a8 <_IO_stdin_used+0xa8>
    144d:	e8 be fd ff ff       	call   1210 <puts@plt>
    1452:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1456:	48 89 c7             	mov    %rax,%rdi
    1459:	e8 cb fe ff ff       	call   1329 <read_line>
    145e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1462:	48 89 c7             	mov    %rax,%rdi
    1465:	e8 3c 04 00 00       	call   18a6 <phase_5>
    146a:	48 8d 3d 5a 1c 00 00 	lea    0x1c5a(%rip),%rdi        # 30cb <_IO_stdin_used+0xcb>
    1471:	e8 9a fd ff ff       	call   1210 <puts@plt>
    1476:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    147a:	48 89 c7             	mov    %rax,%rdi
    147d:	e8 a7 fe ff ff       	call   1329 <read_line>
    1482:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1486:	48 89 c7             	mov    %rax,%rdi
    1489:	e8 fb 07 00 00       	call   1c89 <phase_6>
    148e:	48 8d 3d 53 1c 00 00 	lea    0x1c53(%rip),%rdi        # 30e8 <_IO_stdin_used+0xe8>
    1495:	e8 76 fd ff ff       	call   1210 <puts@plt>
    149a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    149f:	74 4d                	je     14ee <main+0x14c>
    14a1:	48 8d 3d 78 1c 00 00 	lea    0x1c78(%rip),%rdi        # 3120 <_IO_stdin_used+0x120>
    14a8:	e8 3f 0c 00 00       	call   20ec <slow_put>
    14ad:	48 8d 3d 93 1c 00 00 	lea    0x1c93(%rip),%rdi        # 3147 <_IO_stdin_used+0x147>
    14b4:	e8 33 0c 00 00       	call   20ec <slow_put>
    14b9:	48 8d 3d 94 1c 00 00 	lea    0x1c94(%rip),%rdi        # 3154 <_IO_stdin_used+0x154>
    14c0:	e8 8d 0c 00 00       	call   2152 <slow_slow_put>
    14c5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    14c9:	48 89 c7             	mov    %rax,%rdi
    14cc:	e8 58 fe ff ff       	call   1329 <read_line>
    14d1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    14d5:	48 89 c7             	mov    %rax,%rdi
    14d8:	e8 eb 08 00 00       	call   1dc8 <secret_phase>
    14dd:	48 8d 3d 8c 1c 00 00 	lea    0x1c8c(%rip),%rdi        # 3170 <_IO_stdin_used+0x170>
    14e4:	e8 27 fd ff ff       	call   1210 <puts@plt>
    14e9:	e8 43 0d 00 00       	call   2231 <true_ending>
    14ee:	b8 00 00 00 00       	mov    $0x0,%eax
    14f3:	c9                   	leave  
    14f4:	c3                   	ret    

00000000000014f5 <string_not_equal>:
    14f5:	f3 0f 1e fa          	endbr64 
    14f9:	55                   	push   %rbp
    14fa:	48 89 e5             	mov    %rsp,%rbp
    14fd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1501:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1505:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    150c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    150f:	48 63 d0             	movslq %eax,%rdx
    1512:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1516:	48 01 d0             	add    %rdx,%rax
    1519:	0f b6 00             	movzbl (%rax),%eax
    151c:	84 c0                	test   %al,%al                                  //怎么能让%al = 0？===>发现rax里存的是比较用的字符串，每比一次就少一个字符
    151e:	74 31                	je     1551 <string_not_equal+0x5c>             //jmp到正确位置===>每个字符都一样
    1520:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1523:	48 63 d0             	movslq %eax,%rdx
    1526:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    152a:	48 01 d0             	add    %rdx,%rax
    152d:	0f b6 10             	movzbl (%rax),%edx
    1530:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1533:	48 63 c8             	movslq %eax,%rcx
    1536:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    153a:	48 01 c8             	add    %rcx,%rax
    153d:	0f b6 00             	movzbl (%rax),%eax                                  //决定%eax（%al），
    1540:	38 c2                	cmp    %al,%dl                                      //又一次比较，可以确定是%rdx与%rax比较===>发现存的是单个字符的ASCII码，进行跟踪
    1542:	74 07                	je     154b <string_not_equal+0x56>                 //至少跳过了错误的赋值
    1544:	b8 00 00 00 00       	mov    $0x0,%eax                                    //判断错误，让%eax = 0
    1549:	eb 0b                	jmp    1556 <string_not_equal+0x61>                 //直接跳出
    154b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)                              //加1再回跳，不难想到是依次比较每个字母
    154f:	eb bb                	jmp    150c <string_not_equal+0x17>
    1551:	b8 01 00 00 00       	mov    $0x1,%eax                                    //判断正确，让%eax = 1
    1556:	5d                   	pop    %rbp
    1557:	c3                   	ret    

0000000000001558 <phase_1>:                                         //Computer science is not a boring subject
    1558:	f3 0f 1e fa          	endbr64 
    155c:	55                   	push   %rbp
    155d:	48 89 e5             	mov    %rsp,%rbp
    1560:	48 83 ec 20          	sub    $0x20,%rsp
    1564:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1568:	8b 05 3e 4d 00 00    	mov    0x4d3e(%rip),%eax        # 62ac <phase_1_offset>
    156e:	48 98                	cltq   
    1570:	48 8d 15 a9 4a 00 00 	lea    0x4aa9(%rip),%rdx        # 6020 <phase_1_str>
    1577:	48 01 d0             	add    %rdx,%rax
    157a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    157e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1586:	48 89 d6             	mov    %rdx,%rsi
    1589:	48 89 c7             	mov    %rax,%rdi
    158c:	e8 64 ff ff ff       	call   14f5 <string_not_equal>
    1591:	83 f0 01             	xor    $0x1,%eax                            //出来后%eax = 1
    1594:	84 c0                	test   %al,%al                              //必须有%al = 0
    1596:	74 05                	je     159d <phase_1+0x45>                  //跳过引爆
    1598:	e8 bd 0a 00 00       	call   205a <explode_bomb>
    159d:	90                   	nop
    159e:	c9                   	leave  
    159f:	c3                   	ret    

00000000000015a0 <phase_2>:
    15a0:	f3 0f 1e fa          	endbr64 
    15a4:	55                   	push   %rbp
    15a5:	48 89 e5             	mov    %rsp,%rbp
    15a8:	48 83 ec 30          	sub    $0x30,%rsp
    15ac:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    15b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    15b4:	48 8d 35 05 4d 00 00 	lea    0x4d05(%rip),%rsi        # 62c0 <phase_2_nums>
    15bb:	48 89 c7             	mov    %rax,%rdi
    15be:	e8 f5 0b 00 00       	call   21b8 <read_six_numbers>      //表明是读六个数字，进入函数查看
    15c3:	48 8d 05 f6 4c 00 00 	lea    0x4cf6(%rip),%rax        # 62c0 <phase_2_nums>
    15ca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    15ce:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)                  //%rbp-0x4为计数器，初始化为1
    15d5:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)                  //循环回跳到这里，计数器加1，判断是否结束，一共判断6个数字
    15d9:	7f 50                	jg     162b <phase_2+0x8b>              //判断完就结束
    15db:	8b 15 fb 4c 00 00    	mov    0x4cfb(%rip),%edx        # 62dc <phase_2_nums+0x1c> 
    15e1:	8b 45 fc             	mov    -0x4(%rbp),%eax          //%rax载入为计数器的值
    15e4:	48 98                	cltq   
    15e6:	48 c1 e0 02          	shl    $0x2,%rax                
    15ea:	48 8d 48 fc          	lea    -0x4(%rax),%rcx          
    15ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15f2:	48 01 c8             	add    %rcx,%rax
    15f5:	8b 00                	mov    (%rax),%eax
    15f7:	0f af d0             	imul   %eax,%edx
    15fa:	8b 05 e0 4c 00 00    	mov    0x4ce0(%rip),%eax        # 62e0 <phase_2_nums+0x20>
    1600:	01 d0                	add    %edx,%eax
    1602:	89 45 ec             	mov    %eax,-0x14(%rbp)         //%eax==>%rbp-14
    1605:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1608:	48 98                	cltq   
    160a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1611:	00 
    1612:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1616:	48 01 d0             	add    %rdx,%rax
    1619:	8b 00                	mov    (%rax),%eax
    161b:	39 45 ec             	cmp    %eax,-0x14(%rbp)                    
    //关键比较，动态查看两个比较的内容,不难发现%eax与%rbp-0x14里存的数都与输入的数有关，回溯查看输入值的变化
    //通过测试不难得到%rbp-0x14是(1-输入的第一个数乘4)，%eax是输入的第二个数，之后依次类推，也即该数列须满足a[n]=1-4a[n-1]且包含溢出的情况(%eax只存4个bytes)
    //尝试自行构造一个序列，第一个数为1，第二个只能是-3，第三个为13，第四个为-51，第五个为205，第6个为-819,输入后成功通过
    161e:	74 05                	je     1625 <phase_2+0x85>                  //跳过引爆
    1620:	e8 35 0a 00 00       	call   205a <explode_bomb>                  //爆了
    1625:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)                      //又是加1回跳，依次比较      
    1629:	eb aa                	jmp    15d5 <phase_2+0x35>
    162b:	90                   	nop
    162c:	c9                   	leave  
    162d:	c3                   	ret    

000000000000162e <phase_3>:
    162e:	f3 0f 1e fa          	endbr64 
    1632:	55                   	push   %rbp
    1633:	48 89 e5             	mov    %rsp,%rbp        //%rbp存 old %rsp
    1636:	48 83 ec 30          	sub    $0x30,%rsp       //开空间
    163a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)     
    163e:	48 8d 75 ef          	lea    -0x11(%rbp),%rsi
    1642:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    1646:	48 8d 55 f4          	lea    -0xc(%rbp),%rdx          
    164a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    164e:	49 89 f0             	mov    %rsi,%r8
    1651:	48 8d 35 f0 1b 00 00 	lea    0x1bf0(%rip),%rsi        # 3248 <_ZNSt8__detailL19_S_invalid_state_idE+0x8>
    1658:	48 89 c7             	mov    %rax,%rdi
    165b:	b8 00 00 00 00       	mov    $0x0,%eax
    1660:	e8 0b fb ff ff       	call   1170 <__isoc99_sscanf@plt>       //又是它，容易找到输入格式为“%d %d %c”，返回值在%rax
    1665:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1668:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)          //比较%eax与0x3，scanf返回读入的值的数量，即读入3个内容
    166c:	74 05                	je     1673 <phase_3+0x45>      //%eax == 3 跳到1673
    166e:	e8 e7 09 00 00       	call   205a <explode_bomb>
    1673:	8b 45 f4             	mov    -0xc(%rbp),%eax     //反复查看%rbp-0xc，容易发现是第一个输入值
    1676:	3d 62 02 00 00       	cmp    $0x262,%eax              //第一个是0x262
    167b:	0f 84 fb 00 00 00    	je     177c <phase_3+0x14e>     //jump
    1681:	3d 62 02 00 00       	cmp    $0x262,%eax
    1686:	0f 8f 05 01 00 00    	jg     1791 <phase_3+0x163>
    168c:	3d e9 00 00 00       	cmp    $0xe9,%eax
    1691:	0f 84 d0 00 00 00    	je     1767 <phase_3+0x139>
    1697:	3d e9 00 00 00       	cmp    $0xe9,%eax
    169c:	0f 8f ef 00 00 00    	jg     1791 <phase_3+0x163>
    16a2:	83 f8 22             	cmp    $0x22,%eax
    16a5:	7f 34                	jg     16db <phase_3+0xad>
    16a7:	85 c0                	test   %eax,%eax
    16a9:	0f 8e e2 00 00 00    	jle    1791 <phase_3+0x163>
    16af:	83 f8 22             	cmp    $0x22,%eax
    16b2:	0f 87 d9 00 00 00    	ja     1791 <phase_3+0x163>
    16b8:	89 c0                	mov    %eax,%eax
    16ba:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    16c1:	00 
    16c2:	48 8d 05 8b 1b 00 00 	lea    0x1b8b(%rip),%rax        # 3254 <_ZNSt8__detailL19_S_invalid_state_idE+0x14>
    16c9:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    16cc:	48 98                	cltq   
    16ce:	48 8d 15 7f 1b 00 00 	lea    0x1b7f(%rip),%rdx        # 3254 <_ZNSt8__detailL19_S_invalid_state_idE+0x14>
    16d5:	48 01 d0             	add    %rdx,%rax
    16d8:	3e ff e0             	notrack jmp *%rax
    16db:	83 f8 59             	cmp    $0x59,%eax
    16de:	74 72                	je     1752 <phase_3+0x124>
    16e0:	e9 ac 00 00 00       	jmp    1791 <phase_3+0x163>
    16e5:	c6 45 ff 6f          	movb   $0x6f,-0x1(%rbp)
    16e9:	8b 45 f0             	mov    -0x10(%rbp),%eax
    16ec:	83 f8 01             	cmp    $0x1,%eax
    16ef:	0f 84 a3 00 00 00    	je     1798 <phase_3+0x16a>
    16f5:	e8 60 09 00 00       	call   205a <explode_bomb>
    16fa:	e9 99 00 00 00       	jmp    1798 <phase_3+0x16a>
    16ff:	c6 45 ff 76          	movb   $0x76,-0x1(%rbp)
    1703:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1706:	83 f8 03             	cmp    $0x3,%eax
    1709:	0f 84 8c 00 00 00    	je     179b <phase_3+0x16d>
    170f:	e8 46 09 00 00       	call   205a <explode_bomb>
    1714:	e9 82 00 00 00       	jmp    179b <phase_3+0x16d>
    1719:	c6 45 ff 65          	movb   $0x65,-0x1(%rbp)
    171d:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1720:	83 f8 08             	cmp    $0x8,%eax
    1723:	74 79                	je     179e <phase_3+0x170>
    1725:	e8 30 09 00 00       	call   205a <explode_bomb>
    172a:	eb 72                	jmp    179e <phase_3+0x170>
    172c:	c6 45 ff 72          	movb   $0x72,-0x1(%rbp)
    1730:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1733:	83 f8 15             	cmp    $0x15,%eax
    1736:	74 69                	je     17a1 <phase_3+0x173>
    1738:	e8 1d 09 00 00       	call   205a <explode_bomb>
    173d:	eb 62                	jmp    17a1 <phase_3+0x173>
    173f:	c6 45 ff 66          	movb   $0x66,-0x1(%rbp)
    1743:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1746:	83 f8 37             	cmp    $0x37,%eax
    1749:	74 59                	je     17a4 <phase_3+0x176>
    174b:	e8 0a 09 00 00       	call   205a <explode_bomb>
    1750:	eb 52                	jmp    17a4 <phase_3+0x176>
    1752:	c6 45 ff 6c          	movb   $0x6c,-0x1(%rbp)
    1756:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1759:	3d 90 00 00 00       	cmp    $0x90,%eax
    175e:	74 47                	je     17a7 <phase_3+0x179>
    1760:	e8 f5 08 00 00       	call   205a <explode_bomb>
    1765:	eb 40                	jmp    17a7 <phase_3+0x179>
    1767:	c6 45 ff 6f          	movb   $0x6f,-0x1(%rbp)
    176b:	8b 45 f0             	mov    -0x10(%rbp),%eax
    176e:	3d 79 01 00 00       	cmp    $0x179,%eax
    1773:	74 35                	je     17aa <phase_3+0x17c>
    1775:	e8 e0 08 00 00       	call   205a <explode_bomb>
    177a:	eb 2e                	jmp    17aa <phase_3+0x17c>
    177c:	c6 45 ff 77          	movb   $0x77,-0x1(%rbp)      //jump destination
    1780:	8b 45 f0             	mov    -0x10(%rbp),%eax      //明显是第二个输入
    1783:	3d db 03 00 00       	cmp    $0x3db,%eax           //第二个是0x3db
    1788:	74 23                	je     17ad <phase_3+0x17f>  //jump
    178a:	e8 cb 08 00 00       	call   205a <explode_bomb>
    178f:	eb 1c                	jmp    17ad <phase_3+0x17f>
    1791:	e8 c4 08 00 00       	call   205a <explode_bomb>
    1796:	eb 16                	jmp    17ae <phase_3+0x180>
    1798:	90                   	nop
    1799:	eb 13                	jmp    17ae <phase_3+0x180>
    179b:	90                   	nop
    179c:	eb 10                	jmp    17ae <phase_3+0x180>
    179e:	90                   	nop
    179f:	eb 0d                	jmp    17ae <phase_3+0x180>
    17a1:	90                   	nop
    17a2:	eb 0a                	jmp    17ae <phase_3+0x180>
    17a4:	90                   	nop
    17a5:	eb 07                	jmp    17ae <phase_3+0x180>
    17a7:	90                   	nop
    17a8:	eb 04                	jmp    17ae <phase_3+0x180>
    17aa:	90                   	nop
    17ab:	eb 01                	jmp    17ae <phase_3+0x180>
    17ad:	90                   	nop                              //jump destination
    17ae:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax          //第三个输入
    17b2:	38 45 ff             	cmp    %al,-0x1(%rbp)            //比较，容易读取到第三个是w
    17b5:	74 05                	je     17bc <phase_3+0x18e>      //通过
    17b7:	e8 9e 08 00 00       	call   205a <explode_bomb>
    17bc:	90                   	nop
    17bd:	c9                   	leave  
    17be:	c3                   	ret    

00000000000017bf <_ZL4hopei>:
    17bf:	f3 0f 1e fa          	endbr64 
    17c3:	55                   	push   %rbp
    17c4:	48 89 e5             	mov    %rsp,%rbp
    17c7:	48 83 ec 20          	sub    $0x20,%rsp
    17cb:	89 7d ec             	mov    %edi,-0x14(%rbp)   //存输入  ==>解为0b1100，即0xc
    17ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)   //是不是0？不是则jump
    17d2:	75 07                	jne    17db <_ZL4hopei+0x1c>
    17d4:	b8 01 00 00 00       	mov    $0x1,%eax           //是0就给%eax赋1，开始回溯，反复return
    17d9:	eb 2a                	jmp    1805 <_ZL4hopei+0x46>
    17db:	8b 45 ec             	mov    -0x14(%rbp),%eax  //不是0 
    17de:	d1 f8                	sar    %eax
    17e0:	89 c7                	mov    %eax,%edi         //把原输入右移一位再作为输入调用函数
    17e2:	e8 d8 ff ff ff       	call   17bf <_ZL4hopei>  //重复调用会导致ret的地方在这里，也就是重复调用几次下面的函数就执行几次
    17e7:	89 45 fc             	mov    %eax,-0x4(%rbp)  //将%rbp-0x4设为上一次的返回值
    17ea:	8b 45 ec             	mov    -0x14(%rbp),%eax //%eax设为调用时的输入，最后一次调用是0，倒数第二次是1
    17ed:	83 e0 01             	and    $0x1,%eax          
    17f0:	85 c0                	test   %eax,%eax         
    17f2:	74 0b                	je     17ff <_ZL4hopei+0x40> 
    17f4:	8b 45 fc             	mov    -0x4(%rbp),%eax 
    17f7:	0f af c0             	imul   %eax,%eax
    17fa:	c1 e0 02             	shl    $0x2,%eax  
    17fd:	eb 06                	jmp    1805 <_ZL4hopei+0x46>
    17ff:	8b 45 fc             	mov    -0x4(%rbp),%eax  
    1802:	0f af c0             	imul   %eax,%eax        
    1805:	c9                   	leave  
    1806:	c3                   	ret    

0000000000001807 <phase_4>:
    1807:	f3 0f 1e fa          	endbr64 
    180b:	55                   	push   %rbp
    180c:	48 89 e5             	mov    %rsp,%rbp
    180f:	48 83 ec 20          	sub    $0x20,%rsp
    1813:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1817:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
    181b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    181f:	48 8d 35 ba 1a 00 00 	lea    0x1aba(%rip),%rsi        # 32e0 <_ZNSt8__detailL19_S_invalid_state_idE+0xa0>
    1826:	48 89 c7             	mov    %rax,%rdi
    1829:	b8 00 00 00 00       	mov    $0x0,%eax
    182e:	e8 3d f9 ff ff       	call   1170 <__isoc99_sscanf@plt> //"%lld" 输入 long long （ago）
    1833:	83 f8 01             	cmp    $0x1,%eax  //一个输入
    1836:	0f 95 c0             	setne  %al    
    1839:	84 c0                	test   %al,%al
    183b:	74 05                	je     1842 <phase_4+0x3b>  //jump
    183d:	e8 18 08 00 00       	call   205a <explode_bomb>
    1842:	48 8b 45 f0          	mov    -0x10(%rbp),%rax     //输入存在%rbp-0x10里，这里复制给%rax
    1846:	48 c1 f8 20          	sar    $0x20,%rax           //右移32位，%rax为输入的前32位
    184a:	89 45 fc             	mov    %eax,-0x4(%rbp)      //前32位存%rbp-0x4里
    184d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax     //重新在%rax里存输入
    1851:	89 45 f8             	mov    %eax,-0x8(%rbp)      //后32位存在%rbp-0x8里
    1854:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)      //前32位小于0？
    1858:	0f 9e c2             	setle  %dl
    185b:	83 7d fc 0e          	cmpl   $0xe,-0x4(%rbp)      //前32位大于0xe？
    185f:	0f 9f c0             	setg   %al
    1862:	09 d0                	or     %edx,%eax                //两个都不成立，则%eax存0
    1864:	0f b6 d0             	movzbl %al,%edx             //把%al扩展存给%edx
    1867:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)          //同理的后32位比较
    186b:	0f 9e c0             	setle  %al                      //小于0就设定%al为1
    186e:	0f b6 c0             	movzbl %al,%eax                 //扩展赋给%eax
    1871:	09 c2                	or     %eax,%edx                //取或运算赋给%edx
    1873:	83 7d f8 0e          	cmpl   $0xe,-0x8(%rbp)      
    1877:	0f 9f c0             	setg   %al                  
    187a:	0f b6 c0             	movzbl %al,%eax             //%al必须为0
    187d:	09 d0                	or     %edx,%eax            //%edx必须为0
    187f:	85 c0                	test   %eax,%eax            //%eax必须为0
    1881:	74 05                	je     1888 <phase_4+0x81>  //必须要jump
    1883:	e8 d2 07 00 00       	call   205a <explode_bomb>
    1888:	8b 45 fc             	mov    -0x4(%rbp),%eax      //前32位给%eax
    188b:	89 c7                	mov    %eax,%edi            //把%eax赋给%edi，作为下面函数的输入
    188d:	e8 2d ff ff ff       	call   17bf <_ZL4hopei>      //%eax == 0x1000000
    1897:	0f 95 c0             	setne  %al    //这个函数必须输出%eax == 0x1000000
    1892:	3d 00 00 00 01       	cmp    $0x1000000,%eax 
    189a:	84 c0                	test   %al,%al
    189c:	74 05                	je     18a3 <phase_4+0x9c>  //必须要jump
    189e:	e8 b7 07 00 00       	call   205a <explode_bomb>
    18a3:	90                   	nop
    18a4:	c9                   	leave  
    18a5:	c3                   	ret    

00000000000018a6 <phase_5>:
    18a6:	f3 0f 1e fa          	endbr64 
    18aa:	55                   	push   %rbp
    18ab:	48 89 e5             	mov    %rsp,%rbp
    18ae:	53                   	push   %rbx
    18af:	48 83 ec 48          	sub    $0x48,%rsp
    18b3:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    18b7:	48 8d 4d cc          	lea    -0x34(%rbp),%rcx
    18bb:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    18bf:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    18c3:	48 8d 35 1b 1a 00 00 	lea    0x1a1b(%rip),%rsi        # 32e5 <_ZNSt8__detailL19_S_invalid_state_idE+0xa5>
    18ca:	48 89 c7             	mov    %rax,%rdi
    18cd:	b8 00 00 00 00       	mov    $0x0,%eax
    18d2:	e8 99 f8 ff ff       	call   1170 <__isoc99_sscanf@plt>  //"%s %d",输入字符串和数字
    18d7:	83 f8 02             	cmp    $0x2,%eax                   //校验读取到的数量
    18da:	0f 95 c0             	setne  %al
    18dd:	84 c0                	test   %al,%al
    18df:	74 05                	je     18e6 <phase_5+0x40>
    18e1:	e8 74 07 00 00       	call   205a <explode_bomb>
    18e6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax           //phase_5开始
    18ea:	48 8d 35 fa 19 00 00 	lea    0x19fa(%rip),%rsi        # 32eb <_ZNSt8__detailL19_S_invalid_state_idE+0xab>
    18f1:	48 89 c7             	mov    %rax,%rdi
    18f4:	e8 f7 f8 ff ff       	call   11f0 <strcmp@plt>            //调用strcmp函数，输入的字符串存在%rdi和%rsi里，直接查看,得到"杀杀杀！"
    18f9:	85 c0                	test   %eax,%eax
    18fb:	75 1b                	jne    1918 <phase_5+0x72>
    18fd:	bf 10 00 00 00       	mov    $0x10,%edi
    1902:	e8 89 f8 ff ff       	call   1190 <_Znwm@plt>
    1907:	48 89 c3             	mov    %rax,%rbx
    190a:	48 89 df             	mov    %rbx,%rdi
    190d:	e8 c8 05 00 00       	call   1eda <_ZN10worldline1C1Ev>       //世界线1函数
    1912:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
    1916:	eb 69                	jmp    1981 <phase_5+0xdb>
    1918:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    191c:	48 8d 35 d5 19 00 00 	lea    0x19d5(%rip),%rsi        # 32f8 <_ZNSt8__detailL19_S_invalid_state_idE+0xb8>
    1923:	48 89 c7             	mov    %rax,%rdi
    1926:	e8 c5 f8 ff ff       	call   11f0 <strcmp@plt>              //"退退退。"
    192b:	85 c0                	test   %eax,%eax
    192d:	75 1b                	jne    194a <phase_5+0xa4>
    192f:	bf 10 00 00 00       	mov    $0x10,%edi
    1934:	e8 57 f8 ff ff       	call   1190 <_Znwm@plt>
    1939:	48 89 c3             	mov    %rax,%rbx
    193c:	48 89 df             	mov    %rbx,%rdi
    193f:	e8 16 06 00 00       	call   1f5a <_ZN10worldline2C1Ev>       //世界线2函数
    1944:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
    1948:	eb 37                	jmp    1981 <phase_5+0xdb>
    194a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    194e:	48 8d 35 b0 19 00 00 	lea    0x19b0(%rip),%rsi        # 3305 <_ZNSt8__detailL19_S_invalid_state_idE+0xc5>
    1955:	48 89 c7             	mov    %rax,%rdi
    1958:	e8 93 f8 ff ff       	call   11f0 <strcmp@plt>                //"冲冲冲~" ==>这个一看就很对，就进世界线3
    195d:	85 c0                	test   %eax,%eax
    195f:	75 1b                	jne    197c <phase_5+0xd6>
    1961:	bf 10 00 00 00       	mov    $0x10,%edi
    1966:	e8 25 f8 ff ff       	call   1190 <_Znwm@plt>
    196b:	48 89 c3             	mov    %rax,%rbx
    196e:	48 89 df             	mov    %rbx,%rdi
    1971:	e8 64 06 00 00       	call   1fda <_ZN10worldline3C1Ev>      //世界线3函数
    1976:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
    197a:	eb 05                	jmp    1981 <phase_5+0xdb>
    197c:	e8 d9 06 00 00       	call   205a <explode_bomb>
    1981:	48 8b 45 e8          	mov    -0x18(%rbp),%rax      //有三种方法跳到这里，这决定了不同的世界线
    1985:	48 8b 00             	mov    (%rax),%rax           //这一段是准备存储调用函数的输入
    1988:	48 83 c0 10          	add    $0x10,%rax           //%rax原本存的是worldline3里的一个函数，偏移以后指向了下一个函数
    198c:	48 8b 08             	mov    (%rax),%rcx          //载入到%rcx里
    198f:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1992:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1996:	89 d6                	mov    %edx,%esi
    1998:	48 89 c7             	mov    %rax,%rdi
    199b:	ff d1                	call   *%rcx      //调用函数worldline3::dmail(int)，发送dmail,进入该函数可以发现数字应该是0x7e7(2023)
    199d:	85 c0                	test   %eax,%eax                //%eax != 0
    199f:	74 10                	je     19b1 <phase_5+0x10b>    //不能jump
    19a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19a5:	48 89 c7             	mov    %rax,%rdi
    19a8:	e8 0b 05 00 00       	call   1eb8 <_ZN9worldline18is_phase5_passableEv>   //通过phase_5的关键函数,里面是setg，上述解通过
    19ad:	85 c0                	test   %eax,%eax               //%eax != 0
    19af:	75 07                	jne    19b8 <phase_5+0x112>   //正确的jump地点
    19b1:	b8 01 00 00 00       	mov    $0x1,%eax
    19b6:	eb 05                	jmp    19bd <phase_5+0x117>   //jump时%eax == 1，不能jump
    19b8:	b8 00 00 00 00       	mov    $0x0,%eax
    19bd:	84 c0                	test   %al,%al
    19bf:	74 05                	je     19c6 <phase_5+0x120>   //必须jump
    19c1:	e8 94 06 00 00       	call   205a <explode_bomb>
    19c6:	90                   	nop
    19c7:	48 83 c4 48          	add    $0x48,%rsp
    19cb:	5b                   	pop    %rbx
    19cc:	5d                   	pop    %rbp
    19cd:	c3                   	ret    

00000000000019ce <put_val>:
    19ce:	f3 0f 1e fa          	endbr64 
    19d2:	55                   	push   %rbp
    19d3:	48 89 e5             	mov    %rsp,%rbp
    19d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    19da:	89 75 f4             	mov    %esi,-0xc(%rbp)
    19dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19e1:	48 8b 00             	mov    (%rax),%rax
    19e4:	8b 55 f4             	mov    -0xc(%rbp),%edx
    19e7:	89 10                	mov    %edx,(%rax)
    19e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19ed:	48 8b 00             	mov    (%rax),%rax
    19f0:	48 8b 50 08          	mov    0x8(%rax),%rdx
    19f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19f8:	48 89 10             	mov    %rdx,(%rax)
    19fb:	90                   	nop
    19fc:	5d                   	pop    %rbp
    19fd:	c3                   	ret    

00000000000019fe <get_val>:
    19fe:	f3 0f 1e fa          	endbr64 
    1a02:	55                   	push   %rbp
    1a03:	48 89 e5             	mov    %rsp,%rbp
    1a06:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1a0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a0e:	48 8b 00             	mov    (%rax),%rax
    1a11:	8b 00                	mov    (%rax),%eax
    1a13:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1a16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a1a:	48 8b 00             	mov    (%rax),%rax
    1a1d:	48 8b 50 08          	mov    0x8(%rax),%rdx
    1a21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a25:	48 89 10             	mov    %rdx,(%rax)
    1a28:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1a2b:	5d                   	pop    %rbp
    1a2c:	c3                   	ret    

0000000000001a2d <build_queue>:
    1a2d:	f3 0f 1e fa          	endbr64 
    1a31:	55                   	push   %rbp
    1a32:	48 89 e5             	mov    %rsp,%rbp
    1a35:	48 8d 05 24 49 00 00 	lea    0x4924(%rip),%rax        # 6360 <initialNodes+0x40>
    1a3c:	5d                   	pop    %rbp
    1a3d:	c3                   	ret    

0000000000001a3e <check_answer>:
    1a3e:	f3 0f 1e fa          	endbr64 
    1a42:	55                   	push   %rbp
    1a43:	48 89 e5             	mov    %rsp,%rbp
    1a46:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)         //%rdi是输入的参数
    1a4a:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)              
    1a51:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)         //-0x4(%rbp)为计数器，初始化为1
    1a58:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    1a5c:	7f 44                	jg     1aa2 <check_answer+0x64> //正确的jump
    1a5e:	8b 45 fc             	mov    -0x4(%rbp),%eax         //%eax = 计数器值
    1a61:	48 98                	cltq   
    1a63:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx       //%rdx = 4 * %rax
    1a6a:	00 
    1a6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax        //%rax = ？
    1a6f:	48 01 d0             	add    %rdx,%rax               //%rax 加 %rdx
    1a72:	8b 10                	mov    (%rax),%edx             //%edx = %rax
    1a74:	8b 45 fc             	mov    -0x4(%rbp),%eax         //%eax 重置为计数器值
    1a77:	48 98                	cltq   
    1a79:	48 c1 e0 02          	shl    $0x2,%rax               //%rax左移2位，即乘4
    1a7d:	48 8d 48 fc          	lea    -0x4(%rax),%rcx         //%rcx = %rax - 0x4
    1a81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax        //又把%rax改回去
    1a85:	48 01 c8             	add    %rcx,%rax               //%rax加上%rcx
    1a88:	8b 00                	mov    (%rax),%eax              
    1a8a:	39 c2                	cmp    %eax,%edx                //必须实现每次 %edx >= %eax,动态查看两个寄存器并清晰化上述逻辑
    1a8c:	7d 0e                	jge    1a9c <check_answer+0x5e> //回跳中介，不跳不行
    1a8e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1a95:	b8 00 00 00 00       	mov    $0x0,%eax
    1a9a:	eb 0b                	jmp    1aa7 <check_answer+0x69> //错误的jump
    1a9c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)          //计数器加1
    1aa0:	eb b6                	jmp    1a58 <check_answer+0x1a> //回跳反复比较
    1aa2:	b8 01 00 00 00       	mov    $0x1,%eax
    1aa7:	5d                   	pop    %rbp
    1aa8:	c3                   	ret    

0000000000001aa9 <build_target>:                                        //相当复杂，大致是根据输入的数字序列创造一个新序列
    1aa9:	f3 0f 1e fa          	endbr64 
    1aad:	55                   	push   %rbp
    1aae:	48 89 e5             	mov    %rsp,%rbp
    1ab1:	41 57                	push   %r15
    1ab3:	41 56                	push   %r14
    1ab5:	41 55                	push   %r13
    1ab7:	41 54                	push   %r12
    1ab9:	53                   	push   %rbx
    1aba:	48 83 ec 78          	sub    $0x78,%rsp
    1abe:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
    1ac5:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
    1acc:	00 
    1acd:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    1ad4:	00 
    1ad5:	e8 53 ff ff ff       	call   1a2d <build_queue>
    1ada:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1ade:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1ae2:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    1ae6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1aea:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    1aee:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
    1af5:	83 7d c4 05          	cmpl   $0x5,-0x3c(%rbp)
    1af9:	0f 8f 65 01 00 00    	jg     1c64 <build_target+0x1bb>
    1aff:	48 89 e0             	mov    %rsp,%rax
    1b02:	48 89 c3             	mov    %rax,%rbx
    1b05:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1b08:	48 98                	cltq   
    1b0a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1b11:	00 
    1b12:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1b19:	48 01 d0             	add    %rdx,%rax
    1b1c:	8b 00                	mov    (%rax),%eax
    1b1e:	89 45 b4             	mov    %eax,-0x4c(%rbp)
    1b21:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    1b24:	48 98                	cltq   
    1b26:	48 83 e8 01          	sub    $0x1,%rax
    1b2a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    1b2e:	48 89 c2             	mov    %rax,%rdx
    1b31:	48 83 c2 01          	add    $0x1,%rdx
    1b35:	49 89 d4             	mov    %rdx,%r12
    1b38:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    1b3e:	48 89 c2             	mov    %rax,%rdx
    1b41:	48 83 c2 01          	add    $0x1,%rdx
    1b45:	49 89 d6             	mov    %rdx,%r14
    1b48:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    1b4e:	48 83 c0 01          	add    $0x1,%rax
    1b52:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1b59:	00 
    1b5a:	b8 10 00 00 00       	mov    $0x10,%eax
    1b5f:	48 83 e8 01          	sub    $0x1,%rax
    1b63:	48 01 d0             	add    %rdx,%rax
    1b66:	b9 10 00 00 00       	mov    $0x10,%ecx
    1b6b:	ba 00 00 00 00       	mov    $0x0,%edx
    1b70:	48 f7 f1             	div    %rcx
    1b73:	48 6b c0 10          	imul   $0x10,%rax,%rax
    1b77:	48 89 c2             	mov    %rax,%rdx
    1b7a:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
    1b81:	48 89 e6             	mov    %rsp,%rsi
    1b84:	48 29 d6             	sub    %rdx,%rsi
    1b87:	48 89 f2             	mov    %rsi,%rdx
    1b8a:	48 39 d4             	cmp    %rdx,%rsp
    1b8d:	74 12                	je     1ba1 <build_target+0xf8>
    1b8f:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1b96:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
    1b9d:	00 00 
    1b9f:	eb e9                	jmp    1b8a <build_target+0xe1>
    1ba1:	48 89 c2             	mov    %rax,%rdx
    1ba4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1baa:	48 29 d4             	sub    %rdx,%rsp
    1bad:	48 89 c2             	mov    %rax,%rdx
    1bb0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1bb6:	48 85 d2             	test   %rdx,%rdx
    1bb9:	74 10                	je     1bcb <build_target+0x122>
    1bbb:	25 ff 0f 00 00       	and    $0xfff,%eax
    1bc0:	48 83 e8 08          	sub    $0x8,%rax
    1bc4:	48 01 e0             	add    %rsp,%rax
    1bc7:	48 83 08 00          	orq    $0x0,(%rax)
    1bcb:	48 89 e0             	mov    %rsp,%rax
    1bce:	48 83 c0 03          	add    $0x3,%rax
    1bd2:	48 c1 e8 02          	shr    $0x2,%rax
    1bd6:	48 c1 e0 02          	shl    $0x2,%rax
    1bda:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    1bde:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    1be5:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1be8:	3b 45 b4             	cmp    -0x4c(%rbp),%eax
    1beb:	7d 1f                	jge    1c0c <build_target+0x163>
    1bed:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    1bf1:	48 89 c7             	mov    %rax,%rdi
    1bf4:	e8 05 fe ff ff       	call   19fe <get_val>
    1bf9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    1bfd:	8b 4d c8             	mov    -0x38(%rbp),%ecx
    1c00:	48 63 c9             	movslq %ecx,%rcx
    1c03:	89 04 8a             	mov    %eax,(%rdx,%rcx,4)
    1c06:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
    1c0a:	eb d9                	jmp    1be5 <build_target+0x13c>
    1c0c:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    1c0f:	8d 50 ff             	lea    -0x1(%rax),%edx
    1c12:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1c16:	48 63 d2             	movslq %edx,%rdx
    1c19:	8b 14 90             	mov    (%rax,%rdx,4),%edx
    1c1c:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1c1f:	48 98                	cltq   
    1c21:	89 94 85 70 ff ff ff 	mov    %edx,-0x90(%rbp,%rax,4)
    1c28:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    1c2b:	83 e8 01             	sub    $0x1,%eax
    1c2e:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1c31:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    1c35:	78 21                	js     1c58 <build_target+0x1af>
    1c37:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1c3b:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1c3e:	48 63 d2             	movslq %edx,%rdx
    1c41:	8b 14 90             	mov    (%rax,%rdx,4),%edx
    1c44:	48 8d 45 88          	lea    -0x78(%rbp),%rax
    1c48:	89 d6                	mov    %edx,%esi
    1c4a:	48 89 c7             	mov    %rax,%rdi
    1c4d:	e8 7c fd ff ff       	call   19ce <put_val>
    1c52:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    1c56:	eb d9                	jmp    1c31 <build_target+0x188>
    1c58:	48 89 dc             	mov    %rbx,%rsp
    1c5b:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
    1c5f:	e9 91 fe ff ff       	jmp    1af5 <build_target+0x4c>
    1c64:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
    1c6b:	48 89 c7             	mov    %rax,%rdi
    1c6e:	e8 cb fd ff ff       	call   1a3e <check_answer>
    1c73:	88 45 9f             	mov    %al,-0x61(%rbp)
    1c76:	0f b6 45 9f          	movzbl -0x61(%rbp),%eax
    1c7a:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    1c7e:	5b                   	pop    %rbx
    1c7f:	41 5c                	pop    %r12
    1c81:	41 5d                	pop    %r13
    1c83:	41 5e                	pop    %r14
    1c85:	41 5f                	pop    %r15
    1c87:	5d                   	pop    %rbp
    1c88:	c3                   	ret    

0000000000001c89 <phase_6>:
    1c89:	f3 0f 1e fa          	endbr64 
    1c8d:	55                   	push   %rbp
    1c8e:	48 89 e5             	mov    %rsp,%rbp
    1c91:	48 83 ec 30          	sub    $0x30,%rsp
    1c95:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    1c99:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1c9d:	48 8d 35 4c 46 00 00 	lea    0x464c(%rip),%rsi        # 62f0 <phase_6_nums>
    1ca4:	48 89 c7             	mov    %rax,%rdi
    1ca7:	e8 0c 05 00 00       	call   21b8 <read_six_numbers>     //又读6个数字，输入格式没变
    1cac:	48 8d 05 3d 46 00 00 	lea    0x463d(%rip),%rax        # 62f0 <phase_6_nums>   //phase_6_nums,表征输入的前两个数
    1cb3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)                                 //保存%rax
    1cb7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)                                  //起始计数为0
    1cbe:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)              //依次比较
    1cc2:	7f 40                	jg     1d04 <phase_6+0x7b>          //比完jump
    1cc4:	8b 45 fc             	mov    -0x4(%rbp),%eax                                  //载入计数数
    1cc7:	48 98                	cltq   
    1cc9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx                                //%rdx = 4*%rax
    1cd0:	00 
    1cd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax                                 //重载%rax
    1cd5:	48 01 d0             	add    %rdx,%rax                                        //%rax 加上 %rdx
    1cd8:	8b 00                	mov    (%rax),%eax                                      //取后32位
    1cda:	83 f8 06             	cmp    $0x6,%eax                //和6比大小==>可以发现每次和6比大小的就是输入的数，故输入的数不能大于6
    1cdd:	7f 1a                	jg     1cf9 <phase_6+0x70>      //大就爆 
    1cdf:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1ce2:	48 98                	cltq   
    1ce4:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1ceb:	00                                                                  
    1cec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cf0:	48 01 d0             	add    %rdx,%rax
    1cf3:	8b 00                	mov    (%rax),%eax
    1cf5:	85 c0                	test   %eax,%eax            //%eax == 0
    1cf7:	79 05                	jns    1cfe <phase_6+0x75>  //SF == 0，必须跳
    1cf9:	e8 5c 03 00 00       	call   205a <explode_bomb>
    1cfe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1d02:	eb ba                	jmp    1cbe <phase_6+0x35>                              //回跳
    1d04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax                                 //输入6个不大于6的数后进入
    1d08:	48 89 c7             	mov    %rax,%rdi
    1d0b:	e8 99 fd ff ff       	call   1aa9 <build_target>   //查看该函数的输入，逆向跟踪可以发现%rsi是输入的最后一个数，%rdi包含了第1第2个输入的数的数据
    1d10:	88 45 ef             	mov    %al,-0x11(%rbp)       //必须return %al = 1
    1d13:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    1d17:	83 f0 01             	xor    $0x1,%eax            //%eax == 1
    1d1a:	84 c0                	test   %al,%al              //%al == 0
    1d1c:	74 05                	je     1d23 <phase_6+0x9a> //必须jump
    1d1e:	e8 37 03 00 00       	call   205a <explode_bomb>
    1d23:	90                   	nop
    1d24:	c9                   	leave  
    1d25:	c3                   	ret    

0000000000001d26 <_Z28print_candidate_line_inorderP4node>:
    1d26:	f3 0f 1e fa          	endbr64 
    1d2a:	55                   	push   %rbp
    1d2b:	48 89 e5             	mov    %rsp,%rbp
    1d2e:	48 83 ec 20          	sub    $0x20,%rsp
    1d32:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1d36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d3a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1d3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1d45:	83 7d f4 05          	cmpl   $0x5,-0xc(%rbp)
    1d49:	7f 2b                	jg     1d76 <_Z28print_candidate_line_inorderP4node+0x50>
    1d4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1d4f:	8b 00                	mov    (%rax),%eax
    1d51:	89 c6                	mov    %eax,%esi
    1d53:	48 8d 3d b6 15 00 00 	lea    0x15b6(%rip),%rdi        # 3310 <_ZNSt8__detailL19_S_invalid_state_idE+0xd0>
    1d5a:	b8 00 00 00 00       	mov    $0x0,%eax
    1d5f:	e8 dc f3 ff ff       	call   1140 <printf@plt>
    1d64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1d68:	48 8b 40 08          	mov    0x8(%rax),%rax
    1d6c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1d70:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1d74:	eb cf                	jmp    1d45 <_Z28print_candidate_line_inorderP4node+0x1f>
    1d76:	90                   	nop
    1d77:	c9                   	leave  
    1d78:	c3                   	ret    

0000000000001d79 <_Z25print_answer_line_inorderPi>:
    1d79:	f3 0f 1e fa          	endbr64 
    1d7d:	55                   	push   %rbp
    1d7e:	48 89 e5             	mov    %rsp,%rbp
    1d81:	48 83 ec 20          	sub    $0x20,%rsp
    1d85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1d89:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1d90:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    1d94:	7f 2f                	jg     1dc5 <_Z25print_answer_line_inorderPi+0x4c>
    1d96:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1d99:	48 98                	cltq   
    1d9b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1da2:	00 
    1da3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1da7:	48 01 d0             	add    %rdx,%rax
    1daa:	8b 00                	mov    (%rax),%eax
    1dac:	89 c6                	mov    %eax,%esi
    1dae:	48 8d 3d 5b 15 00 00 	lea    0x155b(%rip),%rdi        # 3310 <_ZNSt8__detailL19_S_invalid_state_idE+0xd0>
    1db5:	b8 00 00 00 00       	mov    $0x0,%eax
    1dba:	e8 81 f3 ff ff       	call   1140 <printf@plt>
    1dbf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1dc3:	eb cb                	jmp    1d90 <_Z25print_answer_line_inorderPi+0x17>
    1dc5:	90                   	nop
    1dc6:	c9                   	leave  
    1dc7:	c3                   	ret    

0000000000001dc8 <secret_phase>:
    1dc8:	f3 0f 1e fa          	endbr64 
    1dcc:	55                   	push   %rbp
    1dcd:	48 89 e5             	mov    %rsp,%rbp
    1dd0:	48 83 ec 20          	sub    $0x20,%rsp
    1dd4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1dd8:	eb ff                	jmp    1dd9 <secret_phase+0x11>
    1dda:	c0 48 8d 3d          	rorb   $0x3d,-0x73(%rax)
    1dde:	32 15 00 00 e8 29    	xor    0x29e80000(%rip),%dl        # 29e81de4 <_end+0x29e7ba54>
    1de4:	f4                   	hlt    
    1de5:	ff                   	(bad)  
    1de6:	ff c7                	inc    %edi
    1de8:	45 fc                	rex.RB cld 
    1dea:	de c0                	faddp  %st,%st(0)
    1dec:	ad                   	lods   %ds:(%rsi),%eax
    1ded:	de 48 8d             	fimuls -0x73(%rax)
    1df0:	55                   	push   %rbp
    1df1:	f8                   	clc    
    1df2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1df6:	48 8d 35 1c 15 00 00 	lea    0x151c(%rip),%rsi        # 3319 <_ZNSt8__detailL19_S_invalid_state_idE+0xd9>
    1dfd:	48 89 c7             	mov    %rax,%rdi
    1e00:	b8 00 00 00 00       	mov    $0x0,%eax
    1e05:	e8 66 f3 ff ff       	call   1170 <__isoc99_sscanf@plt>       //"%ud" unsigned int
    1e0a:	83 f8 01             	cmp    $0x1,%eax
    1e0d:	0f 95 c0             	setne  %al
    1e10:	84 c0                	test   %al,%al
    1e12:	74 05                	je     1e19 <secret_phase+0x51>         //读进去就jump了
    1e14:	e8 41 02 00 00       	call   205a <explode_bomb>
    1e19:	8b 45 f8             	mov    -0x8(%rbp),%eax                  //%rbp-0x8是之前输入的东西
    1e1c:	33 45 fc             	xor    -0x4(%rbp),%eax                  //%rbp-0x4是给定的0xdeadc0de
    1e1f:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1e22:	8b 45 f8             	mov    -0x8(%rbp),%eax                  //取后32位
    1e25:	3d 0d f0 ad ba       	cmp    $0xbaadf00d,%eax                 //%eax的比较
    1e2a:	74 05                	je     1e31 <secret_phase+0x69>         //胜利
    1e2c:	e8 29 02 00 00       	call   205a <explode_bomb>
    1e31:	90                   	nop
    1e32:	c9                   	leave  
    1e33:	c3                   	ret    

0000000000001e34 <_Z41__static_initialization_and_destruction_0ii>:
    1e34:	f3 0f 1e fa          	endbr64 
    1e38:	55                   	push   %rbp
    1e39:	48 89 e5             	mov    %rsp,%rbp
    1e3c:	48 83 ec 10          	sub    $0x10,%rsp
    1e40:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1e43:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1e46:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    1e4a:	75 32                	jne    1e7e <_Z41__static_initialization_and_destruction_0ii+0x4a>
    1e4c:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    1e53:	75 29                	jne    1e7e <_Z41__static_initialization_and_destruction_0ii+0x4a>
    1e55:	48 8d 3d 2d 45 00 00 	lea    0x452d(%rip),%rdi        # 6389 <_ZStL8__ioinit>
    1e5c:	e8 9f f3 ff ff       	call   1200 <_ZNSt8ios_base4InitC1Ev@plt>
    1e61:	48 8d 15 a0 41 00 00 	lea    0x41a0(%rip),%rdx        # 6008 <__dso_handle>
    1e68:	48 8d 35 1a 45 00 00 	lea    0x451a(%rip),%rsi        # 6389 <_ZStL8__ioinit>
    1e6f:	48 8b 05 82 41 00 00 	mov    0x4182(%rip),%rax        # 5ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    1e76:	48 89 c7             	mov    %rax,%rdi
    1e79:	e8 e2 f2 ff ff       	call   1160 <__cxa_atexit@plt>
    1e7e:	90                   	nop
    1e7f:	c9                   	leave  
    1e80:	c3                   	ret    

0000000000001e81 <_GLOBAL__sub_I_phase_1_str>:
    1e81:	f3 0f 1e fa          	endbr64 
    1e85:	55                   	push   %rbp
    1e86:	48 89 e5             	mov    %rsp,%rbp
    1e89:	be ff ff 00 00       	mov    $0xffff,%esi
    1e8e:	bf 01 00 00 00       	mov    $0x1,%edi
    1e93:	e8 9c ff ff ff       	call   1e34 <_Z41__static_initialization_and_destruction_0ii>
    1e98:	5d                   	pop    %rbp
    1e99:	c3                   	ret    

0000000000001e9a <_ZN9worldlineC1Ev>:
    1e9a:	f3 0f 1e fa          	endbr64 
    1e9e:	55                   	push   %rbp
    1e9f:	48 89 e5             	mov    %rsp,%rbp
    1ea2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ea6:	48 8d 15 1b 3e 00 00 	lea    0x3e1b(%rip),%rdx        # 5cc8 <__cxa_pure_virtual@CXXABI_1.3>
    1ead:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1eb1:	48 89 10             	mov    %rdx,(%rax)
    1eb4:	90                   	nop
    1eb5:	5d                   	pop    %rbp
    1eb6:	c3                   	ret    
    1eb7:	90                   	nop

0000000000001eb8 <_ZN9worldline18is_phase5_passableEv>:
    1eb8:	f3 0f 1e fa          	endbr64 
    1ebc:	55                   	push   %rbp
    1ebd:	48 89 e5             	mov    %rsp,%rbp
    1ec0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ec4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ec8:	48 8b 40 08          	mov    0x8(%rax),%rax
    1ecc:	48 3d 3f 42 0f 00    	cmp    $0xf423f,%rax
    1ed2:	0f 9f c0             	setg   %al
    1ed5:	0f b6 c0             	movzbl %al,%eax
    1ed8:	5d                   	pop    %rbp
    1ed9:	c3                   	ret    

0000000000001eda <_ZN10worldline1C1Ev>:
    1eda:	f3 0f 1e fa          	endbr64 
    1ede:	55                   	push   %rbp
    1edf:	48 89 e5             	mov    %rsp,%rbp
    1ee2:	48 83 ec 10          	sub    $0x10,%rsp
    1ee6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1eea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1eee:	48 89 c7             	mov    %rax,%rdi
    1ef1:	e8 a4 ff ff ff       	call   1e9a <_ZN9worldlineC1Ev>
    1ef6:	48 8d 15 a3 3d 00 00 	lea    0x3da3(%rip),%rdx        # 5ca0 <_ZTV10worldline1+0x10>
    1efd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f01:	48 89 10             	mov    %rdx,(%rax)
    1f04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f08:	48 c7 40 08 90 b6 08 	movq   $0x8b690,0x8(%rax)
    1f0f:	00 
    1f10:	90                   	nop
    1f11:	c9                   	leave  
    1f12:	c3                   	ret    
    1f13:	90                   	nop

0000000000001f14 <_ZN10worldline112isWorldPeaceEv>:
    1f14:	f3 0f 1e fa          	endbr64 
    1f18:	55                   	push   %rbp
    1f19:	48 89 e5             	mov    %rsp,%rbp
    1f1c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1f20:	b8 00 00 00 00       	mov    $0x0,%eax
    1f25:	5d                   	pop    %rbp
    1f26:	c3                   	ret    
    1f27:	90                   	nop

0000000000001f28 <_ZN10worldline115isEveryoneEqualEv>:
    1f28:	f3 0f 1e fa          	endbr64 
    1f2c:	55                   	push   %rbp
    1f2d:	48 89 e5             	mov    %rsp,%rbp
    1f30:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1f34:	b8 01 00 00 00       	mov    $0x1,%eax
    1f39:	5d                   	pop    %rbp
    1f3a:	c3                   	ret    
    1f3b:	90                   	nop

0000000000001f3c <_ZN10worldline15dmailEi>:
    1f3c:	f3 0f 1e fa          	endbr64 
    1f40:	55                   	push   %rbp
    1f41:	48 89 e5             	mov    %rsp,%rbp
    1f44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1f48:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1f4b:	81 7d f4 e2 07 00 00 	cmpl   $0x7e2,-0xc(%rbp)
    1f52:	0f 94 c0             	sete   %al
    1f55:	0f b6 c0             	movzbl %al,%eax
    1f58:	5d                   	pop    %rbp
    1f59:	c3                   	ret    

0000000000001f5a <_ZN10worldline2C1Ev>:
    1f5a:	f3 0f 1e fa          	endbr64 
    1f5e:	55                   	push   %rbp
    1f5f:	48 89 e5             	mov    %rsp,%rbp
    1f62:	48 83 ec 10          	sub    $0x10,%rsp
    1f66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1f6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f6e:	48 89 c7             	mov    %rax,%rdi
    1f71:	e8 24 ff ff ff       	call   1e9a <_ZN9worldlineC1Ev>
    1f76:	48 8d 15 fb 3c 00 00 	lea    0x3cfb(%rip),%rdx        # 5c78 <_ZTV10worldline2+0x10>
    1f7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f81:	48 89 10             	mov    %rdx,(%rax)
    1f84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f88:	48 c7 40 08 d2 f8 06 	movq   $0x6f8d2,0x8(%rax)
    1f8f:	00 
    1f90:	90                   	nop
    1f91:	c9                   	leave  
    1f92:	c3                   	ret    
    1f93:	90                   	nop

0000000000001f94 <_ZN10worldline212isWorldPeaceEv>:
    1f94:	f3 0f 1e fa          	endbr64 
    1f98:	55                   	push   %rbp
    1f99:	48 89 e5             	mov    %rsp,%rbp
    1f9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1fa0:	b8 01 00 00 00       	mov    $0x1,%eax
    1fa5:	5d                   	pop    %rbp
    1fa6:	c3                   	ret    
    1fa7:	90                   	nop

0000000000001fa8 <_ZN10worldline215isEveryoneEqualEv>:
    1fa8:	f3 0f 1e fa          	endbr64 
    1fac:	55                   	push   %rbp
    1fad:	48 89 e5             	mov    %rsp,%rbp
    1fb0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1fb4:	b8 00 00 00 00       	mov    $0x0,%eax
    1fb9:	5d                   	pop    %rbp
    1fba:	c3                   	ret    
    1fbb:	90                   	nop

0000000000001fbc <_ZN10worldline25dmailEi>:
    1fbc:	f3 0f 1e fa          	endbr64 
    1fc0:	55                   	push   %rbp
    1fc1:	48 89 e5             	mov    %rsp,%rbp
    1fc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1fc8:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1fcb:	81 7d f4 e5 07 00 00 	cmpl   $0x7e5,-0xc(%rbp)
    1fd2:	0f 94 c0             	sete   %al
    1fd5:	0f b6 c0             	movzbl %al,%eax
    1fd8:	5d                   	pop    %rbp
    1fd9:	c3                   	ret    

0000000000001fda <_ZN10worldline3C1Ev>:
    1fda:	f3 0f 1e fa          	endbr64 
    1fde:	55                   	push   %rbp
    1fdf:	48 89 e5             	mov    %rsp,%rbp
    1fe2:	48 83 ec 10          	sub    $0x10,%rsp
    1fe6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1fea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1fee:	48 89 c7             	mov    %rax,%rdi
    1ff1:	e8 a4 fe ff ff       	call   1e9a <_ZN9worldlineC1Ev>
    1ff6:	48 8d 15 53 3c 00 00 	lea    0x3c53(%rip),%rdx        # 5c50 <_ZTV10worldline3+0x10>
    1ffd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2001:	48 89 10             	mov    %rdx,(%rax)
    2004:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2008:	48 c7 40 08 fd 24 11 	movq   $0x1124fd,0x8(%rax)
    200f:	00 
    2010:	90                   	nop
    2011:	c9                   	leave  
    2012:	c3                   	ret    
    2013:	90                   	nop

0000000000002014 <_ZN10worldline312isWorldPeaceEv>:
    2014:	f3 0f 1e fa          	endbr64 
    2018:	55                   	push   %rbp
    2019:	48 89 e5             	mov    %rsp,%rbp
    201c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2020:	b8 01 00 00 00       	mov    $0x1,%eax
    2025:	5d                   	pop    %rbp
    2026:	c3                   	ret    
    2027:	90                   	nop

0000000000002028 <_ZN10worldline315isEveryoneEqualEv>:
    2028:	f3 0f 1e fa          	endbr64 
    202c:	55                   	push   %rbp
    202d:	48 89 e5             	mov    %rsp,%rbp
    2030:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2034:	b8 01 00 00 00       	mov    $0x1,%eax
    2039:	5d                   	pop    %rbp
    203a:	c3                   	ret    
    203b:	90                   	nop

000000000000203c <_ZN10worldline35dmailEi>:
    203c:	f3 0f 1e fa          	endbr64 
    2040:	55                   	push   %rbp
    2041:	48 89 e5             	mov    %rsp,%rbp
    2044:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2048:	89 75 f4             	mov    %esi,-0xc(%rbp)
    204b:	81 7d f4 e7 07 00 00 	cmpl   $0x7e7,-0xc(%rbp)
    2052:	0f 94 c0             	sete   %al
    2055:	0f b6 c0             	movzbl %al,%eax
    2058:	5d                   	pop    %rbp
    2059:	c3                   	ret    

000000000000205a <explode_bomb>:
    205a:	f3 0f 1e fa          	endbr64 
    205e:	55                   	push   %rbp
    205f:	48 89 e5             	mov    %rsp,%rbp
    2062:	48 83 ec 10          	sub    $0x10,%rsp
    2066:	48 8d 3d f3 12 00 00 	lea    0x12f3(%rip),%rdi        # 3360 <_ZTS9worldline+0x10>
    206d:	e8 9e f1 ff ff       	call   1210 <puts@plt>  //boom
    2072:	48 8d 35 ef 12 00 00 	lea    0x12ef(%rip),%rsi        # 3368 <_ZTS9worldline+0x18>
    2079:	48 8d 3d ea 12 00 00 	lea    0x12ea(%rip),%rdi        # 336a <_ZTS9worldline+0x1a>
    2080:	e8 2b f1 ff ff       	call   11b0 <fopen@plt>
    2085:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2089:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    208e:	0f 94 c0             	sete   %al
    2091:	84 c0                	test   %al,%al
    2093:	74 0a                	je     209f <explode_bomb+0x45>
    2095:	bf 01 00 00 00       	mov    $0x1,%edi
    209a:	e8 21 f1 ff ff       	call   11c0 <exit@plt>
    209f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20a3:	48 89 c7             	mov    %rax,%rdi
    20a6:	e8 75 f1 ff ff       	call   1220 <feof@plt>
    20ab:	85 c0                	test   %eax,%eax
    20ad:	0f 94 c0             	sete   %al
    20b0:	84 c0                	test   %al,%al
    20b2:	74 22                	je     20d6 <explode_bomb+0x7c>
    20b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20b8:	48 89 c7             	mov    %rax,%rdi
    20bb:	e8 70 f1 ff ff       	call   1230 <fgetc@plt>
    20c0:	88 45 f7             	mov    %al,-0x9(%rbp)
    20c3:	80 7d f7 ff          	cmpb   $0xff,-0x9(%rbp)
    20c7:	74 d6                	je     209f <explode_bomb+0x45>
    20c9:	0f be 45 f7          	movsbl -0x9(%rbp),%eax
    20cd:	89 c7                	mov    %eax,%edi
    20cf:	e8 0c f1 ff ff       	call   11e0 <putchar@plt>
    20d4:	eb c9                	jmp    209f <explode_bomb+0x45>
    20d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20da:	48 89 c7             	mov    %rax,%rdi
    20dd:	e8 9e f0 ff ff       	call   1180 <fclose@plt>
    20e2:	bf 01 00 00 00       	mov    $0x1,%edi
    20e7:	e8 d4 f0 ff ff       	call   11c0 <exit@plt>

00000000000020ec <slow_put>:
    20ec:	f3 0f 1e fa          	endbr64 
    20f0:	55                   	push   %rbp
    20f1:	48 89 e5             	mov    %rsp,%rbp
    20f4:	48 83 ec 20          	sub    $0x20,%rsp
    20f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    20fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2100:	0f b6 00             	movzbl (%rax),%eax
    2103:	84 c0                	test   %al,%al
    2105:	74 48                	je     214f <slow_put+0x63>
    2107:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    210b:	0f b6 00             	movzbl (%rax),%eax
    210e:	0f be c0             	movsbl %al,%eax
    2111:	89 c7                	mov    %eax,%edi
    2113:	e8 c8 f0 ff ff       	call   11e0 <putchar@plt>
    2118:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    211d:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    2124:	00 
    2125:	48 c7 45 f8 80 f0 fa 	movq   $0x2faf080,-0x8(%rbp)
    212c:	02 
    212d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    2131:	be 00 00 00 00       	mov    $0x0,%esi
    2136:	48 89 c7             	mov    %rax,%rdi
    2139:	e8 12 f0 ff ff       	call   1150 <nanosleep@plt>
    213e:	48 8b 05 3b 42 00 00 	mov    0x423b(%rip),%rax        # 6380 <stdout@GLIBC_2.2.5>
    2145:	48 89 c7             	mov    %rax,%rdi
    2148:	e8 53 f0 ff ff       	call   11a0 <fflush@plt>
    214d:	eb ad                	jmp    20fc <slow_put+0x10>
    214f:	90                   	nop
    2150:	c9                   	leave  
    2151:	c3                   	ret    

0000000000002152 <slow_slow_put>:
    2152:	f3 0f 1e fa          	endbr64 
    2156:	55                   	push   %rbp
    2157:	48 89 e5             	mov    %rsp,%rbp
    215a:	48 83 ec 20          	sub    $0x20,%rsp
    215e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2162:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2166:	0f b6 00             	movzbl (%rax),%eax
    2169:	84 c0                	test   %al,%al
    216b:	74 48                	je     21b5 <slow_slow_put+0x63>
    216d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2171:	0f b6 00             	movzbl (%rax),%eax
    2174:	0f be c0             	movsbl %al,%eax
    2177:	89 c7                	mov    %eax,%edi
    2179:	e8 62 f0 ff ff       	call   11e0 <putchar@plt>
    217e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    2183:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    218a:	00 
    218b:	48 c7 45 f8 00 e1 f5 	movq   $0x5f5e100,-0x8(%rbp)
    2192:	05 
    2193:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    2197:	be 00 00 00 00       	mov    $0x0,%esi
    219c:	48 89 c7             	mov    %rax,%rdi
    219f:	e8 ac ef ff ff       	call   1150 <nanosleep@plt>
    21a4:	48 8b 05 d5 41 00 00 	mov    0x41d5(%rip),%rax        # 6380 <stdout@GLIBC_2.2.5>
    21ab:	48 89 c7             	mov    %rax,%rdi
    21ae:	e8 ed ef ff ff       	call   11a0 <fflush@plt>
    21b3:	eb ad                	jmp    2162 <slow_slow_put+0x10>
    21b5:	90                   	nop
    21b6:	c9                   	leave  
    21b7:	c3                   	ret    

00000000000021b8 <read_six_numbers>:
    21b8:	f3 0f 1e fa          	endbr64 
    21bc:	55                   	push   %rbp
    21bd:	48 89 e5             	mov    %rsp,%rbp                //存old %rbp
    21c0:	48 83 ec 20          	sub    $0x20,%rsp               //划分空间
    21c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)         //存了两个输入
    21c8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    21cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21d0:	48 8d 78 14          	lea    0x14(%rax),%rdi
    21d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21d8:	48 8d 70 10          	lea    0x10(%rax),%rsi
    21dc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21e0:	4c 8d 48 0c          	lea    0xc(%rax),%r9
    21e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21e8:	4c 8d 40 08          	lea    0x8(%rax),%r8
    21ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21f0:	48 8d 48 04          	lea    0x4(%rax),%rcx
    21f4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    21f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    21fc:	57                   	push   %rdi
    21fd:	56                   	push   %rsi
    21fe:	48 8d 35 6e 11 00 00 	lea    0x116e(%rip),%rsi        # 3373 <_ZTS9worldline+0x23>
    2205:	48 89 c7             	mov    %rax,%rdi                                                    //将返回值%rax变为输入值%rdi
    2208:	b8 00 00 00 00       	mov    $0x0,%eax                                                    //%eax归0
    220d:	e8 5e ef ff ff       	call   1170 <__isoc99_sscanf@plt>                                   //scanf返回读取到的数量
    2212:	48 83 c4 10          	add    $0x10,%rsp                                                   
    2216:	89 45 fc             	mov    %eax,-0x4(%rbp)                                              //读到了6个数
    2219:	83 7d fc 06          	cmpl   $0x6,-0x4(%rbp)                                              
    221d:	75 0a                	jne    2229 <read_six_numbers+0x71>                                 //直接爆了
    221f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2223:	8b 00                	mov    (%rax),%eax
    2225:	85 c0                	test   %eax,%eax
    2227:	75 05                	jne    222e <read_six_numbers+0x76>                                 //跳过引爆
    2229:	e8 2c fe ff ff       	call   205a <explode_bomb>                                          //引爆
    222e:	90                   	nop
    222f:	c9                   	leave  
    2230:	c3                   	ret    

0000000000002231 <true_ending>:
    2231:	f3 0f 1e fa          	endbr64 
    2235:	55                   	push   %rbp
    2236:	48 89 e5             	mov    %rsp,%rbp
    2239:	48 8d 3d 45 11 00 00 	lea    0x1145(%rip),%rdi        # 3385 <_ZTS9worldline+0x35>
    2240:	e8 cb ef ff ff       	call   1210 <puts@plt>
    2245:	48 8d 3d 4c 11 00 00 	lea    0x114c(%rip),%rdi        # 3398 <_ZTS9worldline+0x48>
    224c:	e8 bf ef ff ff       	call   1210 <puts@plt>
    2251:	48 8d 3d 68 11 00 00 	lea    0x1168(%rip),%rdi        # 33c0 <_ZTS9worldline+0x70>
    2258:	e8 b3 ef ff ff       	call   1210 <puts@plt>
    225d:	48 8d 3d 84 11 00 00 	lea    0x1184(%rip),%rdi        # 33e8 <_ZTS9worldline+0x98>
    2264:	e8 a7 ef ff ff       	call   1210 <puts@plt>
    2269:	48 8d 3d a8 11 00 00 	lea    0x11a8(%rip),%rdi        # 3418 <_ZTS9worldline+0xc8>
    2270:	e8 9b ef ff ff       	call   1210 <puts@plt>
    2275:	48 8d 3d ec 11 00 00 	lea    0x11ec(%rip),%rdi        # 3468 <_ZTS9worldline+0x118>
    227c:	e8 8f ef ff ff       	call   1210 <puts@plt>
    2281:	48 8d 3d 20 12 00 00 	lea    0x1220(%rip),%rdi        # 34a8 <_ZTS9worldline+0x158>
    2288:	e8 83 ef ff ff       	call   1210 <puts@plt>
    228d:	48 8d 3d 54 12 00 00 	lea    0x1254(%rip),%rdi        # 34e8 <_ZTS9worldline+0x198>
    2294:	e8 77 ef ff ff       	call   1210 <puts@plt>
    2299:	48 8d 3d c8 12 00 00 	lea    0x12c8(%rip),%rdi        # 3568 <_ZTS9worldline+0x218>
    22a0:	e8 6b ef ff ff       	call   1210 <puts@plt>
    22a5:	48 8d 3d 34 13 00 00 	lea    0x1334(%rip),%rdi        # 35e0 <_ZTS9worldline+0x290>
    22ac:	e8 5f ef ff ff       	call   1210 <puts@plt>
    22b1:	48 8d 3d 88 13 00 00 	lea    0x1388(%rip),%rdi        # 3640 <_ZTS9worldline+0x2f0>
    22b8:	e8 53 ef ff ff       	call   1210 <puts@plt>
    22bd:	48 8d 3d c4 13 00 00 	lea    0x13c4(%rip),%rdi        # 3688 <_ZTS9worldline+0x338>
    22c4:	e8 47 ef ff ff       	call   1210 <puts@plt>
    22c9:	48 8d 3d 08 14 00 00 	lea    0x1408(%rip),%rdi        # 36d8 <_ZTS9worldline+0x388>
    22d0:	e8 3b ef ff ff       	call   1210 <puts@plt>
    22d5:	48 8d 3d 3b 14 00 00 	lea    0x143b(%rip),%rdi        # 3717 <_ZTS9worldline+0x3c7>
    22dc:	e8 2f ef ff ff       	call   1210 <puts@plt>
    22e1:	48 8d 3d 50 14 00 00 	lea    0x1450(%rip),%rdi        # 3738 <_ZTS9worldline+0x3e8>
    22e8:	e8 23 ef ff ff       	call   1210 <puts@plt>
    22ed:	48 8d 3d 69 14 00 00 	lea    0x1469(%rip),%rdi        # 375d <_ZTS9worldline+0x40d>
    22f4:	e8 17 ef ff ff       	call   1210 <puts@plt>
    22f9:	48 8d 3d 78 14 00 00 	lea    0x1478(%rip),%rdi        # 3778 <_ZTS9worldline+0x428>
    2300:	e8 0b ef ff ff       	call   1210 <puts@plt>
    2305:	90                   	nop
    2306:	5d                   	pop    %rbp
    2307:	c3                   	ret    
    2308:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    230f:	00 

0000000000002310 <__libc_csu_init>:
    2310:	f3 0f 1e fa          	endbr64 
    2314:	41 57                	push   %r15
    2316:	4c 8d 3d 0b 39 00 00 	lea    0x390b(%rip),%r15        # 5c28 <__frame_dummy_init_array_entry>
    231d:	41 56                	push   %r14
    231f:	49 89 d6             	mov    %rdx,%r14
    2322:	41 55                	push   %r13
    2324:	49 89 f5             	mov    %rsi,%r13
    2327:	41 54                	push   %r12
    2329:	41 89 fc             	mov    %edi,%r12d
    232c:	55                   	push   %rbp
    232d:	48 8d 2d 04 39 00 00 	lea    0x3904(%rip),%rbp        # 5c38 <__do_global_dtors_aux_fini_array_entry>
    2334:	53                   	push   %rbx
    2335:	4c 29 fd             	sub    %r15,%rbp
    2338:	48 83 ec 08          	sub    $0x8,%rsp
    233c:	e8 bf ec ff ff       	call   1000 <_init>
    2341:	48 c1 fd 03          	sar    $0x3,%rbp
    2345:	74 1f                	je     2366 <__libc_csu_init+0x56>
    2347:	31 db                	xor    %ebx,%ebx
    2349:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2350:	4c 89 f2             	mov    %r14,%rdx
    2353:	4c 89 ee             	mov    %r13,%rsi
    2356:	44 89 e7             	mov    %r12d,%edi
    2359:	41 ff 14 df          	call   *(%r15,%rbx,8)
    235d:	48 83 c3 01          	add    $0x1,%rbx
    2361:	48 39 dd             	cmp    %rbx,%rbp
    2364:	75 ea                	jne    2350 <__libc_csu_init+0x40>
    2366:	48 83 c4 08          	add    $0x8,%rsp
    236a:	5b                   	pop    %rbx
    236b:	5d                   	pop    %rbp
    236c:	41 5c                	pop    %r12
    236e:	41 5d                	pop    %r13
    2370:	41 5e                	pop    %r14
    2372:	41 5f                	pop    %r15
    2374:	c3                   	ret    
    2375:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    237c:	00 00 00 00 

0000000000002380 <__libc_csu_fini>:
    2380:	f3 0f 1e fa          	endbr64 
    2384:	c3                   	ret    

Disassembly of section .fini:

0000000000002388 <_fini>:
    2388:	f3 0f 1e fa          	endbr64 
    238c:	48 83 ec 08          	sub    $0x8,%rsp
    2390:	48 83 c4 08          	add    $0x8,%rsp
    2394:	c3                   	ret    
