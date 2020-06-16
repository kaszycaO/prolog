:- use_module(library(clpfd)).
odcinek(List):-
    [R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16] ins 0..1, 
    R1+R9 #= 1,
    R2+R10 #= 1,
    R3+R11 #= 1,
    R4+R12 #= 1,
    R5+R13 #= 1,
    R6+R14 #= 1,
    R7+R15 #= 1,
    R8+R16 #= 1,

        DR1 #= R1,
    DR2 #= R2 - R1,
    DR3 #= R3 - R2,
    DR4 #= R4 - R3,
    DR5 #= R5 - R4,
    DR6 #= R6 - R5,
    DR7 #= R7 - R6,
    DR8 #= R8 - R7,
    DR9 #= 1 - R8,

    sum([DR1,DR2,DR3,DR4,DR5,DR6,DR7,DR8,DR9],#=,1),
    DR1 #= -1,
    DR2 #= -1,
    DR3 #= -1,
    DR4 #= -1,
    DR5 #= -1,
    DR6 #= -1,
    DR7 #= -1,
    DR8 #= -1,
    DR9 #= -1,

    List = [R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16].
