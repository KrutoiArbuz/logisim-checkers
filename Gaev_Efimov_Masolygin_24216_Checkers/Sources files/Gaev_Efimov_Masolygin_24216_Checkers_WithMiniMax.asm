asect 0
main: ext               # Declare labels
default_handler: ext    # as external

# Interrupt vector table (IVT)
# Place a vector to program start and map 
# all internal exceptions to default_handler
dc main, 0              # Startup/Reset vector
dc default_handler, 0   # Unaligned SP
dc default_handler, 0   # Unaligned PC
dc default_handler, 0   # Invalid instruction
dc default_handler, 0   # Double fault
align 0x80              # Reserve space for the rest 
                        # of IVT
asect 0xdff0
INPUT:


# Exception handlers section
rsect exc_handlers

# This handler halts processor
default_handler>
    halt

# Main program section
rsect main

memset>
    push r3
    push r4
    push r5

    ldi r5, 0          

memset_loop:
    cmp r5, r2
    bge memset_end
    ldi r4, 0          
    add r3, r0, r5     
    stb r1, r3, r4

    add r5, 1
    br memset_loop

memset_end:
    pop r5
    pop r4
    pop r3
    rts

macro movens/2
push $1
pop $2
mend



getHashKey>                             # -- Begin function getHashKey
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r0, key
	ldi	r4, 0
	stb	r0, r4
	ldi	r3, 24
	movens	r4, r6
	movens	r4, r1
	movens	r6, r0
	br	__LBB0_2
__LBB0_3:                               # %if.then
                                        #   in Loop: Header=BB0_2 Depth=1
	ldi	r2, val1
	stb	r2, r0
	ldi	r2, checkerX
	ldb	r6, r2, r5
	add	r5, 1
	ldi	r2, val2
	stb	r2, r5
	ldi	r2, checkerY
	ldb	r6, r2, r6
	add	r6, 1
	ldi	r2, val3
	stb	r2, r6
	shl	r5, r5, 3
	shl	r0, r2, 5
	xor r5, r2, r2
	xor r2, r6, r2
	xor r2, r1, r1
	ldi	r2, key
	stb	r2, r1
__LBB0_4:                               # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=1
	cmp	r0, r3
	movens	r0, r6
	beq	__LBB0_1
	br	__LBB0_2
__LBB0_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, checkerIsAlive
	ldb	r6, r2, r5
	add	r0, 1
	cmp	r5, r4
	beq	__LBB0_4
	br	__LBB0_3
__LBB0_1:                               # %for.cond.cleanup
	ldi	r0, 255
	and r1, r0, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
hasCapture>                             # -- Begin function hasCapture
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-24
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r4, -1
	ldi	r3, 1
	ldi	r5, 0
	ssw	r2, -10                         # 2-byte Folded Spill
	cmp	r2, r5
	movens	r3, r0
	beq	__LBB1_2
# %bb.1:                                # %entry
	movens	r4, r0
__LBB1_2:                               # %entry
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	beq	__LBB1_4
# %bb.3:                                # %entry
	movens	r3, r4
__LBB1_4:                               # %entry
	ssw	r4, -18                         # 2-byte Folded Spill
	ldi	r2, dirY
	stb	r2, r0
	shl	r0, r2, 1
	add r2, r1, r3
	ssw	r1, -14                         # 2-byte Folded Spill
	add r0, r1, r4
	lsw	r0, -8                          # 2-byte Folded Reload
	sub	r0, 1
	or r0, r4, r2
	ldi	r1, 255
	and r4, r1, r5
	ssw	r5, -12                         # 2-byte Folded Spill
	ssw	r3, -16                         # 2-byte Folded Spill
	and r3, r1, r6
	ldi	r3, 8
	cmp	r6, r3
	blo	__LBB1_31
	br	__LBB1_5
__LBB1_5:                               # %for.body.us.preheader
	and r2, r1, r2
	ldi	r3, 7
	cmp	r2, r3
	bhi	__LBB1_18
	br	__LBB1_6
__LBB1_6:                               # %if.end.us
	and r0, r1, r0
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r0, r0
	ldi	r2, TABLE_INDEX
	ldb	r0, r2, r0
	ldi	r2, enemyIndex
	stb	r2, r0
	ldi	r6, 0
	ldi	r5, 1
	ldi	r2, 11
	cmp	r0, r2
	movens	r5, r2
	bhi	__LBB1_8
# %bb.7:                                # %if.end.us
	movens	r6, r2
__LBB1_8:                               # %if.end.us
	ssw	r2, -20                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	movens	r5, r2
	beq	__LBB1_10
# %bb.9:                                # %if.end.us
	movens	r6, r2
__LBB1_10:                              # %if.end.us
	ssw	r2, -22                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r6
	movens	r5, r2
	beq	__LBB1_12
# %bb.11:                               # %if.end.us
	movens	r6, r2
__LBB1_12:                              # %if.end.us
	sxt	r0, r0
	ldi	r3, 12
	cmp	r0, r3
	blt	__LBB1_14
# %bb.13:                               # %if.end.us
	movens	r6, r5
__LBB1_14:                              # %if.end.us
	cmp	r0, r6
	ldi	r3, 7
	blt	__LBB1_18
	br	__LBB1_15
__LBB1_15:                              # %if.end.us
	and r2, r5, r0
	tst	r0
	bne	__LBB1_18
	br	__LBB1_16
__LBB1_16:                              # %if.end.us
	lsw	r0, -20                         # 2-byte Folded Reload
	lsw	r2, -22                         # 2-byte Folded Reload
	and r2, r0, r0
	tst	r0
	bne	__LBB1_18
	br	__LBB1_17
__LBB1_17:                              # %if.end50.us
	ldi	r0, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r0, r2
	lsw	r0, -8                          # 2-byte Folded Reload
	sub	r0, 2
	ldi	r2, tx
	stb	r2, r0
__LBB1_18:                              # %for.inc.us
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r2
	and r2, r1, r2
	cmp	r2, r3
	bhi	__LBB1_60
	br	__LBB1_19
__LBB1_19:                              # %if.end.us.1
	and r0, r1, r2
	lsw	r1, -12                         # 2-byte Folded Reload
	shl	r1, r3, 3
	add r3, r2, r2
	ldi	r1, TABLE_INDEX
	ldb	r2, r1, r3
	ldi	r2, enemyIndex
	stb	r2, r3
	ldi	r1, 0
	ldi	r5, 1
	ldi	r6, 11
	cmp	r3, r6
	movens	r5, r2
	bhi	__LBB1_21
# %bb.20:                               # %if.end.us.1
	movens	r1, r2
__LBB1_21:                              # %if.end.us.1
	ssw	r2, -12                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	movens	r5, r2
	beq	__LBB1_23
# %bb.22:                               # %if.end.us.1
	movens	r1, r2
__LBB1_23:                              # %if.end.us.1
	ssw	r2, -20                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	movens	r5, r6
	beq	__LBB1_25
# %bb.24:                               # %if.end.us.1
	movens	r1, r6
__LBB1_25:                              # %if.end.us.1
	sxt	r3, r3
	ldi	r2, 12
	cmp	r3, r2
	blt	__LBB1_27
# %bb.26:                               # %if.end.us.1
	movens	r1, r5
__LBB1_27:                              # %if.end.us.1
	cmp	r3, r1
	blt	__LBB1_60
	br	__LBB1_28
__LBB1_28:                              # %if.end.us.1
	and r6, r5, r1
	tst	r1
	bne	__LBB1_60
	br	__LBB1_29
__LBB1_29:                              # %if.end.us.1
	lsw	r1, -12                         # 2-byte Folded Reload
	lsw	r2, -20                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB1_60
	br	__LBB1_30
__LBB1_30:                              # %if.end50.us.1
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	add	r1, 2
	ldi	r2, tx
	stb	r2, r1
	br	__LBB1_60
__LBB1_31:                              # %entry.split
	ssw	r0, -20                         # 2-byte Folded Spill
	movens	r4, r0
	ldi	r4, 1
	lsw	r5, -10                         # 2-byte Folded Reload
	ssw	r4, -22                         # 2-byte Folded Spill
	cmp	r5, r4
	beq	__LBB1_33
	br	__LBB1_32
__LBB1_33:                              # %for.body.preheader
	and r2, r1, r1
	cmp	r1, r3
	movens	r0, r4
	lsw	r0, -20                         # 2-byte Folded Reload
	blo	__LBB1_51
	br	__LBB1_55
__LBB1_51:                              # %if.end
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r2, enemyIndex
	stb	r2, r1
	ldi	r2, 11
	cmp	r1, r2
	bhi	__LBB1_55
	br	__LBB1_52
__LBB1_52:                              # %if.end
	ldi	r1, 0
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	beq	__LBB1_55
	br	__LBB1_53
__LBB1_53:                              # %if.end50
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	sub	r1, 2
	ldi	r2, tx
	stb	r2, r1
	ldi	r2, 255
	and r1, r2, r2
	ldi	r1, 7
	cmp	r2, r1
	bhi	__LBB1_55
	br	__LBB1_54
__LBB1_54:                              # %if.end78
	shl	r6, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_55
__LBB1_55:                              # %for.inc
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r3, 7
	cmp	r1, r3
	bhi	__LBB1_60
	br	__LBB1_56
__LBB1_56:                              # %if.end.1
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r2, enemyIndex
	stb	r2, r1
	ldi	r2, 11
	cmp	r1, r2
	bhi	__LBB1_60
	br	__LBB1_57
__LBB1_57:                              # %if.end.1
	ldi	r1, 0
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	beq	__LBB1_60
	br	__LBB1_58
__LBB1_58:                              # %if.end50.1
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	add	r1, 2
	ldi	r2, tx
	stb	r2, r1
	ldi	r2, 255
	and r1, r2, r2
	cmp	r2, r3
	bhi	__LBB1_60
	br	__LBB1_59
__LBB1_59:                              # %if.end78.1
	shl	r6, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_60
__LBB1_32:                              # %for.body.us253.preheader
	and r2, r1, r1
	cmp	r1, r3
	ssw	r6, -24                         # 2-byte Folded Spill
	ldi	r6, 0
	movens	r0, r4
	lsw	r0, -20                         # 2-byte Folded Reload
	blo	__LBB1_34
	br	__LBB1_42
__LBB1_34:                              # %if.end.us259
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldsb	r1, r2, r2
	ldi	r1, enemyIndex
	stb	r1, r2
	ldi	r3, 1
	ldi	r5, 0
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r5, r6
	cmp	r1, r5
	movens	r3, r5
	beq	__LBB1_36
# %bb.35:                               # %if.end.us259
	movens	r6, r5
__LBB1_36:                              # %if.end.us259
	ldi	r1, 12
	cmp	r2, r1
	blt	__LBB1_38
# %bb.37:                               # %if.end.us259
	movens	r6, r3
__LBB1_38:                              # %if.end.us259
	cmp	r2, r6
	ldi	r6, 0
	blt	__LBB1_42
	br	__LBB1_39
__LBB1_39:                              # %if.end.us259
	and r5, r3, r1
	tst	r1
	bne	__LBB1_42
	br	__LBB1_40
__LBB1_40:                              # %lor.lhs.false41.us266
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	sub	r1, 2
	ldi	r2, tx
	stb	r2, r1
	ldi	r2, 255
	and r1, r2, r2
	ldi	r1, 7
	cmp	r2, r1
	bhi	__LBB1_42
	br	__LBB1_41
__LBB1_41:                              # %if.end78.us
	lsw	r1, -24                         # 2-byte Folded Reload
	shl	r1, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_42
__LBB1_42:                              # %for.inc.us272
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB1_60
	br	__LBB1_43
__LBB1_43:                              # %if.end.us259.1
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldsb	r1, r2, r2
	ldi	r1, enemyIndex
	stb	r1, r2
	lsw	r1, -10                         # 2-byte Folded Reload
	cmp	r1, r6
	ldi	r3, 1
	beq	__LBB1_45
# %bb.44:                               # %if.end.us259.1
	movens	r6, r3
__LBB1_45:                              # %if.end.us259.1
	ldi	r1, 12
	cmp	r2, r1
	blt	__LBB1_47
# %bb.46:                               # %if.end.us259.1
	ssw	r6, -22                         # 2-byte Folded Spill
__LBB1_47:                              # %if.end.us259.1
	cmp	r2, r6
	blt	__LBB1_60
	br	__LBB1_48
__LBB1_48:                              # %if.end.us259.1
	lsw	r1, -22                         # 2-byte Folded Reload
	and r3, r1, r1
	tst	r1
	bne	__LBB1_60
	br	__LBB1_49
__LBB1_49:                              # %lor.lhs.false41.us266.1
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	add	r1, 2
	ldi	r2, tx
	stb	r2, r1
	ldi	r2, 255
	and r1, r2, r2
	ldi	r1, 7
	cmp	r2, r1
	bhi	__LBB1_60
	br	__LBB1_50
__LBB1_50:                              # %if.end78.us.1
	lsw	r1, -24                         # 2-byte Folded Reload
	shl	r1, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_60
__LBB1_60:                              # %for.end
	ldi	r1, midY
	stb	r1, r4
	ldi	r1, midX
	stb	r1, r0
	lsw	r2, -14                         # 2-byte Folded Reload
	shl	r2, r0, 3
	lsw	r1, -8                          # 2-byte Folded Reload
	add r0, r1, r0
	ldi	r1, TABLE_INDEX
	ldsb	r0, r1, r0
	ldi	r1, id
	stb	r1, r0
	ldi	r3, 0
	cmp	r0, r3
	blt	__LBB1_96
	br	__LBB1_61
__LBB1_61:                              # %land.lhs.true95
	ldi	r1, 255
	and r0, r1, r0
	ldi	r1, checkerIsKing
	ldb	r0, r1, r0
	cmp	r0, r3
	beq	__LBB1_96
	br	__LBB1_62
__LBB1_62:                              # %if.then99
	lsw	r3, -18                         # 2-byte Folded Reload
	ldi	r0, dirY
	stb	r0, r3
	shl	r3, r0, 1
	add r0, r2, r1
	add r3, r2, r4
	lsw	r0, -8                          # 2-byte Folded Reload
	sub	r0, 1
	or r0, r4, r2
	ldi	r3, 255
	and r2, r3, r2
	and r4, r3, r3
	ssw	r3, -12                         # 2-byte Folded Spill
	sxt	r1, r6
	ldi	r1, 7
	cmp	r2, r1
	bhi	__LBB1_78
	br	__LBB1_63
__LBB1_63:                              # %if.end135
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r2
	ldi	r1, enemyIndex
	stb	r1, r2
	ldi	r5, 1
	ldi	r3, 11
	cmp	r2, r3
	movens	r5, r1
	bhi	__LBB1_65
