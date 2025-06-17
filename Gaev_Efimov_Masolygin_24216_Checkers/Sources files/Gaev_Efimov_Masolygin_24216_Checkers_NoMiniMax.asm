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
	beq	__LBB0_2
# %bb.1:                                # %entry
	movens	r4, r0
__LBB0_2:                               # %entry
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	beq	__LBB0_4
# %bb.3:                                # %entry
	movens	r3, r4
__LBB0_4:                               # %entry
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
	blo	__LBB0_31
	br	__LBB0_5
__LBB0_5:                               # %for.body.us.preheader
	and r2, r1, r2
	ldi	r3, 7
	cmp	r2, r3
	bhi	__LBB0_18
	br	__LBB0_6
__LBB0_6:                               # %if.end.us
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
	bhi	__LBB0_8
# %bb.7:                                # %if.end.us
	movens	r6, r2
__LBB0_8:                               # %if.end.us
	ssw	r2, -20                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	movens	r5, r2
	beq	__LBB0_10
# %bb.9:                                # %if.end.us
	movens	r6, r2
__LBB0_10:                              # %if.end.us
	ssw	r2, -22                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r6
	movens	r5, r2
	beq	__LBB0_12
# %bb.11:                               # %if.end.us
	movens	r6, r2
__LBB0_12:                              # %if.end.us
	sxt	r0, r0
	ldi	r3, 12
	cmp	r0, r3
	blt	__LBB0_14
# %bb.13:                               # %if.end.us
	movens	r6, r5
__LBB0_14:                              # %if.end.us
	cmp	r0, r6
	ldi	r3, 7
	blt	__LBB0_18
	br	__LBB0_15
__LBB0_15:                              # %if.end.us
	and r2, r5, r0
	tst	r0
	bne	__LBB0_18
	br	__LBB0_16
__LBB0_16:                              # %if.end.us
	lsw	r0, -20                         # 2-byte Folded Reload
	lsw	r2, -22                         # 2-byte Folded Reload
	and r2, r0, r0
	tst	r0
	bne	__LBB0_18
	br	__LBB0_17
__LBB0_17:                              # %if.end50.us
	ldi	r0, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r0, r2
	lsw	r0, -8                          # 2-byte Folded Reload
	sub	r0, 2
	ldi	r2, tx
	stb	r2, r0
__LBB0_18:                              # %for.inc.us
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r2
	and r2, r1, r2
	cmp	r2, r3
	bhi	__LBB0_60
	br	__LBB0_19
__LBB0_19:                              # %if.end.us.1
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
	bhi	__LBB0_21
# %bb.20:                               # %if.end.us.1
	movens	r1, r2
__LBB0_21:                              # %if.end.us.1
	ssw	r2, -12                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r5
	movens	r5, r2
	beq	__LBB0_23
# %bb.22:                               # %if.end.us.1
	movens	r1, r2
__LBB0_23:                              # %if.end.us.1
	ssw	r2, -20                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	movens	r5, r6
	beq	__LBB0_25
# %bb.24:                               # %if.end.us.1
	movens	r1, r6
__LBB0_25:                              # %if.end.us.1
	sxt	r3, r3
	ldi	r2, 12
	cmp	r3, r2
	blt	__LBB0_27
# %bb.26:                               # %if.end.us.1
	movens	r1, r5
__LBB0_27:                              # %if.end.us.1
	cmp	r3, r1
	blt	__LBB0_60
	br	__LBB0_28
__LBB0_28:                              # %if.end.us.1
	and r6, r5, r1
	tst	r1
	bne	__LBB0_60
	br	__LBB0_29
__LBB0_29:                              # %if.end.us.1
	lsw	r1, -12                         # 2-byte Folded Reload
	lsw	r2, -20                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB0_60
	br	__LBB0_30
__LBB0_30:                              # %if.end50.us.1
	ldi	r1, ty
	lsw	r2, -16                         # 2-byte Folded Reload
	stb	r1, r2
	lsw	r1, -8                          # 2-byte Folded Reload
	add	r1, 2
	ldi	r2, tx
	stb	r2, r1
	br	__LBB0_60
__LBB0_31:                              # %entry.split
	ssw	r0, -20                         # 2-byte Folded Spill
	movens	r4, r0
	ldi	r4, 1
	lsw	r5, -10                         # 2-byte Folded Reload
	ssw	r4, -22                         # 2-byte Folded Spill
	cmp	r5, r4
	beq	__LBB0_33
	br	__LBB0_32
__LBB0_33:                              # %for.body.preheader
	and r2, r1, r1
	cmp	r1, r3
	movens	r0, r4
	lsw	r0, -20                         # 2-byte Folded Reload
	blo	__LBB0_51
	br	__LBB0_55
__LBB0_51:                              # %if.end
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
	bhi	__LBB0_55
	br	__LBB0_52
__LBB0_52:                              # %if.end
	ldi	r1, 0
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	beq	__LBB0_55
	br	__LBB0_53
__LBB0_53:                              # %if.end50
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
	bhi	__LBB0_55
	br	__LBB0_54
__LBB0_54:                              # %if.end78
	shl	r6, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_55
__LBB0_55:                              # %for.inc
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r3, 7
	cmp	r1, r3
	bhi	__LBB0_60
	br	__LBB0_56
__LBB0_56:                              # %if.end.1
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
	bhi	__LBB0_60
	br	__LBB0_57
__LBB0_57:                              # %if.end.1
	ldi	r1, 0
	lsw	r2, -10                         # 2-byte Folded Reload
	cmp	r2, r1
	beq	__LBB0_60
	br	__LBB0_58
__LBB0_58:                              # %if.end50.1
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
	bhi	__LBB0_60
	br	__LBB0_59
__LBB0_59:                              # %if.end78.1
	shl	r6, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_60
__LBB0_32:                              # %for.body.us253.preheader
	and r2, r1, r1
	cmp	r1, r3
	ssw	r6, -24                         # 2-byte Folded Spill
	ldi	r6, 0
	movens	r0, r4
	lsw	r0, -20                         # 2-byte Folded Reload
	blo	__LBB0_34
	br	__LBB0_42
__LBB0_34:                              # %if.end.us259
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
	beq	__LBB0_36
# %bb.35:                               # %if.end.us259
	movens	r6, r5
__LBB0_36:                              # %if.end.us259
	ldi	r1, 12
	cmp	r2, r1
	blt	__LBB0_38
# %bb.37:                               # %if.end.us259
	movens	r6, r3
__LBB0_38:                              # %if.end.us259
	cmp	r2, r6
	ldi	r6, 0
	blt	__LBB0_42
	br	__LBB0_39
__LBB0_39:                              # %if.end.us259
	and r5, r3, r1
	tst	r1
	bne	__LBB0_42
	br	__LBB0_40
__LBB0_40:                              # %lor.lhs.false41.us266
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
	bhi	__LBB0_42
	br	__LBB0_41
__LBB0_41:                              # %if.end78.us
	lsw	r1, -24                         # 2-byte Folded Reload
	shl	r1, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_42
__LBB0_42:                              # %for.inc.us272
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB0_60
	br	__LBB0_43
__LBB0_43:                              # %if.end.us259.1
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
	beq	__LBB0_45
# %bb.44:                               # %if.end.us259.1
	movens	r6, r3
__LBB0_45:                              # %if.end.us259.1
	ldi	r1, 12
	cmp	r2, r1
	blt	__LBB0_47
