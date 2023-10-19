include emu8086.inc
.MODEL LARGE
.STACK 1000H
.data
head DB '                            ---- ECAT TEST ----$'
M2 DB 'Enter your Choise $'

M3 DB '            **                 1.start test              **$' 
M4 DB '            **                 2.check result            **$'
M5 DB '            **                 3.Exit                    **$'
M7 DB '            **                 1.ICS                     **$' 
M6 DB '            **                 2.PreEngineering          **$' 

;INVALID
M55 DB '***&&INVALID ENTRY&&***$'
M56 DB '      ***&&Try Again&&***$'

M60 DB '1.Go Back to Main Menu$'
M61 DB '2.EXIT$' 


MR2 DB '            ***********************************************$'


SEJ DB 10,13,10,13,' $'  
correct db '0'
wrong db '0'

;mcqs of the test
q1 db '1. One light year is equal to:$'
o1 db '1) 9 x 10^12m  2) 6 x 10^12  3) 9.5 x 10^13m   4) None$'

q2 db '2. Reverse process of vector addition?$'
o2 db '1) Addition  2) Subtraction  3) multiplication  4) None$'  

q3 db '3.1 Cal = ___________ j$'
o3 db '1) 418       2) 400   3) 10        4) 4.18$'   

q4 db '4. If a body of 2kg moves vertically 2m then work done is:$'
o4 db '1)-39.2 j      2) 20 j       3) 45 j      4) 35 j$'

q5 db '5. The range of visible wavelength spectrum is:$'
o5 db '1) 400-750      2) 100-400   3) 400-1000      4) 300-600$' 

q6 db '6. Meaning of tremendous $'
o6 db '1) Wonderful     2) sad   3) working     4) mountain$'

q7 db '7. C is a language $'
o7 db '1) High level     2) low level   3) Assembly     4) none$'

q8 db '8. Library file is also known as  $'
o8 db '1) Header file    2) program file   3) All of these     4) none$'

q9 db '9. Extension of C++ program is  $'
o9 db '1) .cpp   2) .txt   3) .exe     4) none$'

q0 db '10.  Antonym of pros $'
o0 db '1) con   2) advantage   3) benefits     4) none$' 

q71 db '7. which of the following is formed by the contact processes $'
o71 db '1) sulphraic acid    2) nitric acid   3) benzene    4) none$'

q81 db '8. king of acid is known as  $'
o81 db '1) hydro acid    2) sulphraic acid   3) nitric acid     4) none$'

q91 db '9. branch of chemistry deals with hydrocarbons  $'
o91 db '1) organic   2) inorganic   3) hydro chemistry     4) none$'




;student data    variables

var1 db 50 dup(?) 
var2 db 50 dup(?)     