# %bb.64:                               # %if.end135
	ldi	r1, 0
__LBB1_65:                              # %if.end135
	ssw	r1, -14                         # 2-byte Folded Spill
	lsw	r3, -10                         # 2-byte Folded Reload
	cmp	r3, r5
	movens	r5, r1
	beq	__LBB1_67
# %bb.66:                               # %if.end135
	ldi	r1, 0
__LBB1_67:                              # %if.end135
	ssw	r1, -16                         # 2-byte Folded Spill
	movens	r6, r1
	lsw	r3, -10                         # 2-byte Folded Reload
	ldi	r6, 0
	cmp	r3, r6
	movens	r5, r3
	beq	__LBB1_69
# %bb.68:                               # %if.end135
	ldi	r3, 0
__LBB1_69:                              # %if.end135
	sxt	r2, r2
	ldi	r6, 12
	cmp	r2, r6
	blt	__LBB1_71
# %bb.70:                               # %if.end135
	ldi	r5, 0
__LBB1_71:                              # %if.end135
	ldi	r6, 0
	cmp	r2, r6
	movens	r1, r6
	blt	__LBB1_78
	br	__LBB1_72
__LBB1_72:                              # %if.end135
	and r3, r5, r1
	tst	r1
	bne	__LBB1_78
	br	__LBB1_73
__LBB1_73:                              # %if.end135
	lsw	r1, -14                         # 2-byte Folded Reload
	lsw	r2, -16                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB1_78
	br	__LBB1_74
__LBB1_74:                              # %if.end160
	ldi	r1, ty
	stb	r1, r6
	lsw	r1, -8                          # 2-byte Folded Reload
	sub	r1, 2
	ldi	r2, tx
	stb	r2, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB1_78
	br	__LBB1_75
__LBB1_75:                              # %if.end160
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB1_78
	br	__LBB1_76
__LBB1_76:                              # %if.end160
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB1_78
	br	__LBB1_77
__LBB1_77:                              # %if.end189
	shl	r6, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_78
__LBB1_78:                              # %for.inc199
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB1_94
	br	__LBB1_79
__LBB1_79:                              # %if.end135.1
	ldi	r1, 255
	and r0, r1, r1
	lsw	r2, -12                         # 2-byte Folded Reload
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r2
	ldi	r1, enemyIndex
	stb	r1, r2
	ldi	r5, 1
	ldi	r1, 11
	cmp	r2, r1
	movens	r5, r1
	bhi	__LBB1_81
# %bb.80:                               # %if.end135.1
	ldi	r1, 0
__LBB1_81:                              # %if.end135.1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r1, -10                         # 2-byte Folded Reload
	cmp	r1, r5
	movens	r5, r1
	beq	__LBB1_83
# %bb.82:                               # %if.end135.1
	ldi	r1, 0
__LBB1_83:                              # %if.end135.1
	ssw	r1, -14                         # 2-byte Folded Spill
	movens	r6, r3
	lsw	r1, -10                         # 2-byte Folded Reload
	ldi	r6, 0
	cmp	r1, r6
	movens	r5, r1
	beq	__LBB1_85
# %bb.84:                               # %if.end135.1
	ldi	r1, 0
__LBB1_85:                              # %if.end135.1
	sxt	r2, r2
	ldi	r6, 12
	cmp	r2, r6
	blt	__LBB1_87
# %bb.86:                               # %if.end135.1
	ldi	r5, 0
__LBB1_87:                              # %if.end135.1
	ldi	r6, 0
	cmp	r2, r6
	blt	__LBB1_94
	br	__LBB1_88
__LBB1_88:                              # %if.end135.1
	and r1, r5, r1
	tst	r1
	bne	__LBB1_94
	br	__LBB1_89
__LBB1_89:                              # %if.end135.1
	lsw	r1, -12                         # 2-byte Folded Reload
	lsw	r2, -14                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB1_94
	br	__LBB1_90
__LBB1_90:                              # %if.end160.1
	ldi	r1, ty
	stb	r1, r3
	lsw	r2, -8                          # 2-byte Folded Reload
	add	r2, 2
	ldi	r1, tx
	stb	r1, r2
	ldi	r1, 255
	and r2, r1, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB1_94
	br	__LBB1_91
__LBB1_91:                              # %if.end160.1
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB1_94
	br	__LBB1_92
__LBB1_92:                              # %if.end160.1
	ldi	r2, 7
	cmp	r3, r2
	bgt	__LBB1_94
	br	__LBB1_93
__LBB1_93:                              # %if.end189.1
	shl	r3, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB1_95
	br	__LBB1_94
__LBB1_94:                              # %for.inc199.1
	ldi	r3, 0
__LBB1_95:                              # %return.sink.split
	ldi	r1, midY
	stb	r1, r4
	ldi	r1, midX
	stb	r1, r0
__LBB1_96:                              # %return
	movens	r3, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	24
	pop	fp
	rts
                                        # -- End function
hasAllCapture>                          # -- Begin function hasAllCapture
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ldi	r0, checkerY
	ldsb	r0, r1
	ldi	r0, checkerX
	ldsb	r0, r0
	ldi	r4, 0
	movens	r4, r2
	jsr	hasCapture
	ldi	r5, 1
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_1
__LBB2_1:                               # %for.cond
	ldi	r0, checkerY+1
	ldsb	r0, r1
	ldi	r0, checkerX+1
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_2
__LBB2_2:                               # %for.cond.1
	ldi	r0, checkerY+2
	ldsb	r0, r1
	ldi	r0, checkerX+2
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_3
__LBB2_3:                               # %for.cond.2
	ldi	r0, checkerY+3
	ldsb	r0, r1
	ldi	r0, checkerX+3
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_4
__LBB2_4:                               # %for.cond.3
	ldi	r0, checkerY+4
	ldsb	r0, r1
	ldi	r0, checkerX+4
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_5
__LBB2_5:                               # %for.cond.4
	ldi	r0, checkerY+5
	ldsb	r0, r1
	ldi	r0, checkerX+5
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_6
__LBB2_6:                               # %for.cond.5
	ldi	r0, checkerY+6
	ldsb	r0, r1
	ldi	r0, checkerX+6
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_7
__LBB2_7:                               # %for.cond.6
	ldi	r0, checkerY+7
	ldsb	r0, r1
	ldi	r0, checkerX+7
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_8
__LBB2_8:                               # %for.cond.7
	ldi	r0, checkerY+8
	ldsb	r0, r1
	ldi	r0, checkerX+8
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_9
__LBB2_9:                               # %for.cond.8
	ldi	r0, checkerY+9
	ldsb	r0, r1
	ldi	r0, checkerX+9
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_10
__LBB2_10:                              # %for.cond.9
	ldi	r0, checkerY+10
	ldsb	r0, r1
	ldi	r0, checkerX+10
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
	br	__LBB2_11
__LBB2_11:                              # %for.cond.10
	ldi	r0, checkerY+11
	ldsb	r0, r1
	ldi	r0, checkerX+11
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB2_13
# %bb.12:                               # %for.cond.10
	movens	r4, r5
__LBB2_13:                              # %cleanup
	movens	r5, r0
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	4
	pop	fp
	rts
                                        # -- End function
move>                                   # -- Begin function move
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r1, r2
	ldi	r1, 15
	and r0, r1, r5
	ldi	r3, y1
	stb	r3, r5
	and r2, r1, r1
	ldi	r3, y2
	ssw	r1, -8                          # 2-byte Folded Spill
	stb	r3, r1
	ldi	r3, 240
	and r0, r3, r0
	shr	r0, r1, 4
	ldi	r4, x1
	stb	r4, r1
	and r2, r3, r2
	shr	r2, r2, 4
	ldi	r3, x2
	ssw	r2, -10                         # 2-byte Folded Spill
	stb	r3, r2
	shl	r5, r3, 3
	add r3, r1, r4
	ldi	r2, TABLE_INDEX
	ldsb	r4, r2, r3
	ldi	r0, 1
	ldi	r2, 11
	cmp	r3, r2
	bgt	__LBB3_2
# %bb.1:                                # %entry
	ldi	r0, 0
__LBB3_2:                               # %entry
	ldi	r2, id
	stb	r2, r3
	ldi	r2, checkerIsKing
	ldb	r3, r2, r6
	ldi	r2, wasKing
	stb	r2, r6
	ldi	r2, lastCap
	ldi	r6, 255
	stb	r2, r6
	ldi	r6, color
	stb	r6, r0
	lsw	r2, -8                          # 2-byte Folded Reload
	sub r2, r5, r6
	shra	r6, r2, 8
	shra	r2, r2, 15-8
	xor r6, r2, r6
	sub r6, r2, r6
	ldi	r2, TABLE_INDEX
	add r4, r2, r2
	ssw	r2, -12                         # 2-byte Folded Spill
	ldi	r4, 2
	cmp	r6, r4
	beq	__LBB3_6
	br	__LBB3_3
__LBB3_3:                               # %entry
	ldi	r4, 1
	cmp	r6, r4
	ldi	r6, lastCap
	bne	__LBB3_8
	br	__LBB3_4
__LBB3_4:                               # %land.lhs.true
	lsw	r2, -10                         # 2-byte Folded Reload
	sub r2, r1, r0
	shra	r0, r2, 8
	shra	r2, r2, 15-8
	xor r0, r2, r0
	sub r0, r2, r0
	cmp	r0, r4
	bne	__LBB3_8
	br	__LBB3_5
__LBB3_5:                               # %if.then
	ldi	r0, checkerX
	lsw	r2, -10                         # 2-byte Folded Reload
	stb	r3, r0, r2
	ldi	r0, checkerY
	lsw	r1, -8                          # 2-byte Folded Reload
	stb	r3, r0, r1
	shl	r1, r0, 3
	add r0, r2, r0
	ldi	r2, TABLE_INDEX
	stb	r0, r2, r3
	ldi	r0, 255
	lsw	r1, -12                         # 2-byte Folded Reload
	stb	r1, r0
	br	__LBB3_8
__LBB3_6:                               # %land.lhs.true72
	ssw	r0, -14                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	sub r2, r1, r2
	shra	r2, r6, 8
	shra	r6, r6, 15-8
	xor r2, r6, r2
	sub r2, r6, r2
	cmp	r2, r4
	ldi	r6, lastCap
	bne	__LBB3_8
	br	__LBB3_7
__LBB3_7:                               # %if.then91
	lsw	r0, -8                          # 2-byte Folded Reload
	add r0, r5, r2
	shr	r2, r2, 1
	ldi	r4, midY
	stb	r4, r2
	lsw	r0, -10                         # 2-byte Folded Reload
	add r0, r1, r0
	shr	r0, r0, 1
	ldi	r4, midX
	stb	r4, r0
	shl	r2, r2, 3
	add r2, r0, r4
	ldi	r0, TABLE_INDEX
	ldsb	r4, r0, r0
	stb	r6, r0
	ldi	r2, checkerIsAlive
	ldi	r5, 0
	stb	r0, r2, r5
	ldi	r1, checkerY
	ldi	r2, 255
	stb	r0, r1, r2
	ldi	r1, checkerX
	stb	r0, r1, r2
	lsw	r5, -10                         # 2-byte Folded Reload
	stb	r3, r1, r5
	lsw	r0, -8                          # 2-byte Folded Reload
	ldi	r1, checkerY
	stb	r3, r1, r0
	shl	r0, r0, 3
	add r0, r5, r0
	movens	r5, r1
	ldi	r5, TABLE_INDEX
	stb	r0, r5, r3
	ldi	r0, TABLE_INDEX
	stb	r4, r0, r2
	lsw	r0, -12                         # 2-byte Folded Reload
	stb	r0, r2
	movens	r1, r0
	lsw	r1, -8                          # 2-byte Folded Reload
	lsw	r2, -14                         # 2-byte Folded Reload
	jsr	hasCapture
	ldi	r1, canContinueCapture
	stb	r1, r0
	ldi	r0, y2
	ldb	r0, r0
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r0, id
	ldb	r0, r3
__LBB3_8:                               # %if.end128
	sxt	r3, r0
	ldi	r2, 11
	cmp	r0, r2
	bgt	__LBB3_10
	br	__LBB3_9
__LBB3_9:                               # %if.end128
	ldi	r2, 255
	lsw	r1, -8                          # 2-byte Folded Reload
	and r1, r2, r2
	ldi	r3, 7
	cmp	r2, r3
	beq	__LBB3_12
	br	__LBB3_10
__LBB3_10:                              # %lor.lhs.false
	ldi	r2, 12
	cmp	r0, r2
	blt	__LBB3_13
	br	__LBB3_11
__LBB3_11:                              # %lor.lhs.false
	ldi	r2, 255
	lsw	r1, -8                          # 2-byte Folded Reload
	and r1, r2, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB3_13
	br	__LBB3_12
__LBB3_12:                              # %if.then143
	ldi	r1, 1
	ldi	r2, checkerIsKing
	stb	r0, r2, r1
__LBB3_13:                              # %if.end146
	ldi	r0, wasKing
	ldb	r0, r0
	ldi	r1, 1
	and r0, r1, r0
	ldb	r6, r1
	shl	r1, r1, 1
	or r0, r1, r0
	sxt	r0, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
undoMove>                               # -- Begin function undoMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r4, 15
	and r0, r4, r3
	ldi	r5, y1
	stb	r5, r3
	and r1, r4, r4
	ldi	r5, y2
	stb	r5, r4
	ldi	r6, 240
	and r0, r6, r0
	shr	r0, r5, 4
	ldi	r0, x1
	stb	r0, r5
	and r1, r6, r0
	shr	r0, r1, 4
	ldi	r0, x2
	stb	r0, r1
	ssw	r4, -8                          # 2-byte Folded Spill
	shl	r4, r0, 3
	ssw	r1, -10                         # 2-byte Folded Spill
	add r0, r1, r0
	ldi	r1, TABLE_INDEX
	ldsb	r0, r1, r6
	ldi	r4, id
	stb	r4, r6
	ldi	r4, checkerX
	stb	r6, r4, r5
	ldi	r4, checkerY
	stb	r6, r4, r3
	shl	r3, r4, 3
	add r4, r5, r4
	stb	r4, r1, r6
	ldi	r4, 255
	stb	r0, r1, r4
	ldi	r1, 1
	and r2, r1, r0
	ldi	r4, checkerIsKing
	stb	r6, r4, r0
	shra	r2, r2, 1
	ldi	r0, 0
	cmp	r2, r0
	blt	__LBB4_2
	br	__LBB4_1