# %bb.46:                               # %if.end.us259.1
	ssw	r6, -22                         # 2-byte Folded Spill
__LBB0_47:                              # %if.end.us259.1
	cmp	r2, r6
	blt	__LBB0_60
	br	__LBB0_48
__LBB0_48:                              # %if.end.us259.1
	lsw	r1, -22                         # 2-byte Folded Reload
	and r3, r1, r1
	tst	r1
	bne	__LBB0_60
	br	__LBB0_49
__LBB0_49:                              # %lor.lhs.false41.us266.1
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
	bhi	__LBB0_60
	br	__LBB0_50
__LBB0_50:                              # %if.end78.us.1
	lsw	r1, -24                         # 2-byte Folded Reload
	shl	r1, r1, 3
	add r1, r2, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_60
__LBB0_60:                              # %for.end
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
	blt	__LBB0_96
	br	__LBB0_61
__LBB0_61:                              # %land.lhs.true95
	ldi	r1, 255
	and r0, r1, r0
	ldi	r1, checkerIsKing
	ldb	r0, r1, r0
	cmp	r0, r3
	beq	__LBB0_96
	br	__LBB0_62
__LBB0_62:                              # %if.then99
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
	bhi	__LBB0_78
	br	__LBB0_63
__LBB0_63:                              # %if.end135
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
	bhi	__LBB0_65
# %bb.64:                               # %if.end135
	ldi	r1, 0
__LBB0_65:                              # %if.end135
	ssw	r1, -14                         # 2-byte Folded Spill
	lsw	r3, -10                         # 2-byte Folded Reload
	cmp	r3, r5
	movens	r5, r1
	beq	__LBB0_67
# %bb.66:                               # %if.end135
	ldi	r1, 0
__LBB0_67:                              # %if.end135
	ssw	r1, -16                         # 2-byte Folded Spill
	movens	r6, r1
	lsw	r3, -10                         # 2-byte Folded Reload
	ldi	r6, 0
	cmp	r3, r6
	movens	r5, r3
	beq	__LBB0_69
# %bb.68:                               # %if.end135
	ldi	r3, 0
__LBB0_69:                              # %if.end135
	sxt	r2, r2
	ldi	r6, 12
	cmp	r2, r6
	blt	__LBB0_71
# %bb.70:                               # %if.end135
	ldi	r5, 0
__LBB0_71:                              # %if.end135
	ldi	r6, 0
	cmp	r2, r6
	movens	r1, r6
	blt	__LBB0_78
	br	__LBB0_72
__LBB0_72:                              # %if.end135
	and r3, r5, r1
	tst	r1
	bne	__LBB0_78
	br	__LBB0_73
__LBB0_73:                              # %if.end135
	lsw	r1, -14                         # 2-byte Folded Reload
	lsw	r2, -16                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB0_78
	br	__LBB0_74
__LBB0_74:                              # %if.end160
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
	bhi	__LBB0_78
	br	__LBB0_75
__LBB0_75:                              # %if.end160
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB0_78
	br	__LBB0_76
__LBB0_76:                              # %if.end160
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB0_78
	br	__LBB0_77
__LBB0_77:                              # %if.end189
	shl	r6, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_78
__LBB0_78:                              # %for.inc199
	lsw	r0, -8                          # 2-byte Folded Reload
	add	r0, 1
	or r0, r4, r1
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 7
	cmp	r1, r2
	bhi	__LBB0_94
	br	__LBB0_79
__LBB0_79:                              # %if.end135.1
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
	bhi	__LBB0_81
# %bb.80:                               # %if.end135.1
	ldi	r1, 0
__LBB0_81:                              # %if.end135.1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r1, -10                         # 2-byte Folded Reload
	cmp	r1, r5
	movens	r5, r1
	beq	__LBB0_83
# %bb.82:                               # %if.end135.1
	ldi	r1, 0
__LBB0_83:                              # %if.end135.1
	ssw	r1, -14                         # 2-byte Folded Spill
	movens	r6, r3
	lsw	r1, -10                         # 2-byte Folded Reload
	ldi	r6, 0
	cmp	r1, r6
	movens	r5, r1
	beq	__LBB0_85
# %bb.84:                               # %if.end135.1
	ldi	r1, 0
__LBB0_85:                              # %if.end135.1
	sxt	r2, r2
	ldi	r6, 12
	cmp	r2, r6
	blt	__LBB0_87
# %bb.86:                               # %if.end135.1
	ldi	r5, 0
__LBB0_87:                              # %if.end135.1
	ldi	r6, 0
	cmp	r2, r6
	blt	__LBB0_94
	br	__LBB0_88
__LBB0_88:                              # %if.end135.1
	and r1, r5, r1
	tst	r1
	bne	__LBB0_94
	br	__LBB0_89
__LBB0_89:                              # %if.end135.1
	lsw	r1, -12                         # 2-byte Folded Reload
	lsw	r2, -14                         # 2-byte Folded Reload
	and r2, r1, r1
	tst	r1
	bne	__LBB0_94
	br	__LBB0_90
__LBB0_90:                              # %if.end160.1
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
	bhi	__LBB0_94
	br	__LBB0_91
__LBB0_91:                              # %if.end160.1
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB0_94
	br	__LBB0_92
__LBB0_92:                              # %if.end160.1
	ldi	r2, 7
	cmp	r3, r2
	bgt	__LBB0_94
	br	__LBB0_93
__LBB0_93:                              # %if.end189.1
	shl	r3, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r3, 1
	ldi	r2, 255
	cmp	r1, r2
	beq	__LBB0_95
	br	__LBB0_94
__LBB0_94:                              # %for.inc199.1
	ldi	r3, 0
__LBB0_95:                              # %return.sink.split
	ldi	r1, midY
	stb	r1, r4
	ldi	r1, midX
	stb	r1, r0
__LBB0_96:                              # %return
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
	bne	__LBB1_13
	br	__LBB1_1
__LBB1_1:                               # %for.cond
	ldi	r0, checkerY+1
	ldsb	r0, r1
	ldi	r0, checkerX+1
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_2
__LBB1_2:                               # %for.cond.1
	ldi	r0, checkerY+2
	ldsb	r0, r1
	ldi	r0, checkerX+2
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_3
__LBB1_3:                               # %for.cond.2
	ldi	r0, checkerY+3
	ldsb	r0, r1
	ldi	r0, checkerX+3
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_4
__LBB1_4:                               # %for.cond.3
	ldi	r0, checkerY+4
	ldsb	r0, r1
	ldi	r0, checkerX+4
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_5
__LBB1_5:                               # %for.cond.4
	ldi	r0, checkerY+5
	ldsb	r0, r1
	ldi	r0, checkerX+5
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_6
__LBB1_6:                               # %for.cond.5
	ldi	r0, checkerY+6
	ldsb	r0, r1
	ldi	r0, checkerX+6
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_7
__LBB1_7:                               # %for.cond.6
	ldi	r0, checkerY+7
	ldsb	r0, r1
	ldi	r0, checkerX+7
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_8
__LBB1_8:                               # %for.cond.7
	ldi	r0, checkerY+8
	ldsb	r0, r1
	ldi	r0, checkerX+8
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_9
__LBB1_9:                               # %for.cond.8
	ldi	r0, checkerY+9
	ldsb	r0, r1
	ldi	r0, checkerX+9
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_10
__LBB1_10:                              # %for.cond.9
	ldi	r0, checkerY+10
	ldsb	r0, r1
	ldi	r0, checkerX+10
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
	br	__LBB1_11
