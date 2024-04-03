
mips_mem.bin:     file format binary

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
      28:	0c0000fb 	jal	0x3ec
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
      cc:	3c130040 	lui	s3,0x40
      d0:	36732000 	ori	s3,s3,0x2000
      d4:	24160001 	li	s6,1
      d8:	24170001 	li	s7,1
      dc:	24180005 	li	t8,5
      e0:	afb80068 	sw	t8,104(sp)
      e4:	02c02021 	move	a0,s6
      e8:	0c000416 	jal	0x1058
      ec:	03002821 	move	a1,t8
      f0:	0040c021 	move	t8,v0
      f4:	afb8005c 	sw	t8,92(sp)
      f8:	240ffff9 	li	t7,-7
      fc:	afaf0058 	sw	t7,88(sp)
     100:	270effe0 	addiu	t6,t8,-32
     104:	01d77021 	addu	t6,t6,s7
     108:	afae0064 	sw	t6,100(sp)
     10c:	240d0001 	li	t5,1
     110:	afad0060 	sw	t5,96(sp)
     114:	01e02021 	move	a0,t7
     118:	25ccffff 	addiu	t4,t6,-1
     11c:	01956021 	addu	t4,t4,s5
     120:	81850000 	lb	a1,0(t4)
     124:	00000000 	nop
     128:	00850019 	multu	a0,a1
     12c:	00001012 	mflo	v0
     130:	0040c021 	move	t8,v0
     134:	afb80054 	sw	t8,84(sp)
     138:	8faf0068 	lw	t7,104(sp)
     13c:	00000000 	nop
     140:	01e02021 	move	a0,t7
     144:	8faf0064 	lw	t7,100(sp)
     148:	00000000 	nop
     14c:	01f57821 	addu	t7,t7,s5
     150:	81e50000 	lb	a1,0(t7)
     154:	00000000 	nop
     158:	00850019 	multu	a0,a1
     15c:	00001012 	mflo	v0
     160:	0040c021 	move	t8,v0
     164:	afb80050 	sw	t8,80(sp)
     168:	8faf0064 	lw	t7,100(sp)
     16c:	00000000 	nop
     170:	25ef0001 	addiu	t7,t7,1
     174:	01f57821 	addu	t7,t7,s5
     178:	81e40000 	lb	a0,0(t7)
     17c:	8faf0060 	lw	t7,96(sp)
     180:	00000000 	nop
     184:	0c000416 	jal	0x1058
     188:	01e02821 	move	a1,t7
     18c:	0040c021 	move	t8,v0
     190:	afb80044 	sw	t8,68(sp)
     194:	240fffff 	li	t7,-1
     198:	afaf0048 	sw	t7,72(sp)
     19c:	8fae005c 	lw	t6,92(sp)
     1a0:	00000000 	nop
     1a4:	01d77021 	addu	t6,t6,s7
     1a8:	afae004c 	sw	t6,76(sp)
     1ac:	01e02021 	move	a0,t7
     1b0:	25cdffff 	addiu	t5,t6,-1
     1b4:	01b56821 	addu	t5,t5,s5
     1b8:	81a50000 	lb	a1,0(t5)
     1bc:	00000000 	nop
     1c0:	00850019 	multu	a0,a1
     1c4:	00001012 	mflo	v0
     1c8:	0040c021 	move	t8,v0
     1cc:	afb80040 	sw	t8,64(sp)
     1d0:	2404000f 	li	a0,15
     1d4:	8faf004c 	lw	t7,76(sp)
     1d8:	00000000 	nop
     1dc:	01f57821 	addu	t7,t7,s5
     1e0:	81e50000 	lb	a1,0(t7)
     1e4:	00000000 	nop
     1e8:	00850019 	multu	a0,a1
     1ec:	00001012 	mflo	v0
     1f0:	0040c021 	move	t8,v0
     1f4:	afb8003c 	sw	t8,60(sp)
     1f8:	8faf0048 	lw	t7,72(sp)
     1fc:	00000000 	nop
     200:	01e02021 	move	a0,t7
     204:	8faf004c 	lw	t7,76(sp)
     208:	00000000 	nop
     20c:	25ef0001 	addiu	t7,t7,1
     210:	01f57821 	addu	t7,t7,s5
     214:	81e50000 	lb	a1,0(t7)
     218:	00000000 	nop
     21c:	00850019 	multu	a0,a1
     220:	00001012 	mflo	v0
     224:	0040c021 	move	t8,v0
     228:	afb80034 	sw	t8,52(sp)
     22c:	8faf005c 	lw	t7,92(sp)
     230:	00000000 	nop
     234:	25ef0020 	addiu	t7,t7,32
     238:	01f77821 	addu	t7,t7,s7
     23c:	afaf0038 	sw	t7,56(sp)
     240:	25eeffff 	addiu	t6,t7,-1
     244:	01d57021 	addu	t6,t6,s5
     248:	81c40000 	lb	a0,0(t6)
     24c:	8fae0060 	lw	t6,96(sp)
     250:	00000000 	nop
     254:	0c000416 	jal	0x1058
     258:	01c02821 	move	a1,t6
     25c:	0040c021 	move	t8,v0
     260:	afb80030 	sw	t8,48(sp)
     264:	8faf0068 	lw	t7,104(sp)
     268:	00000000 	nop
     26c:	01e02021 	move	a0,t7
     270:	8faf0038 	lw	t7,56(sp)
     274:	00000000 	nop
     278:	01f57821 	addu	t7,t7,s5
     27c:	81e50000 	lb	a1,0(t7)
     280:	00000000 	nop
     284:	00850019 	multu	a0,a1
     288:	00001012 	mflo	v0
     28c:	0040c021 	move	t8,v0
     290:	afb8002c 	sw	t8,44(sp)
     294:	8faf0058 	lw	t7,88(sp)
     298:	00000000 	nop
     29c:	01e02021 	move	a0,t7
     2a0:	8faf0038 	lw	t7,56(sp)
     2a4:	00000000 	nop
     2a8:	25ef0001 	addiu	t7,t7,1
     2ac:	01f57821 	addu	t7,t7,s5
     2b0:	81e50000 	lb	a1,0(t7)
     2b4:	00000000 	nop
     2b8:	00850019 	multu	a0,a1
     2bc:	00001012 	mflo	v0
     2c0:	8faf0054 	lw	t7,84(sp)
     2c4:	8fae0050 	lw	t6,80(sp)
     2c8:	00000000 	nop
     2cc:	01ee7821 	addu	t7,t7,t6
     2d0:	8fae0044 	lw	t6,68(sp)
     2d4:	00000000 	nop
     2d8:	01ee7821 	addu	t7,t7,t6
     2dc:	8fae0040 	lw	t6,64(sp)
     2e0:	00000000 	nop
     2e4:	01ee7821 	addu	t7,t7,t6
     2e8:	8fae003c 	lw	t6,60(sp)
     2ec:	00000000 	nop
     2f0:	01ee7821 	addu	t7,t7,t6
     2f4:	8fae0034 	lw	t6,52(sp)
     2f8:	00000000 	nop
     2fc:	01ee7821 	addu	t7,t7,t6
     300:	8fae0030 	lw	t6,48(sp)
     304:	00000000 	nop
     308:	01ee7821 	addu	t7,t7,t6
     30c:	8fae002c 	lw	t6,44(sp)
     310:	00000000 	nop
     314:	01ee7821 	addu	t7,t7,t6
     318:	01e2c021 	addu	t8,t7,v0
     31c:	27040080 	addiu	a0,t8,128
     320:	0c000381 	jal	0xe04
     324:	2405000d 	li	a1,13
     328:	0040a021 	move	s4,v0
     32c:	0280f02a 	slt	s8,s4,zero
     330:	13c00008 	beqz	s8,0x354
     334:	00000000 	nop
     338:	0016c040 	sll	t8,s6,0x1
     33c:	0018c080 	sll	t8,t8,0x2
     340:	0018c080 	sll	t8,t8,0x2
     344:	0317c021 	addu	t8,t8,s7
     348:	0313c021 	addu	t8,t8,s3
     34c:	10000014 	b	0x3a0
     350:	a3000000 	sb	zero,0(t8)
     354:	241800ff 	li	t8,255
     358:	0314f02a 	slt	s8,t8,s4
     35c:	13c00009 	beqz	s8,0x384
     360:	00000000 	nop
     364:	0016c040 	sll	t8,s6,0x1
     368:	0018c080 	sll	t8,t8,0x2
     36c:	0018c080 	sll	t8,t8,0x2
     370:	0317c021 	addu	t8,t8,s7
     374:	0313c021 	addu	t8,t8,s3
     378:	240f00ff 	li	t7,255
     37c:	10000008 	b	0x3a0
     380:	a30f0000 	sb	t7,0(t8)
     384:	0016c040 	sll	t8,s6,0x1
     388:	0018c080 	sll	t8,t8,0x2
     38c:	0018c080 	sll	t8,t8,0x2
     390:	0317c021 	addu	t8,t8,s7
     394:	0313c021 	addu	t8,t8,s3
     398:	02807821 	move	t7,s4
     39c:	a30f0000 	sb	t7,0(t8)
     3a0:	26f70001 	addiu	s7,s7,1
     3a4:	2418001f 	li	t8,31
     3a8:	02f8f02a 	slt	s8,s7,t8
     3ac:	17c0ff4b 	bnez	s8,0xdc
     3b0:	00000000 	nop
     3b4:	26d60001 	addiu	s6,s6,1
     3b8:	2418001f 	li	t8,31
     3bc:	02d8f02a 	slt	s8,s6,t8
     3c0:	17c0ff45 	bnez	s8,0xd8
     3c4:	00000000 	nop
     3c8:	8fb30010 	lw	s3,16(sp)
     3cc:	8fb40014 	lw	s4,20(sp)
     3d0:	8fb50018 	lw	s5,24(sp)
     3d4:	8fb6001c 	lw	s6,28(sp)
     3d8:	8fb70020 	lw	s7,32(sp)
     3dc:	8fbf0024 	lw	ra,36(sp)
     3e0:	27bd0070 	addiu	sp,sp,112
     3e4:	03e00008 	jr	ra
     3e8:	00000000 	nop
     3ec:	27bdfff8 	addiu	sp,sp,-8
     3f0:	10000005 	b	0x408
     3f4:	afb70000 	sw	s7,0(sp)
     3f8:	0080c021 	move	t8,a0
     3fc:	27180001 	addiu	t8,t8,1
     400:	03002021 	move	a0,t8
     404:	24a5ffff 	addiu	a1,a1,-1
     408:	10a00005 	beqz	a1,0x420
     40c:	00000000 	nop
     410:	0080c021 	move	t8,a0
     414:	33180003 	andi	t8,t8,0x3
     418:	1700fff7 	bnez	t8,0x3f8
     41c:	00000000 	nop
     420:	24180018 	li	t8,24
     424:	00b8f02b 	sltu	s8,a1,t8
     428:	13c00003 	beqz	s8,0x438
     42c:	00000000 	nop
     430:	10000025 	b	0x4c8
     434:	00000000 	nop
     438:	0080b821 	move	s7,a0
     43c:	24a5fff8 	addiu	a1,a1,-8
     440:	24180001 	li	t8,1
     444:	aef80000 	sw	t8,0(s7)
     448:	aee50004 	sw	a1,4(s7)
     44c:	8ef80004 	lw	t8,4(s7)
     450:	3c01ffff 	lui	at,0xffff
     454:	3421fffe 	ori	at,at,0xfffe
     458:	03017824 	and	t7,t8,at
     45c:	01f77821 	addu	t7,t7,s7
     460:	adf80000 	sw	t8,0(t7)
     464:	8ef80004 	lw	t8,4(s7)
     468:	3c01ffff 	lui	at,0xffff
     46c:	3421fffe 	ori	at,at,0xfffe
     470:	0301c024 	and	t8,t8,at
     474:	0317c021 	addu	t8,t8,s7
     478:	240f0001 	li	t7,1
     47c:	af0f0004 	sw	t7,4(t8)
     480:	3c180040 	lui	t8,0x40
     484:	8f180010 	lw	t8,16(t8)
     488:	00000000 	nop
     48c:	aef80008 	sw	t8,8(s7)
     490:	3c180040 	lui	t8,0x40
     494:	8f180010 	lw	t8,16(t8)
     498:	00000000 	nop
     49c:	8f18000c 	lw	t8,12(t8)
     4a0:	00000000 	nop
     4a4:	aef8000c 	sw	t8,12(s7)
     4a8:	3c180040 	lui	t8,0x40
     4ac:	8f180010 	lw	t8,16(t8)
     4b0:	00000000 	nop
     4b4:	2718000c 	addiu	t8,t8,12
     4b8:	8f0f0000 	lw	t7,0(t8)
     4bc:	00000000 	nop
     4c0:	adf70008 	sw	s7,8(t7)
     4c4:	af170000 	sw	s7,0(t8)
     4c8:	8fb70000 	lw	s7,0(sp)
     4cc:	03e00008 	jr	ra
     4d0:	27bd0008 	addiu	sp,sp,8
     4d4:	27bdffe0 	addiu	sp,sp,-32
     4d8:	afb60010 	sw	s6,16(sp)
     4dc:	afb70014 	sw	s7,20(sp)
     4e0:	afbf0018 	sw	ra,24(sp)
     4e4:	afa40020 	sw	a0,32(sp)
     4e8:	00a0b821 	move	s7,a1
     4ec:	02e02021 	move	a0,s7
     4f0:	8fa50020 	lw	a1,32(sp)
     4f4:	00000000 	nop
     4f8:	00850019 	multu	a0,a1
     4fc:	00001012 	mflo	v0
     500:	0040c021 	move	t8,v0
     504:	0300b821 	move	s7,t8
     508:	0c0001d6 	jal	0x758
     50c:	02e02021 	move	a0,s7
     510:	0040b021 	move	s6,v0
     514:	0040c021 	move	t8,v0
     518:	17000003 	bnez	t8,0x528
     51c:	00000000 	nop
     520:	10000006 	b	0x53c
     524:	00001021 	move	v0,zero
     528:	02c02021 	move	a0,s6
     52c:	00002821 	move	a1,zero
     530:	0c0002fd 	jal	0xbf4
     534:	02e03021 	move	a2,s7
     538:	02c01021 	move	v0,s6
     53c:	8fb60010 	lw	s6,16(sp)
     540:	8fb70014 	lw	s7,20(sp)
     544:	8fbf0018 	lw	ra,24(sp)
     548:	27bd0020 	addiu	sp,sp,32
     54c:	03e00008 	jr	ra
     550:	00000000 	nop
     554:	27bdfff0 	addiu	sp,sp,-16
     558:	afb60000 	sw	s6,0(sp)
     55c:	afb70004 	sw	s7,4(sp)
     560:	0080c021 	move	t8,a0
     564:	17000003 	bnez	t8,0x574
     568:	00000000 	nop
     56c:	10000076 	b	0x748
     570:	00000000 	nop
     574:	3c17ffff 	lui	s7,0xffff
     578:	36f7fff8 	ori	s7,s7,0xfff8
     57c:	02e4b821 	addu	s7,s7,a0
     580:	8ef80004 	lw	t8,4(s7)
     584:	00000000 	nop
     588:	33180001 	andi	t8,t8,0x1
     58c:	17000003 	bnez	t8,0x59c
     590:	00000000 	nop
     594:	1000006c 	b	0x748
     598:	00000000 	nop
     59c:	26f80004 	addiu	t8,s7,4
     5a0:	8f0f0000 	lw	t7,0(t8)
     5a4:	3c01ffff 	lui	at,0xffff
     5a8:	3421fffe 	ori	at,at,0xfffe
     5ac:	01e17824 	and	t7,t7,at
     5b0:	af0f0000 	sw	t7,0(t8)
     5b4:	8ef80004 	lw	t8,4(s7)
     5b8:	3c01ffff 	lui	at,0xffff
     5bc:	3421fffe 	ori	at,at,0xfffe
     5c0:	0301c024 	and	t8,t8,at
     5c4:	0317c021 	addu	t8,t8,s7
     5c8:	8f0f0000 	lw	t7,0(t8)
     5cc:	3c01ffff 	lui	at,0xffff
     5d0:	3421fffe 	ori	at,at,0xfffe
     5d4:	01e17824 	and	t7,t7,at
     5d8:	af0f0000 	sw	t7,0(t8)
     5dc:	8ef80000 	lw	t8,0(s7)
     5e0:	00000000 	nop
     5e4:	33180001 	andi	t8,t8,0x1
     5e8:	17000020 	bnez	t8,0x66c
     5ec:	00000000 	nop
     5f0:	8ef80004 	lw	t8,4(s7)
     5f4:	00000000 	nop
     5f8:	afb8000c 	sw	t8,12(sp)
     5fc:	8ef80000 	lw	t8,0(s7)
     600:	3c01ffff 	lui	at,0xffff
     604:	3421fffe 	ori	at,at,0xfffe
     608:	0301c024 	and	t8,t8,at
     60c:	241effff 	li	s8,-1
     610:	031ec026 	xor	t8,t8,s8
     614:	27180001 	addiu	t8,t8,1
     618:	0317b821 	addu	s7,t8,s7
     61c:	26f80004 	addiu	t8,s7,4
     620:	8f0f0000 	lw	t7,0(t8)
     624:	8fae000c 	lw	t6,12(sp)
     628:	00000000 	nop
     62c:	01ee7821 	addu	t7,t7,t6
     630:	af0f0000 	sw	t7,0(t8)
     634:	8ef80004 	lw	t8,4(s7)
     638:	3c01ffff 	lui	at,0xffff
     63c:	3421fffe 	ori	at,at,0xfffe
     640:	03017824 	and	t7,t8,at
     644:	01f77821 	addu	t7,t7,s7
     648:	adf80000 	sw	t8,0(t7)
     64c:	8ef80008 	lw	t8,8(s7)
     650:	8eef000c 	lw	t7,12(s7)
     654:	00000000 	nop
     658:	af0f000c 	sw	t7,12(t8)
     65c:	8ef8000c 	lw	t8,12(s7)
     660:	8eef0008 	lw	t7,8(s7)
     664:	00000000 	nop
     668:	af0f0008 	sw	t7,8(t8)
     66c:	8ef80004 	lw	t8,4(s7)
     670:	3c01ffff 	lui	at,0xffff
     674:	3421fffe 	ori	at,at,0xfffe
     678:	0301c024 	and	t8,t8,at
     67c:	0317b021 	addu	s6,t8,s7
     680:	8ed80004 	lw	t8,4(s6)
     684:	00000000 	nop
     688:	33180001 	andi	t8,t8,0x1
     68c:	1700001c 	bnez	t8,0x700
     690:	00000000 	nop
     694:	26f80004 	addiu	t8,s7,4
     698:	8f0f0000 	lw	t7,0(t8)
     69c:	8ece0004 	lw	t6,4(s6)
     6a0:	00000000 	nop
     6a4:	01ee7821 	addu	t7,t7,t6
     6a8:	af0f0000 	sw	t7,0(t8)
     6ac:	8ef80004 	lw	t8,4(s7)
     6b0:	3c01ffff 	lui	at,0xffff
     6b4:	3421fffe 	ori	at,at,0xfffe
     6b8:	03017824 	and	t7,t8,at
     6bc:	01f77821 	addu	t7,t7,s7
     6c0:	adf80000 	sw	t8,0(t7)
     6c4:	3c180040 	lui	t8,0x40
     6c8:	8f180014 	lw	t8,20(t8)
     6cc:	02c07821 	move	t7,s6
     6d0:	170f0003 	bne	t8,t7,0x6e0
     6d4:	00000000 	nop
     6d8:	3c010040 	lui	at,0x40
     6dc:	ac370014 	sw	s7,20(at)
     6e0:	8ed80008 	lw	t8,8(s6)
     6e4:	8ecf000c 	lw	t7,12(s6)
     6e8:	00000000 	nop
     6ec:	af0f000c 	sw	t7,12(t8)
     6f0:	8ed8000c 	lw	t8,12(s6)
     6f4:	8ecf0008 	lw	t7,8(s6)
     6f8:	00000000 	nop
     6fc:	af0f0008 	sw	t7,8(t8)
     700:	3c180040 	lui	t8,0x40
     704:	8f180010 	lw	t8,16(t8)
     708:	00000000 	nop
     70c:	aef80008 	sw	t8,8(s7)
     710:	3c180040 	lui	t8,0x40
     714:	8f180010 	lw	t8,16(t8)
     718:	00000000 	nop
     71c:	8f18000c 	lw	t8,12(t8)
     720:	00000000 	nop
     724:	aef8000c 	sw	t8,12(s7)
     728:	3c180040 	lui	t8,0x40
     72c:	8f180010 	lw	t8,16(t8)
     730:	00000000 	nop
     734:	2718000c 	addiu	t8,t8,12
     738:	8f0f0000 	lw	t7,0(t8)
     73c:	00000000 	nop
     740:	adf70008 	sw	s7,8(t7)
     744:	af170000 	sw	s7,0(t8)
     748:	8fb60000 	lw	s6,0(sp)
     74c:	8fb70004 	lw	s7,4(sp)
     750:	03e00008 	jr	ra
     754:	27bd0010 	addiu	sp,sp,16
     758:	27bdffe8 	addiu	sp,sp,-24
     75c:	afb40000 	sw	s4,0(sp)
     760:	afb50004 	sw	s5,4(sp)
     764:	afb60008 	sw	s6,8(sp)
     768:	14800003 	bnez	a0,0x778
     76c:	afb7000c 	sw	s7,12(sp)
     770:	1000006f 	b	0x930
     774:	00001021 	move	v0,zero
     778:	24980008 	addiu	t8,a0,8
     77c:	240f0010 	li	t7,16
     780:	030ff02b 	sltu	s8,t8,t7
     784:	13c00003 	beqz	s8,0x794
     788:	00000000 	nop
     78c:	10000002 	b	0x798
     790:	24140010 	li	s4,16
     794:	24940008 	addiu	s4,a0,8
     798:	26980004 	addiu	t8,s4,4
     79c:	2718ffff 	addiu	t8,t8,-1
     7a0:	3c01ffff 	lui	at,0xffff
     7a4:	3421fffc 	ori	at,at,0xfffc
     7a8:	0301b024 	and	s6,t8,at
     7ac:	3c170040 	lui	s7,0x40
     7b0:	8ef70014 	lw	s7,20(s7)
     7b4:	00000000 	nop
     7b8:	8ef80004 	lw	t8,4(s7)
     7bc:	00000000 	nop
     7c0:	0316f02b 	sltu	s8,t8,s6
     7c4:	17c00003 	bnez	s8,0x7d4
     7c8:	00000000 	nop
     7cc:	10000009 	b	0x7f4
     7d0:	00000000 	nop
     7d4:	8ef7000c 	lw	s7,12(s7)
     7d8:	00000000 	nop
     7dc:	02e0c021 	move	t8,s7
     7e0:	3c0f0040 	lui	t7,0x40
     7e4:	8def0014 	lw	t7,20(t7)
     7e8:	00000000 	nop
     7ec:	170ffff2 	bne	t8,t7,0x7b8
     7f0:	00000000 	nop
     7f4:	8ef80004 	lw	t8,4(s7)
     7f8:	00000000 	nop
     7fc:	0316f02b 	sltu	s8,t8,s6
     800:	13c00003 	beqz	s8,0x810
     804:	00000000 	nop
     808:	10000049 	b	0x930
     80c:	00001021 	move	v0,zero
     810:	8ef8000c 	lw	t8,12(s7)
     814:	3c010040 	lui	at,0x40
     818:	ac380014 	sw	t8,20(at)
     81c:	8ef80004 	lw	t8,4(s7)
     820:	00000000 	nop
     824:	afb80014 	sw	t8,20(sp)
     828:	8fb80014 	lw	t8,20(sp)
     82c:	00000000 	nop
     830:	0316c023 	subu	t8,t8,s6
     834:	240f0010 	li	t7,16
     838:	030ff02b 	sltu	s8,t8,t7
     83c:	17c00029 	bnez	s8,0x8e4
     840:	00000000 	nop
     844:	aef60004 	sw	s6,4(s7)
     848:	8ef80004 	lw	t8,4(s7)
     84c:	3c01ffff 	lui	at,0xffff
     850:	3421fffe 	ori	at,at,0xfffe
     854:	03017824 	and	t7,t8,at
     858:	01f77821 	addu	t7,t7,s7
     85c:	adf80000 	sw	t8,0(t7)
     860:	8ef80004 	lw	t8,4(s7)
     864:	3c01ffff 	lui	at,0xffff
     868:	3421fffe 	ori	at,at,0xfffe
     86c:	0301c024 	and	t8,t8,at
     870:	0317a821 	addu	s5,t8,s7
     874:	8fb80014 	lw	t8,20(sp)
     878:	00000000 	nop
     87c:	0316c023 	subu	t8,t8,s6
     880:	aeb80004 	sw	t8,4(s5)
     884:	8eb80004 	lw	t8,4(s5)
     888:	3c01ffff 	lui	at,0xffff
     88c:	3421fffe 	ori	at,at,0xfffe
     890:	03017824 	and	t7,t8,at
     894:	01f57821 	addu	t7,t7,s5
     898:	adf80000 	sw	t8,0(t7)
     89c:	3c180040 	lui	t8,0x40
     8a0:	8f180010 	lw	t8,16(t8)
     8a4:	00000000 	nop
     8a8:	aeb80008 	sw	t8,8(s5)
     8ac:	3c180040 	lui	t8,0x40
     8b0:	8f180010 	lw	t8,16(t8)
     8b4:	00000000 	nop
     8b8:	8f18000c 	lw	t8,12(t8)
     8bc:	00000000 	nop
     8c0:	aeb8000c 	sw	t8,12(s5)
     8c4:	3c180040 	lui	t8,0x40
     8c8:	8f180010 	lw	t8,16(t8)
     8cc:	00000000 	nop
     8d0:	2718000c 	addiu	t8,t8,12
     8d4:	8f0f0000 	lw	t7,0(t8)
     8d8:	00000000 	nop
     8dc:	adf50008 	sw	s5,8(t7)
     8e0:	af150000 	sw	s5,0(t8)
     8e4:	8ef80008 	lw	t8,8(s7)
     8e8:	8eef000c 	lw	t7,12(s7)
     8ec:	00000000 	nop
     8f0:	af0f000c 	sw	t7,12(t8)
     8f4:	8ef8000c 	lw	t8,12(s7)
     8f8:	8eef0008 	lw	t7,8(s7)
     8fc:	00000000 	nop
     900:	af0f0008 	sw	t7,8(t8)
     904:	26f80004 	addiu	t8,s7,4
     908:	8f0f0000 	lw	t7,0(t8)
     90c:	00000000 	nop
     910:	35ee0001 	ori	t6,t7,0x1
     914:	af0e0000 	sw	t6,0(t8)
     918:	3c01ffff 	lui	at,0xffff
     91c:	3421fffe 	ori	at,at,0xfffe
     920:	01e1c024 	and	t8,t7,at
     924:	0317c021 	addu	t8,t8,s7
     928:	af0e0000 	sw	t6,0(t8)
     92c:	26e20008 	addiu	v0,s7,8
     930:	8fb40000 	lw	s4,0(sp)
     934:	8fb50004 	lw	s5,4(sp)
     938:	8fb60008 	lw	s6,8(sp)
     93c:	8fb7000c 	lw	s7,12(sp)
     940:	03e00008 	jr	ra
     944:	27bd0018 	addiu	sp,sp,24
     948:	27bdffd0 	addiu	sp,sp,-48
     94c:	afb20010 	sw	s2,16(sp)
     950:	afb30014 	sw	s3,20(sp)
     954:	afb40018 	sw	s4,24(sp)
     958:	afb5001c 	sw	s5,28(sp)
     95c:	afb60020 	sw	s6,32(sp)
     960:	afb70024 	sw	s7,36(sp)
     964:	afbf0028 	sw	ra,40(sp)
     968:	0080b821 	move	s7,a0
     96c:	00a0b021 	move	s6,a1
     970:	02e0c021 	move	t8,s7
     974:	17000005 	bnez	t8,0x98c
     978:	00000000 	nop
     97c:	0c0001d6 	jal	0x758
     980:	02c02021 	move	a0,s6
     984:	1000006d 	b	0xb3c
     988:	0040c021 	move	t8,v0
     98c:	16c00005 	bnez	s6,0x9a4
     990:	00000000 	nop
     994:	0c000155 	jal	0x554
     998:	02e02021 	move	a0,s7
     99c:	10000067 	b	0xb3c
     9a0:	00001021 	move	v0,zero
     9a4:	3c15ffff 	lui	s5,0xffff
     9a8:	36b5fff8 	ori	s5,s5,0xfff8
     9ac:	02b7a821 	addu	s5,s5,s7
     9b0:	8eb80004 	lw	t8,4(s5)
     9b4:	00000000 	nop
     9b8:	33180001 	andi	t8,t8,0x1
     9bc:	17000003 	bnez	t8,0x9cc
     9c0:	00000000 	nop
     9c4:	1000005d 	b	0xb3c
     9c8:	00001021 	move	v0,zero
     9cc:	8eb80004 	lw	t8,4(s5)
     9d0:	3c01ffff 	lui	at,0xffff
     9d4:	3421fffe 	ori	at,at,0xfffe
     9d8:	0301a024 	and	s4,t8,at
     9dc:	26d80008 	addiu	t8,s6,8
     9e0:	240f0010 	li	t7,16
     9e4:	030ff02b 	sltu	s8,t8,t7
     9e8:	13c00003 	beqz	s8,0x9f8
     9ec:	00000000 	nop
     9f0:	10000002 	b	0x9fc
     9f4:	24120010 	li	s2,16
     9f8:	26d20008 	addiu	s2,s6,8
     9fc:	26580004 	addiu	t8,s2,4
     a00:	2718ffff 	addiu	t8,t8,-1
     a04:	3c01ffff 	lui	at,0xffff
     a08:	3421fffc 	ori	at,at,0xfffc
     a0c:	03019824 	and	s3,t8,at
     a10:	0293f02b 	sltu	s8,s4,s3
     a14:	17c0003a 	bnez	s8,0xb00
     a18:	00000000 	nop
     a1c:	0293c023 	subu	t8,s4,s3
     a20:	240f0010 	li	t7,16
     a24:	030ff02b 	sltu	s8,t8,t7
     a28:	13c00003 	beqz	s8,0xa38
     a2c:	00000000 	nop
     a30:	10000042 	b	0xb3c
     a34:	02e01021 	move	v0,s7
     a38:	aeb30004 	sw	s3,4(s5)
     a3c:	8eb80004 	lw	t8,4(s5)
     a40:	3c01ffff 	lui	at,0xffff
     a44:	3421fffe 	ori	at,at,0xfffe
     a48:	03017824 	and	t7,t8,at
     a4c:	01f57821 	addu	t7,t7,s5
     a50:	adf80000 	sw	t8,0(t7)
     a54:	26b80004 	addiu	t8,s5,4
     a58:	8f0f0000 	lw	t7,0(t8)
     a5c:	00000000 	nop
     a60:	35ee0001 	ori	t6,t7,0x1
     a64:	af0e0000 	sw	t6,0(t8)
     a68:	3c01ffff 	lui	at,0xffff
     a6c:	3421fffe 	ori	at,at,0xfffe
     a70:	01e1c024 	and	t8,t7,at
     a74:	0315c021 	addu	t8,t8,s5
     a78:	af0e0000 	sw	t6,0(t8)
     a7c:	8eb80004 	lw	t8,4(s5)
     a80:	3c01ffff 	lui	at,0xffff
     a84:	3421fffe 	ori	at,at,0xfffe
     a88:	0301c024 	and	t8,t8,at
     a8c:	0315a821 	addu	s5,t8,s5
     a90:	0293c023 	subu	t8,s4,s3
     a94:	aeb80004 	sw	t8,4(s5)
     a98:	8eb80004 	lw	t8,4(s5)
     a9c:	3c01ffff 	lui	at,0xffff
     aa0:	3421fffe 	ori	at,at,0xfffe
     aa4:	03017824 	and	t7,t8,at
     aa8:	01f57821 	addu	t7,t7,s5
     aac:	adf80000 	sw	t8,0(t7)
     ab0:	3c180040 	lui	t8,0x40
     ab4:	8f180010 	lw	t8,16(t8)
     ab8:	00000000 	nop
     abc:	aeb80008 	sw	t8,8(s5)
     ac0:	3c180040 	lui	t8,0x40
     ac4:	8f180010 	lw	t8,16(t8)
     ac8:	00000000 	nop
     acc:	8f18000c 	lw	t8,12(t8)
     ad0:	00000000 	nop
     ad4:	aeb8000c 	sw	t8,12(s5)
     ad8:	3c180040 	lui	t8,0x40
     adc:	8f180010 	lw	t8,16(t8)
     ae0:	00000000 	nop
     ae4:	2718000c 	addiu	t8,t8,12
     ae8:	8f0f0000 	lw	t7,0(t8)
     aec:	00000000 	nop
     af0:	adf50008 	sw	s5,8(t7)
     af4:	af150000 	sw	s5,0(t8)
     af8:	10000010 	b	0xb3c
     afc:	02e01021 	move	v0,s7
     b00:	0c0001d6 	jal	0x758
     b04:	02c02021 	move	a0,s6
     b08:	afa2002c 	sw	v0,44(sp)
     b0c:	0040c021 	move	t8,v0
     b10:	17000003 	bnez	t8,0xb20
     b14:	00000000 	nop
     b18:	10000008 	b	0xb3c
     b1c:	00001021 	move	v0,zero
     b20:	8fa4002c 	lw	a0,44(sp)
     b24:	02e02821 	move	a1,s7
     b28:	0c0002d9 	jal	0xb64
     b2c:	2686fff8 	addiu	a2,s4,-8
     b30:	0c000155 	jal	0x554
     b34:	02e02021 	move	a0,s7
     b38:	8fa2002c 	lw	v0,44(sp)
     b3c:	8fb20010 	lw	s2,16(sp)
     b40:	8fb30014 	lw	s3,20(sp)
     b44:	8fb40018 	lw	s4,24(sp)
     b48:	8fb5001c 	lw	s5,28(sp)
     b4c:	8fb60020 	lw	s6,32(sp)
     b50:	8fb70024 	lw	s7,36(sp)
     b54:	8fbf0028 	lw	ra,40(sp)
     b58:	27bd0030 	addiu	sp,sp,48
     b5c:	03e00008 	jr	ra
     b60:	00000000 	nop
     b64:	27bdfff8 	addiu	sp,sp,-8
     b68:	afb60000 	sw	s6,0(sp)
     b6c:	afb70004 	sw	s7,4(sp)
     b70:	0080b821 	move	s7,a0
     b74:	10000008 	b	0xb98
     b78:	00a0b021 	move	s6,a1
     b7c:	02e0c021 	move	t8,s7
     b80:	27170001 	addiu	s7,t8,1
     b84:	02c07821 	move	t7,s6
     b88:	25f60001 	addiu	s6,t7,1
     b8c:	81ef0000 	lb	t7,0(t7)
     b90:	00000000 	nop
     b94:	a30f0000 	sb	t7,0(t8)
     b98:	00c0c021 	move	t8,a2
     b9c:	1700fff7 	bnez	t8,0xb7c
     ba0:	2706ffff 	addiu	a2,t8,-1
     ba4:	00801021 	move	v0,a0
     ba8:	8fb60000 	lw	s6,0(sp)
     bac:	8fb70004 	lw	s7,4(sp)
     bb0:	03e00008 	jr	ra
     bb4:	27bd0008 	addiu	sp,sp,8
     bb8:	27bdffe8 	addiu	sp,sp,-24
     bbc:	afbf0010 	sw	ra,16(sp)
     bc0:	afa40018 	sw	a0,24(sp)
     bc4:	afa5001c 	sw	a1,28(sp)
     bc8:	afa60020 	sw	a2,32(sp)
     bcc:	8fa40018 	lw	a0,24(sp)
     bd0:	8fa5001c 	lw	a1,28(sp)
     bd4:	8fa60020 	lw	a2,32(sp)
     bd8:	0c0002d9 	jal	0xb64
     bdc:	00000000 	nop
     be0:	0040c021 	move	t8,v0
     be4:	8fbf0010 	lw	ra,16(sp)
     be8:	27bd0018 	addiu	sp,sp,24
     bec:	03e00008 	jr	ra
     bf0:	00000000 	nop
     bf4:	27bdffd0 	addiu	sp,sp,-48
     bf8:	afb20010 	sw	s2,16(sp)
     bfc:	afb30014 	sw	s3,20(sp)
     c00:	afb40018 	sw	s4,24(sp)
     c04:	afb5001c 	sw	s5,28(sp)
     c08:	afb60020 	sw	s6,32(sp)
     c0c:	afb70024 	sw	s7,36(sp)
     c10:	afbf0028 	sw	ra,40(sp)
     c14:	afa40030 	sw	a0,48(sp)
     c18:	00a0b821 	move	s7,a1
     c1c:	00c0b021 	move	s6,a2
     c20:	8fb50030 	lw	s5,48(sp)
     c24:	00000000 	nop
     c28:	afb5002c 	sw	s5,44(sp)
     c2c:	24180003 	li	t8,3
     c30:	0316f02b 	sltu	s8,t8,s6
     c34:	13c00027 	beqz	s8,0xcd4
     c38:	00000000 	nop
     c3c:	02a0c021 	move	t8,s5
     c40:	33180003 	andi	t8,t8,0x3
     c44:	1300000c 	beqz	t8,0xc78
     c48:	03009021 	move	s2,t8
     c4c:	24180004 	li	t8,4
     c50:	03129023 	subu	s2,t8,s2
     c54:	10000005 	b	0xc6c
     c58:	02d2b023 	subu	s6,s6,s2
     c5c:	02a0c021 	move	t8,s5
     c60:	27150001 	addiu	s5,t8,1
     c64:	02e07821 	move	t7,s7
     c68:	a30f0000 	sb	t7,0(t8)
     c6c:	0240c021 	move	t8,s2
     c70:	1700fffa 	bnez	t8,0xc5c
     c74:	2712ffff 	addiu	s2,t8,-1
     c78:	0016c082 	srl	t8,s6,0x2
     c7c:	03009821 	move	s3,t8
     c80:	32d60003 	andi	s6,s6,0x3
     c84:	02e0c021 	move	t8,s7
     c88:	331800ff 	andi	t8,t8,0xff
     c8c:	0300a021 	move	s4,t8
     c90:	0014c200 	sll	t8,s4,0x8
     c94:	0298a025 	or	s4,s4,t8
     c98:	0014c200 	sll	t8,s4,0x8
     c9c:	0018c200 	sll	t8,t8,0x8
     ca0:	10000003 	b	0xcb0
     ca4:	0298a025 	or	s4,s4,t8
     ca8:	aeb40000 	sw	s4,0(s5)
     cac:	26b50004 	addiu	s5,s5,4
     cb0:	0260c021 	move	t8,s3
     cb4:	1700fffc 	bnez	t8,0xca8
     cb8:	2713ffff 	addiu	s3,t8,-1
     cbc:	10000005 	b	0xcd4
     cc0:	00000000 	nop
     cc4:	02a0c021 	move	t8,s5
     cc8:	27150001 	addiu	s5,t8,1
     ccc:	02e07821 	move	t7,s7
     cd0:	a30f0000 	sb	t7,0(t8)
     cd4:	02c0c021 	move	t8,s6
     cd8:	1700fffa 	bnez	t8,0xcc4
     cdc:	2716ffff 	addiu	s6,t8,-1
     ce0:	8fa2002c 	lw	v0,44(sp)
     ce4:	8fb20010 	lw	s2,16(sp)
     ce8:	8fb30014 	lw	s3,20(sp)
     cec:	8fb40018 	lw	s4,24(sp)
     cf0:	8fb5001c 	lw	s5,28(sp)
     cf4:	8fb60020 	lw	s6,32(sp)
     cf8:	8fb70024 	lw	s7,36(sp)
     cfc:	8fbf0028 	lw	ra,40(sp)
     d00:	27bd0030 	addiu	sp,sp,48
     d04:	03e00008 	jr	ra
     d08:	00000000 	nop
     d0c:	27bdffd8 	addiu	sp,sp,-40
     d10:	afb40010 	sw	s4,16(sp)
     d14:	afb50014 	sw	s5,20(sp)
     d18:	afb60018 	sw	s6,24(sp)
     d1c:	afb7001c 	sw	s7,28(sp)
     d20:	afbf0020 	sw	ra,32(sp)
     d24:	0080b821 	move	s7,a0
     d28:	00a0b021 	move	s6,a1
     d2c:	24150001 	li	s5,1
     d30:	1000000d 	b	0xd68
     d34:	0000a021 	move	s4,zero
     d38:	24180001 	li	t8,1
     d3c:	afb80024 	sw	t8,36(sp)
     d40:	02c02021 	move	a0,s6
     d44:	0c000416 	jal	0x1058
     d48:	03002821 	move	a1,t8
     d4c:	0040b021 	move	s6,v0
     d50:	02a02021 	move	a0,s5
     d54:	8fb80024 	lw	t8,36(sp)
     d58:	00000000 	nop
     d5c:	0c000416 	jal	0x1058
     d60:	03002821 	move	a1,t8
     d64:	0040a821 	move	s5,v0
     d68:	02d7f02b 	sltu	s8,s6,s7
     d6c:	13c00007 	beqz	s8,0xd8c
     d70:	00000000 	nop
     d74:	12a00005 	beqz	s5,0xd8c
     d78:	00000000 	nop
     d7c:	3c018000 	lui	at,0x8000
     d80:	02c1c024 	and	t8,s6,at
     d84:	1300ffec 	beqz	t8,0xd38
     d88:	00000000 	nop
     d8c:	10000012 	b	0xdd8
     d90:	00000000 	nop
     d94:	02f6f02b 	sltu	s8,s7,s6
     d98:	17c00003 	bnez	s8,0xda8
     d9c:	00000000 	nop
     da0:	02f6b823 	subu	s7,s7,s6
     da4:	0295a025 	or	s4,s4,s5
     da8:	24180001 	li	t8,1
     dac:	afb80024 	sw	t8,36(sp)
     db0:	02a02021 	move	a0,s5
     db4:	0c000448 	jal	0x1120
     db8:	03002821 	move	a1,t8
     dbc:	0040a821 	move	s5,v0
     dc0:	02c02021 	move	a0,s6
     dc4:	8fb80024 	lw	t8,36(sp)
     dc8:	00000000 	nop
     dcc:	0c000448 	jal	0x1120
     dd0:	03002821 	move	a1,t8
     dd4:	0040b021 	move	s6,v0
     dd8:	16a0ffee 	bnez	s5,0xd94
     ddc:	00000000 	nop
     de0:	02801021 	move	v0,s4
     de4:	8fb40010 	lw	s4,16(sp)
     de8:	8fb50014 	lw	s5,20(sp)
     dec:	8fb60018 	lw	s6,24(sp)
     df0:	8fb7001c 	lw	s7,28(sp)
     df4:	8fbf0020 	lw	ra,32(sp)
     df8:	27bd0028 	addiu	sp,sp,40
     dfc:	03e00008 	jr	ra
     e00:	00000000 	nop
     e04:	27bdffd8 	addiu	sp,sp,-40
     e08:	afb30010 	sw	s3,16(sp)
     e0c:	afb40014 	sw	s4,20(sp)
     e10:	afb50018 	sw	s5,24(sp)
     e14:	afb6001c 	sw	s6,28(sp)
     e18:	afb70020 	sw	s7,32(sp)
     e1c:	afbf0024 	sw	ra,36(sp)
     e20:	0080b821 	move	s7,a0
     e24:	00a0b021 	move	s6,a1
     e28:	0000a821 	move	s5,zero
     e2c:	02e0f02a 	slt	s8,s7,zero
     e30:	13c00007 	beqz	s8,0xe50
     e34:	00000000 	nop
     e38:	16a00003 	bnez	s5,0xe48
     e3c:	0017b823 	negu	s7,s7
     e40:	10000002 	b	0xe4c
     e44:	24130001 	li	s3,1
     e48:	00009821 	move	s3,zero
     e4c:	0260a821 	move	s5,s3
     e50:	02c0f02a 	slt	s8,s6,zero
     e54:	13c00007 	beqz	s8,0xe74
     e58:	00000000 	nop
     e5c:	16a00003 	bnez	s5,0xe6c
     e60:	0016b023 	negu	s6,s6
     e64:	10000002 	b	0xe70
     e68:	24130001 	li	s3,1
     e6c:	00009821 	move	s3,zero
     e70:	0260a821 	move	s5,s3
     e74:	02e02021 	move	a0,s7
     e78:	0c000343 	jal	0xd0c
     e7c:	02c02821 	move	a1,s6
     e80:	12a00002 	beqz	s5,0xe8c
     e84:	0040a021 	move	s4,v0
     e88:	0014a023 	negu	s4,s4
     e8c:	02801021 	move	v0,s4
     e90:	8fb30010 	lw	s3,16(sp)
     e94:	8fb40014 	lw	s4,20(sp)
     e98:	8fb50018 	lw	s5,24(sp)
     e9c:	8fb6001c 	lw	s6,28(sp)
     ea0:	8fb70020 	lw	s7,32(sp)
     ea4:	8fbf0024 	lw	ra,36(sp)
     ea8:	27bd0028 	addiu	sp,sp,40
     eac:	03e00008 	jr	ra
     eb0:	00000000 	nop
     eb4:	27bdffd8 	addiu	sp,sp,-40
     eb8:	afb50010 	sw	s5,16(sp)
     ebc:	afb60014 	sw	s6,20(sp)
     ec0:	afb70018 	sw	s7,24(sp)
     ec4:	afbf001c 	sw	ra,28(sp)
     ec8:	0080b821 	move	s7,a0
     ecc:	00a0b021 	move	s6,a1
     ed0:	1000000d 	b	0xf08
     ed4:	24150001 	li	s5,1
     ed8:	24180001 	li	t8,1
     edc:	afb80024 	sw	t8,36(sp)
     ee0:	02c02021 	move	a0,s6
     ee4:	0c000416 	jal	0x1058
     ee8:	03002821 	move	a1,t8
     eec:	0040b021 	move	s6,v0
     ef0:	02a02021 	move	a0,s5
     ef4:	8fb80024 	lw	t8,36(sp)
     ef8:	00000000 	nop
     efc:	0c000416 	jal	0x1058
     f00:	03002821 	move	a1,t8
     f04:	0040a821 	move	s5,v0
     f08:	02d7f02b 	sltu	s8,s6,s7
     f0c:	13c00007 	beqz	s8,0xf2c
     f10:	00000000 	nop
     f14:	12a00005 	beqz	s5,0xf2c
     f18:	00000000 	nop
     f1c:	3c018000 	lui	at,0x8000
     f20:	02c1c024 	and	t8,s6,at
     f24:	1300ffec 	beqz	t8,0xed8
     f28:	00000000 	nop
     f2c:	10000011 	b	0xf74
     f30:	00000000 	nop
     f34:	02f6f02b 	sltu	s8,s7,s6
     f38:	17c00002 	bnez	s8,0xf44
     f3c:	00000000 	nop
     f40:	02f6b823 	subu	s7,s7,s6
     f44:	24180001 	li	t8,1
     f48:	afb80024 	sw	t8,36(sp)
     f4c:	02a02021 	move	a0,s5
     f50:	0c000448 	jal	0x1120
     f54:	03002821 	move	a1,t8
     f58:	0040a821 	move	s5,v0
     f5c:	02c02021 	move	a0,s6
     f60:	8fb80024 	lw	t8,36(sp)
     f64:	00000000 	nop
     f68:	0c000448 	jal	0x1120
     f6c:	03002821 	move	a1,t8
     f70:	0040b021 	move	s6,v0
     f74:	16a0ffef 	bnez	s5,0xf34
     f78:	00000000 	nop
     f7c:	02e01021 	move	v0,s7
     f80:	8fb50010 	lw	s5,16(sp)
     f84:	8fb60014 	lw	s6,20(sp)
     f88:	8fb70018 	lw	s7,24(sp)
     f8c:	8fbf001c 	lw	ra,28(sp)
     f90:	27bd0028 	addiu	sp,sp,40
     f94:	03e00008 	jr	ra
     f98:	00000000 	nop
     f9c:	27bdffd8 	addiu	sp,sp,-40
     fa0:	afb50010 	sw	s5,16(sp)
     fa4:	afb60014 	sw	s6,20(sp)
     fa8:	afb70018 	sw	s7,24(sp)
     fac:	afbf001c 	sw	ra,28(sp)
     fb0:	0080b821 	move	s7,a0
     fb4:	00a0b021 	move	s6,a1
     fb8:	afa00024 	sw	zero,36(sp)
     fbc:	02e0f02a 	slt	s8,s7,zero
     fc0:	13c00004 	beqz	s8,0xfd4
     fc4:	00000000 	nop
     fc8:	0017b823 	negu	s7,s7
     fcc:	24180001 	li	t8,1
     fd0:	afb80024 	sw	t8,36(sp)
     fd4:	02c0f02a 	slt	s8,s6,zero
     fd8:	13c00002 	beqz	s8,0xfe4
     fdc:	00000000 	nop
     fe0:	0016b023 	negu	s6,s6
     fe4:	02e02021 	move	a0,s7
     fe8:	0c0003ad 	jal	0xeb4
     fec:	02c02821 	move	a1,s6
     ff0:	0040a821 	move	s5,v0
     ff4:	8fb80024 	lw	t8,36(sp)
     ff8:	00000000 	nop
     ffc:	13000002 	beqz	t8,0x1008
    1000:	00000000 	nop
    1004:	0015a823 	negu	s5,s5
    1008:	02a01021 	move	v0,s5
    100c:	8fb50010 	lw	s5,16(sp)
    1010:	8fb60014 	lw	s6,20(sp)
    1014:	8fb70018 	lw	s7,24(sp)
    1018:	8fbf001c 	lw	ra,28(sp)
    101c:	27bd0028 	addiu	sp,sp,40
    1020:	03e00008 	jr	ra
    1024:	00000000 	nop
    1028:	27bdfff8 	addiu	sp,sp,-8
    102c:	14800003 	bnez	a0,0x103c
    1030:	afb70000 	sw	s7,0(sp)
    1034:	10000004 	b	0x1048
    1038:	0000b821 	move	s7,zero
    103c:	0080c021 	move	t8,a0
    1040:	3c018000 	lui	at,0x8000
    1044:	0301b826 	xor	s7,t8,at
    1048:	02e01021 	move	v0,s7
    104c:	8fb70000 	lw	s7,0(sp)
    1050:	03e00008 	jr	ra
    1054:	27bd0008 	addiu	sp,sp,8
    1058:	00801021 	move	v0,a0
    105c:	30a80001 	andi	t0,a1,0x1
    1060:	11000002 	beqz	t0,0x106c
    1064:	00000000 	nop
    1068:	00021040 	sll	v0,v0,0x1
    106c:	30a80002 	andi	t0,a1,0x2
    1070:	11000002 	beqz	t0,0x107c
    1074:	00000000 	nop
    1078:	00021080 	sll	v0,v0,0x2
    107c:	30a80004 	andi	t0,a1,0x4
    1080:	11000003 	beqz	t0,0x1090
    1084:	00000000 	nop
    1088:	00021080 	sll	v0,v0,0x2
    108c:	00021080 	sll	v0,v0,0x2
    1090:	30a80008 	andi	t0,a1,0x8
    1094:	11000002 	beqz	t0,0x10a0
    1098:	00000000 	nop
    109c:	00021200 	sll	v0,v0,0x8
    10a0:	30a80010 	andi	t0,a1,0x10
    10a4:	11000003 	beqz	t0,0x10b4
    10a8:	00000000 	nop
    10ac:	00021200 	sll	v0,v0,0x8
    10b0:	00021200 	sll	v0,v0,0x8
    10b4:	03e00008 	jr	ra
    10b8:	00000000 	nop
    10bc:	00801021 	move	v0,a0
    10c0:	30a80001 	andi	t0,a1,0x1
    10c4:	11000002 	beqz	t0,0x10d0
    10c8:	00000000 	nop
    10cc:	00021043 	sra	v0,v0,0x1
    10d0:	30a80002 	andi	t0,a1,0x2
    10d4:	11000002 	beqz	t0,0x10e0
    10d8:	00000000 	nop
    10dc:	00021083 	sra	v0,v0,0x2
    10e0:	30a80004 	andi	t0,a1,0x4
    10e4:	11000003 	beqz	t0,0x10f4
    10e8:	00000000 	nop
    10ec:	00021083 	sra	v0,v0,0x2
    10f0:	00021083 	sra	v0,v0,0x2
    10f4:	30a80008 	andi	t0,a1,0x8
    10f8:	11000002 	beqz	t0,0x1104
    10fc:	00000000 	nop
    1100:	00021203 	sra	v0,v0,0x8
    1104:	30a80010 	andi	t0,a1,0x10
    1108:	11000003 	beqz	t0,0x1118
    110c:	00000000 	nop
    1110:	00021203 	sra	v0,v0,0x8
    1114:	00021203 	sra	v0,v0,0x8
    1118:	03e00008 	jr	ra
    111c:	00000000 	nop
    1120:	00801021 	move	v0,a0
    1124:	30a80001 	andi	t0,a1,0x1
    1128:	11000002 	beqz	t0,0x1134
    112c:	00000000 	nop
    1130:	00021042 	srl	v0,v0,0x1
    1134:	30a80002 	andi	t0,a1,0x2
    1138:	11000002 	beqz	t0,0x1144
    113c:	00000000 	nop
    1140:	00021082 	srl	v0,v0,0x2
    1144:	30a80004 	andi	t0,a1,0x4
    1148:	11000003 	beqz	t0,0x1158
    114c:	00000000 	nop
    1150:	00021082 	srl	v0,v0,0x2
    1154:	00021082 	srl	v0,v0,0x2
    1158:	30a80008 	andi	t0,a1,0x8
    115c:	11000002 	beqz	t0,0x1168
    1160:	00000000 	nop
    1164:	00021202 	srl	v0,v0,0x8
    1168:	30a80010 	andi	t0,a1,0x10
    116c:	11000003 	beqz	t0,0x117c
    1170:	00000000 	nop
    1174:	00021202 	srl	v0,v0,0x8
    1178:	00021202 	srl	v0,v0,0x8
    117c:	03e00008 	jr	ra
    1180:	00000000 	nop
    1184:	24020000 	li	v0,0
    1188:	00805021 	move	t2,a0
    118c:	00a05821 	move	t3,a1
    1190:	31480001 	andi	t0,t2,0x1
    1194:	11000002 	beqz	t0,0x11a0
    1198:	00000000 	nop
    119c:	004b1021 	addu	v0,v0,t3
    11a0:	000a5042 	srl	t2,t2,0x1
    11a4:	1540fffa 	bnez	t2,0x1190
    11a8:	000b5840 	sll	t3,t3,0x1
    11ac:	03e00008 	jr	ra
	...
  400008:	00400000 	0x400000
  40000c:	00400000 	0x400000
  400010:	00400000 	0x400000
  400014:	00400000 	0x400000