__LBB4_1:                               # %if.then
	lsw	r0, -8                          # 2-byte Folded Reload
	add r0, r3, r0
	shr	r0, r0, 1
	ldi	r3, midY
	stb	r3, r0
	movens	r1, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	add r1, r5, r1
	shr	r1, r1, 1
	ldi	r3, midX
	stb	r3, r1
	ldi	r3, checkerIsAlive
	stb	r2, r3, r4
	ldi	r3, checkerX
	stb	r2, r3, r1
	ldi	r3, checkerY
	stb	r2, r3, r0
	shl	r0, r0, 3
	add r0, r1, r0
	ldi	r1, TABLE_INDEX
	stb	r0, r1, r2
__LBB4_2:                               # %if.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
checkCapture>                           # -- Begin function checkCapture
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r2, -8                          # 2-byte Folded Spill
	ldi	r2, startX
	ldb	r2, r4
	add r4, r0, r5
	ldi	r2, midX
	stb	r2, r5
	ldi	r2, startY
	ldb	r2, r3
	add r3, r1, r2
	ldi	r6, midY
	stb	r6, r2
	ldi	r6, 255
	and r5, r6, r5
	ldi	r6, 7
	cmp	r5, r6
	bhi	__LBB5_13
	br	__LBB5_1
__LBB5_1:                               # %entry
	sxt	r2, r2
	ldi	r6, 0
	cmp	r2, r6
	blt	__LBB5_13
	br	__LBB5_2
__LBB5_2:                               # %entry
	ldi	r6, 7
	cmp	r2, r6
	bgt	__LBB5_13
	br	__LBB5_3
__LBB5_3:                               # %if.end
	shl	r2, r2, 3
	add r2, r5, r2
	ldi	r5, TABLE_INDEX
	ldsb	r2, r5, r5
	ldi	r2, enemyIndex
	stb	r2, r5
	ldi	r2, 0
	cmp	r5, r2
	blt	__LBB5_13
	br	__LBB5_4
__LBB5_4:                               # %lor.lhs.false25
	ldi	r2, curColor
	ldb	r2, r2
	ldi	r6, 11
	cmp	r5, r6
	bhi	__LBB5_6
	br	__LBB5_5
__LBB5_5:                               # %lor.lhs.false25
	ldi	r6, 255
	and r2, r6, r6
	ssw	r4, -10                         # 2-byte Folded Spill
	movens	r2, r4
	ldi	r2, 0
	cmp	r6, r2
	movens	r4, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	beq	__LBB5_13
	br	__LBB5_6
__LBB5_6:                               # %lor.lhs.false32
	ldi	r6, 12
	cmp	r5, r6
	blo	__LBB5_8
	br	__LBB5_7
__LBB5_7:                               # %lor.lhs.false32
	ldi	r5, 255
	and r2, r5, r2
	ldi	r5, 1
	cmp	r2, r5
	beq	__LBB5_13
	br	__LBB5_8
__LBB5_8:                               # %if.end41
	shl	r0, r0, 1
	add r4, r0, r2
	shl	r1, r0, 1
	add r3, r0, r3
	ldi	r6, newY
	stb	r6, r3
	ldi	r1, newX
	stb	r1, r2
	ldi	r0, 255
	and r2, r0, r2
	ldi	r0, 7
	cmp	r2, r0
	bhi	__LBB5_13
	br	__LBB5_9
__LBB5_9:                               # %if.end41
	sxt	r3, r3
	ldi	r0, 0
	cmp	r3, r0
	blt	__LBB5_13
	br	__LBB5_10
__LBB5_10:                              # %if.end41
	ldi	r0, 7
	cmp	r3, r0
	bgt	__LBB5_13
	br	__LBB5_11
__LBB5_11:                              # %lor.lhs.false66
	shl	r3, r3, 3
	add r3, r2, r2
	ldi	r0, TABLE_INDEX
	ldb	r2, r0, r2
	ldi	r0, 255
	cmp	r2, r0
	bne	__LBB5_13
	br	__LBB5_12
__LBB5_12:                              # %if.end75
	ldi	r0, checkCount
	ldb	r0, r3
	shl	r3, r5, 2
	ldi	r3, id
	stb	r3, r5
	ldi	r0, 97
	add r4, r0, r4
	sxt	r5, r5
	lsw	r0, -8                          # 2-byte Folded Reload
	stb	r0, r5, r4
	ldsb	r3, r4
	add r0, r4, r4
	ldi	r2, startY
	ldb	r2, r5
	add	r5, 49
	ldi	r2, 1
	stb	r4, r2, r5
	ldb	r1, r1
	ldi	r2, 97
	add r1, r2, r1
	ldsb	r3, r2
	add r0, r2, r2
	ldi	r4, 2
	stb	r2, r4, r1
	ldsb	r3, r1
	add r0, r1, r1
	ldb	r6, r0
	add	r0, 49
	ldi	r2, 3
	stb	r1, r2, r0
	ldi	r1, checkCount
	ldb	r1, r0
	add	r0, 1
	stb	r1, r0
__LBB5_13:                              # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
checkMove>                              # -- Begin function checkMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r3, startY
	ldb	r3, r3
	add r3, r1, r3
	ldi	r1, startX
	ldb	r1, r4
	add r4, r0, r0
	ldi	r1, newX
	stb	r1, r0
	ldi	r1, newY
	stb	r1, r3
	ldi	r5, 255
	and r0, r5, r6
	ldi	r0, 7
	cmp	r6, r0
	bhi	__LBB6_5
	br	__LBB6_1
__LBB6_1:                               # %entry
	sxt	r3, r3
	ldi	r1, 0
	cmp	r3, r1
	blt	__LBB6_5
	br	__LBB6_2
__LBB6_2:                               # %entry
	cmp	r3, r0
	bgt	__LBB6_5
	br	__LBB6_3
__LBB6_3:                               # %lor.lhs.false20
	shl	r3, r0, 3
	add r0, r6, r0
	ldi	r1, TABLE_INDEX
	ldb	r0, r1, r0
	cmp	r0, r5
	bne	__LBB6_5
	br	__LBB6_4
__LBB6_4:                               # %if.end
	ldi	r5, checkCount
	ldb	r5, r0
	shl	r0, r0, 2
	ldi	r6, id
	stb	r6, r0
	ldi	r1, 97
	add r4, r1, r3
	sxt	r0, r0
	stb	r2, r0, r3
	ldsb	r6, r0
	add r2, r0, r0
	ldi	r3, startY
	ldb	r3, r3
	add	r3, 49
	ldi	r4, 1
	stb	r0, r4, r3
	ldi	r0, newX
	ldb	r0, r0
	add r0, r1, r0
	ldsb	r6, r1
	add r2, r1, r1
	ldi	r3, 2
	stb	r1, r3, r0
	ldsb	r6, r0
	add r2, r0, r0
	ldi	r1, newY
	ldb	r1, r1
	add	r1, 49
	ldi	r2, 3
	stb	r0, r2, r1
	ldb	r5, r0
	add	r0, 1
	stb	r5, r0
__LBB6_5:                               # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
getMoves>                               # -- Begin function getMoves
# %bb.0:                                # %for.body.lr.ph
	push	fp
	ldsp	fp
	addsp	-18
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, 1
	ldi	r3, -1
	ldi	r2, 0
	cmp	r0, r2
	movens	r3, r2
	beq	__LBB7_2
# %bb.1:                                # %for.body.lr.ph
	movens	r1, r2
__LBB7_2:                               # %for.body.lr.ph
	ldi	r4, 0
	cmp	r0, r4
	beq	__LBB7_4
# %bb.3:                                # %for.body.lr.ph
	movens	r3, r1
__LBB7_4:                               # %for.body.lr.ph
	ldi	r3, checkCount
	stb	r3, r4
	ldi	r3, 12
	cmp	r0, r4
	beq	__LBB7_6
# %bb.5:                                # %for.body.lr.ph
	ldi	r3, 24
__LBB7_6:                               # %for.body.lr.ph
	cmp	r0, r4
	beq	__LBB7_8
# %bb.7:                                # %for.body.lr.ph
	ldi	r4, 12
__LBB7_8:                               # %for.body.lr.ph
	ldi	r5, curColor
	stb	r5, r0
	ldi	r0, endIdx
	stb	r0, r3
	ldi	r0, dirY
	stb	r0, r1
	ldi	r0, backDirY
	stb	r0, r2
	ldi	r0, startIdx
	stb	r0, r4
	lsw	r0, -10                         # 2-byte Folded Reload
	movens	r0, r1
	add	r1, 3
	ssw	r1, -14                         # 2-byte Folded Spill
	movens	r0, r1
	add	r1, 2
	ssw	r1, -16                         # 2-byte Folded Spill
	add	r0, 1
	ssw	r0, -18                         # 2-byte Folded Spill
	br	__LBB7_10
__LBB7_38:                              # %if.then23
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r0, backDirY
	movens	r0, r6
	ldsb	r6, r1
	ldi	r0, -1
	lsw	r5, -10                         # 2-byte Folded Reload
	movens	r5, r2
	jsr	checkCapture
	ldsb	r6, r1
	ldi	r0, 1
	movens	r5, r2
	jsr	checkCapture
__LBB7_39:                              # %for.inc25
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r0, endIdx
	ldsb	r0, r1
	add	r4, 1
	cmp	r4, r1
	blt	__LBB7_10
	br	__LBB7_9
__LBB7_10:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, checkerIsAlive
	ldb	r4, r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB7_39
	br	__LBB7_11
__LBB7_11:                              # %if.end7
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r0, checkerX
	ldb	r4, r0, r0
	ldi	r1, startX
	stb	r1, r0
	ldi	r1, checkerY
	ldb	r4, r1, r1
	ldi	r2, startY
	stb	r2, r1
	movens	r0, r2
	sub	r2, 1
	ldi	r3, 255
	and r2, r3, r5
	ldi	r2, dirY
	ldb	r2, r2
	ssw	r2, -8                          # 2-byte Folded Spill
	add r1, r2, r3
	sxt	r3, r3
	ldi	r2, 7
	cmp	r5, r2
	bhi	__LBB7_24
	br	__LBB7_12
__LBB7_12:                              # %if.end7
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB7_24
	br	__LBB7_13
__LBB7_13:                              # %if.end7
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 7
	cmp	r3, r2
	bgt	__LBB7_24
	br	__LBB7_14
__LBB7_14:                              # %if.end.i
                                        #   in Loop: Header=BB7_10 Depth=1
	shl	r3, r6, 3
	add r6, r5, r5
	ldi	r2, TABLE_INDEX
	ldsb	r5, r2, r5
	ldi	r2, enemyIndex
	stb	r2, r5
	ldi	r2, 0
	cmp	r5, r2
	blt	__LBB7_24
	br	__LBB7_15
__LBB7_15:                              # %lor.lhs.false25.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, curColor
	ldb	r2, r6
	ldi	r2, 11
	cmp	r5, r2
	bhi	__LBB7_17
	br	__LBB7_16
__LBB7_16:                              # %lor.lhs.false25.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 255
	and r6, r2, r2
	ssw	r6, -12                         # 2-byte Folded Spill
	ldi	r6, 0
	cmp	r2, r6
	lsw	r6, -12                         # 2-byte Folded Reload
	beq	__LBB7_24
	br	__LBB7_17
__LBB7_17:                              # %lor.lhs.false32.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 12
	cmp	r5, r2
	blo	__LBB7_19
	br	__LBB7_18
__LBB7_18:                              # %lor.lhs.false32.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 255
	and r6, r2, r2
	ldi	r5, 1
	cmp	r2, r5
	beq	__LBB7_24
	br	__LBB7_19
__LBB7_19:                              # %if.end41.i
                                        #   in Loop: Header=BB7_10 Depth=1
	lsw	r2, -8                          # 2-byte Folded Reload
	shl	r2, r2, 1
	add r1, r2, r6
	movens	r0, r2
	sub	r2, 2
	ldi	r5, newX
	stb	r5, r2
	ldi	r5, newY
	stb	r5, r6
	ldi	r5, 255
	and r2, r5, r5
	ldi	r2, 7
	cmp	r5, r2
	bhi	__LBB7_24
	br	__LBB7_20
__LBB7_20:                              # %if.end41.i
                                        #   in Loop: Header=BB7_10 Depth=1
	sxt	r6, r6
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB7_24
	br	__LBB7_21
__LBB7_21:                              # %if.end41.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB7_24
	br	__LBB7_22
__LBB7_22:                              # %lor.lhs.false66.i
                                        #   in Loop: Header=BB7_10 Depth=1
	shl	r6, r2, 3
	add r2, r5, r2
	ldi	r5, TABLE_INDEX
	ldb	r2, r5, r2
	ldi	r5, 255
	cmp	r2, r5
	bne	__LBB7_24
	br	__LBB7_23
__LBB7_23:                              # %if.end75.i
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r3, checkCount
	ldb	r3, r1
	shl	r1, r1, 2
	ldi	r2, id
	movens	r2, r6
	stb	r6, r1
	ldi	r3, 97
	add r0, r3, r0
	sxt	r1, r1
	lsw	r2, -10                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldi	r5, startY
	ldb	r5, r0
	add	r0, 49
	ldsb	r6, r1
	lsw	r2, -18                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldi	r0, newX
	ldb	r0, r0
	add r0, r3, r0
	ldsb	r6, r1
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldsb	r6, r0
	ldi	r1, newY
	ldb	r1, r1
	add	r1, 49
	lsw	r2, -14                         # 2-byte Folded Reload
	stb	r2, r0, r1
	ldi	r1, checkCount
	ldb	r1, r0
	add	r0, 1
	stb	r1, r0
	ldi	r0, startX
	ldb	r0, r0
	ldb	r5, r1
	ldi	r2, dirY
	ldb	r2, r2
	ssw	r2, -8                          # 2-byte Folded Spill
	add r1, r2, r3
__LBB7_24:                              # %checkCapture.exit
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, midY
	stb	r2, r3
	movens	r0, r2
	add	r2, 1
	ldi	r5, midX
	stb	r5, r2
	ldi	r5, 255
	and r2, r5, r5
	ldi	r2, 7
	cmp	r5, r2
	bhi	__LBB7_37
	br	__LBB7_25
__LBB7_25:                              # %checkCapture.exit
                                        #   in Loop: Header=BB7_10 Depth=1
	sxt	r3, r6
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB7_37
	br	__LBB7_26
__LBB7_26:                              # %checkCapture.exit
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB7_37
	br	__LBB7_27
__LBB7_27:                              # %if.end.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 255
	and r3, r2, r2
	shl	r2, r2, 3
	add r2, r5, r2
	ldi	r3, TABLE_INDEX
	ldsb	r2, r3, r3
	ldi	r2, enemyIndex
	stb	r2, r3
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB7_37
	br	__LBB7_28