__LBB1_11:                              # %for.cond.10
	ldi	r0, checkerY+11
	ldsb	r0, r1
	ldi	r0, checkerX+11
	ldsb	r0, r0
	movens	r4, r2
	jsr	hasCapture
	cmp	r0, r4
	bne	__LBB1_13
# %bb.12:                               # %for.cond.10
	movens	r4, r5
__LBB1_13:                              # %cleanup
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
	bgt	__LBB2_2
# %bb.1:                                # %entry
	ldi	r0, 0
__LBB2_2:                               # %entry
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
	beq	__LBB2_6
	br	__LBB2_3
__LBB2_3:                               # %entry
	ldi	r4, 1
	cmp	r6, r4
	ldi	r6, lastCap
	bne	__LBB2_8
	br	__LBB2_4
__LBB2_4:                               # %land.lhs.true
	lsw	r2, -10                         # 2-byte Folded Reload
	sub r2, r1, r0
	shra	r0, r2, 8
	shra	r2, r2, 15-8
	xor r0, r2, r0
	sub r0, r2, r0
	cmp	r0, r4
	bne	__LBB2_8
	br	__LBB2_5
__LBB2_5:                               # %if.then
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
	br	__LBB2_8
__LBB2_6:                               # %land.lhs.true72
	ssw	r0, -14                         # 2-byte Folded Spill
	lsw	r2, -10                         # 2-byte Folded Reload
	sub r2, r1, r2
	shra	r2, r6, 8
	shra	r6, r6, 15-8
	xor r2, r6, r2
	sub r2, r6, r2
	cmp	r2, r4
	ldi	r6, lastCap
	bne	__LBB2_8
	br	__LBB2_7
__LBB2_7:                               # %if.then91
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
__LBB2_8:                               # %if.end128
	sxt	r3, r0
	ldi	r2, 11
	cmp	r0, r2
	bgt	__LBB2_10
	br	__LBB2_9
__LBB2_9:                               # %if.end128
	ldi	r2, 255
	lsw	r1, -8                          # 2-byte Folded Reload
	and r1, r2, r2
	ldi	r3, 7
	cmp	r2, r3
	beq	__LBB2_12
	br	__LBB2_10
__LBB2_10:                              # %lor.lhs.false
	ldi	r2, 12
	cmp	r0, r2
	blt	__LBB2_13
	br	__LBB2_11
__LBB2_11:                              # %lor.lhs.false
	ldi	r2, 255
	lsw	r1, -8                          # 2-byte Folded Reload
	and r1, r2, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB2_13
	br	__LBB2_12
__LBB2_12:                              # %if.then143
	ldi	r1, 1
	ldi	r2, checkerIsKing
	stb	r0, r2, r1
__LBB2_13:                              # %if.end146
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
	blt	__LBB3_2
	br	__LBB3_1
__LBB3_1:                               # %if.then
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
__LBB3_2:                               # %if.end
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
	bhi	__LBB4_13
	br	__LBB4_1
__LBB4_1:                               # %entry
	sxt	r2, r2
	ldi	r6, 0
	cmp	r2, r6
	blt	__LBB4_13
	br	__LBB4_2
__LBB4_2:                               # %entry
	ldi	r6, 7
	cmp	r2, r6
	bgt	__LBB4_13
	br	__LBB4_3
__LBB4_3:                               # %if.end
	shl	r2, r2, 3
	add r2, r5, r2
	ldi	r5, TABLE_INDEX
	ldsb	r2, r5, r5
	ldi	r2, enemyIndex
	stb	r2, r5
	ldi	r2, 0
	cmp	r5, r2
	blt	__LBB4_13
	br	__LBB4_4
__LBB4_4:                               # %lor.lhs.false25
	ldi	r2, curColor
	ldb	r2, r2
	ldi	r6, 11
	cmp	r5, r6
	bhi	__LBB4_6
	br	__LBB4_5
__LBB4_5:                               # %lor.lhs.false25
	ldi	r6, 255
	and r2, r6, r6
	ssw	r4, -10                         # 2-byte Folded Spill
	movens	r2, r4
	ldi	r2, 0
	cmp	r6, r2
	movens	r4, r2
	lsw	r4, -10                         # 2-byte Folded Reload
	beq	__LBB4_13
	br	__LBB4_6
__LBB4_6:                               # %lor.lhs.false32
	ldi	r6, 12
	cmp	r5, r6
	blo	__LBB4_8
	br	__LBB4_7
__LBB4_7:                               # %lor.lhs.false32
	ldi	r5, 255
	and r2, r5, r2
	ldi	r5, 1
	cmp	r2, r5
	beq	__LBB4_13
	br	__LBB4_8
__LBB4_8:                               # %if.end41
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
	bhi	__LBB4_13
	br	__LBB4_9
__LBB4_9:                               # %if.end41
	sxt	r3, r3
	ldi	r0, 0
	cmp	r3, r0
	blt	__LBB4_13
	br	__LBB4_10
__LBB4_10:                              # %if.end41
	ldi	r0, 7
	cmp	r3, r0
	bgt	__LBB4_13
	br	__LBB4_11
__LBB4_11:                              # %lor.lhs.false66
	shl	r3, r3, 3
	add r3, r2, r2
	ldi	r0, TABLE_INDEX
	ldb	r2, r0, r2
	ldi	r0, 255
	cmp	r2, r0
	bne	__LBB4_13
	br	__LBB4_12
__LBB4_12:                              # %if.end75
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
__LBB4_13:                              # %return
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
	bhi	__LBB5_5
	br	__LBB5_1
__LBB5_1:                               # %entry
	sxt	r3, r3
	ldi	r1, 0
	cmp	r3, r1
	blt	__LBB5_5
	br	__LBB5_2
__LBB5_2:                               # %entry
	cmp	r3, r0
	bgt	__LBB5_5
	br	__LBB5_3
__LBB5_3:                               # %lor.lhs.false20
	shl	r3, r0, 3
	add r0, r6, r0
	ldi	r1, TABLE_INDEX
	ldb	r0, r1, r0
	cmp	r0, r5
	bne	__LBB5_5
	br	__LBB5_4
__LBB5_4:                               # %if.end
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
__LBB5_5:                               # %return
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
	beq	__LBB6_2
# %bb.1:                                # %for.body.lr.ph
	movens	r1, r2
__LBB6_2:                               # %for.body.lr.ph
	ldi	r4, 0
	cmp	r0, r4
	beq	__LBB6_4
# %bb.3:                                # %for.body.lr.ph
	movens	r3, r1
__LBB6_4:                               # %for.body.lr.ph
	ldi	r3, checkCount
	stb	r3, r4
	ldi	r3, 12
	cmp	r0, r4
	beq	__LBB6_6
# %bb.5:                                # %for.body.lr.ph
	ldi	r3, 24
__LBB6_6:                               # %for.body.lr.ph
	cmp	r0, r4
	beq	__LBB6_8
# %bb.7:                                # %for.body.lr.ph
	ldi	r4, 12
__LBB6_8:                               # %for.body.lr.ph
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
	br	__LBB6_10
__LBB6_38:                              # %if.then23
                                        #   in Loop: Header=BB6_10 Depth=1
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
__LBB6_39:                              # %for.inc25
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r0, endIdx
	ldsb	r0, r1
	add	r4, 1
	cmp	r4, r1
	blt	__LBB6_10
	br	__LBB6_9
