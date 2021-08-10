;Breno Lima e Matheus Carvalho
%include "io.inc"
section .data
casasP dd 36,32,4,28,20,16,28; casas pega disco
casasC dd 0,12,16,0,24,4,8; casas coloca disco
topo1 dd 36
topo2 dd 24
topo3 dd 12
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;Aqui fica o ebp
    push 0;casa3 -4
    push 0;casa2 -8
    push 0;topo torre3,casa 1 -12
    push 0;casa3 -16
    push 0;casa2 -20
    push 0;topo torre2,casa 1 -24
    push 3;casa 3 -28
    push 2;casa2  -32
    push 1;topo torre1, casa 1 -36
    
   mov edx,0;contador de movimentos
   while:
   mov esp, ebp
   sub esp,[casasP+4*edx]
   mov eax,[esp]
   add esp,4; para o push ser na casa certa, pois o push pula uma casa e depois sobrescreve 
   push 0; o push decrementa 4 e depois sobrescreve
   
   mov esp, ebp
   sub esp,[casasC+4*edx]
   push eax
   
   inc edx
    mov esp, ebp    
    sub esp,36; topo da pilha
    mov ecx,3; quantidade de casas, de uma torre  
    mov ebx, esp; pois se usar o esp para percorrer ele vai sobrescrever a pilha pois é usado nas instrucoes
    PRINT_DEC 4,edx
    PRINT_STRING " MOVIMENTO"
    NEWLINE
    PRINT_STRING "Primeira Torre:"
    print1:   
    PRINT_DEC 4,[ebx] ;;;;;
    add ebx,4;;;;
    loop print1
    NEWLINE
    
    mov ecx,3
    PRINT_STRING "Segunda Torre:"
    print2:   
    PRINT_DEC 4,[ebx] ;;;;
    add ebx,4;;;;
    loop print2
    NEWLINE
    
    mov ecx,3
    PRINT_STRING "Terceira Torre:"
    print3:   
    PRINT_DEC 4,[ebx] ;;;;
    add ebx,4;;;;
    loop print3
    NEWLINE
    cmp edx,7
    jne while
   
    
    mov esp,ebp
    xor eax, eax
    ret