__LBB7_28:                              # %lor.lhs.false25.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, curColor
	ldb	r2, r5
	ldi	r2, 11
	cmp	r3, r2
	bhi	__LBB7_30
	br	__LBB7_29
__LBB7_29:                              # %lor.lhs.false25.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 255
	and r5, r2, r2
	ldi	r6, 0
	cmp	r2, r6
	beq	__LBB7_37
	br	__LBB7_30
__LBB7_30:                              # %lor.lhs.false32.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 12
	cmp	r3, r2
	blo	__LBB7_32
	br	__LBB7_31
__LBB7_31:                              # %lor.lhs.false32.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r2, 255
	and r5, r2, r2
	ldi	r3, 1
	cmp	r2, r3
	beq	__LBB7_37
	br	__LBB7_32
__LBB7_32:                              # %if.end41.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	lsw	r2, -8                          # 2-byte Folded Reload
	shl	r2, r2, 1
	add r1, r2, r2
	movens	r0, r1
	add	r1, 2
	ldi	r3, newX
	stb	r3, r1
	ldi	r3, newY
	stb	r3, r2
	ldi	r3, 255
	and r1, r3, r1
	ldi	r3, 7
	cmp	r1, r3
	bhi	__LBB7_37
	br	__LBB7_33
__LBB7_33:                              # %if.end41.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	sxt	r2, r2
	ldi	r3, 0
	cmp	r2, r3
	blt	__LBB7_37
	br	__LBB7_34
__LBB7_34:                              # %if.end41.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r3, 7
	cmp	r2, r3
	bgt	__LBB7_37
	br	__LBB7_35
__LBB7_35:                              # %lor.lhs.false66.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r2, 255
	cmp	r1, r2
	bne	__LBB7_37
	br	__LBB7_36
__LBB7_36:                              # %if.end75.i.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r3, checkCount
	ldb	r3, r1
	shl	r1, r1, 2
	ldi	r2, id
	movens	r2, r5
	stb	r5, r1
	ldi	r2, 97
	movens	r2, r6
	add r0, r6, r0
	sxt	r1, r1
	lsw	r2, -10                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldi	r0, startY
	ldb	r0, r0
	add	r0, 49
	ldsb	r5, r1
	lsw	r2, -18                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldi	r0, newX
	ldb	r0, r0
	add r0, r6, r0
	ldsb	r5, r1
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r2, r1, r0
	ldsb	r5, r0
	ldi	r1, newY
	ldb	r1, r1
	add	r1, 49
	lsw	r2, -14                         # 2-byte Folded Reload
	stb	r2, r0, r1
	ldb	r3, r0
	add	r0, 1
	stb	r3, r0
__LBB7_37:                              # %checkCapture.exit.1
                                        #   in Loop: Header=BB7_10 Depth=1
	ldi	r0, checkerIsKing
	ldb	r4, r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB7_39
	br	__LBB7_38
__LBB7_9:                               # %for.cond.cleanup
	ldi	r0, checkCount
	ldb	r0, r2
	ldi	r3, 0
	cmp	r2, r3
	beq	__LBB7_40
	br	__LBB7_65
__LBB7_40:                              # %if.end30
	ldi	r0, startIdx
	ldsb	r0, r0
	cmp	r0, r1
	movens	r3, r2
	bge	__LBB7_65
	br	__LBB7_41
__LBB7_41:                              # %for.body38.lr.ph
	ldi	r2, 0
__LBB7_42:                              # %for.body38
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, checkerIsAlive
	ldb	r0, r3, r3
	ldi	r1, 0
	cmp	r3, r1
	beq	__LBB7_64
	br	__LBB7_43
__LBB7_43:                              # %if.end43
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r3, checkerX
	ldb	r0, r3, r3
	ldi	r4, startX
	stb	r4, r3
	ldi	r4, checkerY
	ldb	r0, r4, r4
	ldi	r5, startY
	stb	r5, r4
	ldi	r5, dirY
	ldb	r5, r5
	add r4, r5, r4
	movens	r3, r5
	sub	r5, 1
	ldi	r1, newX
	stb	r1, r5
	ldi	r1, newY
	stb	r1, r4
	ldi	r6, 255
	and r5, r6, r5
	sxt	r4, r4
	ldi	r6, 7
	cmp	r5, r6
	bhi	__LBB7_48
	br	__LBB7_44
__LBB7_44:                              # %if.end43
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 0
	cmp	r4, r1
	blt	__LBB7_48
	br	__LBB7_45
__LBB7_45:                              # %if.end43
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 7
	cmp	r4, r1
	bgt	__LBB7_48
	br	__LBB7_46
__LBB7_46:                              # %lor.lhs.false20.i
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r4, r6, 3
	add r6, r5, r5
	ldi	r1, TABLE_INDEX
	ldb	r5, r1, r5
	ldi	r6, 255
	cmp	r5, r6
	bne	__LBB7_48
	br	__LBB7_47
__LBB7_47:                              # %if.end.i101
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r2, r2, 2
	ldi	r1, id
	movens	r1, r6
	stb	r6, r2
	ldi	r1, 97
	add r3, r1, r3
	sxt	r2, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r5, startY
	ldb	r5, r2
	add	r2, 49
	ldsb	r6, r3
	lsw	r4, -18                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldi	r1, newX
	ldb	r1, r2
	ldi	r1, 97
	add r2, r1, r2
	ldsb	r6, r3
	lsw	r4, -16                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldsb	r6, r2
	ldi	r1, newY
	ldb	r1, r3
	add	r3, 49
	lsw	r4, -14                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, checkCount
	movens	r2, r3
	ldb	r3, r2
	add	r2, 1
	stb	r3, r2
	ldi	r3, dirY
	ldb	r3, r3
	ldb	r5, r4
	add r4, r3, r4
	ldi	r3, startX
	ldb	r3, r3
__LBB7_48:                              # %checkMove.exit
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, newY
	stb	r1, r4
	movens	r3, r5
	add	r5, 1
	ldi	r1, newX
	stb	r1, r5
	ldi	r6, 255
	and r5, r6, r5
	ldi	r6, 7
	cmp	r5, r6
	bhi	__LBB7_53
	br	__LBB7_49
__LBB7_49:                              # %checkMove.exit
                                        #   in Loop: Header=BB7_42 Depth=1
	sxt	r4, r6
	ldi	r1, 0
	cmp	r6, r1
	blt	__LBB7_53
	br	__LBB7_50
__LBB7_50:                              # %checkMove.exit
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 7
	cmp	r6, r1
	bgt	__LBB7_53
	br	__LBB7_51
__LBB7_51:                              # %lor.lhs.false20.i.1
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r6, 255
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r5, r4
	ldi	r1, TABLE_INDEX
	ldb	r4, r1, r4
	cmp	r4, r6
	bne	__LBB7_53
	br	__LBB7_52
__LBB7_52:                              # %if.end.i101.1
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r2, r2, 2
	ldi	r1, id
	movens	r1, r5
	stb	r5, r2
	ldi	r1, 97
	movens	r1, r6
	add r3, r6, r3
	sxt	r2, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, startY
	ldb	r2, r2
	add	r2, 49
	ldsb	r5, r3
	lsw	r4, -18                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldi	r1, newX
	ldb	r1, r2
	add r2, r6, r2
	ldsb	r5, r3
	lsw	r4, -16                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldsb	r5, r2
	ldi	r1, newY
	ldb	r1, r3
	add	r3, 49
	lsw	r4, -14                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, checkCount
	movens	r2, r3
	ldb	r3, r2
	add	r2, 1
	stb	r3, r2
__LBB7_53:                              # %checkMove.exit.1
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, checkerIsKing
	ldb	r0, r1, r3
	ldi	r1, 0
	cmp	r3, r1
	beq	__LBB7_64
	br	__LBB7_54
__LBB7_54:                              # %if.then63
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r3, backDirY
	ldb	r3, r3
	ldi	r4, startY
	ldb	r4, r4
	add r4, r3, r4
	ldi	r3, startX
	ldb	r3, r3
	movens	r3, r5
	sub	r5, 1
	ldi	r1, newX
	stb	r1, r5
	ldi	r1, newY
	stb	r1, r4
	ldi	r6, 255
	and r5, r6, r5
	sxt	r4, r4
	ldi	r6, 7
	cmp	r5, r6
	bhi	__LBB7_59
	br	__LBB7_55
__LBB7_55:                              # %if.then63
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 0
	cmp	r4, r1
	blt	__LBB7_59
	br	__LBB7_56
__LBB7_56:                              # %if.then63
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 7
	cmp	r4, r1
	bgt	__LBB7_59
	br	__LBB7_57
__LBB7_57:                              # %lor.lhs.false20.i111
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r4, r6, 3
	add r6, r5, r5
	ldi	r1, TABLE_INDEX
	ldb	r5, r1, r5
	ldi	r6, 255
	cmp	r5, r6
	bne	__LBB7_59
	br	__LBB7_58
__LBB7_58:                              # %if.end.i116
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r2, r2, 2
	ldi	r1, id
	movens	r1, r6
	stb	r6, r2
	ldi	r1, 97
	add r3, r1, r3
	sxt	r2, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r5, startY
	ldb	r5, r2
	add	r2, 49
	ldsb	r6, r3
	lsw	r4, -18                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldi	r1, newX
	ldb	r1, r2
	ldi	r1, 97
	add r2, r1, r2
	ldsb	r6, r3
	lsw	r4, -16                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldsb	r6, r2
	ldi	r1, newY
	ldb	r1, r3
	add	r3, 49
	lsw	r4, -14                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, checkCount
	movens	r2, r3
	ldb	r3, r2
	add	r2, 1
	stb	r3, r2
	ldi	r3, backDirY
	ldb	r3, r3
	ldb	r5, r4
	add r4, r3, r4
	ldi	r3, startX
	ldb	r3, r3
__LBB7_59:                              # %checkMove.exit131
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, newY
	stb	r1, r4
	movens	r3, r5
	add	r5, 1
	ldi	r1, newX
	stb	r1, r5
	ldi	r6, 255
	and r5, r6, r5
	ldi	r6, 7
	cmp	r5, r6
	bhi	__LBB7_64
	br	__LBB7_60
__LBB7_60:                              # %checkMove.exit131
                                        #   in Loop: Header=BB7_42 Depth=1
	sxt	r4, r6
	ldi	r1, 0
	cmp	r6, r1
	blt	__LBB7_64
	br	__LBB7_61
__LBB7_61:                              # %checkMove.exit131
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r1, 7
	cmp	r6, r1
	bgt	__LBB7_64
	br	__LBB7_62
__LBB7_62:                              # %lor.lhs.false20.i139
                                        #   in Loop: Header=BB7_42 Depth=1
	ldi	r6, 255
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r5, r4
	ldi	r1, TABLE_INDEX
	ldb	r4, r1, r4
	cmp	r4, r6
	bne	__LBB7_64
	br	__LBB7_63
__LBB7_63:                              # %if.end.i144
                                        #   in Loop: Header=BB7_42 Depth=1
	shl	r2, r2, 2
	ldi	r1, id
	movens	r1, r5
	stb	r5, r2
	ldi	r1, 97
	movens	r1, r6
	add r3, r6, r3
	sxt	r2, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, startY
	ldb	r2, r2
	add	r2, 49
	ldsb	r5, r3
	lsw	r4, -18                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldi	r1, newX
	ldb	r1, r2
	add r2, r6, r2
	ldsb	r5, r3
	lsw	r4, -16                         # 2-byte Folded Reload
	stb	r4, r3, r2
	ldsb	r5, r2
	ldi	r1, newY
	ldb	r1, r3
	add	r3, 49
	lsw	r4, -14                         # 2-byte Folded Reload
	stb	r4, r2, r3
	ldi	r2, checkCount
	movens	r2, r3
	ldb	r3, r2
	add	r2, 1
	stb	r3, r2
__LBB7_64:                              # %for.inc65
                                        #   in Loop: Header=BB7_42 Depth=1
	add	r0, 1
	ldi	r3, endIdx
	ldsb	r3, r3
	cmp	r0, r3
	blt	__LBB7_42
	br	__LBB7_65
__LBB7_65:                              # %return
	sxt	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
	pop	fp
	rts
                                        # -- End function
evaluateBoard>                          # -- Begin function evaluateBoard
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r3
	ldi	r0, blackMaterial
	ldi	r4, 0
	stw	r0, r4
	ldi	r0, score
	stw	r0, r4
	ldi	r0, whiteMaterial
	stw	r0, r4
	ldi	r0, -100
	ldi	r2, countCapture
	ldb	r2, r2
	cmp	r2, r4
	beq	__LBB8_19
	br	__LBB8_1
__LBB8_1:                               # %if.end
	ldi	r0, 100
	ldi	r2, countCapture+1
	ldb	r2, r2
	cmp	r2, r4
	beq	__LBB8_19
	br	__LBB8_2
__LBB8_2:                               # %for.cond.preheader
	ssw	r3, -12                         # 2-byte Folded Spill
	ldi	r0, KING_VALUE
	ldb	r0, r0
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r0, PAWN_VALUE
	ldb	r0, r0
	ssw	r0, -8                          # 2-byte Folded Spill
	movens	r4, r0
	movens	r4, r1
__LBB8_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, checkerIsAlive
	ldb	r0, r2, r3
	cmp	r3, r4
	beq	__LBB8_8
	br	__LBB8_4
__LBB8_4:                               # %if.then10
                                        #   in Loop: Header=BB8_3 Depth=1
	ldi	r2, checkerIsKing
	ldb	r0, r2, r3
	movens	r4, r6
	cmp	r3, r4
	lsw	r4, -8                          # 2-byte Folded Reload
	beq	__LBB8_6
# %bb.5:                                # %if.then10
                                        #   in Loop: Header=BB8_3 Depth=1
	lsw	r4, -10                         # 2-byte Folded Reload
__LBB8_6:                               # %if.then10
                                        #   in Loop: Header=BB8_3 Depth=1
	sxt	r4, r4
	add r1, r4, r2
	ldi	r1, checkerX
	ldsb	r0, r1, r4
	ldi	r1, POS_VALUE
	ldsb	r4, r1, r4
	add r2, r4, r2
	ldi	r4, checkerY
	ldsb	r0, r4, r5
	ldsb	r5, r1, r4
	add r2, r4, r2
	ldi	r1, blackMaterial
	stw	r1, r2
	movens	r2, r1
	movens	r6, r4
	cmp	r3, r4
	bne	__LBB8_8
	br	__LBB8_7
__LBB8_7:                               # %if.then34
                                        #   in Loop: Header=BB8_3 Depth=1
	add r1, r5, r1
	movens	r1, r2
	ldi	r1, blackMaterial
	stw	r1, r2
	movens	r2, r1