__LBB6_10:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, checkerIsAlive
	ldb	r4, r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB6_39
	br	__LBB6_11
__LBB6_11:                              # %if.end7
                                        #   in Loop: Header=BB6_10 Depth=1
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
	bhi	__LBB6_24
	br	__LBB6_12
__LBB6_12:                              # %if.end7
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 0
	cmp	r3, r2
	blt	__LBB6_24
	br	__LBB6_13
__LBB6_13:                              # %if.end7
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 7
	cmp	r3, r2
	bgt	__LBB6_24
	br	__LBB6_14
__LBB6_14:                              # %if.end.i
                                        #   in Loop: Header=BB6_10 Depth=1
	shl	r3, r6, 3
	add r6, r5, r5
	ldi	r2, TABLE_INDEX
	ldsb	r5, r2, r5
	ldi	r2, enemyIndex
	stb	r2, r5
	ldi	r2, 0
	cmp	r5, r2
	blt	__LBB6_24
	br	__LBB6_15
__LBB6_15:                              # %lor.lhs.false25.i
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, curColor
	ldb	r2, r6
	ldi	r2, 11
	cmp	r5, r2
	bhi	__LBB6_17
	br	__LBB6_16
__LBB6_16:                              # %lor.lhs.false25.i
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 255
	and r6, r2, r2
	ssw	r6, -12                         # 2-byte Folded Spill
	ldi	r6, 0
	cmp	r2, r6
	lsw	r6, -12                         # 2-byte Folded Reload
	beq	__LBB6_24
	br	__LBB6_17
__LBB6_17:                              # %lor.lhs.false32.i
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 12
	cmp	r5, r2
	blo	__LBB6_19
	br	__LBB6_18
__LBB6_18:                              # %lor.lhs.false32.i
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 255
	and r6, r2, r2
	ldi	r5, 1
	cmp	r2, r5
	beq	__LBB6_24
	br	__LBB6_19
__LBB6_19:                              # %if.end41.i
                                        #   in Loop: Header=BB6_10 Depth=1
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
	bhi	__LBB6_24
	br	__LBB6_20
__LBB6_20:                              # %if.end41.i
                                        #   in Loop: Header=BB6_10 Depth=1
	sxt	r6, r6
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB6_24
	br	__LBB6_21
__LBB6_21:                              # %if.end41.i
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB6_24
	br	__LBB6_22
__LBB6_22:                              # %lor.lhs.false66.i
                                        #   in Loop: Header=BB6_10 Depth=1
	shl	r6, r2, 3
	add r2, r5, r2
	ldi	r5, TABLE_INDEX
	ldb	r2, r5, r2
	ldi	r5, 255
	cmp	r2, r5
	bne	__LBB6_24
	br	__LBB6_23
__LBB6_23:                              # %if.end75.i
                                        #   in Loop: Header=BB6_10 Depth=1
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
__LBB6_24:                              # %checkCapture.exit
                                        #   in Loop: Header=BB6_10 Depth=1
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
	bhi	__LBB6_37
	br	__LBB6_25
__LBB6_25:                              # %checkCapture.exit
                                        #   in Loop: Header=BB6_10 Depth=1
	sxt	r3, r6
	ldi	r2, 0
	cmp	r6, r2
	blt	__LBB6_37
	br	__LBB6_26
__LBB6_26:                              # %checkCapture.exit
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 7
	cmp	r6, r2
	bgt	__LBB6_37
	br	__LBB6_27
__LBB6_27:                              # %if.end.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
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
	blt	__LBB6_37
	br	__LBB6_28
__LBB6_28:                              # %lor.lhs.false25.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, curColor
	ldb	r2, r5
	ldi	r2, 11
	cmp	r3, r2
	bhi	__LBB6_30
	br	__LBB6_29
__LBB6_29:                              # %lor.lhs.false25.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 255
	and r5, r2, r2
	ldi	r6, 0
	cmp	r2, r6
	beq	__LBB6_37
	br	__LBB6_30
__LBB6_30:                              # %lor.lhs.false32.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 12
	cmp	r3, r2
	blo	__LBB6_32
	br	__LBB6_31
__LBB6_31:                              # %lor.lhs.false32.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r2, 255
	and r5, r2, r2
	ldi	r3, 1
	cmp	r2, r3
	beq	__LBB6_37
	br	__LBB6_32
__LBB6_32:                              # %if.end41.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
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
	bhi	__LBB6_37
	br	__LBB6_33
__LBB6_33:                              # %if.end41.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	sxt	r2, r2
	ldi	r3, 0
	cmp	r2, r3
	blt	__LBB6_37
	br	__LBB6_34
__LBB6_34:                              # %if.end41.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r3, 7
	cmp	r2, r3
	bgt	__LBB6_37
	br	__LBB6_35
__LBB6_35:                              # %lor.lhs.false66.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	ldb	r1, r2, r1
	ldi	r2, 255
	cmp	r1, r2
	bne	__LBB6_37
	br	__LBB6_36
__LBB6_36:                              # %if.end75.i.1
                                        #   in Loop: Header=BB6_10 Depth=1
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
__LBB6_37:                              # %checkCapture.exit.1
                                        #   in Loop: Header=BB6_10 Depth=1
	ldi	r0, checkerIsKing
	ldb	r4, r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB6_39
	br	__LBB6_38
__LBB6_9:                               # %for.cond.cleanup
	ldi	r0, checkCount
	ldb	r0, r2
	ldi	r3, 0
	cmp	r2, r3
	beq	__LBB6_40
	br	__LBB6_65
__LBB6_40:                              # %if.end30
	ldi	r0, startIdx
	ldsb	r0, r0
	cmp	r0, r1
	movens	r3, r2
	bge	__LBB6_65
	br	__LBB6_41
__LBB6_41:                              # %for.body38.lr.ph
	ldi	r2, 0
__LBB6_42:                              # %for.body38
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, checkerIsAlive
	ldb	r0, r3, r3
	ldi	r1, 0
	cmp	r3, r1
	beq	__LBB6_64
	br	__LBB6_43
__LBB6_43:                              # %if.end43
                                        #   in Loop: Header=BB6_42 Depth=1
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
	bhi	__LBB6_48
	br	__LBB6_44
__LBB6_44:                              # %if.end43
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 0
	cmp	r4, r1
	blt	__LBB6_48
	br	__LBB6_45
__LBB6_45:                              # %if.end43
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 7
	cmp	r4, r1
	bgt	__LBB6_48
	br	__LBB6_46
__LBB6_46:                              # %lor.lhs.false20.i
                                        #   in Loop: Header=BB6_42 Depth=1
	shl	r4, r6, 3
	add r6, r5, r5
	ldi	r1, TABLE_INDEX
	ldb	r5, r1, r5
	ldi	r6, 255
	cmp	r5, r6
	bne	__LBB6_48
	br	__LBB6_47
__LBB6_47:                              # %if.end.i101
                                        #   in Loop: Header=BB6_42 Depth=1
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
__LBB6_48:                              # %checkMove.exit
                                        #   in Loop: Header=BB6_42 Depth=1
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
	bhi	__LBB6_53
	br	__LBB6_49
__LBB6_49:                              # %checkMove.exit
                                        #   in Loop: Header=BB6_42 Depth=1
	sxt	r4, r6
	ldi	r1, 0
	cmp	r6, r1
	blt	__LBB6_53
	br	__LBB6_50