.code
main proc
    mov ax,@data 
    mov  ds,ax 
    mov ax,0
    
    call getdata 
    top:
    
    mov ax, 3   ;clear screen
    int 10h   
    
    call newline
    
    lea dx,head
    mov ah,09h
    int 21h     ;welcome 
    
    call newline
    call newline
    
     LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H  
   call newline
    
    ;menu
    LEA DX,M3
    MOV AH,9
    INT 21H 
  call newline
    
    LEA DX,M4
    MOV AH,9        ;menu
    INT 21H 
   call newline 
    
    LEA DX,M5
    MOV AH,9
    INT 21H  
  call newline
    
     
    LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H  
  call newline 
    
    print 'Enter your choice : '
    mov ah,01
    int 21h
    mov bl,al    ;get choice
    sub bl,48
    
    cmp bl,1
    je starttest     
    
      cmp bl,2
    je result 
    
    cmp bl,3
    je last
    
    jmp error
    
    
     
    
    
    
    
    
    
    
    
    
    
    ;-----------------------------------------------------------start test---------------------------------------
    starttest:  
    mov ax, 3   ;clear screen
    int 10h  
    
    lea dx,head
    mov ah,09h
    int 21h     ;welcome
   call newline
    LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H   
    call newline
    
     LEA DX,M7
    MOV AH,9        ;menu
    INT 21H 
    call newline   
    
     LEA DX,M6
    MOV AH,9        ;menu
    INT 21H 
    call newline
    
      LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H 
     call newline  
    
    print 'Enter your choice : '
    mov ah,01
    int 21h
    mov bl,al    ;get choice
    sub bl,48
    
    cmp bl,1
    je ics  
    cmp bl,2
    je engineering 
    jmp error
    
    ;---------------------ics
    
    ics:
    
     mov ax, 3   ;clear screen
    int 10h 
    
      lea dx,head
    mov ah,09h
    int 21h     ;welcome
     call newline   
    
    LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H   
     call newline  
    
    print 'Instructions'
   call newline
    
    print '   This test contain 10 MCQS'
    call newline
    
    print '   Test has Negative marking'
   call newline
    
      LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H 
   call newline
    
    print 'Press any Number to start test'
    
    mov ah,01
    int 21h 
    
    mov correct,0
    mov wrong,0                          
    
    mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
    print '      test started '          ;   
    call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
      call newline                             ;
                                         ;
         LEA DX,q1 ;question             ;
    MOV AH,9
    INT 21H                              ;
    call newline                              ;
                                         ;
          LEA DX,o1 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
    call newline                              ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H  
    call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,3                             ;
    je c1                                ;
    inc wrong                            ;
    jmp end1                             ;
    c1:                                  ;
    inc correct                            ;
    end1:                 
    
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
    call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
  call newline                            ;
                                         ;
         LEA DX,q2 ;question             ;
    MOV AH,9
    INT 21H                              ;
   call newline                             ;
                                         ;
          LEA DX,o2 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
  call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
      call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c2                                ;
    inc wrong                            ;
    jmp end2                             ;
    c2:                                  ;
    inc correct                            ;
    end2:                              
    
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
     call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
    call newline                            ;
                                         ;
         LEA DX,q3 ;question             ;
    MOV AH,9
    INT 21H                              ;
  call newline                           ;
                                         ;
          LEA DX,o3 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
    call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
      call newline                          ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,1                             ;
    je c3                                ;
    inc wrong                            ;
    jmp end3                             ;
    c3:                                  ;
    inc correct                            ;
    end3:
    
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
     call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
     call newline                            ;
                                         ;
         LEA DX,q4 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 4
   call newline                             ;
                                         ;
          LEA DX,o4 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
    call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
      call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c4                                ;
    inc wrong                            ;
    jmp end4                             ;
    c4:                                  ;
    inc correct                            ;
    end4:   
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
     call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
       call newline                            ;
                                         ;
         LEA DX,q5 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 5
      call newline                            ;
                                         ;
          LEA DX,o5 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
                                         ;
  call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
    call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,2                             ;
    je c5                                ;
    inc wrong                            ;
    jmp end5                             ;
    c5:                                  ;
    inc correct                            ;
    end5:     
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
   call newline                           ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
    call newline                             ;
                                         ;
         LEA DX,q6 ;question             ;
    MOV AH,9
    INT 21H                              ;
       call newline                            ;
                                         ;
          LEA DX,o6 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
                                         ;
    call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
     call newline                             ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,1                             ;
    je c6                                ;
    inc wrong                            ;
    jmp end6                             ;
    c6:                                  ;
    inc correct                            ;
    end6:  
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
     call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
      call newline                             ;
                                         ;
         LEA DX,q7 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 7
       call newline                           ;
                                         ;
          LEA DX,o7 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
    call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
     call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c7                                ;
    inc wrong                            ;
    jmp end7                             ;
    c7:                                  ;
    inc correct                            ;
    end7:
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
       call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
        call newline                             ;
                                         ;
         LEA DX,q8 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 8
        call newline                             ;
                                         ;
          LEA DX,o8 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
        call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
     call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,1                             ;
    je c8                                ;
    inc wrong                            ;
    jmp end8                             ;
    c8:                                  ;
    inc correct                            ;
    end8:  
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
      call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
      call newline                             ;
                                         ;
         LEA DX,q9 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 9
        call newline                             ;
                                         ;
          LEA DX,o9 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
        call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
      call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,1                             ;
    je c9                                ;
    inc wrong                            ;
    jmp end9                             ;
    c9:                                  ;
    inc correct                            ;
    end9:
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
       call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
       call newline                            ;
                                         ;
         LEA DX,q0 ;question             ;
    MOV AH,9
    INT 21H                              ;
         call newline                             ;
                                         ;
          LEA DX,o0 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
       call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
                                          ;
        LEA DX,SEJ ;NEWLINE              ;
    MOV AH,9                             ;
    INT 21H                             ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c10                                ;
    inc wrong                            ;
    jmp end10                             ;
    c10:                                  ;
    inc correct                            ;
    end10:
    
    
       mov ax, 3   ;clear screen           
    int 10h    
       call newline
    
    print 'congrulation you have completed the Test'
    jmp top
    
    
    
    
    
     engineering:
    
     mov ax, 3   ;clear screen
    int 10h 
    
      lea dx,head
    mov ah,09h
    int 21h     ;welcome
    
  call newline
    LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H   
    
    call newline  
    
    print 'Instructions'
    
   call newline
    
    print '   This test contain 10 MCQS'
    
    call newline
    
    print '   Test has Negative marking'
    
      call newline
    
      LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H 
    
       call newline
    
    print 'Press any Number to start test'
    
    mov ah,01
    int 21h 
    
    mov correct,0
    mov wrong,0                          
    
    mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
    print '      test started '          ;   
     call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
    call newline                            ;
                                         ;
         LEA DX,q1 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 1
       call newline                             ;
                                         ;
          LEA DX,o1 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
        call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H  
    
       call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,3                             ;
    je c11                                ;
    inc wrong                            ;
    jmp end11                             ;
    c11:                                  ;
    inc correct                            ;
    end11:                 
    
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
            ;   
                                         ;
       call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
                                         ;
       call newline                             ;
                                         ;
         LEA DX,q2 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 2
         call newline                             ;
                                         ;
          LEA DX,o2 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
      call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
 call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c21                                ;
    inc wrong                            ;
    jmp end21                             ;
    c21:                                  ;
    inc correct                            ;
    end21:                              
    
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
     call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
       call newline                             ;
                                         ;
         LEA DX,q3 ;question             ;
    MOV AH,9
    INT 21H                              ;
       call newline                            ;
                                         ;
          LEA DX,o3 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
       call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
       call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c31                                ;
    inc wrong                            ;
    jmp end31                             ;
    c31:                                  ;
    inc correct                            ;
    end31:
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
      call newline                              ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
   call newline                            ;
                                         ;
         LEA DX,q4 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 4
    call newline                            ;
                                         ;
          LEA DX,o4 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
 call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
  call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c41                                ;
    inc wrong                            ;
    jmp end41                             ;
    c41:                                  ;
    inc correct                            ;
    end41:   
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
                                         ; 
    call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
 call newline                           ;
                                         ;
         LEA DX,q5 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 5
    call newline                            ;
                                         ;
          LEA DX,o5 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
     call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    call newline                           ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c51                                ;
    inc wrong                            ;
    jmp end51                             ;
    c51:                                  ;
    inc correct                            ;
    end51:     
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
      call newline                             ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
      call newline                             ;
                                         ;
         LEA DX,q6 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 6
 call newline                            ;
                                         ;
          LEA DX,o6 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
 call newline                           ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c61                                ;
    inc wrong                            ;
    jmp end61                             ;
    c61:                                  ;
    inc correct                            ;
    end61:  
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
   call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
    call newline                            ;
                                         ;
         LEA DX,q71 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 7
     call newline                              ;
                                         ;
          LEA DX,o71 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
   call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
     call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c71                                ;
    inc wrong                            ;
    jmp end71                             ;
    c71:                                  ;
    inc correct                            ;
    end71:
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
      call newline                              ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
     call newline                             ;
                                         ;
         LEA DX,q81 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 8
     call newline                             ;
                                         ;
          LEA DX,o81 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
    call newline                             ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
 call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c81                                ;
    inc wrong                            ;
    jmp end81                             ;
    c81:                                  ;
    inc correct                            ;
    end81:  
    
    
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
 call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
      call newline                            ;
                                         ;
         LEA DX,q91 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 9
         call newline                           ;
                                         ;
          LEA DX,o91 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
        call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
      call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c91                                ;
    inc wrong                            ;
    jmp end91                             ;
    c91:                                  ;
    inc correct                            ;
    end91:
    
     mov ax, 3   ;clear screen            ;
    int 10h                              ; 
 call newline                            ;
                                         ;
        LEA DX,MR2                       ;
    MOV AH,9    ;start border            ;
    INT 21H                              ;
     call newline                              ;
                                         ;
         LEA DX,q0 ;question             ;
    MOV AH,9
    INT 21H                              ;
                                         ;  question 10
       call newline                             ;
                                         ;
          LEA DX,o0 ;question            ;
    MOV AH,9                             ;
    INT 21H                              ;
                                         ;
 call newline                            ;
                                         ;
          LEA DX,MR2                     ;
    MOV AH,9    ;start border            ;
    INT 21H 
    
        call newline                            ;
                                         ;
    print 'enter your answer'            ;
    mov ah,01                            ;
    int 21h                              ;
    mov bl,al                            ;
    sub bl,48                            ;
    cmp bl,4                             ;
    je c101                              ;
    inc wrong                            ;
    jmp end101                           ;
    c101:                                ;
    inc correct                          ;
    end101:
    
    
       mov ax, 3   ;clear screen           
    int 10h    
       call newline
    
    print 'congrulation you have completed the Test'
    jmp top                           
               
                              
               
    
    
    
    
     ;--------------------------------------------------------------result calculation---------------------------------
     
     
    
        result:
          mov ax, 3   ;clear screen            
    int 10h                               
    call newline                             
                                         
        LEA DX,MR2                       
    MOV AH,9    ;start border            
    INT 21H                              
     call newline
    
    print 'Student Name : '
    
   
    
    
      lea bx,var1
      
       mov cx,15
      bbbc:    
      mov dl,[bx] 
     
      mov ah,2h
      int 21h
      add bx,2 
      loop bbbc  
      call newline
    
        print 'Student Roll : '
    

    
    
      lea bx,var2
      
      mov cx,15
      bbbb:    
      mov dl,[bx] 
     
      mov ah,2h
      int 21h
      add bx,2 
      loop bbbb  
    call newline
    
    
    
    print 'total marks : 10' 
    call newline
    
    print 'obtain marks : ' 
    mov ah,0
    mov al,correct 
    call print_num
     
    call newline
    
    print 'wrong questions : ' 
     mov ah,0
    mov al,wrong 
    call print_num 
    call newline
    
     print 'Final marks : ' 
     mov ah,0              
     mov al,correct
     sub al,wrong   
     cmp al,5
     js zero
    call print_num  
    zero:
    print '0'
   call newline
    
           LEA DX,MR2                       
    MOV AH,9    ;start border            
    INT 21H 
     call newline
     print 'press any key to return to main menu '
     mov ah,1
     int 21h
     jmp top
 
     jmp last

    
    
     error: 
     print 'wrong input please try again '
     jmp top

    
      last: 
      mov ax,4C00h
      int 21h
      main endp 
    
       
     ;functions 
     
     getdata proc                           ;get name
        
        
          lea dx,head
    mov ah,09h
    int 21h     ;welcome 
    
    call newline
     call newline
    
     LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H  
    call newline  
    
    print 'Enter your Name : '
    
        
         lea bx,var1
    aa:
    mov ah,1
    int 21h
    cmp al,13
    je last1
    mov [bx],al
    add bx,2
    jmp aa 
    last1:
    print 10
    print 13
    print 'Enter your Roll number : '  
    
       
         lea bx,var2
    aa2:
    mov ah,1
    int 21h
    cmp al,13
    je last12
    mov [bx],al
    add bx,2
    jmp aa2 
    last12:
    print 10
    print 13  
    
     LEA DX,MR2
    MOV AH,9    ;start border
    INT 21H 
    
    ret
     
    getdata endp
     
     
     
     newline proc
        print 10
        print 13
        ret
        newline endp
    
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
end main