__LBB8_8:                               # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=1
	add	r0, 1
	ldi	r3, 12
	cmp	r0, r3
	bne	__LBB8_3
	br	__LBB8_9
__LBB8_9:                               # %for.body47.preheader
	ssw	r1, -14                         # 2-byte Folded Spill
	ldi	r6, 0
	movens	r6, r0
	movens	r6, r1
	br	__LBB8_13
__LBB8_17:                              # %if.then81
                                        #   in Loop: Header=BB8_13 Depth=1
	sub r1, r4, r1
	add	r1, 7
	ldi	r4, whiteMaterial
	stw	r4, r1
__LBB8_18:                              # %for.inc89
                                        #   in Loop: Header=BB8_13 Depth=1
	add	r0, 1
	cmp	r0, r3
	beq	__LBB8_10
	br	__LBB8_13
__LBB8_13:                              # %for.body47
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, checkerIsAlive+12
	ldb	r0, r2, r4
	cmp	r4, r6
	beq	__LBB8_18
	br	__LBB8_14
__LBB8_14:                              # %if.then51
                                        #   in Loop: Header=BB8_13 Depth=1
	ldi	r2, checkerIsKing+12
	ldb	r0, r2, r5
	movens	r6, r2
	cmp	r5, r6
	lsw	r4, -8                          # 2-byte Folded Reload
	beq	__LBB8_16
# %bb.15:                               # %if.then51
                                        #   in Loop: Header=BB8_13 Depth=1
	lsw	r4, -10                         # 2-byte Folded Reload
__LBB8_16:                              # %if.then51
                                        #   in Loop: Header=BB8_13 Depth=1
	sxt	r4, r4
	add r1, r4, r1
	ldi	r4, checkerX+12
	ldsb	r0, r4, r4
	ldi	r6, POS_VALUE
	ldsb	r4, r6, r4
	add r1, r4, r1
	ldi	r4, checkerY+12
	ldsb	r0, r4, r4
	ldsb	r4, r6, r6
	add r1, r6, r1
	ldi	r6, whiteMaterial
	stw	r6, r1
	movens	r2, r6
	cmp	r5, r6
	bne	__LBB8_18
	br	__LBB8_17
__LBB8_10:                              # %for.cond.cleanup46
	lsw	r0, -14                         # 2-byte Folded Reload
	sub r0, r1, r1
	ldi	r2, 0
	lsw	r0, -12                         # 2-byte Folded Reload
	cmp	r0, r2
	movens	r1, r0
	beq	__LBB8_12
# %bb.11:                               # %for.cond.cleanup46
	sub r2, r1, r0
__LBB8_12:                              # %for.cond.cleanup46
	ldi	r2, score
	stw	r2, r1
	br	__LBB8_19
__LBB8_19:                              # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
scoreMove>                              # -- Begin function scoreMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r1
	ldi	r4, -97
	add r1, r4, r3
	ldi	r1, x1
	stb	r1, r3
	ldi	r1, 1
	ldb	r0, r1, r2
	sub	r2, 49
	ldi	r1, y1
	stb	r1, r2
	ldi	r1, 2
	ldb	r0, r1, r5
	ssw	r5, -10                         # 2-byte Folded Spill
	add r5, r4, r6
	ldi	r4, x2
	stb	r4, r6
	ldi	r4, 3
	ldb	r0, r4, r0
	ldi	r5, y2
	ssw	r0, -8                          # 2-byte Folded Spill
	sub	r0, 49
	stb	r5, r0
	sxt	r3, r5
	sxt	r6, r3
	sub r3, r5, r6
	shra	r6, r4, 8
	shra	r4, r4, 15-8
	xor r6, r4, r6
	sub r6, r4, r4
	ldi	r6, 100
	cmp	r4, r1
	movens	r1, r4
	beq	__LBB9_10
	br	__LBB9_1
__LBB9_1:                               # %if.end
	sxt	r0, r1
	sxt	r2, r0
	shl	r0, r0, 3
	add r0, r5, r0
	ldi	r2, TABLE_INDEX
	ldsb	r0, r2, r0
	ldi	r6, 50
	ldi	r2, 11
	cmp	r0, r2
	bgt	__LBB9_3
	br	__LBB9_2
__LBB9_2:                               # %if.end
	ldi	r2, 5
	cmp	r1, r2
	bgt	__LBB9_10
	br	__LBB9_3
__LBB9_3:                               # %lor.lhs.false
	ldi	r2, 12
	cmp	r0, r2
	blt	__LBB9_5
	br	__LBB9_4
__LBB9_4:                               # %lor.lhs.false
	cmp	r1, r4
	blt	__LBB9_10
	br	__LBB9_5
__LBB9_5:                               # %if.end48
	ldi	r2, 3
	cmp	r3, r2
	blt	__LBB9_7
# %bb.6:                                # %if.end48
	ldi	r0, 103
	movens	r1, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	sub r0, r1, r3
	movens	r4, r1
__LBB9_7:                               # %if.end48
	cmp	r1, r2
	blt	__LBB9_9
# %bb.8:                                # %if.end48
	ldi	r0, 55
	lsw	r1, -8                          # 2-byte Folded Reload
	sub r0, r1, r1
__LBB9_9:                               # %if.end48
	add r1, r3, r6
__LBB9_10:                              # %return
	sxt	r6, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
sortMoves>                              # -- Begin function sortMoves
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-28
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r0, -20                         # 2-byte Folded Spill
	ldi	r0, 2
	ssw	r1, -26                         # 2-byte Folded Spill
	cmp	r1, r0
	blt	__LBB10_4
	br	__LBB10_1
__LBB10_1:                              # %for.cond3.preheader.preheader
	lsw	r0, -26                         # 2-byte Folded Reload
	sub	r0, 1
	ssw	r0, -28                         # 2-byte Folded Spill
	ldi	r1, 0
	lsw	r0, -20                         # 2-byte Folded Reload
	add	r0, 4
	ssw	r0, -22                         # 2-byte Folded Spill
	movens	r1, r0
	movens	r1, r2
__LBB10_2:                              # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_6 Depth 2
	ssw	r2, -24                         # 2-byte Folded Spill
	ldi	r1, -1
	xor r0, r1, r0
	lsw	r1, -26                         # 2-byte Folded Reload
	add r0, r1, r1
	ldi	r0, 1
	ssw	r1, -18                         # 2-byte Folded Spill
	cmp	r1, r0
	blt	__LBB10_5
	br	__LBB10_3
__LBB10_3:                              # %for.body12.preheader
                                        #   in Loop: Header=BB10_2 Depth=1
	ldi	r5, 0
	movens	r5, r0
	br	__LBB10_6
__LBB10_27:                             # %for.body27.preheader
                                        #   in Loop: Header=BB10_6 Depth=2
	ldb	r6, r0
	ldi	r1, temp
	stb	r1, r0
	ldi	r0, 1
	movens	r0, r1
	ldb	r6, r1, r0
	movens	r1, r3
	ldi	r1, temp+1
	stb	r1, r0
	ldi	r0, 2
	ldb	r6, r0, r0
	ldi	r1, temp+2
	stb	r1, r0
	ldi	r0, 3
	movens	r0, r4
	ldb	r6, r4, r0
	ldi	r1, temp+3
	stb	r1, r0
	lsw	r1, -22                         # 2-byte Folded Reload
	lsw	r2, -10                         # 2-byte Folded Reload
	add r1, r2, r0
	ldb	r1, r2, r1
	ldb	r0, r3, r2
	ldb	r0, r4, r3
	ldi	r4, 2
	ldb	r0, r4, r0
	stb	r6, r4, r0
	ldi	r0, 3
	stb	r6, r0, r3
	ldi	r0, 1
	stb	r6, r0, r2
	stb	r6, r1
	ldi	r0, temp
	ldb	r0, r0
	ldi	r1, 4
	stb	r6, r1, r0
	ldi	r0, temp+1
	ldb	r0, r0
	ldi	r1, 5
	stb	r6, r1, r0
	ldi	r0, temp+2
	ldb	r0, r0
	ldi	r1, 6
	stb	r6, r1, r0
	ldi	r0, temp+3
	ldb	r0, r0
	ldi	r1, 7
	stb	r6, r1, r0
__LBB10_28:                             # %for.inc73
                                        #   in Loop: Header=BB10_6 Depth=2
	add	r5, 1
	sxt	r5, r0
	lsw	r1, -18                         # 2-byte Folded Reload
	cmp	r1, r0
	bgt	__LBB10_6
	br	__LBB10_5
__LBB10_6:                              # %for.body12
                                        #   Parent Loop BB10_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ssw	r5, -8                          # 2-byte Folded Spill
	shl	r0, r4, 2
	lsw	r1, -20                         # 2-byte Folded Reload
	ldb	r1, r4, r0
	ldi	r2, -97
	movens	r2, r3
	add r0, r3, r0
	ldi	r2, x1
	stb	r2, r0
	ssw	r4, -10                         # 2-byte Folded Spill
	add r1, r4, r6
	ldi	r1, 1
	ldb	r6, r1, r1
	sub	r1, 49
	ldi	r2, y1
	stb	r2, r1
	ldi	r5, 2
	ldb	r6, r5, r2
	ssw	r2, -16                         # 2-byte Folded Spill
	add r2, r3, r2
	ldi	r3, x2
	stb	r3, r2
	ldi	r3, 3
	ldb	r6, r3, r4
	ssw	r4, -14                         # 2-byte Folded Spill
	sub	r4, 49
	ldi	r3, y2
	stb	r3, r4
	sxt	r0, r3
	sxt	r2, r0
	ssw	r0, -12                         # 2-byte Folded Spill
	sub r0, r3, r2
	shra	r2, r0, 8
	shra	r0, r0, 15-8
	xor r2, r0, r2
	sub r2, r0, r0
	cmp	r0, r5
	ldi	r5, 100
	beq	__LBB10_16
	br	__LBB10_7
__LBB10_7:                              # %if.end.i
                                        #   in Loop: Header=BB10_6 Depth=2
	sxt	r4, r4
	sxt	r1, r0
	shl	r0, r0, 3
	add r0, r3, r0
	ldi	r1, TABLE_INDEX
	ldsb	r0, r1, r1
	ldi	r0, 11
	cmp	r1, r0
	bgt	__LBB10_9
	br	__LBB10_8
__LBB10_8:                              # %if.end.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 5
	cmp	r4, r0
	ldi	r5, 50
	bgt	__LBB10_16
	br	__LBB10_9
__LBB10_9:                              # %lor.lhs.false.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 12
	cmp	r1, r0
	blt	__LBB10_11
	br	__LBB10_10
__LBB10_10:                             # %lor.lhs.false.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 2
	cmp	r4, r0
	ldi	r5, 50
	blt	__LBB10_16
	br	__LBB10_11
__LBB10_11:                             # %if.end48.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 3
	lsw	r2, -12                         # 2-byte Folded Reload
	cmp	r2, r0
	blt	__LBB10_13
# %bb.12:                               # %if.end48.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 103
	lsw	r1, -16                         # 2-byte Folded Reload
	sub r0, r1, r2
__LBB10_13:                             # %if.end48.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 3
	cmp	r4, r0
	blt	__LBB10_15
# %bb.14:                               # %if.end48.i
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 55
	lsw	r1, -14                         # 2-byte Folded Reload
	sub r0, r1, r4
__LBB10_15:                             # %if.end48.i
                                        #   in Loop: Header=BB10_6 Depth=2
	add r4, r2, r5
__LBB10_16:                             # %scoreMove.exit
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 4
	ldb	r6, r0, r0
	ldi	r1, -97
	movens	r1, r2
	add r0, r2, r0
	ldi	r1, x1
	stb	r1, r0
	ldi	r1, 5
	ldb	r6, r1, r1
	sub	r1, 49
	ldi	r3, y1
	stb	r3, r1
	ldi	r3, 6
	ldb	r6, r3, r3
	ssw	r3, -16                         # 2-byte Folded Spill
	add r3, r2, r2
	ldi	r3, x2
	stb	r3, r2
	ldi	r3, 7
	ldb	r6, r3, r4
	ssw	r4, -14                         # 2-byte Folded Spill
	sub	r4, 49
	ldi	r3, y2
	stb	r3, r4
	sxt	r0, r3
	sxt	r2, r0
	ssw	r0, -12                         # 2-byte Folded Spill
	sub r0, r3, r2
	shra	r2, r0, 8
	shra	r0, r0, 15-8
	xor r2, r0, r2
	sub r2, r0, r0
	ldi	r2, 2
	cmp	r0, r2
	ldi	r2, 100
	beq	__LBB10_26
	br	__LBB10_17
__LBB10_17:                             # %if.end.i116
                                        #   in Loop: Header=BB10_6 Depth=2
	sxt	r4, r4
	sxt	r1, r0
	shl	r0, r0, 3
	add r0, r3, r0
	ldi	r1, TABLE_INDEX
	ldsb	r0, r1, r1
	ldi	r0, 11
	cmp	r1, r0
	bgt	__LBB10_19
	br	__LBB10_18
__LBB10_18:                             # %if.end.i116
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 5
	cmp	r4, r0
	ldi	r2, 50
	bgt	__LBB10_26
	br	__LBB10_19
__LBB10_19:                             # %lor.lhs.false.i122
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 12
	cmp	r1, r0
	blt	__LBB10_21
	br	__LBB10_20
__LBB10_20:                             # %lor.lhs.false.i122
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 2
	cmp	r4, r0
	ldi	r2, 50
	blt	__LBB10_26
	br	__LBB10_21
__LBB10_21:                             # %if.end48.i126
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 3
	lsw	r2, -12                         # 2-byte Folded Reload
	cmp	r2, r0
	blt	__LBB10_23
# %bb.22:                               # %if.end48.i126
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 103
	lsw	r1, -16                         # 2-byte Folded Reload
	sub r0, r1, r2
__LBB10_23:                             # %if.end48.i126
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 3
	cmp	r4, r0
	blt	__LBB10_25
# %bb.24:                               # %if.end48.i126
                                        #   in Loop: Header=BB10_6 Depth=2
	ldi	r0, 55
	lsw	r1, -14                         # 2-byte Folded Reload
	sub r0, r1, r4
__LBB10_25:                             # %if.end48.i126
                                        #   in Loop: Header=BB10_6 Depth=2
	add r4, r2, r2
__LBB10_26:                             # %scoreMove.exit133
                                        #   in Loop: Header=BB10_6 Depth=2
	sxt	r2, r0
	sxt	r5, r1
	cmp	r1, r0
	lsw	r5, -8                          # 2-byte Folded Reload
	bge	__LBB10_28
	br	__LBB10_27