__LBB6_50:                              # %checkMove.exit
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 7
	cmp	r6, r1
	bgt	__LBB6_53
	br	__LBB6_51
__LBB6_51:                              # %lor.lhs.false20.i.1
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r6, 255
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r5, r4
	ldi	r1, TABLE_INDEX
	ldb	r4, r1, r4
	cmp	r4, r6
	bne	__LBB6_53
	br	__LBB6_52
__LBB6_52:                              # %if.end.i101.1
                                        #   in Loop: Header=BB6_42 Depth=1
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
__LBB6_53:                              # %checkMove.exit.1
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, checkerIsKing
	ldb	r0, r1, r3
	ldi	r1, 0
	cmp	r3, r1
	beq	__LBB6_64
	br	__LBB6_54
__LBB6_54:                              # %if.then63
                                        #   in Loop: Header=BB6_42 Depth=1
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
	bhi	__LBB6_59
	br	__LBB6_55
__LBB6_55:                              # %if.then63
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 0
	cmp	r4, r1
	blt	__LBB6_59
	br	__LBB6_56
__LBB6_56:                              # %if.then63
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 7
	cmp	r4, r1
	bgt	__LBB6_59
	br	__LBB6_57
__LBB6_57:                              # %lor.lhs.false20.i111
                                        #   in Loop: Header=BB6_42 Depth=1
	shl	r4, r6, 3
	add r6, r5, r5
	ldi	r1, TABLE_INDEX
	ldb	r5, r1, r5
	ldi	r6, 255
	cmp	r5, r6
	bne	__LBB6_59
	br	__LBB6_58
__LBB6_58:                              # %if.end.i116
                                        #   in Loop: Header=BB6_42 Depth=1
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
__LBB6_59:                              # %checkMove.exit131
                                        #   in Loop: Header=BB6_42 Depth=1
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
	bhi	__LBB6_64
	br	__LBB6_60
__LBB6_60:                              # %checkMove.exit131
                                        #   in Loop: Header=BB6_42 Depth=1
	sxt	r4, r6
	ldi	r1, 0
	cmp	r6, r1
	blt	__LBB6_64
	br	__LBB6_61
__LBB6_61:                              # %checkMove.exit131
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r1, 7
	cmp	r6, r1
	bgt	__LBB6_64
	br	__LBB6_62
__LBB6_62:                              # %lor.lhs.false20.i139
                                        #   in Loop: Header=BB6_42 Depth=1
	ldi	r6, 255
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r5, r4
	ldi	r1, TABLE_INDEX
	ldb	r4, r1, r4
	cmp	r4, r6
	bne	__LBB6_64
	br	__LBB6_63
__LBB6_63:                              # %if.end.i144
                                        #   in Loop: Header=BB6_42 Depth=1
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
__LBB6_64:                              # %for.inc65
                                        #   in Loop: Header=BB6_42 Depth=1
	add	r0, 1
	ldi	r3, endIdx
	ldsb	r3, r3
	cmp	r0, r3
	blt	__LBB6_42
	br	__LBB6_65
__LBB6_65:                              # %return
	sxt	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
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
	bls	__LBB7_36
	br	__LBB7_1
__LBB7_1:                               # %for.body.preheader
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
__LBB7_2:                               # %for.body
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
	blt	__LBB7_10
	br	__LBB7_3
__LBB7_3:                               # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 255
	and r3, r0, r5
	ldi	r0, checkerIsKing
	ldb	r5, r0, r5
	cmp	r5, r2
	movens	r4, r0
	beq	__LBB7_5
# %bb.4:                                # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 3
__LBB7_5:                               # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r0, -12                         # 2-byte Folded Spill
	cmp	r5, r2
	movens	r4, r5
	bne	__LBB7_7
# %bb.6:                                # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r5, 0
__LBB7_7:                               # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	shl	r5, r5, 1
	ldi	r0, 12
	cmp	r3, r0
	blo	__LBB7_9
# %bb.8:                                # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	lsw	r5, -12                         # 2-byte Folded Reload
__LBB7_9:                               # %if.then35
                                        #   in Loop: Header=BB7_2 Depth=1
	add	r5, 1
__LBB7_10:                              # %for.inc
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r5, -12                         # 2-byte Folded Spill
	add r6, r1, r5
	ldi	r1, 2
	ldsb	r5, r1, r1
	cmp	r1, r2
	movens	r2, r3
	blt	__LBB7_18
	br	__LBB7_11
__LBB7_11:                              # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 255
	and r1, r0, r3
	ldi	r0, checkerIsKing
	ldb	r3, r0, r3
	cmp	r3, r2
	movens	r4, r0
	beq	__LBB7_13
# %bb.12:                               # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 3
__LBB7_13:                              # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r0, -16                         # 2-byte Folded Spill
	cmp	r3, r2
	movens	r4, r3
	bne	__LBB7_15
# %bb.14:                               # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r3, 0
__LBB7_15:                              # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	shl	r3, r3, 1
	ldi	r0, 12
	cmp	r1, r0
	blo	__LBB7_17
# %bb.16:                               # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	lsw	r3, -16                         # 2-byte Folded Reload
__LBB7_17:                              # %if.then35.1
                                        #   in Loop: Header=BB7_2 Depth=1
	add	r3, 1
__LBB7_18:                              # %for.inc.1
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r3, -18                         # 2-byte Folded Spill
	ldi	r0, 4
	ldsb	r5, r0, r3
	cmp	r3, r2
	movens	r2, r1
	blt	__LBB7_26
	br	__LBB7_19
__LBB7_19:                              # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 255
	and r3, r0, r1
	ldi	r0, checkerIsKing
	ldb	r1, r0, r1
	cmp	r1, r2
	movens	r4, r0
	beq	__LBB7_21
# %bb.20:                               # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 3
__LBB7_21:                              # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r0, -16                         # 2-byte Folded Spill
	cmp	r1, r2
	movens	r4, r1
	bne	__LBB7_23
# %bb.22:                               # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r1, 0
__LBB7_23:                              # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	shl	r1, r1, 1
	ldi	r0, 12
	cmp	r3, r0
	blo	__LBB7_25
# %bb.24:                               # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	lsw	r1, -16                         # 2-byte Folded Reload
__LBB7_25:                              # %if.then35.2
                                        #   in Loop: Header=BB7_2 Depth=1
	add	r1, 1
__LBB7_26:                              # %for.inc.2
                                        #   in Loop: Header=BB7_2 Depth=1
	ssw	r1, -20                         # 2-byte Folded Spill
	ssw	r6, -16                         # 2-byte Folded Spill
	ldi	r0, 6
	ldsb	r5, r0, r1
	cmp	r1, r2
	movens	r2, r3
	lsw	r4, -8                          # 2-byte Folded Reload
	lsw	r5, -12                         # 2-byte Folded Reload
	blt	__LBB7_34
	br	__LBB7_27
__LBB7_27:                              # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r0, 255
	and r1, r0, r3
	ldi	r0, checkerIsKing
	ldb	r3, r0, r3
	cmp	r3, r2
	ldi	r0, 1
	movens	r0, r4
	beq	__LBB7_29
# %bb.28:                               # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	ldi	r4, 3
__LBB7_29:                              # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	cmp	r3, r2
	movens	r0, r3
	bne	__LBB7_31
