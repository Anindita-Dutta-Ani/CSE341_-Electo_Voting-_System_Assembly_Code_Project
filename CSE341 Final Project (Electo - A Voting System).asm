org 100h
include "emu8086.inc"  ; Include emu8086 specific functions
define_pthis           ; Define print this function
define_print_num       ; Define print number function
define_print_num_uns   ; Define print unsigned number function
define_scan_num        ; Define scan number function
define_clear_screen    ; Define clear screen function

.data
array1 dw 101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130
array2 dw 201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220
array3 dw 301,302,303,304,305

cnt1 db 0       
cnt2 db 0      
cnt3 db 0       
tot db 0        
numr1 db 0      
numr2 db 0      
numr3 db 0      
lrgt db 0       

.code
mov ax, @data
mov ds, ax

main:
    call clear_screen
    call pthis     
    db "Electo Finale Round Voting",0  
    printn ""
    printn "" 
            
    call pthis
    db 10,13,"1.Spectator 2.OtherContestant 3.Judges 4.Admin",0
    printn ""
    call scan_num
    mov al, cl  
    
    cmp al, 1
    je s1
    cmp al, 2
    je s2
    cmp al, 3
    je s3
    cmp al, 4
    je s4
    call pthis
    db 10,13,"Invalid choice",0
    jmp main

; Spectator Section
s1:
    call clear_screen
    call pthis     
    db "Enter Your Login",0
    printn ""
    call scan_num
    mov al, cl
    mov cl, 30
    lea si, array1

L1:
    cmp al, [si]  ; Compare login input with the list
    je check1      ; If valid, jump to check1
    add si, 2      ; Move to next login in array
    dec cl
    jnz L1
    call pthis
    db 10,13,"Invalid user",0
    jmp main

; Other Contestant Section
s2:
    call clear_screen
    call pthis     
    db "Enter Your Login",0
    printn ""
    call scan_num
    mov al, cl
    mov cl, 20
    lea si, array2

L2:
    cmp al, [si]  
    je check2      
    add si, 2      
    dec cl
    jnz L2
    call pthis
    db 10,13,"Invalid user",0
    jmp main

; Judges Section
s3:
    call clear_screen
    call pthis     
    db "Enter Your Login",0
    printn ""
    call scan_num
    cmp cl, 0
    je exit         ; Exit if invalid login (0)
    mov al, cl
    mov cl, 5
    lea si, array3

L3:
    cmp al, [si]   
    je check3      
    add si, 2      
    dec cl
    jnz L3
    call pthis
    db 10,13,"Invalid user",0
    jmp main

exit:
    call pthis
    db 10,13,"Invalid user",0
    jmp s3

check1:  ; Valid Audience User
    inc numr1       
    call pthis
    db 10,13,"Valid user/Audience",0
    call clear_screen
    jmp vote1 

check2:  ; Valid Contestant User
    inc numr2       
    call pthis
    db 10,13,"Valid user/Contestant",0
    call clear_screen   
    jmp vote2

check3:  ; Valid Judge User
    inc numr3       
    call pthis
    db 10,13,"Valid user/Judge",0
    call clear_screen        
    jmp vote3

vote1:   ; Vote for Contestant as Audience
    mov [si], 0 
    call pthis
    db 10,13,"Vote for the Contestant",0
    printn
    printn
    call pthis
    db 10,10,13,"1. Con1  2. Con2  3. Con3",0
    printn      
    call scan_num
    cmp cl, 1
    je c1 
    cmp cl, 2
    je c2
    cmp cl, 3
    je c3
    printn
    call pthis
    db 10,13,"Invalid option",0
    printn
    jmp vote1

vote2:   ; Vote for Contestant as Other Contestant
    mov [si], 0  
    call pthis
    db 10,13,"Vote for the Contestant",0
    printn
    printn
    call pthis
    db 10,10,13,"1. Con1  2. Con2  3. Con3",0
    printn      
    call scan_num
    cmp cl, 1
    je c1 
    cmp cl, 2
    je c2
    cmp cl, 3
    je c3
    printn
    call pthis
    db 10,13,"Invalid option",0
    printn
    jmp vote2

vote3:   ; Vote for Contestant as Judge
    mov [si], 0 
    call pthis
    db 10,13,"Vote for the Contestant",0
    printn    
    printn
    call pthis
    db 10,10,13,"1. Con1  2. Con2  3. Con3",0
    printn      
    call scan_num
    cmp cl, 1
    je c1 
    cmp cl, 2
    je c2
    cmp cl, 3
    je c3
    printn
    call pthis
    db 10,13,"Invalid option",0
    printn
    jmp vote3