__LBB10_5:                              # %for.cond.cleanup11
                                        #   in Loop: Header=BB10_2 Depth=1
	lsw	r2, -24                         # 2-byte Folded Reload
	add	r2, 1
	sxt	r2, r0
	lsw	r1, -28                         # 2-byte Folded Reload
	cmp	r1, r0
	bgt	__LBB10_2
	br	__LBB10_4
__LBB10_4:                              # %for.cond.cleanup
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	28
	pop	fp
	rts
                                        # -- End function
minimax>                                # -- Begin function minimax
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-102
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r3, -76                         # 2-byte Folded Spill
	ssw	r2, -74                         # 2-byte Folded Spill
	ssw	r1, -94                         # 2-byte Folded Spill
	ldi	r2, key
	ldi	r1, 0
	stb	r2, r1
	ssw	r0, -78                         # 2-byte Folded Spill
	ssw	r0, -100                        # 2-byte Folded Spill
	ldi	r2, 24
	ldi	r4, checkerX
	movens	r1, r6
	ssw	r1, -72                         # 2-byte Folded Spill
	movens	r6, r0
__LBB11_1:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, checkerIsAlive
	ldb	r6, r3, r3
	add	r0, 1
	cmp	r3, r1
	beq	__LBB11_3
	br	__LBB11_2
__LBB11_2:                              # %if.then.i
                                        #   in Loop: Header=BB11_1 Depth=1
	ldi	r3, val1
	stb	r3, r0
	ldb	r6, r4, r3
	add	r3, 1
	ldi	r4, val2
	stb	r4, r3
	ldi	r4, checkerY
	ldb	r6, r4, r6
	add	r6, 1
	ldi	r4, val3
	stb	r4, r6
	shl	r3, r3, 3
	shl	r0, r4, 5
	xor r4, r3, r3
	ldi	r4, checkerX
	lsw	r5, -72                         # 2-byte Folded Reload
	xor r3, r5, r3
	xor r3, r6, r3
	ssw	r3, -72                         # 2-byte Folded Spill
	ldi	r5, key
	stb	r5, r3
__LBB11_3:                              # %for.inc.i
                                        #   in Loop: Header=BB11_1 Depth=1
	cmp	r0, r2
	movens	r0, r6
	bne	__LBB11_1
	br	__LBB11_4
__LBB11_4:                              # %getHashKey.exit
	ldi	r1, 255
	lsw	r0, -72                         # 2-byte Folded Reload
	and r0, r1, r2
	ldi	r0, tt_hash
	ldb	r2, r0, r0
	cmp	r0, r2
	bne	__LBB11_7
	br	__LBB11_5
__LBB11_5:                              # %land.lhs.true
	ldi	r0, tt_depth
	ldsb	r2, r0, r0
	lsw	r1, -100                        # 2-byte Folded Reload
	cmp	r0, r1
	blt	__LBB11_7
	br	__LBB11_6
__LBB11_7:                              # %if.end
	ldi	r1, 0
	lsw	r0, -100                        # 2-byte Folded Reload
	cmp	r0, r1
	bgt	__LBB11_9
	br	__LBB11_8
__LBB11_9:                              # %if.end14
	ssw	r2, -102                        # 2-byte Folded Spill
	ldi	r0, -70
	add	r0, fp, r5
	lsw	r6, -94                         # 2-byte Folded Reload
	movens	r6, r0
	movens	r5, r1
	jsr	getMoves
	movens	r0, r1
	movens	r5, r0
	ldi	r5, 0
	movens	r1, r4
	movens	r5, r2
	jsr	sortMoves
	ldi	r0, -100
	cmp	r6, r5
	movens	r0, r6
	beq	__LBB11_11
# %bb.10:                               # %if.end14
	ldi	r6, 100
__LBB11_11:                             # %if.end14
	ldi	r0, 1
	movens	r4, r2
	cmp	r2, r0
	lsw	r4, -74                         # 2-byte Folded Reload
	blt	__LBB11_28
	br	__LBB11_12
__LBB11_12:                             # %for.body.lr.ph
	lsw	r1, -94                         # 2-byte Folded Reload
	sub r0, r1, r1
	sub	r2, 1
	ldi	r0, -70
	add	r0, fp, r3
	add	r3, 3
	sxt	r1, r0
	ssw	r0, -96                         # 2-byte Folded Spill
	lsw	r0, -78                         # 2-byte Folded Reload
	sub	r0, 1
	sxt	r0, r0
	ssw	r0, -98                         # 2-byte Folded Spill
	movens	r6, r0
__LBB11_13:                             # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ssw	r4, -74                         # 2-byte Folded Spill
	ssw	r0, -86                         # 2-byte Folded Spill
	ssw	r2, -80                         # 2-byte Folded Spill
	ldi	r0, -2
	ldb	r3, r0, r0
	sub	r0, 1
	ldb	r3, r1
	sub	r1, 1
	ldi	r2, 15
	and r1, r2, r5
	and r0, r2, r2
	ssw	r2, -78                         # 2-byte Folded Spill
	ldi	r0, -1
	ldb	r3, r0, r1
	ssw	r3, -82                         # 2-byte Folded Spill
	ldi	r0, -3
	ldb	r3, r0, r0
	shl	r0, r6, 4
	sub	r6, 16
	or r2, r6, r0
	sxt	r0, r0
	shl	r1, r4, 4
	sub	r4, 16
	or r5, r4, r1
	sxt	r1, r1
	jsr	move
	ssw	r0, -88                         # 2-byte Folded Spill
	lsw	r0, -98                         # 2-byte Folded Reload
	lsw	r1, -96                         # 2-byte Folded Reload
	lsw	r2, -74                         # 2-byte Folded Reload
	lsw	r3, -76                         # 2-byte Folded Reload
	jsr	minimax
	ssw	r0, -84                         # 2-byte Folded Spill
	ldi	r0, 240
	and r4, r0, r2
	and r6, r0, r1
	shr	r1, r1, 4
	ldi	r0, x1
	stb	r0, r1
	ldi	r0, y1
	lsw	r6, -78                         # 2-byte Folded Reload
	stb	r0, r6
	shr	r2, r2, 4
	ldi	r0, x2
	stb	r0, r2
	ldi	r0, y2
	stb	r0, r5
	ssw	r5, -90                         # 2-byte Folded Spill
	shl	r5, r3, 3
	ssw	r2, -92                         # 2-byte Folded Spill
	add r3, r2, r3
	ldi	r2, TABLE_INDEX
	ldsb	r3, r2, r4
	ldi	r0, id
	stb	r0, r4
	ldi	r5, checkerX
	stb	r4, r5, r1
	ldi	r0, checkerY
	movens	r6, r5
	stb	r4, r0, r5
	shl	r5, r5, 3
	add r5, r1, r5
	stb	r5, r2, r4
	ldi	r0, 255
	stb	r3, r2, r0
	ldi	r0, 1
	lsw	r6, -88                         # 2-byte Folded Reload
	and r6, r0, r3
	ldi	r5, checkerIsKing
	stb	r4, r5, r3
	shra	r6, r3, 1
	ldi	r4, 0
	cmp	r3, r4
	blt	__LBB11_15
	br	__LBB11_14
__LBB11_14:                             # %if.then.i139
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r4, -90                         # 2-byte Folded Reload
	lsw	r5, -78                         # 2-byte Folded Reload
	add r4, r5, r4
	shr	r4, r4, 1
	ldi	r5, midY
	stb	r5, r4
	lsw	r2, -92                         # 2-byte Folded Reload
	add r2, r1, r1
	shr	r1, r1, 1
	ldi	r2, midX
	stb	r2, r1
	ldi	r2, checkerIsAlive
	stb	r3, r2, r0
	ldi	r0, checkerX
	stb	r3, r0, r1
	ldi	r0, checkerY
	stb	r3, r0, r4
	shl	r4, r2, 3
	add r2, r1, r1
	ldi	r0, TABLE_INDEX
	stb	r1, r0, r3
__LBB11_15:                             # %undoMove.exit
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r1, -94                         # 2-byte Folded Reload
	ldi	r5, 0
	cmp	r1, r5
	bne	__LBB11_21
	br	__LBB11_16
__LBB11_21:                             # %if.else
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r2, -76                         # 2-byte Folded Reload
	lsw	r6, -84                         # 2-byte Folded Reload
	cmp	r6, r2
	movens	r6, r1
	lsw	r0, -74                         # 2-byte Folded Reload
	lsw	r3, -82                         # 2-byte Folded Reload
	lsw	r4, -86                         # 2-byte Folded Reload
	blt	__LBB11_23
# %bb.22:                               # %if.else
                                        #   in Loop: Header=BB11_13 Depth=1
	movens	r2, r1
__LBB11_23:                             # %if.else
                                        #   in Loop: Header=BB11_13 Depth=1
	cmp	r6, r4
	blt	__LBB11_25
# %bb.24:                               # %if.else
                                        #   in Loop: Header=BB11_13 Depth=1
	movens	r4, r6
__LBB11_25:                             # %if.else
                                        #   in Loop: Header=BB11_13 Depth=1
	movens	r1, r2
	movens	r0, r1
	lsw	r0, -80                         # 2-byte Folded Reload
__LBB11_26:                             # %if.end74
                                        #   in Loop: Header=BB11_13 Depth=1
	ssw	r2, -76                         # 2-byte Folded Spill
	cmp	r2, r1
	ble	__LBB11_28
	br	__LBB11_27
__LBB11_27:                             # %if.end74
                                        #   in Loop: Header=BB11_13 Depth=1
	add	r3, 4
	movens	r0, r2
	sub	r2, 1
	cmp	r0, r5
	movens	r1, r4
	movens	r6, r0
	bne	__LBB11_13
	br	__LBB11_28
__LBB11_16:                             # %if.then57
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r0, -74                         # 2-byte Folded Reload
	lsw	r6, -84                         # 2-byte Folded Reload
	cmp	r6, r0
	movens	r6, r1
	lsw	r2, -76                         # 2-byte Folded Reload
	lsw	r3, -82                         # 2-byte Folded Reload
	lsw	r4, -86                         # 2-byte Folded Reload
	bgt	__LBB11_18
# %bb.17:                               # %if.then57
                                        #   in Loop: Header=BB11_13 Depth=1
	movens	r0, r1
__LBB11_18:                             # %if.then57
                                        #   in Loop: Header=BB11_13 Depth=1
	cmp	r6, r4
	bgt	__LBB11_20
# %bb.19:                               # %if.then57
                                        #   in Loop: Header=BB11_13 Depth=1
	movens	r4, r6
__LBB11_20:                             # %if.then57
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r0, -80                         # 2-byte Folded Reload
	br	__LBB11_26
__LBB11_8:                              # %if.then12
	lsw	r0, -94                         # 2-byte Folded Reload
	jsr	evaluateBoard
	movens	r0, r6
	br	__LBB11_29
__LBB11_6:                              # %if.then
	shl	r2, r0, 1
	ldi	r1, tt_score
	ldw	r0, r1, r6
	br	__LBB11_29
__LBB11_28:                             # %cleanup86
	lsw	r0, -72                         # 2-byte Folded Reload
	lsw	r3, -102                        # 2-byte Folded Reload
	ldi	r1, tt_hash
	stb	r3, r1, r0
	ldi	r1, tt_depth
	lsw	r2, -100                        # 2-byte Folded Reload
	stb	r3, r1, r2
	shl	r3, r1, 1
	ldi	r2, tt_score
	stw	r1, r2, r6
__LBB11_29:                             # %cleanup94
	movens	r6, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	102
	pop	fp
	rts
                                        # -- End function
updateLines>                            # -- Begin function updateLines
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-28
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 15
	and r1, r2, r4
	ssw	r0, -10                         # 2-byte Folded Spill
	and r0, r2, r5
	sub r5, r4, r1
	shra	r1, r3, 8
	shra	r3, r3, 15-8
	xor r1, r3, r1
	sub r1, r3, r2
	add	r2, 1
	ldi	r1, cntLine
	stb	r1, r2
	cmp	r5, r4
	ldi	r0, 255
	bls	__LBB12_36
	br	__LBB12_1
__LBB12_1:                              # %for.body.preheader
	movens	r0, r3
	shl	r5, r0, 3
	ldi	r1, TABLE_INDEX
	add r0, r1, r6
	ssw	r2, -28                         # 2-byte Folded Spill
	and r2, r3, r0
	sub r5, r0, r0
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r4, LINES
	lsw	r0, -10                         # 2-byte Folded Reload
__LBB12_2:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ssw	r4, -8                          # 2-byte Folded Spill
	ssw	r5, -14                         # 2-byte Folded Spill
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r4, 1
	and r0, r4, r1
	ldsb	r6, r1, r3
	ldi	r2, 0
	cmp	r3, r2
	movens	r2, r5
	blt	__LBB12_10
	br	__LBB12_3
__LBB12_3:                              # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 255
	and r3, r0, r5
	ldi	r0, checkerIsKing
	ldb	r5, r0, r5
	cmp	r5, r2
	movens	r4, r0
	beq	__LBB12_5
# %bb.4:                                # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 3
__LBB12_5:                              # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r0, -12                         # 2-byte Folded Spill
	cmp	r5, r2
	movens	r4, r5
	bne	__LBB12_7
# %bb.6:                                # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r5, 0
__LBB12_7:                              # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	shl	r5, r5, 1
	ldi	r0, 12
	cmp	r3, r0
	blo	__LBB12_9
# %bb.8:                                # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	lsw	r5, -12                         # 2-byte Folded Reload
__LBB12_9:                              # %if.then35
                                        #   in Loop: Header=BB12_2 Depth=1
	add	r5, 1
__LBB12_10:                             # %for.inc
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r5, -12                         # 2-byte Folded Spill
	add r6, r1, r5
	ldi	r1, 2
	ldsb	r5, r1, r1
	cmp	r1, r2
	movens	r2, r3
	blt	__LBB12_18
	br	__LBB12_11
__LBB12_11:                             # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 255
	and r1, r0, r3
	ldi	r0, checkerIsKing
	ldb	r3, r0, r3
	cmp	r3, r2
	movens	r4, r0
	beq	__LBB12_13
# %bb.12:                               # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 3
__LBB12_13:                             # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r0, -16                         # 2-byte Folded Spill
	cmp	r3, r2
	movens	r4, r3
	bne	__LBB12_15
# %bb.14:                               # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r3, 0
__LBB12_15:                             # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	shl	r3, r3, 1
	ldi	r0, 12
	cmp	r1, r0
	blo	__LBB12_17
# %bb.16:                               # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	lsw	r3, -16                         # 2-byte Folded Reload
__LBB12_17:                             # %if.then35.1
                                        #   in Loop: Header=BB12_2 Depth=1
	add	r3, 1