# %bb.30:                               # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	movens	r2, r3
__LBB7_31:                              # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	shl	r3, r3, 1
	ldi	r0, 12
	cmp	r1, r0
	blo	__LBB7_33
# %bb.32:                               # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	movens	r4, r3
__LBB7_33:                              # %if.then35.3
                                        #   in Loop: Header=BB7_2 Depth=1
	add	r3, 1
	lsw	r4, -8                          # 2-byte Folded Reload
__LBB7_34:                              # %for.inc.3
                                        #   in Loop: Header=BB7_2 Depth=1
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
	bgt	__LBB7_2
	br	__LBB7_35
__LBB7_35:                              # %for.cond.if.end67.loopexit_crit_edge
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
__LBB7_36:                              # %if.end67
	and r2, r0, r0
	ldi	r1, 2
	cmp	r0, r1
	bne	__LBB7_38
	br	__LBB7_37
__LBB7_37:                              # %if.then71
	ldi	r0, LINES+2
	ldw	r0, r0
	ldi	r1, LINES+4
	stw	r1, r0
__LBB7_38:                              # %if.end72
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	28
	pop	fp
	rts
                                        # -- End function

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

botMove>                                # -- Begin function botMove
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-18
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r4, 1
	ldi	r1, moves
	movens	r4, r0
	jsr	getMoves
	ldi	r1, moveCount
	stb	r1, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB8_2
	br	__LBB8_1
__LBB8_2:                               # %if.end
	ldi	r3, bestScore
	ldi	r2, 156
	stb	r3, r2
	ldi	r2, bestMoveId
	stb	r2, r1
	cmp	r0, r4
	ldi	r5, moves+3
	blt	__LBB8_5
	br	__LBB8_3
__LBB8_3:                               # %for.body.preheader
	ldi	r0, 0
	movens	r5, r4
	movens	r0, r2
	br	__LBB8_6
__LBB8_44:                              # %if.then282
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r1, bestMoveId
	stb	r1, r2
	ldi	r1, bestScore
	stb	r1, r0
__LBB8_45:                              # %if.end283
                                        #   in Loop: Header=BB8_6 Depth=1
	lsw	r4, -8                          # 2-byte Folded Reload
	add	r4, 4
	add	r2, 1
	ldi	r0, moveCount
	ldsb	r0, r0
	cmp	r2, r0
	blt	__LBB8_6
	br	__LBB8_4
__LBB8_6:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ssw	r2, -12                         # 2-byte Folded Spill
	ldi	r0, -3
	ldb	r4, r0, r0
	ldi	r1, -97
	movens	r1, r3
	add r0, r3, r0
	ldi	r1, x1
	stb	r1, r0
	ldi	r1, -2
	ldb	r4, r1, r1
	sub	r1, 49
	ldi	r2, y1
	stb	r2, r1
	ldi	r2, -1
	ssw	r4, -8                          # 2-byte Folded Spill
	ldb	r4, r2, r2
	add r2, r3, r2
	sxt	r0, r3
	sxt	r2, r4
	ssw	r3, -10                         # 2-byte Folded Spill
	sub r4, r3, r4
	shra	r4, r5, 8
	shra	r5, r5, 15-8
	xor r4, r5, r4
	sub r4, r5, r4
	ldi	r3, 2
	cmp	r4, r3
	ldi	r6, 10
	beq	__LBB8_8
# %bb.7:                                # %for.body
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r6, 0
__LBB8_8:                               # %for.body
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r3, x2
	stb	r3, r2
	lsw	r3, -8                          # 2-byte Folded Reload
	ldb	r3, r4
	movens	r4, r5
	sub	r5, 49
	ldi	r3, y2
	stb	r3, r5
	ldi	r3, score
	stb	r3, r6
	ldi	r3, 56
	cmp	r4, r3
	beq	__LBB8_10
	br	__LBB8_9
__LBB8_9:                               # %for.body
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r3, 49
	cmp	r4, r3
	bne	__LBB8_12
	br	__LBB8_10
__LBB8_10:                              # %land.lhs.true
                                        #   in Loop: Header=BB8_6 Depth=1
	sxt	r1, r4
	shl	r4, r4, 3
	lsw	r3, -10                         # 2-byte Folded Reload
	add r4, r3, r3
	ldi	r4, TABLE_INDEX
	ldsb	r3, r4, r3
	ldi	r4, checkerIsKing
	ldb	r3, r4, r3
	ldi	r4, 0
	cmp	r3, r4
	bne	__LBB8_12
	br	__LBB8_11
__LBB8_11:                              # %if.then59
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r3, 5
	or r6, r3, r3
	ldi	r4, score
	stb	r4, r3
__LBB8_12:                              # %if.end63
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r3, 15
	movens	r3, r4
	and r5, r4, r3
	shl	r2, r2, 4
	or r3, r2, r2
	ldi	r3, packedEnd
	stb	r3, r2
	and r1, r4, r1
	shl	r0, r0, 4
	or r1, r0, r0
	ldi	r1, packedStart
	stb	r1, r0
	sxt	r0, r0
	sxt	r2, r1
	jsr	move
	ldi	r1, inf
	ssw	r0, -14                         # 2-byte Folded Spill
	stb	r1, r0
	ldi	r1, y2
	ldsb	r1, r2
	ldi	r1, x2
	ldsb	r1, r3
	movens	r3, r1
	sub	r1, 1
	ssw	r3, -10                         # 2-byte Folded Spill
	ldi	r4, 0
	cmp	r3, r4
	bgt	__LBB8_14
	br	__LBB8_13
__LBB8_14:                              # %land.lhs.true71
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r0, 1
	cmp	r2, r0
	blt	__LBB8_19
	br	__LBB8_15
__LBB8_15:                              # %if.then76
                                        #   in Loop: Header=BB8_6 Depth=1
	shl	r2, r4, 3
	add r4, r1, r5
	ldi	r6, TABLE_INDEX-8
	ldb	r5, r6, r5
	ldi	r6, 11
	cmp	r5, r6
	bhi	__LBB8_19
	br	__LBB8_16
__LBB8_16:                              # %if.then90
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r5, 6
	lsw	r6, -10                         # 2-byte Folded Reload
	cmp	r6, r5
	bhi	__LBB8_19
	br	__LBB8_17
__LBB8_17:                              # %if.then90
                                        #   in Loop: Header=BB8_6 Depth=1
	cmp	r2, r5
	bhi	__LBB8_19
	br	__LBB8_18
__LBB8_18:                              # %land.lhs.true100
                                        #   in Loop: Header=BB8_6 Depth=1
	add	r3, 1
	add r4, r3, r4
	ldi	r5, TABLE_INDEX+8
	ldb	r4, r5, r4
	ldi	r5, 255
	cmp	r4, r5
	beq	__LBB8_40
	br	__LBB8_22
__LBB8_22:                              # %if.then125.thread
                                        #   in Loop: Header=BB8_6 Depth=1
	movens	r2, r4
	sub	r4, 1
	and r4, r5, r4
	shl	r4, r4, 3
	add r4, r3, r4
	ldi	r5, TABLE_INDEX
	ldb	r4, r5, r4
	ldi	r5, 12
	cmp	r4, r5
	movens	r0, r6
	blo	__LBB8_25
	br	__LBB8_28
__LBB8_19:                              # %land.lhs.true115
                                        #   in Loop: Header=BB8_6 Depth=1
	add	r3, 1
	ldi	r4, 6
	lsw	r5, -10                         # 2-byte Folded Reload
	cmp	r5, r4
	ldi	r6, 0
	bhi	__LBB8_27
	br	__LBB8_20
