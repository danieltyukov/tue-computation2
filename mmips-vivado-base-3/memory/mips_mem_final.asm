
mips_mem_final.bin:     file format binary

Disassembly of section .data:

0000000000000000 <.data>:
       0:	00000000 	nop
       4:	3c1c0040 	lui	gp,0x40
       8:	279c0018 	addiu	gp,gp,24
       c:	3c1d0042 	lui	sp,0x42
      10:	27bd0000 	addiu	sp,sp,0
      14:	3c1e0042 	lui	s8,0x42
      18:	27de0000 	addiu	s8,s8,0
      1c:	3c040040 	lui	a0,0x40
      20:	24840024 	addiu	a0,a0,36
      24:	3c05003d 	lui	a1,0x3d
      28:	0c0000e4 	jal	0x390
      2c:	34a50900 	ori	a1,a1,0x900
      30:	00000000 	nop
      34:	00002021 	move	a0,zero
      38:	0c000028 	jal	0xa0
      3c:	00002821 	move	a1,zero
      40:	08000010 	j	0x40
	...
      60:	08000010 	j	0x40
	...
      80:	08000010 	j	0x40
	...
      a0:	27bdff90 	addiu	sp,sp,-112
      a4:	afb30010 	sw	s3,16(sp)
      a8:	afb40014 	sw	s4,20(sp)
      ac:	afb50018 	sw	s5,24(sp)
      b0:	afb6001c 	sw	s6,28(sp)
      b4:	afb70020 	sw	s7,32(sp)
      b8:	afbf0024 	sw	ra,36(sp)
      bc:	241800ff 	li	t8,255
      c0:	afb8006c 	sw	t8,108(sp)
      c4:	3c150040 	lui	s5,0x40
      c8:	36b51000 	ori	s5,s5,0x1000
      cc:	3c180040 	lui	t8,0x40
      d0:	37182000 	ori	t8,t8,0x2000
      d4:	afb80068 	sw	t8,104(sp)
      d8:	24160001 	li	s6,1
      dc:	24170001 	li	s7,1
      e0:	24180005 	li	t8,5
      e4:	afb80064 	sw	t8,100(sp)
      e8:	02c02021 	move	a0,s6
      ec:	0c0003ff 	jal	0xffc
      f0:	03002821 	move	a1,t8
      f4:	0040c021 	move	t8,v0
      f8:	afb80058 	sw	t8,88(sp)
      fc:	240ffff9 	li	t7,-7
     100:	afaf0054 	sw	t7,84(sp)
     104:	270effe0 	addiu	t6,t8,-32
     108:	01d77021 	addu	t6,t6,s7
     10c:	afae0060 	sw	t6,96(sp)
     110:	240d0001 	li	t5,1
     114:	afad005c 	sw	t5,92(sp)
     118:	01e02021 	move	a0,t7
     11c:	25ccffff 	addiu	t4,t6,-1
     120:	01956021 	addu	t4,t4,s5
     124:	81850000 	lb	a1,0(t4)
     128:	00000000 	nop
     12c:	00850019 	multu	a0,a1
     130:	00001012 	mflo	v0
     134:	0040c021 	move	t8,v0
     138:	afb80050 	sw	t8,80(sp)
     13c:	8faf0064 	lw	t7,100(sp)
     140:	00000000 	nop
     144:	01e02021 	move	a0,t7
     148:	8faf0060 	lw	t7,96(sp)
     14c:	00000000 	nop
     150:	01f57821 	addu	t7,t7,s5
     154:	81e50000 	lb	a1,0(t7)
     158:	00000000 	nop
     15c:	00850019 	multu	a0,a1
     160:	00001012 	mflo	v0
     164:	0040c021 	move	t8,v0
     168:	afb8004c 	sw	t8,76(sp)
     16c:	8faf0060 	lw	t7,96(sp)
     170:	00000000 	nop
     174:	25ef0001 	addiu	t7,t7,1
     178:	01f57821 	addu	t7,t7,s5
     17c:	81e40000 	lb	a0,0(t7)
     180:	8faf005c 	lw	t7,92(sp)
     184:	00000000 	nop
     188:	0c0003ff 	jal	0xffc
     18c:	01e02821 	move	a1,t7
     190:	0040c021 	move	t8,v0
     194:	afb80040 	sw	t8,64(sp)
     198:	240fffff 	li	t7,-1
     19c:	afaf0044 	sw	t7,68(sp)
     1a0:	8fae0058 	lw	t6,88(sp)
     1a4:	00000000 	nop
     1a8:	01d77021 	addu	t6,t6,s7
     1ac:	afae0048 	sw	t6,72(sp)
     1b0:	01e02021 	move	a0,t7
     1b4:	25cdffff 	addiu	t5,t6,-1
     1b8:	01b56821 	addu	t5,t5,s5
     1bc:	81a50000 	lb	a1,0(t5)
     1c0:	00000000 	nop
     1c4:	00850019 	multu	a0,a1
     1c8:	00001012 	mflo	v0
     1cc:	0040c021 	move	t8,v0
     1d0:	afb8003c 	sw	t8,60(sp)
     1d4:	2404000f 	li	a0,15
     1d8:	8faf0048 	lw	t7,72(sp)
     1dc:	00000000 	nop
     1e0:	01f57821 	addu	t7,t7,s5
     1e4:	81e50000 	lb	a1,0(t7)
     1e8:	00000000 	nop
     1ec:	00850019 	multu	a0,a1
     1f0:	00001012 	mflo	v0
     1f4:	0040c021 	move	t8,v0
     1f8:	afb80038 	sw	t8,56(sp)
     1fc:	8faf0044 	lw	t7,68(sp)
     200:	00000000 	nop
     204:	01e02021 	move	a0,t7
     208:	8faf0048 	lw	t7,72(sp)
     20c:	00000000 	nop
     210:	25ef0001 	addiu	t7,t7,1
     214:	01f57821 	addu	t7,t7,s5
     218:	81e50000 	lb	a1,0(t7)
     21c:	00000000 	nop
     220:	00850019 	multu	a0,a1
     224:	00001012 	mflo	v0
     228:	0040c021 	move	t8,v0
     22c:	afb80030 	sw	t8,48(sp)
     230:	8faf0058 	lw	t7,88(sp)
     234:	00000000 	nop
     238:	25ef0020 	addiu	t7,t7,32
     23c:	01f77821 	addu	t7,t7,s7
     240:	afaf0034 	sw	t7,52(sp)
     244:	25eeffff 	addiu	t6,t7,-1
     248:	01d57021 	addu	t6,t6,s5
     24c:	81c40000 	lb	a0,0(t6)
     250:	8fae005c 	lw	t6,92(sp)
     254:	00000000 	nop
     258:	0c0003ff 	jal	0xffc
     25c:	01c02821 	move	a1,t6
     260:	0040c021 	move	t8,v0
     264:	afb8002c 	sw	t8,44(sp)
     268:	8faf0064 	lw	t7,100(sp)
     26c:	00000000 	nop
     270:	01e02021 	move	a0,t7
     274:	8faf0034 	lw	t7,52(sp)
     278:	00000000 	nop
     27c:	01f57821 	addu	t7,t7,s5
     280:	81e50000 	lb	a1,0(t7)
     284:	00000000 	nop
     288:	00850019 	multu	a0,a1
     28c:	00001012 	mflo	v0
     290:	0040c021 	move	t8,v0
     294:	afb80028 	sw	t8,40(sp)
     298:	8faf0054 	lw	t7,84(sp)
     29c:	00000000 	nop
     2a0:	01e02021 	move	a0,t7
     2a4:	8faf0034 	lw	t7,52(sp)
     2a8:	00000000 	nop
     2ac:	25ef0001 	addiu	t7,t7,1
     2b0:	01f57821 	addu	t7,t7,s5
     2b4:	81e50000 	lb	a1,0(t7)
     2b8:	00000000 	nop
     2bc:	00850019 	multu	a0,a1
     2c0:	00001012 	mflo	v0
     2c4:	8faf0050 	lw	t7,80(sp)
     2c8:	8fae004c 	lw	t6,76(sp)
     2cc:	00000000 	nop
     2d0:	01ee7821 	addu	t7,t7,t6
     2d4:	8fae0040 	lw	t6,64(sp)
     2d8:	00000000 	nop
     2dc:	01ee7821 	addu	t7,t7,t6
     2e0:	8fae003c 	lw	t6,60(sp)
     2e4:	00000000 	nop
     2e8:	01ee7821 	addu	t7,t7,t6
     2ec:	8fae0038 	lw	t6,56(sp)
     2f0:	00000000 	nop
     2f4:	01ee7821 	addu	t7,t7,t6
     2f8:	8fae0030 	lw	t6,48(sp)
     2fc:	00000000 	nop
     300:	01ee7821 	addu	t7,t7,t6
     304:	8fae002c 	lw	t6,44(sp)
     308:	00000000 	nop
     30c:	01ee7821 	addu	t7,t7,t6
     310:	8fae0028 	lw	t6,40(sp)
     314:	00000000 	nop
     318:	01ee7821 	addu	t7,t7,t6
     31c:	01e2c021 	addu	t8,t7,v0
     320:	27040080 	addiu	a0,t8,128
     324:	0c00036a 	jal	0xda8
     328:	2405000d 	li	a1,13
     32c:	0040a021 	move	s4,v0
     330:	3c181234 	lui	t8,0x1234
     334:	8f184321 	lw	t8,17185(t8)
     338:	00000000 	nop
     33c:	271800ff 	addiu	t8,t8,255
     340:	02989823 	subu	s3,s4,t8
     344:	26f70001 	addiu	s7,s7,1
     348:	2418001f 	li	t8,31
     34c:	02f8f02a 	slt	s8,s7,t8
     350:	17c0ff63 	bnez	s8,0xe0
     354:	00000000 	nop
     358:	26d60001 	addiu	s6,s6,1
     35c:	2418001f 	li	t8,31
     360:	02d8f02a 	slt	s8,s6,t8
     364:	17c0ff5d 	bnez	s8,0xdc
     368:	00000000 	nop
     36c:	8fb30010 	lw	s3,16(sp)
     370:	8fb40014 	lw	s4,20(sp)
     374:	8fb50018 	lw	s5,24(sp)
     378:	8fb6001c 	lw	s6,28(sp)
     37c:	8fb70020 	lw	s7,32(sp)
     380:	8fbf0024 	lw	ra,36(sp)
     384:	27bd0070 	addiu	sp,sp,112
     388:	03e00008 	jr	ra
     38c:	00000000 	nop
     390:	27bdfff8 	addiu	sp,sp,-8
     394:	10000005 	b	0x3ac
     398:	afb70000 	sw	s7,0(sp)
     39c:	0080c021 	move	t8,a0
     3a0:	27180001 	addiu	t8,t8,1
     3a4:	03002021 	move	a0,t8
     3a8:	24a5ffff 	addiu	a1,a1,-1
     3ac:	10a00005 	beqz	a1,0x3c4
     3b0:	00000000 	nop
     3b4:	0080c021 	move	t8,a0
     3b8:	33180003 	andi	t8,t8,0x3
     3bc:	1700fff7 	bnez	t8,0x39c
     3c0:	00000000 	nop
     3c4:	24180018 	li	t8,24
     3c8:	00b8f02b 	sltu	s8,a1,t8
     3cc:	13c00003 	beqz	s8,0x3dc
     3d0:	00000000 	nop
     3d4:	10000025 	b	0x46c
     3d8:	00000000 	nop
     3dc:	0080b821 	move	s7,a0
     3e0:	24a5fff8 	addiu	a1,a1,-8
     3e4:	24180001 	li	t8,1
     3e8:	aef80000 	sw	t8,0(s7)
     3ec:	aee50004 	sw	a1,4(s7)
     3f0:	8ef80004 	lw	t8,4(s7)
     3f4:	3c01ffff 	lui	at,0xffff
     3f8:	3421fffe 	ori	at,at,0xfffe
     3fc:	03017824 	and	t7,t8,at
     400:	01f77821 	addu	t7,t7,s7
     404:	adf80000 	sw	t8,0(t7)
     408:	8ef80004 	lw	t8,4(s7)
     40c:	3c01ffff 	lui	at,0xffff
     410:	3421fffe 	ori	at,at,0xfffe
     414:	0301c024 	and	t8,t8,at
     418:	0317c021 	addu	t8,t8,s7
     41c:	240f0001 	li	t7,1
     420:	af0f0004 	sw	t7,4(t8)
     424:	3c180040 	lui	t8,0x40
     428:	8f180010 	lw	t8,16(t8)
     42c:	00000000 	nop
     430:	aef80008 	sw	t8,8(s7)
     434:	3c180040 	lui	t8,0x40
     438:	8f180010 	lw	t8,16(t8)
     43c:	00000000 	nop
     440:	8f18000c 	lw	t8,12(t8)
     444:	00000000 	nop
     448:	aef8000c 	sw	t8,12(s7)
     44c:	3c180040 	lui	t8,0x40
     450:	8f180010 	lw	t8,16(t8)
     454:	00000000 	nop
     458:	2718000c 	addiu	t8,t8,12
     45c:	8f0f0000 	lw	t7,0(t8)
     460:	00000000 	nop
     464:	adf70008 	sw	s7,8(t7)
     468:	af170000 	sw	s7,0(t8)
     46c:	8fb70000 	lw	s7,0(sp)
     470:	03e00008 	jr	ra
     474:	27bd0008 	addiu	sp,sp,8
     478:	27bdffe0 	addiu	sp,sp,-32
     47c:	afb60010 	sw	s6,16(sp)
     480:	afb70014 	sw	s7,20(sp)
     484:	afbf0018 	sw	ra,24(sp)
     488:	afa40020 	sw	a0,32(sp)
     48c:	00a0b821 	move	s7,a1
     490:	02e02021 	move	a0,s7
     494:	8fa50020 	lw	a1,32(sp)
     498:	00000000 	nop
     49c:	00850019 	multu	a0,a1
     4a0:	00001012 	mflo	v0
     4a4:	0040c021 	move	t8,v0
     4a8:	0300b821 	move	s7,t8
     4ac:	0c0001bf 	jal	0x6fc
     4b0:	02e02021 	move	a0,s7
     4b4:	0040b021 	move	s6,v0
     4b8:	0040c021 	move	t8,v0
     4bc:	17000003 	bnez	t8,0x4cc
     4c0:	00000000 	nop
     4c4:	10000006 	b	0x4e0
     4c8:	00001021 	move	v0,zero
     4cc:	02c02021 	move	a0,s6
     4d0:	00002821 	move	a1,zero
     4d4:	0c0002e6 	jal	0xb98
     4d8:	02e03021 	move	a2,s7
     4dc:	02c01021 	move	v0,s6
     4e0:	8fb60010 	lw	s6,16(sp)
     4e4:	8fb70014 	lw	s7,20(sp)
     4e8:	8fbf0018 	lw	ra,24(sp)
     4ec:	27bd0020 	addiu	sp,sp,32
     4f0:	03e00008 	jr	ra
     4f4:	00000000 	nop
     4f8:	27bdfff0 	addiu	sp,sp,-16
     4fc:	afb60000 	sw	s6,0(sp)
     500:	afb70004 	sw	s7,4(sp)
     504:	0080c021 	move	t8,a0
     508:	17000003 	bnez	t8,0x518
     50c:	00000000 	nop
     510:	10000076 	b	0x6ec
     514:	00000000 	nop
     518:	3c17ffff 	lui	s7,0xffff
     51c:	36f7fff8 	ori	s7,s7,0xfff8
     520:	02e4b821 	addu	s7,s7,a0
     524:	8ef80004 	lw	t8,4(s7)
     528:	00000000 	nop
     52c:	33180001 	andi	t8,t8,0x1
     530:	17000003 	bnez	t8,0x540
     534:	00000000 	nop
     538:	1000006c 	b	0x6ec
     53c:	00000000 	nop
     540:	26f80004 	addiu	t8,s7,4
     544:	8f0f0000 	lw	t7,0(t8)
     548:	3c01ffff 	lui	at,0xffff
     54c:	3421fffe 	ori	at,at,0xfffe
     550:	01e17824 	and	t7,t7,at
     554:	af0f0000 	sw	t7,0(t8)
     558:	8ef80004 	lw	t8,4(s7)
     55c:	3c01ffff 	lui	at,0xffff
     560:	3421fffe 	ori	at,at,0xfffe
     564:	0301c024 	and	t8,t8,at
     568:	0317c021 	addu	t8,t8,s7
     56c:	8f0f0000 	lw	t7,0(t8)
     570:	3c01ffff 	lui	at,0xffff
     574:	3421fffe 	ori	at,at,0xfffe
     578:	01e17824 	and	t7,t7,at
     57c:	af0f0000 	sw	t7,0(t8)
     580:	8ef80000 	lw	t8,0(s7)
     584:	00000000 	nop
     588:	33180001 	andi	t8,t8,0x1
     58c:	17000020 	bnez	t8,0x610
     590:	00000000 	nop
     594:	8ef80004 	lw	t8,4(s7)
     598:	00000000 	nop
     59c:	afb8000c 	sw	t8,12(sp)
     5a0:	8ef80000 	lw	t8,0(s7)
     5a4:	3c01ffff 	lui	at,0xffff
     5a8:	3421fffe 	ori	at,at,0xfffe
     5ac:	0301c024 	and	t8,t8,at
     5b0:	241effff 	li	s8,-1
     5b4:	031ec026 	xor	t8,t8,s8
     5b8:	27180001 	addiu	t8,t8,1
     5bc:	0317b821 	addu	s7,t8,s7
     5c0:	26f80004 	addiu	t8,s7,4
     5c4:	8f0f0000 	lw	t7,0(t8)
     5c8:	8fae000c 	lw	t6,12(sp)
     5cc:	00000000 	nop
     5d0:	01ee7821 	addu	t7,t7,t6
     5d4:	af0f0000 	sw	t7,0(t8)
     5d8:	8ef80004 	lw	t8,4(s7)
     5dc:	3c01ffff 	lui	at,0xffff
     5e0:	3421fffe 	ori	at,at,0xfffe
     5e4:	03017824 	and	t7,t8,at
     5e8:	01f77821 	addu	t7,t7,s7
     5ec:	adf80000 	sw	t8,0(t7)
     5f0:	8ef80008 	lw	t8,8(s7)
     5f4:	8eef000c 	lw	t7,12(s7)
     5f8:	00000000 	nop
     5fc:	af0f000c 	sw	t7,12(t8)
     600:	8ef8000c 	lw	t8,12(s7)
     604:	8eef0008 	lw	t7,8(s7)
     608:	00000000 	nop
     60c:	af0f0008 	sw	t7,8(t8)
     610:	8ef80004 	lw	t8,4(s7)
     614:	3c01ffff 	lui	at,0xffff
     618:	3421fffe 	ori	at,at,0xfffe
     61c:	0301c024 	and	t8,t8,at
     620:	0317b021 	addu	s6,t8,s7
     624:	8ed80004 	lw	t8,4(s6)
     628:	00000000 	nop
     62c:	33180001 	andi	t8,t8,0x1
     630:	1700001c 	bnez	t8,0x6a4
     634:	00000000 	nop
     638:	26f80004 	addiu	t8,s7,4
     63c:	8f0f0000 	lw	t7,0(t8)
     640:	8ece0004 	lw	t6,4(s6)
     644:	00000000 	nop
     648:	01ee7821 	addu	t7,t7,t6
     64c:	af0f0000 	sw	t7,0(t8)
     650:	8ef80004 	lw	t8,4(s7)
     654:	3c01ffff 	lui	at,0xffff
     658:	3421fffe 	ori	at,at,0xfffe
     65c:	03017824 	and	t7,t8,at
     660:	01f77821 	addu	t7,t7,s7
     664:	adf80000 	sw	t8,0(t7)
     668:	3c180040 	lui	t8,0x40
     66c:	8f180014 	lw	t8,20(t8)
     670:	02c07821 	move	t7,s6
     674:	170f0003 	bne	t8,t7,0x684
     678:	00000000 	nop
     67c:	3c010040 	lui	at,0x40
     680:	ac370014 	sw	s7,20(at)
     684:	8ed80008 	lw	t8,8(s6)
     688:	8ecf000c 	lw	t7,12(s6)
     68c:	00000000 	nop
     690:	af0f000c 	sw	t7,12(t8)
     694:	8ed8000c 	lw	t8,12(s6)
     698:	8ecf0008 	lw	t7,8(s6)
     69c:	00000000 	nop
     6a0:	af0f0008 	sw	t7,8(t8)
     6a4:	3c180040 	lui	t8,0x40
     6a8:	8f180010 	lw	t8,16(t8)
     6ac:	00000000 	nop
     6b0:	aef80008 	sw	t8,8(s7)
     6b4:	3c180040 	lui	t8,0x40
     6b8:	8f180010 	lw	t8,16(t8)
     6bc:	00000000 	nop
     6c0:	8f18000c 	lw	t8,12(t8)
     6c4:	00000000 	nop
     6c8:	aef8000c 	sw	t8,12(s7)
     6cc:	3c180040 	lui	t8,0x40
     6d0:	8f180010 	lw	t8,16(t8)
     6d4:	00000000 	nop
     6d8:	2718000c 	addiu	t8,t8,12
     6dc:	8f0f0000 	lw	t7,0(t8)
     6e0:	00000000 	nop
     6e4:	adf70008 	sw	s7,8(t7)
     6e8:	af170000 	sw	s7,0(t8)
     6ec:	8fb60000 	lw	s6,0(sp)
     6f0:	8fb70004 	lw	s7,4(sp)
     6f4:	03e00008 	jr	ra
     6f8:	27bd0010 	addiu	sp,sp,16
     6fc:	27bdffe8 	addiu	sp,sp,-24
     700:	afb40000 	sw	s4,0(sp)
     704:	afb50004 	sw	s5,4(sp)
     708:	afb60008 	sw	s6,8(sp)
     70c:	14800003 	bnez	a0,0x71c
     710:	afb7000c 	sw	s7,12(sp)
     714:	1000006f 	b	0x8d4
     718:	00001021 	move	v0,zero
     71c:	24980008 	addiu	t8,a0,8
     720:	240f0010 	li	t7,16
     724:	030ff02b 	sltu	s8,t8,t7
     728:	13c00003 	beqz	s8,0x738
     72c:	00000000 	nop
     730:	10000002 	b	0x73c
     734:	24140010 	li	s4,16
     738:	24940008 	addiu	s4,a0,8
     73c:	26980004 	addiu	t8,s4,4
     740:	2718ffff 	addiu	t8,t8,-1
     744:	3c01ffff 	lui	at,0xffff
     748:	3421fffc 	ori	at,at,0xfffc
     74c:	0301b024 	and	s6,t8,at
     750:	3c170040 	lui	s7,0x40
     754:	8ef70014 	lw	s7,20(s7)
     758:	00000000 	nop
     75c:	8ef80004 	lw	t8,4(s7)
     760:	00000000 	nop
     764:	0316f02b 	sltu	s8,t8,s6
     768:	17c00003 	bnez	s8,0x778
     76c:	00000000 	nop
     770:	10000009 	b	0x798
     774:	00000000 	nop
     778:	8ef7000c 	lw	s7,12(s7)
     77c:	00000000 	nop
     780:	02e0c021 	move	t8,s7
     784:	3c0f0040 	lui	t7,0x40
     788:	8def0014 	lw	t7,20(t7)
     78c:	00000000 	nop
     790:	170ffff2 	bne	t8,t7,0x75c
     794:	00000000 	nop
     798:	8ef80004 	lw	t8,4(s7)
     79c:	00000000 	nop
     7a0:	0316f02b 	sltu	s8,t8,s6
     7a4:	13c00003 	beqz	s8,0x7b4
     7a8:	00000000 	nop
     7ac:	10000049 	b	0x8d4
     7b0:	00001021 	move	v0,zero
     7b4:	8ef8000c 	lw	t8,12(s7)
     7b8:	3c010040 	lui	at,0x40
     7bc:	ac380014 	sw	t8,20(at)
     7c0:	8ef80004 	lw	t8,4(s7)
     7c4:	00000000 	nop
     7c8:	afb80014 	sw	t8,20(sp)
     7cc:	8fb80014 	lw	t8,20(sp)
     7d0:	00000000 	nop
     7d4:	0316c023 	subu	t8,t8,s6
     7d8:	240f0010 	li	t7,16
     7dc:	030ff02b 	sltu	s8,t8,t7
     7e0:	17c00029 	bnez	s8,0x888
     7e4:	00000000 	nop
     7e8:	aef60004 	sw	s6,4(s7)
     7ec:	8ef80004 	lw	t8,4(s7)
     7f0:	3c01ffff 	lui	at,0xffff
     7f4:	3421fffe 	ori	at,at,0xfffe
     7f8:	03017824 	and	t7,t8,at
     7fc:	01f77821 	addu	t7,t7,s7
     800:	adf80000 	sw	t8,0(t7)
     804:	8ef80004 	lw	t8,4(s7)
     808:	3c01ffff 	lui	at,0xffff
     80c:	3421fffe 	ori	at,at,0xfffe
     810:	0301c024 	and	t8,t8,at
     814:	0317a821 	addu	s5,t8,s7
     818:	8fb80014 	lw	t8,20(sp)
     81c:	00000000 	nop
     820:	0316c023 	subu	t8,t8,s6
     824:	aeb80004 	sw	t8,4(s5)
     828:	8eb80004 	lw	t8,4(s5)
     82c:	3c01ffff 	lui	at,0xffff
     830:	3421fffe 	ori	at,at,0xfffe
     834:	03017824 	and	t7,t8,at
     838:	01f57821 	addu	t7,t7,s5
     83c:	adf80000 	sw	t8,0(t7)
     840:	3c180040 	lui	t8,0x40
     844:	8f180010 	lw	t8,16(t8)
     848:	00000000 	nop
     84c:	aeb80008 	sw	t8,8(s5)
     850:	3c180040 	lui	t8,0x40
     854:	8f180010 	lw	t8,16(t8)
     858:	00000000 	nop
     85c:	8f18000c 	lw	t8,12(t8)
     860:	00000000 	nop
     864:	aeb8000c 	sw	t8,12(s5)
     868:	3c180040 	lui	t8,0x40
     86c:	8f180010 	lw	t8,16(t8)
     870:	00000000 	nop
     874:	2718000c 	addiu	t8,t8,12
     878:	8f0f0000 	lw	t7,0(t8)
     87c:	00000000 	nop
     880:	adf50008 	sw	s5,8(t7)
     884:	af150000 	sw	s5,0(t8)
     888:	8ef80008 	lw	t8,8(s7)
     88c:	8eef000c 	lw	t7,12(s7)
     890:	00000000 	nop
     894:	af0f000c 	sw	t7,12(t8)
     898:	8ef8000c 	lw	t8,12(s7)
     89c:	8eef0008 	lw	t7,8(s7)
     8a0:	00000000 	nop
     8a4:	af0f0008 	sw	t7,8(t8)
     8a8:	26f80004 	addiu	t8,s7,4
     8ac:	8f0f0000 	lw	t7,0(t8)
     8b0:	00000000 	nop
     8b4:	35ee0001 	ori	t6,t7,0x1
     8b8:	af0e0000 	sw	t6,0(t8)
     8bc:	3c01ffff 	lui	at,0xffff
     8c0:	3421fffe 	ori	at,at,0xfffe
     8c4:	01e1c024 	and	t8,t7,at
     8c8:	0317c021 	addu	t8,t8,s7
     8cc:	af0e0000 	sw	t6,0(t8)
     8d0:	26e20008 	addiu	v0,s7,8
     8d4:	8fb40000 	lw	s4,0(sp)
     8d8:	8fb50004 	lw	s5,4(sp)
     8dc:	8fb60008 	lw	s6,8(sp)
     8e0:	8fb7000c 	lw	s7,12(sp)
     8e4:	03e00008 	jr	ra
     8e8:	27bd0018 	addiu	sp,sp,24
     8ec:	27bdffd0 	addiu	sp,sp,-48
     8f0:	afb20010 	sw	s2,16(sp)
     8f4:	afb30014 	sw	s3,20(sp)
     8f8:	afb40018 	sw	s4,24(sp)
     8fc:	afb5001c 	sw	s5,28(sp)
     900:	afb60020 	sw	s6,32(sp)
     904:	afb70024 	sw	s7,36(sp)
     908:	afbf0028 	sw	ra,40(sp)
     90c:	0080b821 	move	s7,a0
     910:	00a0b021 	move	s6,a1
     914:	02e0c021 	move	t8,s7
     918:	17000005 	bnez	t8,0x930
     91c:	00000000 	nop
     920:	0c0001bf 	jal	0x6fc
     924:	02c02021 	move	a0,s6
     928:	1000006d 	b	0xae0
     92c:	0040c021 	move	t8,v0
     930:	16c00005 	bnez	s6,0x948
     934:	00000000 	nop
     938:	0c00013e 	jal	0x4f8
     93c:	02e02021 	move	a0,s7
     940:	10000067 	b	0xae0
     944:	00001021 	move	v0,zero
     948:	3c15ffff 	lui	s5,0xffff
     94c:	36b5fff8 	ori	s5,s5,0xfff8
     950:	02b7a821 	addu	s5,s5,s7
     954:	8eb80004 	lw	t8,4(s5)
     958:	00000000 	nop
     95c:	33180001 	andi	t8,t8,0x1
     960:	17000003 	bnez	t8,0x970
     964:	00000000 	nop
     968:	1000005d 	b	0xae0
     96c:	00001021 	move	v0,zero
     970:	8eb80004 	lw	t8,4(s5)
     974:	3c01ffff 	lui	at,0xffff
     978:	3421fffe 	ori	at,at,0xfffe
     97c:	0301a024 	and	s4,t8,at
     980:	26d80008 	addiu	t8,s6,8
     984:	240f0010 	li	t7,16
     988:	030ff02b 	sltu	s8,t8,t7
     98c:	13c00003 	beqz	s8,0x99c
     990:	00000000 	nop
     994:	10000002 	b	0x9a0
     998:	24120010 	li	s2,16
     99c:	26d20008 	addiu	s2,s6,8
     9a0:	26580004 	addiu	t8,s2,4
     9a4:	2718ffff 	addiu	t8,t8,-1
     9a8:	3c01ffff 	lui	at,0xffff
     9ac:	3421fffc 	ori	at,at,0xfffc
     9b0:	03019824 	and	s3,t8,at
     9b4:	0293f02b 	sltu	s8,s4,s3
     9b8:	17c0003a 	bnez	s8,0xaa4
     9bc:	00000000 	nop
     9c0:	0293c023 	subu	t8,s4,s3
     9c4:	240f0010 	li	t7,16
     9c8:	030ff02b 	sltu	s8,t8,t7
     9cc:	13c00003 	beqz	s8,0x9dc
     9d0:	00000000 	nop
     9d4:	10000042 	b	0xae0
     9d8:	02e01021 	move	v0,s7
     9dc:	aeb30004 	sw	s3,4(s5)
     9e0:	8eb80004 	lw	t8,4(s5)
     9e4:	3c01ffff 	lui	at,0xffff
     9e8:	3421fffe 	ori	at,at,0xfffe
     9ec:	03017824 	and	t7,t8,at
     9f0:	01f57821 	addu	t7,t7,s5
     9f4:	adf80000 	sw	t8,0(t7)
     9f8:	26b80004 	addiu	t8,s5,4
     9fc:	8f0f0000 	lw	t7,0(t8)
     a00:	00000000 	nop
     a04:	35ee0001 	ori	t6,t7,0x1
     a08:	af0e0000 	sw	t6,0(t8)
     a0c:	3c01ffff 	lui	at,0xffff
     a10:	3421fffe 	ori	at,at,0xfffe
     a14:	01e1c024 	and	t8,t7,at
     a18:	0315c021 	addu	t8,t8,s5
     a1c:	af0e0000 	sw	t6,0(t8)
     a20:	8eb80004 	lw	t8,4(s5)
     a24:	3c01ffff 	lui	at,0xffff
     a28:	3421fffe 	ori	at,at,0xfffe
     a2c:	0301c024 	and	t8,t8,at
     a30:	0315a821 	addu	s5,t8,s5
     a34:	0293c023 	subu	t8,s4,s3
     a38:	aeb80004 	sw	t8,4(s5)
     a3c:	8eb80004 	lw	t8,4(s5)
     a40:	3c01ffff 	lui	at,0xffff
     a44:	3421fffe 	ori	at,at,0xfffe
     a48:	03017824 	and	t7,t8,at
     a4c:	01f57821 	addu	t7,t7,s5
     a50:	adf80000 	sw	t8,0(t7)
     a54:	3c180040 	lui	t8,0x40
     a58:	8f180010 	lw	t8,16(t8)
     a5c:	00000000 	nop
     a60:	aeb80008 	sw	t8,8(s5)
     a64:	3c180040 	lui	t8,0x40
     a68:	8f180010 	lw	t8,16(t8)
     a6c:	00000000 	nop
     a70:	8f18000c 	lw	t8,12(t8)
     a74:	00000000 	nop
     a78:	aeb8000c 	sw	t8,12(s5)
     a7c:	3c180040 	lui	t8,0x40
     a80:	8f180010 	lw	t8,16(t8)
     a84:	00000000 	nop
     a88:	2718000c 	addiu	t8,t8,12
     a8c:	8f0f0000 	lw	t7,0(t8)
     a90:	00000000 	nop
     a94:	adf50008 	sw	s5,8(t7)
     a98:	af150000 	sw	s5,0(t8)
     a9c:	10000010 	b	0xae0
     aa0:	02e01021 	move	v0,s7
     aa4:	0c0001bf 	jal	0x6fc
     aa8:	02c02021 	move	a0,s6
     aac:	afa2002c 	sw	v0,44(sp)
     ab0:	0040c021 	move	t8,v0
     ab4:	17000003 	bnez	t8,0xac4
     ab8:	00000000 	nop
     abc:	10000008 	b	0xae0
     ac0:	00001021 	move	v0,zero
     ac4:	8fa4002c 	lw	a0,44(sp)
     ac8:	02e02821 	move	a1,s7
     acc:	0c0002c2 	jal	0xb08
     ad0:	2686fff8 	addiu	a2,s4,-8
     ad4:	0c00013e 	jal	0x4f8
     ad8:	02e02021 	move	a0,s7
     adc:	8fa2002c 	lw	v0,44(sp)
     ae0:	8fb20010 	lw	s2,16(sp)
     ae4:	8fb30014 	lw	s3,20(sp)
     ae8:	8fb40018 	lw	s4,24(sp)
     aec:	8fb5001c 	lw	s5,28(sp)
     af0:	8fb60020 	lw	s6,32(sp)
     af4:	8fb70024 	lw	s7,36(sp)
     af8:	8fbf0028 	lw	ra,40(sp)
     afc:	27bd0030 	addiu	sp,sp,48
     b00:	03e00008 	jr	ra
     b04:	00000000 	nop
     b08:	27bdfff8 	addiu	sp,sp,-8
     b0c:	afb60000 	sw	s6,0(sp)
     b10:	afb70004 	sw	s7,4(sp)
     b14:	0080b821 	move	s7,a0
     b18:	10000008 	b	0xb3c
     b1c:	00a0b021 	move	s6,a1
     b20:	02e0c021 	move	t8,s7
     b24:	27170001 	addiu	s7,t8,1
     b28:	02c07821 	move	t7,s6
     b2c:	25f60001 	addiu	s6,t7,1
     b30:	81ef0000 	lb	t7,0(t7)
     b34:	00000000 	nop
     b38:	a30f0000 	sb	t7,0(t8)
     b3c:	00c0c021 	move	t8,a2
     b40:	1700fff7 	bnez	t8,0xb20
     b44:	2706ffff 	addiu	a2,t8,-1
     b48:	00801021 	move	v0,a0
     b4c:	8fb60000 	lw	s6,0(sp)
     b50:	8fb70004 	lw	s7,4(sp)
     b54:	03e00008 	jr	ra
     b58:	27bd0008 	addiu	sp,sp,8
     b5c:	27bdffe8 	addiu	sp,sp,-24
     b60:	afbf0010 	sw	ra,16(sp)
     b64:	afa40018 	sw	a0,24(sp)
     b68:	afa5001c 	sw	a1,28(sp)
     b6c:	afa60020 	sw	a2,32(sp)
     b70:	8fa40018 	lw	a0,24(sp)
     b74:	8fa5001c 	lw	a1,28(sp)
     b78:	8fa60020 	lw	a2,32(sp)
     b7c:	0c0002c2 	jal	0xb08
     b80:	00000000 	nop
     b84:	0040c021 	move	t8,v0
     b88:	8fbf0010 	lw	ra,16(sp)
     b8c:	27bd0018 	addiu	sp,sp,24
     b90:	03e00008 	jr	ra
     b94:	00000000 	nop
     b98:	27bdffd0 	addiu	sp,sp,-48
     b9c:	afb20010 	sw	s2,16(sp)
     ba0:	afb30014 	sw	s3,20(sp)
     ba4:	afb40018 	sw	s4,24(sp)
     ba8:	afb5001c 	sw	s5,28(sp)
     bac:	afb60020 	sw	s6,32(sp)
     bb0:	afb70024 	sw	s7,36(sp)
     bb4:	afbf0028 	sw	ra,40(sp)
     bb8:	afa40030 	sw	a0,48(sp)
     bbc:	00a0b821 	move	s7,a1
     bc0:	00c0b021 	move	s6,a2
     bc4:	8fb50030 	lw	s5,48(sp)
     bc8:	00000000 	nop
     bcc:	afb5002c 	sw	s5,44(sp)
     bd0:	24180003 	li	t8,3
     bd4:	0316f02b 	sltu	s8,t8,s6
     bd8:	13c00027 	beqz	s8,0xc78
     bdc:	00000000 	nop
     be0:	02a0c021 	move	t8,s5
     be4:	33180003 	andi	t8,t8,0x3
     be8:	1300000c 	beqz	t8,0xc1c
     bec:	03009021 	move	s2,t8
     bf0:	24180004 	li	t8,4
     bf4:	03129023 	subu	s2,t8,s2
     bf8:	10000005 	b	0xc10
     bfc:	02d2b023 	subu	s6,s6,s2
     c00:	02a0c021 	move	t8,s5
     c04:	27150001 	addiu	s5,t8,1
     c08:	02e07821 	move	t7,s7
     c0c:	a30f0000 	sb	t7,0(t8)
     c10:	0240c021 	move	t8,s2
     c14:	1700fffa 	bnez	t8,0xc00
     c18:	2712ffff 	addiu	s2,t8,-1
     c1c:	0016c082 	srl	t8,s6,0x2
     c20:	03009821 	move	s3,t8
     c24:	32d60003 	andi	s6,s6,0x3
     c28:	02e0c021 	move	t8,s7
     c2c:	331800ff 	andi	t8,t8,0xff
     c30:	0300a021 	move	s4,t8
     c34:	0014c200 	sll	t8,s4,0x8
     c38:	0298a025 	or	s4,s4,t8
     c3c:	0014c200 	sll	t8,s4,0x8
     c40:	0018c200 	sll	t8,t8,0x8
     c44:	10000003 	b	0xc54
     c48:	0298a025 	or	s4,s4,t8
     c4c:	aeb40000 	sw	s4,0(s5)
     c50:	26b50004 	addiu	s5,s5,4
     c54:	0260c021 	move	t8,s3
     c58:	1700fffc 	bnez	t8,0xc4c
     c5c:	2713ffff 	addiu	s3,t8,-1
     c60:	10000005 	b	0xc78
     c64:	00000000 	nop
     c68:	02a0c021 	move	t8,s5
     c6c:	27150001 	addiu	s5,t8,1
     c70:	02e07821 	move	t7,s7
     c74:	a30f0000 	sb	t7,0(t8)
     c78:	02c0c021 	move	t8,s6
     c7c:	1700fffa 	bnez	t8,0xc68
     c80:	2716ffff 	addiu	s6,t8,-1
     c84:	8fa2002c 	lw	v0,44(sp)
     c88:	8fb20010 	lw	s2,16(sp)
     c8c:	8fb30014 	lw	s3,20(sp)
     c90:	8fb40018 	lw	s4,24(sp)
     c94:	8fb5001c 	lw	s5,28(sp)
     c98:	8fb60020 	lw	s6,32(sp)
     c9c:	8fb70024 	lw	s7,36(sp)
     ca0:	8fbf0028 	lw	ra,40(sp)
     ca4:	27bd0030 	addiu	sp,sp,48
     ca8:	03e00008 	jr	ra
     cac:	00000000 	nop
     cb0:	27bdffd8 	addiu	sp,sp,-40
     cb4:	afb40010 	sw	s4,16(sp)
     cb8:	afb50014 	sw	s5,20(sp)
     cbc:	afb60018 	sw	s6,24(sp)
     cc0:	afb7001c 	sw	s7,28(sp)
     cc4:	afbf0020 	sw	ra,32(sp)
     cc8:	0080b821 	move	s7,a0
     ccc:	00a0b021 	move	s6,a1
     cd0:	24150001 	li	s5,1
     cd4:	1000000d 	b	0xd0c
     cd8:	0000a021 	move	s4,zero
     cdc:	24180001 	li	t8,1
     ce0:	afb80024 	sw	t8,36(sp)
     ce4:	02c02021 	move	a0,s6
     ce8:	0c0003ff 	jal	0xffc
     cec:	03002821 	move	a1,t8
     cf0:	0040b021 	move	s6,v0
     cf4:	02a02021 	move	a0,s5
     cf8:	8fb80024 	lw	t8,36(sp)
     cfc:	00000000 	nop
     d00:	0c0003ff 	jal	0xffc
     d04:	03002821 	move	a1,t8
     d08:	0040a821 	move	s5,v0
     d0c:	02d7f02b 	sltu	s8,s6,s7
     d10:	13c00007 	beqz	s8,0xd30
     d14:	00000000 	nop
     d18:	12a00005 	beqz	s5,0xd30
     d1c:	00000000 	nop
     d20:	3c018000 	lui	at,0x8000
     d24:	02c1c024 	and	t8,s6,at
     d28:	1300ffec 	beqz	t8,0xcdc
     d2c:	00000000 	nop
     d30:	10000012 	b	0xd7c
     d34:	00000000 	nop
     d38:	02f6f02b 	sltu	s8,s7,s6
     d3c:	17c00003 	bnez	s8,0xd4c
     d40:	00000000 	nop
     d44:	02f6b823 	subu	s7,s7,s6
     d48:	0295a025 	or	s4,s4,s5
     d4c:	24180001 	li	t8,1
     d50:	afb80024 	sw	t8,36(sp)
     d54:	02a02021 	move	a0,s5
     d58:	0c000431 	jal	0x10c4
     d5c:	03002821 	move	a1,t8
     d60:	0040a821 	move	s5,v0
     d64:	02c02021 	move	a0,s6
     d68:	8fb80024 	lw	t8,36(sp)
     d6c:	00000000 	nop
     d70:	0c000431 	jal	0x10c4
     d74:	03002821 	move	a1,t8
     d78:	0040b021 	move	s6,v0
     d7c:	16a0ffee 	bnez	s5,0xd38
     d80:	00000000 	nop
     d84:	02801021 	move	v0,s4
     d88:	8fb40010 	lw	s4,16(sp)
     d8c:	8fb50014 	lw	s5,20(sp)
     d90:	8fb60018 	lw	s6,24(sp)
     d94:	8fb7001c 	lw	s7,28(sp)
     d98:	8fbf0020 	lw	ra,32(sp)
     d9c:	27bd0028 	addiu	sp,sp,40
     da0:	03e00008 	jr	ra
     da4:	00000000 	nop
     da8:	27bdffd8 	addiu	sp,sp,-40
     dac:	afb30010 	sw	s3,16(sp)
     db0:	afb40014 	sw	s4,20(sp)
     db4:	afb50018 	sw	s5,24(sp)
     db8:	afb6001c 	sw	s6,28(sp)
     dbc:	afb70020 	sw	s7,32(sp)
     dc0:	afbf0024 	sw	ra,36(sp)
     dc4:	0080b821 	move	s7,a0
     dc8:	00a0b021 	move	s6,a1
     dcc:	0000a821 	move	s5,zero
     dd0:	02e0f02a 	slt	s8,s7,zero
     dd4:	13c00007 	beqz	s8,0xdf4
     dd8:	00000000 	nop
     ddc:	16a00003 	bnez	s5,0xdec
     de0:	0017b823 	negu	s7,s7
     de4:	10000002 	b	0xdf0
     de8:	24130001 	li	s3,1
     dec:	00009821 	move	s3,zero
     df0:	0260a821 	move	s5,s3
     df4:	02c0f02a 	slt	s8,s6,zero
     df8:	13c00007 	beqz	s8,0xe18
     dfc:	00000000 	nop
     e00:	16a00003 	bnez	s5,0xe10
     e04:	0016b023 	negu	s6,s6
     e08:	10000002 	b	0xe14
     e0c:	24130001 	li	s3,1
     e10:	00009821 	move	s3,zero
     e14:	0260a821 	move	s5,s3
     e18:	02e02021 	move	a0,s7
     e1c:	0c00032c 	jal	0xcb0
     e20:	02c02821 	move	a1,s6
     e24:	12a00002 	beqz	s5,0xe30
     e28:	0040a021 	move	s4,v0
     e2c:	0014a023 	negu	s4,s4
     e30:	02801021 	move	v0,s4
     e34:	8fb30010 	lw	s3,16(sp)
     e38:	8fb40014 	lw	s4,20(sp)
     e3c:	8fb50018 	lw	s5,24(sp)
     e40:	8fb6001c 	lw	s6,28(sp)
     e44:	8fb70020 	lw	s7,32(sp)
     e48:	8fbf0024 	lw	ra,36(sp)
     e4c:	27bd0028 	addiu	sp,sp,40
     e50:	03e00008 	jr	ra
     e54:	00000000 	nop
     e58:	27bdffd8 	addiu	sp,sp,-40
     e5c:	afb50010 	sw	s5,16(sp)
     e60:	afb60014 	sw	s6,20(sp)
     e64:	afb70018 	sw	s7,24(sp)
     e68:	afbf001c 	sw	ra,28(sp)
     e6c:	0080b821 	move	s7,a0
     e70:	00a0b021 	move	s6,a1
     e74:	1000000d 	b	0xeac
     e78:	24150001 	li	s5,1
     e7c:	24180001 	li	t8,1
     e80:	afb80024 	sw	t8,36(sp)
     e84:	02c02021 	move	a0,s6
     e88:	0c0003ff 	jal	0xffc
     e8c:	03002821 	move	a1,t8
     e90:	0040b021 	move	s6,v0
     e94:	02a02021 	move	a0,s5
     e98:	8fb80024 	lw	t8,36(sp)
     e9c:	00000000 	nop
     ea0:	0c0003ff 	jal	0xffc
     ea4:	03002821 	move	a1,t8
     ea8:	0040a821 	move	s5,v0
     eac:	02d7f02b 	sltu	s8,s6,s7
     eb0:	13c00007 	beqz	s8,0xed0
     eb4:	00000000 	nop
     eb8:	12a00005 	beqz	s5,0xed0
     ebc:	00000000 	nop
     ec0:	3c018000 	lui	at,0x8000
     ec4:	02c1c024 	and	t8,s6,at
     ec8:	1300ffec 	beqz	t8,0xe7c
     ecc:	00000000 	nop
     ed0:	10000011 	b	0xf18
     ed4:	00000000 	nop
     ed8:	02f6f02b 	sltu	s8,s7,s6
     edc:	17c00002 	bnez	s8,0xee8
     ee0:	00000000 	nop
     ee4:	02f6b823 	subu	s7,s7,s6
     ee8:	24180001 	li	t8,1
     eec:	afb80024 	sw	t8,36(sp)
     ef0:	02a02021 	move	a0,s5
     ef4:	0c000431 	jal	0x10c4
     ef8:	03002821 	move	a1,t8
     efc:	0040a821 	move	s5,v0
     f00:	02c02021 	move	a0,s6
     f04:	8fb80024 	lw	t8,36(sp)
     f08:	00000000 	nop
     f0c:	0c000431 	jal	0x10c4
     f10:	03002821 	move	a1,t8
     f14:	0040b021 	move	s6,v0
     f18:	16a0ffef 	bnez	s5,0xed8
     f1c:	00000000 	nop
     f20:	02e01021 	move	v0,s7
     f24:	8fb50010 	lw	s5,16(sp)
     f28:	8fb60014 	lw	s6,20(sp)
     f2c:	8fb70018 	lw	s7,24(sp)
     f30:	8fbf001c 	lw	ra,28(sp)
     f34:	27bd0028 	addiu	sp,sp,40
     f38:	03e00008 	jr	ra
     f3c:	00000000 	nop
     f40:	27bdffd8 	addiu	sp,sp,-40
     f44:	afb50010 	sw	s5,16(sp)
     f48:	afb60014 	sw	s6,20(sp)
     f4c:	afb70018 	sw	s7,24(sp)
     f50:	afbf001c 	sw	ra,28(sp)
     f54:	0080b821 	move	s7,a0
     f58:	00a0b021 	move	s6,a1
     f5c:	afa00024 	sw	zero,36(sp)
     f60:	02e0f02a 	slt	s8,s7,zero
     f64:	13c00004 	beqz	s8,0xf78
     f68:	00000000 	nop
     f6c:	0017b823 	negu	s7,s7
     f70:	24180001 	li	t8,1
     f74:	afb80024 	sw	t8,36(sp)
     f78:	02c0f02a 	slt	s8,s6,zero
     f7c:	13c00002 	beqz	s8,0xf88
     f80:	00000000 	nop
     f84:	0016b023 	negu	s6,s6
     f88:	02e02021 	move	a0,s7
     f8c:	0c000396 	jal	0xe58
     f90:	02c02821 	move	a1,s6
     f94:	0040a821 	move	s5,v0
     f98:	8fb80024 	lw	t8,36(sp)
     f9c:	00000000 	nop
     fa0:	13000002 	beqz	t8,0xfac
     fa4:	00000000 	nop
     fa8:	0015a823 	negu	s5,s5
     fac:	02a01021 	move	v0,s5
     fb0:	8fb50010 	lw	s5,16(sp)
     fb4:	8fb60014 	lw	s6,20(sp)
     fb8:	8fb70018 	lw	s7,24(sp)
     fbc:	8fbf001c 	lw	ra,28(sp)
     fc0:	27bd0028 	addiu	sp,sp,40
     fc4:	03e00008 	jr	ra
     fc8:	00000000 	nop
     fcc:	27bdfff8 	addiu	sp,sp,-8
     fd0:	14800003 	bnez	a0,0xfe0
     fd4:	afb70000 	sw	s7,0(sp)
     fd8:	10000004 	b	0xfec
     fdc:	0000b821 	move	s7,zero
     fe0:	0080c021 	move	t8,a0
     fe4:	3c018000 	lui	at,0x8000
     fe8:	0301b826 	xor	s7,t8,at
     fec:	02e01021 	move	v0,s7
     ff0:	8fb70000 	lw	s7,0(sp)
     ff4:	03e00008 	jr	ra
     ff8:	27bd0008 	addiu	sp,sp,8
     ffc:	00801021 	move	v0,a0
    1000:	30a80001 	andi	t0,a1,0x1
    1004:	11000002 	beqz	t0,0x1010
    1008:	00000000 	nop
    100c:	00021040 	sll	v0,v0,0x1
    1010:	30a80002 	andi	t0,a1,0x2
    1014:	11000002 	beqz	t0,0x1020
    1018:	00000000 	nop
    101c:	00021080 	sll	v0,v0,0x2
    1020:	30a80004 	andi	t0,a1,0x4
    1024:	11000003 	beqz	t0,0x1034
    1028:	00000000 	nop
    102c:	00021080 	sll	v0,v0,0x2
    1030:	00021080 	sll	v0,v0,0x2
    1034:	30a80008 	andi	t0,a1,0x8
    1038:	11000002 	beqz	t0,0x1044
    103c:	00000000 	nop
    1040:	00021200 	sll	v0,v0,0x8
    1044:	30a80010 	andi	t0,a1,0x10
    1048:	11000003 	beqz	t0,0x1058
    104c:	00000000 	nop
    1050:	00021200 	sll	v0,v0,0x8
    1054:	00021200 	sll	v0,v0,0x8
    1058:	03e00008 	jr	ra
    105c:	00000000 	nop
    1060:	00801021 	move	v0,a0
    1064:	30a80001 	andi	t0,a1,0x1
    1068:	11000002 	beqz	t0,0x1074
    106c:	00000000 	nop
    1070:	00021043 	sra	v0,v0,0x1
    1074:	30a80002 	andi	t0,a1,0x2
    1078:	11000002 	beqz	t0,0x1084
    107c:	00000000 	nop
    1080:	00021083 	sra	v0,v0,0x2
    1084:	30a80004 	andi	t0,a1,0x4
    1088:	11000003 	beqz	t0,0x1098
    108c:	00000000 	nop
    1090:	00021083 	sra	v0,v0,0x2
    1094:	00021083 	sra	v0,v0,0x2
    1098:	30a80008 	andi	t0,a1,0x8
    109c:	11000002 	beqz	t0,0x10a8
    10a0:	00000000 	nop
    10a4:	00021203 	sra	v0,v0,0x8
    10a8:	30a80010 	andi	t0,a1,0x10
    10ac:	11000003 	beqz	t0,0x10bc
    10b0:	00000000 	nop
    10b4:	00021203 	sra	v0,v0,0x8
    10b8:	00021203 	sra	v0,v0,0x8
    10bc:	03e00008 	jr	ra
    10c0:	00000000 	nop
    10c4:	00801021 	move	v0,a0
    10c8:	30a80001 	andi	t0,a1,0x1
    10cc:	11000002 	beqz	t0,0x10d8
    10d0:	00000000 	nop
    10d4:	00021042 	srl	v0,v0,0x1
    10d8:	30a80002 	andi	t0,a1,0x2
    10dc:	11000002 	beqz	t0,0x10e8
    10e0:	00000000 	nop
    10e4:	00021082 	srl	v0,v0,0x2
    10e8:	30a80004 	andi	t0,a1,0x4
    10ec:	11000003 	beqz	t0,0x10fc
    10f0:	00000000 	nop
    10f4:	00021082 	srl	v0,v0,0x2
    10f8:	00021082 	srl	v0,v0,0x2
    10fc:	30a80008 	andi	t0,a1,0x8
    1100:	11000002 	beqz	t0,0x110c
    1104:	00000000 	nop
    1108:	00021202 	srl	v0,v0,0x8
    110c:	30a80010 	andi	t0,a1,0x10
    1110:	11000003 	beqz	t0,0x1120
    1114:	00000000 	nop
    1118:	00021202 	srl	v0,v0,0x8
    111c:	00021202 	srl	v0,v0,0x8
    1120:	03e00008 	jr	ra
    1124:	00000000 	nop
    1128:	24020000 	li	v0,0
    112c:	00805021 	move	t2,a0
    1130:	00a05821 	move	t3,a1
    1134:	31480001 	andi	t0,t2,0x1
    1138:	11000002 	beqz	t0,0x1144
    113c:	00000000 	nop
    1140:	004b1021 	addu	v0,v0,t3
    1144:	000a5042 	srl	t2,t2,0x1
    1148:	1540fffa 	bnez	t2,0x1134
    114c:	000b5840 	sll	t3,t3,0x1
    1150:	03e00008 	jr	ra
	...
  400008:	00400000 	0x400000
  40000c:	00400000 	0x400000
  400010:	00400000 	0x400000
  400014:	00400000 	0x400000