__LBB12_18:                             # %for.inc.1
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r3, -18                         # 2-byte Folded Spill
	ldi	r0, 4
	ldsb	r5, r0, r3
	cmp	r3, r2
	movens	r2, r1
	blt	__LBB12_26
	br	__LBB12_19
__LBB12_19:                             # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 255
	and r3, r0, r1
	ldi	r0, checkerIsKing
	ldb	r1, r0, r1
	cmp	r1, r2
	movens	r4, r0
	beq	__LBB12_21
# %bb.20:                               # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 3
__LBB12_21:                             # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r0, -16                         # 2-byte Folded Spill
	cmp	r1, r2
	movens	r4, r1
	bne	__LBB12_23
# %bb.22:                               # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r1, 0
__LBB12_23:                             # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	shl	r1, r1, 1
	ldi	r0, 12
	cmp	r3, r0
	blo	__LBB12_25
# %bb.24:                               # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	lsw	r1, -16                         # 2-byte Folded Reload
__LBB12_25:                             # %if.then35.2
                                        #   in Loop: Header=BB12_2 Depth=1
	add	r1, 1
__LBB12_26:                             # %for.inc.2
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r1, -20                         # 2-byte Folded Spill
	ssw	r6, -16                         # 2-byte Folded Spill
	ldi	r0, 6
	ldsb	r5, r0, r1
	cmp	r1, r2
	movens	r2, r3
	lsw	r4, -8                          # 2-byte Folded Reload
	lsw	r5, -12                         # 2-byte Folded Reload
	blt	__LBB12_34
	br	__LBB12_27
__LBB12_27:                             # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r0, 255
	and r1, r0, r3
	ldi	r0, checkerIsKing
	ldb	r3, r0, r3
	cmp	r3, r2
	ldi	r0, 1
	movens	r0, r4
	beq	__LBB12_29
# %bb.28:                               # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	ldi	r4, 3
__LBB12_29:                             # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	cmp	r3, r2
	movens	r0, r3
	bne	__LBB12_31
# %bb.30:                               # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	movens	r2, r3
__LBB12_31:                             # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	shl	r3, r3, 1
	ldi	r0, 12
	cmp	r1, r0
	blo	__LBB12_33
# %bb.32:                               # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	movens	r4, r3
__LBB12_33:                             # %if.then35.3
                                        #   in Loop: Header=BB12_2 Depth=1
	add	r3, 1
	lsw	r4, -8                          # 2-byte Folded Reload
__LBB12_34:                             # %for.inc.3
                                        #   in Loop: Header=BB12_2 Depth=1
	ssw	r1, -24                         # 2-byte Folded Spill
	lsw	r1, -18                         # 2-byte Folded Reload
	shl	r1, r0, 8
	shl	r0, r0, 10-8
	shl	r5, r2, 8
	shl	r2, r2, 13-8
	or r2, r0, r0
	ssw	r3, -26                         # 2-byte Folded Spill
	shl	r3, r2, 4
	lsw	r3, -20                         # 2-byte Folded Reload
	shl	r3, r5, 7
	or r5, r2, r2
	or r2, r0, r0
	lsw	r5, -14                         # 2-byte Folded Reload
	ldi	r2, 15
	and r5, r2, r2
	or r0, r2, r0
	stw	r4, r0
	add	r4, 2
	lsw	r0, -10                         # 2-byte Folded Reload
	add	r0, 1
	lsw	r6, -16                         # 2-byte Folded Reload
	sub	r6, 8
	sub	r5, 1
	lsw	r2, -22                         # 2-byte Folded Reload
	cmp	r5, r2
	bgt	__LBB12_2
	br	__LBB12_35
__LBB12_35:                             # %for.cond.if.end67.loopexit_crit_edge
	ldi	r0, checkersLine+3
	lsw	r2, -26                         # 2-byte Folded Reload
	stb	r0, r2
	ldi	r0, checkersLine+2
	stb	r0, r3
	ldi	r0, checkersLine+1
	stb	r0, r1
	ldi	r0, checkersLine
	lsw	r1, -12                         # 2-byte Folded Reload
	stb	r0, r1
	ldi	r0, id
	lsw	r1, -24                         # 2-byte Folded Reload
	stb	r0, r1
	add	r5, 1
	ldi	r0, 1
	and r5, r0, r0
	ldi	r1, swift
	stb	r1, r0
	lsw	r2, -28                         # 2-byte Folded Reload
	ldi	r0, 255
__LBB12_36:                             # %if.end67
	and r2, r0, r0
	ldi	r1, 2
	cmp	r0, r1
	bne	__LBB12_38
	br	__LBB12_37
__LBB12_37:                             # %if.then71
	ldi	r0, LINES+2
	ldw	r0, r0
	ldi	r1, LINES+4
	stw	r1, r0
__LBB12_38:                             # %if.end72
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	28
	pop	fp
	rts
checkSituation>                         # -- Begin function checkSituation
# %bb.0:                                # %entry
	ldi	r0, countCapture
	ldsb	r0, r0
	ldi	r1, countCapture+1
	ldsb	r1, r1
	cmp	r0, r1
	bge	__LBB21_2
	br	__LBB21_1
__LBB21_1:                              # %if.then
#ФЛАГ ПОРАЖЕНИЯ
    ldi r6, LOSE
    ldw r6,r6
#ФЛАГ ПОРАЖЕНИЯ                        
	br	__LBB21_5
__LBB21_2:                              # %if.end
	ldi	r0, countCapture
	ldsb	r0, r0
	ldi	r1, countCapture+1
	ldsb	r1, r1
	cmp	r0, r1
	ble	__LBB21_4
	br	__LBB21_3
__LBB21_3:                              # %if.then7
#ФЛАГ ПОБЕДЫ
    ldi r6, WIN
    ldw r6,r6
#ФЛАГ ПОБЕДЫ  
	br	__LBB21_5
__LBB21_4:                              # %if.end8
#ФЛАГ НИЧЬИ
    ldi r6, DRAW
    ldw r6,r6
#ФЛАГ НИЧЬИ  
	br	__LBB21_5
__LBB21_5:                              # %return
	rts
                                        # -- End function
botMove>                                # -- Begin function botMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-88
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r5, -70
	add	r5, fp, r1
	ldi	r4, 1
	movens	r4, r0
	jsr	getMoves
	movens	r0, r1
	ldi	r0, moveCount
	stb	r0, r1
	ssw	r4, -88                         # 2-byte Folded Spill
	cmp	r1, r4
	beq	__LBB13_3
	br	__LBB13_1
__LBB13_1:                              # %entry
	ldi	r0, 255
	and r1, r0, r0
	ldi	r4, 0
	cmp	r0, r4
	bne	__LBB13_8
	br	__LBB13_2
__LBB13_2:                              # %if.then
    jsr checkSituation
	br	__LBB13_23
__LBB13_3:                              # %if.then5
	ldi	r0, -97
	lsw	r1, -70
	add r1, r0, r1
	ldi	r2, x1
	stb	r2, r1
	add	r5, fp, r3
	ldb	r3, r4, r5
	sub	r5, 49
	ldi	r2, y1
	stb	r2, r5
	ldi	r2, 15
	and r5, r2, r5
	shl	r1, r1, 4
	or r5, r1, r1
	ldi	r5, 3
	ldb	r3, r5, r6
	ldi	r5, 2
	ldb	r3, r5, r3
	add r3, r0, r0
	ldi	r3, x2
	stb	r3, r0
	sub	r6, 49
	ldi	r3, y2
	stb	r3, r6
	ldi	r5, packedStart
	stb	r5, r1
	and r6, r2, r2
	shl	r0, r0, 4
	or r2, r0, r2
	ldi	r6, packedEnd
	stb	r6, r2
	sxt	r1, r0
	sxt	r2, r1
	jsr	move
	ldi	r1, inf
	stb	r1, r0
	shra	r0, r1, 1
	ldi	r0, cap
	stb	r0, r1
	ldi	r0, 0
	cmp	r1, r0
	blt	__LBB13_7
	br	__LBB13_4
__LBB13_4:                              # %if.then27
	ldi	r2, 11
	cmp	r1, r2
	bhi	__LBB13_6
# %bb.5:                                # %if.then27
	movens	r0, r4
__LBB13_6:                              # %if.then27
	ldi	r0, countCapture
	ldb	r4, r0, r1
	sub	r1, 1
	stb	r4, r0, r1
__LBB13_7:                              # %if.end32
	ldsb	r6, r1
	ldsb	r5, r0
	jsr	updateLines
	br	__LBB13_23
__LBB13_8:                              # %if.end33
	add	r5, fp, r0
	movens	r4, r2
	jsr	sortMoves
	ldi	r0, moveCount
	ldsb	r0, r0
	ldi	r1, 1
	cmp	r0, r1
	blt	__LBB13_11
	br	__LBB13_9
__LBB13_9:                              # %for.body.preheader
	ldi	r0, 0
	ldi	r1, 100
	add	r5, fp, r3
	add	r3, 3
	movens	r1, r2
	ssw	r0, -86                         # 2-byte Folded Spill
	br	__LBB13_12
__LBB13_13:                             # %if.then.i
                                        #   in Loop: Header=BB13_12 Depth=1
	lsw	r4, -84                         # 2-byte Folded Reload
	add r4, r6, r4
	shr	r4, r4, 1
	ldi	r5, midY
	stb	r5, r4
	add r0, r1, r1
	shr	r1, r1, 1
	ldi	r0, midX
	stb	r0, r1
	ldi	r0, checkerIsAlive
	ldi	r2, 1
	stb	r3, r0, r2
	ldi	r0, checkerX
	stb	r3, r0, r1
	ldi	r0, checkerY
	stb	r3, r0, r4
	shl	r4, r2, 3
	add r2, r1, r1
	ldi	r0, TABLE_INDEX
	stb	r1, r0, r3
__LBB13_14:                             # %undoMove.exit
                                        #   in Loop: Header=BB13_12 Depth=1
	lsw	r2, -76                         # 2-byte Folded Reload
	lsw	r4, -78                         # 2-byte Folded Reload
	cmp	r4, r2
	lsw	r0, -74                         # 2-byte Folded Reload
	movens	r0, r1
	blt	__LBB13_16
# %bb.15:                               # %undoMove.exit
                                        #   in Loop: Header=BB13_12 Depth=1
	lsw	r1, -86                         # 2-byte Folded Reload
__LBB13_16:                             # %undoMove.exit
                                        #   in Loop: Header=BB13_12 Depth=1
	cmp	r4, r2
	ldi	r5, -70
	lsw	r3, -72                         # 2-byte Folded Reload
	blt	__LBB13_18
# %bb.17:                               # %undoMove.exit
                                        #   in Loop: Header=BB13_12 Depth=1
	movens	r2, r4
__LBB13_18:                             # %undoMove.exit
                                        #   in Loop: Header=BB13_12 Depth=1
	add	r3, 4
	add	r0, 1
	ldi	r2, moveCount
	ldsb	r2, r2
	cmp	r0, r2
	movens	r4, r2
	ssw	r1, -86                         # 2-byte Folded Spill
	blt	__LBB13_12
	br	__LBB13_10
__LBB13_12:                             # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ssw	r2, -76                         # 2-byte Folded Spill
	ssw	r0, -74                         # 2-byte Folded Spill
	ldi	r0, -2
	ldb	r3, r0, r0
	sub	r0, 1
	ldb	r3, r1
	sub	r1, 1
	ldi	r2, 15
	and r1, r2, r6
	and r0, r2, r2
	ssw	r2, -82                         # 2-byte Folded Spill
	ldi	r0, -1
	ldb	r3, r0, r1
	ssw	r3, -72                         # 2-byte Folded Spill
	ldi	r0, -3
	ldb	r3, r0, r0
	shl	r0, r5, 4
	sub	r5, 16
	or r2, r5, r0
	sxt	r0, r0
	shl	r1, r4, 4
	sub	r4, 16
	or r6, r4, r1
	sxt	r1, r1
	jsr	move
	ssw	r0, -80                         # 2-byte Folded Spill
	ldi	r0, DEPTH
	ldsb	r0, r0
	ldi	r1, 0
	ldi	r2, -100
	ldi	r3, 100
	jsr	minimax
	ssw	r0, -78                         # 2-byte Folded Spill
	ldi	r1, 240
	and r4, r1, r2
	and r5, r1, r1
	shr	r1, r1, 4
	ldi	r3, x1
	stb	r3, r1
	ldi	r3, y1
	lsw	r4, -82                         # 2-byte Folded Reload
	stb	r3, r4
	shr	r2, r0, 4
	ldi	r3, x2
	stb	r3, r0
	ldi	r3, y2
	stb	r3, r6
	ssw	r6, -84                         # 2-byte Folded Spill
	shl	r6, r3, 3
	movens	r4, r6
	add r3, r0, r3
	ldi	r2, TABLE_INDEX
	ldsb	r3, r2, r4
	ldi	r5, id
	stb	r5, r4
	ldi	r5, checkerX
	stb	r4, r5, r1
	ldi	r5, checkerY
	stb	r4, r5, r6
	shl	r6, r5, 3
	add r5, r1, r5
	stb	r5, r2, r4
	ldi	r5, 255
	stb	r3, r2, r5
	ldi	r2, 1
	movens	r2, r3
	lsw	r2, -80                         # 2-byte Folded Reload
	and r2, r3, r3
	ldi	r5, checkerIsKing
	stb	r4, r5, r3
	shra	r2, r3, 1
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB13_14
	br	__LBB13_13
__LBB13_10:                             # %for.cond.cleanup.loopexit
	sxt	r1, r0
	shl	r0, r4, 2
__LBB13_11:                             # %for.cond.cleanup
	add	r5, fp, r0
	add r0, r4, r1
	ldb	r0, r4, r0
	ldi	r2, -97
	add r0, r2, r0
	ldi	r3, x1
	stb	r3, r0
	ldi	r3, 1
	ldb	r1, r3, r3
	sub	r3, 49
	ldi	r4, y1
	stb	r4, r3
	ldi	r4, 15
	movens	r4, r5
	and r3, r5, r3
	shl	r0, r0, 4
	or r3, r0, r0
	ldi	r3, 3
	ldb	r1, r3, r3
	ldi	r4, 2
	ldb	r1, r4, r1
	add r1, r2, r1
	ldi	r2, x2
	stb	r2, r1
	sub	r3, 49
	ldi	r2, y2
	stb	r2, r3
	ldi	r4, packedStart
	stb	r4, r0
	and r3, r5, r2
	shl	r1, r1, 4
	or r2, r1, r1
	ldi	r5, packedEnd
	stb	r5, r1
	sxt	r0, r0
	sxt	r1, r1
	jsr	move
	ldi	r1, inf
	stb	r1, r0
	shra	r0, r0, 1
	ldi	r1, cap
	stb	r1, r0
	ldi	r1, -1
	cmp	r0, r1
	bgt	__LBB13_19
	br	__LBB13_22