__LBB8_13:                              # %if.end63.land.lhs.true115.thread_crit_edge
                                        #   in Loop: Header=BB8_6 Depth=1
	add	r3, 1
	ldi	r0, 1
	br	__LBB8_20
__LBB8_20:                              # %land.lhs.true120
                                        #   in Loop: Header=BB8_6 Depth=1
	cmp	r2, r0
	blt	__LBB8_26
	br	__LBB8_21
__LBB8_21:                              # %if.then125
                                        #   in Loop: Header=BB8_6 Depth=1
	movens	r2, r4
	sub	r4, 1
	ldi	r5, 255
	and r4, r5, r4
	shl	r4, r4, 3
	add r4, r3, r4
	ldi	r5, TABLE_INDEX
	ldb	r4, r5, r4
	ldi	r5, 12
	cmp	r4, r5
	blo	__LBB8_23
	br	__LBB8_26
__LBB8_23:                              # %if.then139
                                        #   in Loop: Header=BB8_6 Depth=1
	lsw	r4, -10                         # 2-byte Folded Reload
	cmp	r4, r0
	blt	__LBB8_34
	br	__LBB8_24
__LBB8_24:                              # %land.lhs.true144
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r4, 6
	cmp	r2, r4
	bhi	__LBB8_41
	br	__LBB8_25
__LBB8_25:                              # %land.lhs.true149
                                        #   in Loop: Header=BB8_6 Depth=1
	movens	r2, r4
	add	r4, 1
	ldi	r5, 255
	movens	r5, r6
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r1, r4
	ldi	r5, TABLE_INDEX
	ldb	r4, r5, r4
	cmp	r4, r6
	movens	r0, r6
	beq	__LBB8_40
	br	__LBB8_28
__LBB8_26:                              # %land.lhs.true164
                                        #   in Loop: Header=BB8_6 Depth=1
	lsw	r4, -10                         # 2-byte Folded Reload
	cmp	r4, r0
	movens	r0, r6
	blt	__LBB8_34
	br	__LBB8_27
__LBB8_27:                              # %land.lhs.true169
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r4, 6
	cmp	r2, r4
	bgt	__LBB8_33
	br	__LBB8_28
__LBB8_28:                              # %if.then174
                                        #   in Loop: Header=BB8_6 Depth=1
	shl	r2, r4, 3
	add r4, r1, r4
	ldi	r5, TABLE_INDEX+8
	ldb	r4, r5, r4
	ldi	r5, 11
	cmp	r4, r5
	bhi	__LBB8_33
	br	__LBB8_29
__LBB8_29:                              # %land.lhs.true188
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r0, checkerIsKing
	ldb	r4, r0, r4
	ldi	r0, 1
	ldi	r5, 0
	cmp	r4, r5
	beq	__LBB8_33
	br	__LBB8_30
__LBB8_30:                              # %if.then193
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r4, 0
	cmp	r6, r4
	beq	__LBB8_41
	br	__LBB8_31
__LBB8_31:                              # %land.lhs.true198
                                        #   in Loop: Header=BB8_6 Depth=1
	cmp	r2, r0
	blt	__LBB8_35
	br	__LBB8_32
__LBB8_32:                              # %land.lhs.true203
                                        #   in Loop: Header=BB8_6 Depth=1
	movens	r2, r4
	sub	r4, 1
	ldi	r5, 255
	movens	r5, r6
	and r4, r6, r4
	shl	r4, r4, 3
	add r4, r3, r4
	ldi	r5, TABLE_INDEX
	ldb	r4, r5, r4
	cmp	r4, r6
	beq	__LBB8_40
	br	__LBB8_35
__LBB8_33:                              # %land.lhs.true218
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r4, 0
	cmp	r6, r4
	beq	__LBB8_41
	br	__LBB8_34
__LBB8_34:                              # %land.lhs.true223
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r4, 6
	cmp	r2, r4
	bgt	__LBB8_41
	br	__LBB8_35
__LBB8_35:                              # %if.then228
                                        #   in Loop: Header=BB8_6 Depth=1
	shl	r2, r4, 3
	add r4, r3, r3
	ldi	r5, TABLE_INDEX+8
	ldb	r3, r5, r3
	ldi	r5, 11
	cmp	r3, r5
	bhi	__LBB8_41
	br	__LBB8_36
__LBB8_36:                              # %land.lhs.true243
                                        #   in Loop: Header=BB8_6 Depth=1
	lsw	r5, -10                         # 2-byte Folded Reload
	cmp	r5, r0
	blt	__LBB8_41
	br	__LBB8_37
__LBB8_37:                              # %land.lhs.true243
                                        #   in Loop: Header=BB8_6 Depth=1
	cmp	r2, r0
	blt	__LBB8_41
	br	__LBB8_38
__LBB8_38:                              # %land.lhs.true243
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r0, checkerIsKing
	ldb	r3, r0, r2
	ldi	r0, 1
	ldi	r3, 255
	and r2, r3, r2
	ldi	r3, 0
	cmp	r2, r3
	beq	__LBB8_41
	br	__LBB8_39
__LBB8_39:                              # %land.lhs.true258
                                        #   in Loop: Header=BB8_6 Depth=1
	add r4, r1, r1
	ldi	r2, TABLE_INDEX-8
	ldb	r1, r2, r1
	ldi	r2, 255
	cmp	r1, r2
	bne	__LBB8_41
	br	__LBB8_40
__LBB8_40:                              # %if.then273
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r1, score
	movens	r1, r2
	ldb	r2, r1
	sub	r1, 20
	stb	r2, r1
__LBB8_41:                              # %if.end277
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r1, packedStart
	ldb	r1, r2
	movens	r0, r1
	shr	r2, r0, 4
	ldi	r3, x1
	stb	r3, r0
	ldi	r3, 15
	movens	r3, r5
	and r2, r5, r2
	ldi	r3, y1
	stb	r3, r2
	ldi	r3, packedEnd
	ldb	r3, r4
	shr	r4, r6, 4
	ldi	r3, x2
	stb	r3, r6
	and r4, r5, r4
	ldi	r3, y2
	stb	r3, r4
	ssw	r4, -18                         # 2-byte Folded Spill
	shl	r4, r5, 3
	ssw	r6, -16                         # 2-byte Folded Spill
	add r5, r6, r5
	ldi	r3, TABLE_INDEX
	movens	r1, r4
	ldsb	r5, r3, r6
	ldi	r3, id
	stb	r3, r6
	ldi	r3, checkerX
	stb	r6, r3, r0
	ldi	r1, checkerY
	stb	r6, r1, r2
	shl	r2, r3, 3
	ssw	r0, -10                         # 2-byte Folded Spill
	add r3, r0, r3
	ldi	r0, TABLE_INDEX
	stb	r3, r0, r6
	ldi	r3, 255
	stb	r5, r0, r3
	lsw	r5, -14                         # 2-byte Folded Reload
	and r5, r4, r3
	ldi	r0, checkerIsKing
	stb	r6, r0, r3
	shra	r5, r0, 1
	ldi	r3, 0
	cmp	r0, r3
	ldi	r3, checkerX
	movens	r1, r4
	blt	__LBB8_43
	br	__LBB8_42