c1:   ; Contestant 1 Vote
    printn ""
    inc byte ptr [cnt1]  
    inc byte ptr [tot]   
    jmp main

c2:   ; Contestant 2 Vote
    printn "" 
    inc byte ptr [cnt2]  
    inc byte ptr [tot]    
    jmp main

c3:   ; Contestant 3 Vote
    printn ""
    inc byte ptr [cnt3] 
    inc byte ptr [tot]   
    jmp main

s4:   ; Admin Section
    call clear_screen
    call pthis     
    db "Enter Password",0
    printn ""
    call scan_num 
    mov al, cl
    cmp al, 10
    jnz exitadmin
    printn ""

s6:   ; Admin Menu
    call clear_screen
    call pthis
    db 10,13,"1. Summary 2. Check_Proceed 3.Back",0
    printn ""
    call scan_num 
    cmp cl, 1
    je s5
    cmp cl, 2                                                     
    je find 
    cmp cl,3
    je main
    db 10,13,"Invalid choice",0
    jmp s4

exitadmin:  ; Admin Exit
    printn ""
    call pthis     
    db "Incorrect Admin Login Password.Try Again",0
    jmp main

s5:   ; Admin Summary
    call clear_screen
    call pthis
    db 10,13,"Summary",0
    printn ""
    call pthis
    db 10,10,13,"Individual votes",0
    printn ""

    ; Display individual votes for each contestant
    call pthis
    db 10,13,"Con1",0 
    call pthis  
    db 10,13,"Votes:",0 
    mov al, cnt1        
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h

    call pthis
    db 10,13,"Con2",0   
    call pthis  
    db 10,13,"Votes:",0 
    mov al, cnt2        
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h

    call pthis
    db 10,13,"Con3",0 
    call pthis 
    db 10,13,"Votes:",0 
    mov al, cnt3        
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h

    printn "" 
    call pthis
    db 10,13,"Audience",0  
    call pthis 
    db 10,13,"Votes:",0 
    mov al, numr1       
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h

    printn "" 
    call pthis
    db 10,13,"Other Contestants",0  
    call pthis 
    db 10,13,"Votes:",0 
    mov al, numr2       
    add al, 48         
    mov dl, al 
    mov ah, 02 
    int 21h

    printn "" 
    call pthis
    db 10,13,"Judges",0  
    call pthis 
    db 10,13,"Votes:",0 
    mov al, numr3       
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h 

    printn ""
    call pthis
    db "Total votes received:",0
    mov al, tot         
    add al, 48          
    mov dl, al 
    mov ah, 02 
    int 21h

delay:  
    mov cx, 500
f1:                                                      
    dec cx
    jnz f1
    jmp s6

find:   ; Determine Winner
    mov al, cnt1
    mov ah, cnt2
    cmp al, ah
    jge skip_check2
    mov al, cnt2
    mov dl, al ; Store the largest vote count
skip_check2:
    mov al, cnt3
    cmp dl, al
    jge skip_check3
    mov dl, al ; Store the largest vote count (final winner)
skip_check3:

    ; Display the winner based on the highest vote count
    call result

result:   ; Display the Result
    cmp dl, cnt1
    jz cont1

    cmp dl, cnt2
    jz cont2

    cmp dl, cnt3
    jz cont3

cont1:   ; Contestant 1 Wins
    call clear_screen
    call pthis
    db 10,13,"Election Winner :: Contestant 1",0
    call pthis
    db 10,13,"Votes:",0
    mov al, cnt1
    add al, 48
    mov dl, al
    mov ah, 02
    int 21h
    jmp delay

cont2:   ; Contestant 2 Wins     
    call clear_screen
    call pthis
    db 10,10,13,"Election Winner :: Contestant 2",0
    call pthis
    db 10,13,"Votes:",0
    mov al, cnt2
    add al, 48
    mov dl, al
    mov ah, 02
    int 21h
    jmp delay

cont3:   ; Contestant 3 Wins
    call clear_screen
    call pthis
    db "Election Winner :: Contestant 3",0 
    call pthis
    db 10,13,"Votes:",0
    mov al, cnt3
    add al, 48
    mov dl, al
    mov ah, 02
    int 21h
    jmp delay