__LBB13_19:                             # %if.then104
	ldi	r1, 11
	cmp	r0, r1
	bhi	__LBB13_21
# %bb.20:                               # %if.then104
	ldi	r0, 0
	ssw	r0, -88                         # 2-byte Folded Spill
__LBB13_21:                             # %if.then104
	ldi	r0, countCapture
	lsw	r2, -88                         # 2-byte Folded Reload
	ldb	r2, r0, r1
	sub	r1, 1
	stb	r2, r0, r1
__LBB13_22:                             # %if.end111
	ldsb	r5, r1
	ldsb	r4, r0
	jsr	updateLines
__LBB13_23:                             # %cleanup
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	88
	pop	fp
	rts
                                        # -- End function
playerMove>                             # -- Begin function playerMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	ldi	r0, y1
	ldb	r0, r0
	ldi	r1, 15
	and r0, r1, r0
	ldi	r2, x1
	ldb	r2, r2
	shl	r2, r2, 4
	or r0, r2, r0
	ldi	r2, packedStart
	stb	r2, r0
	ldi	r2, y2
	ldb	r2, r2
	and r2, r1, r1
	ldi	r2, x2
	ldb	r2, r2
	shl	r2, r2, 4
	or r1, r2, r1
	ldi	r2, packedEnd
	stb	r2, r1
	sxt	r0, r0
	sxt	r1, r1
	jsr	move
	ldi	r1, inf
	stb	r1, r0
	shra	r0, r2, 1
	ldi	r0, cap
	stb	r0, r2
	ldi	r1, 0
	cmp	r2, r1
	blt	__LBB14_4
	br	__LBB14_1
__LBB14_1:                              # %if.then
	ldi	r0, 1
	ldi	r3, 11
	cmp	r2, r3
	bhi	__LBB14_3
# %bb.2:                                # %if.then
	movens	r1, r0
__LBB14_3:                              # %if.then
	ldi	r1, countCapture
	ldb	r0, r1, r2
	sub	r2, 1
	stb	r0, r1, r2
__LBB14_4:                              # %if.end
	addsp	0
	pop	fp
	rts
                                        # -- End function
main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ldi	r0, 0
	ssw	r0, -2
	ldi	r1, GAMEMODE
	stb	r1, r0
	br	__LBB23_1
__LBB23_1:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_9 Depth 2
                                        #     Child Loop BB18_3 Depth 2
	ldi	r1, canContinueCapture
	ldi	r0, 1
	stb	r1, r0
	ldi	r0, GAMEMODE
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB23_8
	br	__LBB23_2
__LBB23_2:                              # %if.then
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB23_3
__LBB23_3:                              # %while.cond2
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r0, canContinueCapture
	ldb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB23_7
	br	__LBB23_4
__LBB23_4:                              # %while.body3
                                        #   in Loop: Header=BB18_3 Depth=2
	
#ФЛАГ ПЕРЕД ВВОДОМ ИГРОКА
    ldi r6, MOVE
    ldw r6,r6
    ldi r6,0
#ФЛАГ ПЕРЕД ВВОДОМ ИГРОКА
    
	ldi	r1, canContinueCapture
	ssw	r1, -6                          # 2-byte Folded Spill
	ldi	r0, 0
	ssw	r0, -4                          # 2-byte Folded Spill
	stb	r1, r0



#ВВОД В ПРОЦЕССОР
	ldi	r0, y1
    ldi r5, INPUT
    ldw r5,r5
    stb r0,r5

	ldi	r0, x1
    ldi r5, INPUT+2
    ldw r5,r5
    stb r0,r5

	ldi	r0, y2
    ldi r5, INPUT+4
    ldw r5,r5
    stb r0,r5

	ldi	r0, x2
    ldi r5, INPUT+6
    ldw r5,r5
    stb r0,r5
#ВВОД В ПРОЦЕССОР


#ХОД ИГРОКА
	jsr	playerMove
#ХОД ИГРОКА

	lsw	r0, -6                          # 2-byte Folded Reload
	lsw	r1, -4                          # 2-byte Folded Reload
	ldb	r0, r0
	cmp	r0, r1
	beq	__LBB23_6
	br	__LBB23_5
__LBB23_5:                              # %if.then5
                                        #   in Loop: Header=BB18_3 Depth=2
#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА ИГРОКА
    ldi r6, CONTINUEP
    ldw r6,r6
    ldi r6,0
#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА ИГРОКА
	br	__LBB23_6
__LBB23_6:                              # %if.end
                                        #   in Loop: Header=BB18_3 Depth=2
	br	__LBB23_3
__LBB23_7:                              # %while.end
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r1, GAMEMODE
	ldi	r0, 1
	stb	r1, r0
	br	__LBB23_18
__LBB23_8:                              # %if.else
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB23_9
__LBB23_9:                              # %while.cond6
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r0, canContinueCapture
	ldb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB23_17
	br	__LBB23_10
__LBB23_10:                              # %while.body8
                                        #   in Loop: Header=BB18_9 Depth=2
	ldi	r1, canContinueCapture
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r0, 0
	ssw	r0, -8                          # 2-byte Folded Spill
	stb	r1, r0
    #ХОД БОТА
	jsr	botMove
	lsw	r0, -10                         # 2-byte Folded Reload
	lsw	r1, -8                          # 2-byte Folded Reload
	ldb	r0, r0
	cmp	r0, r1
	beq	__LBB23_12
	br	__LBB23_11
__LBB23_11:                         # %if.then10
                                        #   in Loop: Header=BB18_9 Depth=2
#ВЫВОД НА ПОЛЕ
    ldi r6, cntLine
    ldw r6,r3

    ldi r6, LINES
    ldw r6,r0

    ldi r6, LINES+2
    ldw r6,r1

    ldi r6, LINES+4
    ldw r6,r2


#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА БОТА
    ldi r6, CONTINUEB
    ldw r6,r6
    ldi r6,0
#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА БОТА
#ВЫВОД НА ПОЛЕ
	br	__LBB23_16
__LBB23_12:                               # %if.else11
                                        #   in Loop: Header=BB18_9 Depth=2
	jsr	hasAllCapture
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB23_14
	br	__LBB23_13
__LBB23_13:                              # %if.then13
                                        #   in Loop: Header=BB18_9 Depth=2
#ВЫВОД НА ПОЛЕ
    ldi r6, cntLine
    ldw r6,r3

    ldi r6, LINES
    ldw r6,r0

    ldi r6, LINES+2
    ldw r6,r1

    ldi r6, LINES+4
    ldw r6,r2


#ФЛАГ КОНЦА ХОДА БОТА + ИГРОК ТОЛЬКО СРУБ
    ldi r6, HASCAPTURE
    ldw r6,r6
    ldi r6,0
#ФЛАГ КОНЦА ХОДА БОТА + ИГРОК ТОЛЬКО СРУБ
#ВЫВОД НА ПОЛЕ
	br	__LBB23_15
__LBB23_14:                             # %if.else14
                                        #   in Loop: Header=BB18_9 Depth=2
 #ВЫВОД НА ПОЛЕ
    ldi r6, cntLine
    ldw r6,r3

    ldi r6, LINES
    ldw r6,r0

    ldi r6, LINES+2
    ldw r6,r1

    ldi r6, LINES+4
    ldw r6,r2


#ФЛАГ КОНЦА ХОДА БОТА + ИГРОК ХОТЬ КАК

    ldi r6, FINALBOT
    ldw r6,r6
    ldi r6,0

#ФЛАГ КОНЦА ХОДА БОТА + ИГРОК ХОТЬ КАК
#ВЫВОД НА ПОЛЕ
	br	__LBB23_15
__LBB23_15:                             # %if.end15
                                        #   in Loop: Header=BB18_9 Depth=2
	br	__LBB23_16
__LBB23_16:                             # %if.end16
                                        #   in Loop: Header=BB18_9 Depth=2
	br	__LBB23_9
__LBB23_17:                             # %while.end17
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r1, GAMEMODE
	ldi	r0, 0
	stb	r1, r0
	br	__LBB23_18
__LBB23_18:                             # %if.end18
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r0, countCapture
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB23_20
	br	__LBB23_19
__LBB23_19:     
#ФЛАГ ПОРАЖЕНИЯ
    ldi r6, LOSE
    ldw r6,r6
#ФЛАГ ПОРАЖЕНИЯ                        # %if.then22
	br	__LBB23_23
__LBB23_20:                             # %if.end23
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r0, countCapture+1
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB23_22
	br	__LBB23_21
__LBB23_21:     
#ФЛАГ ПОБЕДЫ
    ldi r6, WIN
    ldw r6,r6
#ФЛАГ ПОБЕДЫ                        # %if.then27
	br	__LBB23_23
__LBB23_22:                             # %if.end28
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB23_1
__LBB23_23:                             # %while.end29
	ldi	r0, 0
	addsp	10
	pop	fp
	rts
                                        # -- End function
### SECTION: .bss
GAMEMODE>                               # @GAMEMODE
	db	0                               # 0x0

### SECTION: .data
checkerX>                               # @checkerX
	db	0
	db	2
	db	4
	db	6
	db	1
	db	3
	db	5
	db	7
	db	0
	db	2
	db	4
	db	6
	db	1
	db	3
	db	5
	db	7
	db	0
	db	2
	db	4
	db	6
	db	1
	db	3
	db	5
	db	7

checkerY>                               # @checkerY
	db	0
	db	0
	db	0
	db	0
	db	1
	db	1
	db	1
	db	1
	db	2
	db	2
	db	2
	db	2
	db	5
	db	5
	db	5
	db	5
	db	6
	db	6
	db	6
	db	6
	db	7
	db	7
	db	7
	db	7

### SECTION: .bss
checkerIsKing>                          # @checkerIsKing
	ds	24

### SECTION: .data
checkerIsAlive>                         # @checkerIsAlive
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

TABLE_INDEX>                            # @TABLE_INDEX
	db	0
	db	255
	db	1
	db	255
	db	2
	db	255
	db	3
	db	255
	db	255
	db	4
	db	255
	db	5
	db	255
	db	6
	db	255
	db	7
	db	8
	db	255
	db	9
	db	255
	db	10
	db	255
	db	11
	db	255
    db 255,255,255,255,255,255,255,255
    db 255,255,255,255,255,255,255,255
	db	255
	db	12
	db	255
	db	13
	db	255
	db	14
	db	255
	db	15
	db	16
	db	255
	db	17
	db	255
	db	18
	db	255
	db	19
	db	255
	db	255
	db	20
	db	255
	db	21
	db	255
	db	22
	db	255
	db	23

### SECTION: .rodata
dirX>                                   # @dirX
	db	255
	db	1

### SECTION: .data
countCapture>                           # @countCapture
	db	12,12

### SECTION: .bss
canContinueCapture>                     # @canContinueCapture
	db	0                               # 0x0

### SECTION: .data
DEPTH>                                  # @DEPTH
	db	1                               # 0x1

PAWN_VALUE>                             # @PAWN_VALUE
	db	10                              # 0xa

KING_VALUE>                             # @KING_VALUE
	db	30                              # 0x1e

POS_VALUE>                              # @POS_VALUE
	db	0
	db	1
	db	2
	db	3
	db	3
	db	2
	db	1
	db	0

MOVE>                                   # @MOVE
	dc	32753                           # 0x7ff1

HASCAPTURE>                             # @HASCAPTURE
	dc	32754                           # 0x7ff2

WIN>                                    # @WIN
	dc	32755                           # 0x7ff3

LOSE>                                   # @LOSE
	dc	32756                           # 0x7ff4

CONTINUEP>                              # @CONTINUEP
	dc	32757                           # 0x7ff5

CONTINUEB>                              # @CONTINUEB
	dc	32758                           # 0x7ff6

FINALBOT>                               # @FINALBOT
	dc	32759                           # 0x7ff7

DRAW>                                   # @DRAW
	dc	32760                           # 0x7ff8

### SECTION: .bss
key>                                    # @key
	db	0                               # 0x0

val1>                                   # @val1
	db	0                               # 0x0

val2>                                   # @val2
	db	0                               # 0x0

val3>                                   # @val3
	db	0                               # 0x0

dirY>                                   # @dirY
	db	0                               # 0x0

midX>                                   # @midX
	db	0                               # 0x0

midY>                                   # @midY
	db	0                               # 0x0

enemyIndex>                             # @enemyIndex
	db	0                               # 0x0

tx>                                     # @tx
	db	0                               # 0x0

ty>                                     # @ty
	db	0                               # 0x0

id>                                     # @id
	db	0                               # 0x0

x1>                                     # @x1
	db	0                               # 0x0

y1>                                     # @y1
	db	0                               # 0x0

x2>                                     # @x2
	db	0                               # 0x0

y2>                                     # @y2
	db	0                               # 0x0

wasKing>                                # @wasKing
	db	0                               # 0x0

color>                                  # @color
	db	0                               # 0x0

lastCap>                                # @lastCap
	db	0                               # 0x0

startX>                                 # @startX
	db	0                               # 0x0

startY>                                 # @startY
	db	0                               # 0x0

curColor>                               # @curColor
	db	0                               # 0x0

newX>                                   # @newX
	db	0                               # 0x0

newY>                                   # @newY
	db	0                               # 0x0

checkCount>                             # @checkCount
	db	0                               # 0x0

startIdx>                               # @startIdx
	db	0                               # 0x0

endIdx>                                 # @endIdx
	db	0                               # 0x0

backDirY>                               # @backDirY
	db	0                               # 0x0

score>                                  # @score
	dc	0                               # 0x0

blackMaterial>                          # @blackMaterial
	dc	0                               # 0x0

whiteMaterial>                          # @whiteMaterial
	dc	0                               # 0x0

temp>                                   # @temp
	ds	4

tt_hash>                                # @tt_hash
	ds	256

tt_depth>                               # @tt_depth
	ds	256

tt_score>                               # @tt_score
	ds	512

cntLine>                                # @cntLine
	db	0                               # 0x0

swift>                                  # @swift
	db	0                               # 0x0

checkersLine>                           # @checkersLine
	ds	4

LINES>                                  # @LINES
	ds	6

moveCount>                              # @moveCount
	db	0                               # 0x0

packedStart>                            # @packedStart
	db	0                               # 0x0

packedEnd>                              # @packedEnd
	db	0                               # 0x0

inf>                                    # @inf
	db	0                               # 0x0

cap>                                    # @cap
	db	0                               # 0x0

moves>                                  # @moves
	ds	64

bestScore>                              # @bestScore
	dc	0                               # 0x0

bestMoveId>                             # @bestMoveId
	db	0                               # 0x0

end.