__LBB8_42:                              # %if.then.i
                                        #   in Loop: Header=BB8_6 Depth=1
	lsw	r1, -18                         # 2-byte Folded Reload
	add r1, r2, r2
	shr	r2, r2, 1
	ldi	r1, midY
	stb	r1, r2
	lsw	r1, -10                         # 2-byte Folded Reload
	lsw	r5, -16                         # 2-byte Folded Reload
	add r5, r1, r1
	shr	r1, r1, 1
	ldi	r6, midX
	stb	r6, r1
	ldi	r6, checkerIsAlive
	ldi	r5, 1
	stb	r0, r6, r5
	stb	r0, r3, r1
	stb	r0, r4, r2
	shl	r2, r2, 3
	add r2, r1, r1
	ldi	r2, TABLE_INDEX
	stb	r1, r2, r0
__LBB8_43:                              # %undoMove.exit
                                        #   in Loop: Header=BB8_6 Depth=1
	ldi	r0, score
	ldsb	r0, r0
	ldi	r1, bestScore
	ldsb	r1, r1
	cmp	r0, r1
	ldi	r5, moves+3
	lsw	r2, -12                         # 2-byte Folded Reload
	ble	__LBB8_45
	br	__LBB8_44
__LBB8_4:                               # %for.cond.cleanup.loopexit
	ldi	r0, bestMoveId
	ldsb	r0, r0
	shl	r0, r1, 2
	ldi	r4, 1
__LBB8_5:                               # %for.cond.cleanup
	ldi	r0, moves
	ldb	r1, r0, r0
	ldi	r2, -97
	movens	r2, r6
	add r0, r6, r0
	ldi	r2, x1
	stb	r2, r0
	ldi	r2, moves+1
	ldb	r1, r2, r2
	sub	r2, 49
	ldi	r3, y1
	stb	r3, r2
	ldi	r3, moves+2
	ldb	r1, r3, r3
	add r3, r6, r3
	ldi	r6, x2
	stb	r6, r3
	ldi	r6, 15
	and r2, r6, r2
	shl	r0, r0, 4
	or r2, r0, r0
	ldb	r1, r5, r1
	ldi	r2, packedStart
	stb	r2, r0
	sub	r1, 49
	ldi	r2, y2
	stb	r2, r1
	and r1, r6, r1
	shl	r3, r2, 4
	or r1, r2, r1
	ldi	r2, packedEnd
	stb	r2, r1
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
	bgt	__LBB8_46
	br	__LBB8_49
__LBB8_46:                              # %if.then318
	ldi	r1, 11
	cmp	r0, r1
	bhi	__LBB8_48
# %bb.47:                               # %if.then318
	ldi	r4, 0
__LBB8_48:                              # %if.then318
	ldi	r0, countCapture
	ldb	r4, r0, r1
	sub	r1, 1
	stb	r4, r0, r1
__LBB8_49:                              # %if.end324
	ldi	r0, packedEnd
	ldsb	r0, r1
	ldi	r0, packedStart
	ldsb	r0, r0
	jsr	updateLines
__LBB8_50:                              # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
	pop	fp
	rts
__LBB8_1:                               # %if.then
    jsr checkSituation
	br	__LBB8_50
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
	blt	__LBB9_4
	br	__LBB9_1
__LBB9_1:                               # %if.then
	ldi	r0, 1
	ldi	r3, 11
	cmp	r2, r3
	bhi	__LBB9_3
# %bb.2:                                # %if.then
	movens	r1, r0
__LBB9_3:                               # %if.then
	ldi	r1, countCapture
	ldb	r0, r1, r2
	sub	r2, 1
	stb	r0, r1, r2
__LBB9_4:                               # %if.end
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
	br	__LBB18_1
__LBB18_1:                              # %while.body
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
	bne	__LBB18_8
	br	__LBB18_2
__LBB18_2:                              # %if.then
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB18_3
__LBB18_3:                              # %while.cond2
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r0, canContinueCapture
	ldb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB18_7
	br	__LBB18_4
__LBB18_4:                              # %while.body3
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
	beq	__LBB18_6
	br	__LBB18_5
__LBB18_5:                              # %if.then5
                                        #   in Loop: Header=BB18_3 Depth=2
#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА ИГРОКА
    ldi r6, CONTINUEP
    ldw r6,r6
    ldi r6,0
#ФЛАГ ПРОДОЛЖЕНИЕ ХОДА ИГРОКА
	br	__LBB18_6
__LBB18_6:                              # %if.end
                                        #   in Loop: Header=BB18_3 Depth=2
	br	__LBB18_3
__LBB18_7:                              # %while.end
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r1, GAMEMODE
	ldi	r0, 1
	stb	r1, r0
	br	__LBB18_18
__LBB18_8:                              # %if.else
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB18_9
__LBB18_9:                              # %while.cond6
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r0, canContinueCapture
	ldb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB18_17
	br	__LBB18_10
__LBB18_10:                             # %while.body8
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
	beq	__LBB18_12
	br	__LBB18_11
__LBB18_11:                             # %if.then10
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
	br	__LBB18_16
__LBB18_12:                             # %if.else11
                                        #   in Loop: Header=BB18_9 Depth=2
	jsr	hasAllCapture
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB18_14
	br	__LBB18_13
__LBB18_13:                             # %if.then13
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
	br	__LBB18_15
__LBB18_14:                             # %if.else14
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
	br	__LBB18_15
__LBB18_15:                             # %if.end15
                                        #   in Loop: Header=BB18_9 Depth=2
	br	__LBB18_16
__LBB18_16:                             # %if.end16
                                        #   in Loop: Header=BB18_9 Depth=2
	br	__LBB18_9
__LBB18_17:                             # %while.end17
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r1, GAMEMODE
	ldi	r0, 0
	stb	r1, r0
	br	__LBB18_18
__LBB18_18:                             # %if.end18
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r0, countCapture
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB18_20
	br	__LBB18_19
__LBB18_19:     
#ФЛАГ ПОРАЖЕНИЯ
    ldi r6, LOSE
    ldw r6,r6
#ФЛАГ ПОРАЖЕНИЯ                        # %if.then22
	br	__LBB18_23
__LBB18_20:                             # %if.end23
                                        #   in Loop: Header=BB18_1 Depth=1
	ldi	r0, countCapture+1
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB18_22
	br	__LBB18_21
__LBB18_21:     
#ФЛАГ ПОБЕДЫ
    ldi r6, WIN
    ldw r6,r6
#ФЛАГ ПОБЕДЫ                        # %if.then27
	br	__LBB18_23
__LBB18_22:                             # %if.end28
                                        #   in Loop: Header=BB18_1 Depth=1
	br	__LBB18_1
__LBB18_23:                             # %while.end29
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

cntLine>                                # @cntLine
	db	0                               # 0x0

swift>                                  # @swift
	db	0                               # 0x0

checkersLine>                           # @checkersLine
	ds	4

LINES>                                  # @LINES
	ds	6

moves>                                  # @moves
	ds	64

moveCount>                              # @moveCount
	db	0                               # 0x0

bestScore>                              # @bestScore
	db	0                               # 0x0

bestMoveId>                             # @bestMoveId
	db	0                               # 0x0

score>                                  # @score
	db	0                               # 0x0

packedStart>                            # @packedStart
	db	0                               # 0x0

packedEnd>                              # @packedEnd
	db	0                               # 0x0

inf>                                    # @inf
	db	0                               # 0x0

cap>                                    # @cap
	db	0                               # 0x0

end.
