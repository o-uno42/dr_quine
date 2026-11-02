# Cos'è un Quine?
Un Quine è un programma che, quando viene eseguito, stampa a schermo il suo esatto codice sorgente, senza ricevere alcun input esterno (quindi non vale barare aprendo il file .c e leggendolo!).

Se ci pensi, sembra un paradosso. Se il programma deve stampare se stesso, dovrà contenere l'istruzione printf("qualcosa"). Ma allora dovrà stampare anche quel printf, il che significa che dentro quel printf ci deve essere un altro printf... un loop infinito.

### Il Trucco: La formula di Von Neumann
Per uscire da questo loop, ogni Quine si divide sempre in due parti:

1. Il codice attivo: La parte che esegue le istruzioni (le printf).

2. I dati passivi: Una stringa che contiene una copia del codice stesso.

Il segreto sta nell'usare lo specificatore di formato %s e il carattere speciale delle virgolette (%c con valore ASCII 34). Il programma usa la stringa di dati due volte: prima la stampa come testo normale, e poi la ristampa inserendola dentro le virgolette per ricreare la stringa stessa.

Ecco perché si studia e a cosa serve:

### 1. Fondamenti Teorici: Il Teorema di Ricorsione di Kleene
I Quine non sono nati come sfida di programmazione, ma come concetto matematico. Dimostrano nella pratica il Teorema di ricorsione di Kleene (e i lavori di Alan Turing e Kurt Gödel).
In informatica teorica, questo teorema dimostra che qualsiasi algoritmo computabile può operare su una copia di se stesso. I Quine sono la prova empirica che un software può possedere una completa "autoconsapevolezza" del proprio codice senza entrare in un loop infinito.

### 2. Compilatori e "Bootstrapping" (Il self-hosting)
Questo è l'utilizzo pratico più importante in assoluto. Come si scrive il compilatore di un nuovo linguaggio di programmazione?
Se inventi il linguaggio "X", all'inizio scriverai il compilatore usando il C. Ma l'obiettivo finale è fare in modo che il compilatore del linguaggio X sia scritto in linguaggio X. Questo processo si chiama Bootstrapping.

Un compilatore self-hosting è, di fatto, un gigantesco Quine: è un programma che prende come input del codice sorgente (il suo stesso codice) e genera come output un eseguibile identico a se stesso. Studiare i Quine ti fa capire come i linguaggi di programmazione creano se stessi.

### 3. Sicurezza Informatica: Malware e Vulnerabilità
Nel mondo reale, i Quine condividono la stessa logica di funzionamento di alcune minacce informatiche:

I Worm e i Virus auto-replicanti: Un virus che si diffonde in una rete deve essere in grado di copiare il proprio codice sorgente (o binario) e iniettarlo in un altro sistema senza alterarlo. Capire come un programma possa contenere le istruzioni per duplicare se stesso è fondamentale per chi studia cyber-security.

Il "Trusting Trust" Attack: Nel 1984, Ken Thompson (uno dei padri di UNIX) tenne un famoso discorso in cui spiegò come inserire una backdoor immortale in un compilatore. Il compilatore modificato riconosceva quando stava compilando se stesso e reinseriva la backdoor nel nuovo eseguibile, anche se nel codice sorgente visibile all'umano la backdoor era stata cancellata. Questa è logica Quine applicata all'hacking.

### 4. Filosofia e Logica (DNA e Vita)
C'è un parallelo affascinante con la biologia. Le cellule del nostro corpo contengono il DNA. Il DNA non è altro che un codice (stringa di dati passivi) che contiene le istruzioni per costruire le proteine (codice attivo) che, tra le altre cose, servono proprio a duplicare il DNA stesso.
![alt text](image.png)
Il Quine è il corrispettivo informatico della riproduzione cellulare: informazioni che replicano se stesse usando i propri stessi strumenti.

## Come funzionano i printf in un Quine?
Il segreto di tutto sta nella Tabella ASCII (che è il dizionario che usa il computer per associare i numeri alle lettere).

Guardiamo un esempio semplicissimo
Immagina di voler stampare questa esatta riga di testo, che contiene delle virgolette:
Ciao "Mondo"

In C standard faresti così: printf("Ciao \"Mondo\""); (usando la barra \ per non far confondere il compilatore).

In un Quine, invece, per evitare di usare le barre che complicano la stringa, usiamo i numeri ASCII combinati con %c (che significa "stampa il carattere corrispondente a questo numero").

Scriveremo la stringa così:
"Ciao %cMondo%c"

E poi la stamperemo passando il numero 34:
printf("Ciao %cMondo%c", 34, 34);

E per l'andata a capo (il numero 10)?
Stessa identica cosa. Se voglio stampare:
Ciao
Mondo

Posso scrivere:

printf("Ciao%cMondo", 10);

## Il paradosso
Il motivo per cui non possiamo usare il metodo standard come \n o \" dentro la stringa globale è che la stringa deve contenere anche se stessa, comprese le virgolette e i caratteri speciali che servono a definirla.

Se proviamo a usare il metodo standard, cadiamo in un paradosso logico e sintattico. Vediamo esattamente cosa succede se ci proviamo.

Problema #1: Se usi \" (Le virgolette)
Immagina di voler scrivere la stringa globale usando il metodo standard. La stringa deve contenere tutto il codice, inclusa la stringa stessa.

Ci proveresti scrivendo qualcosa del genere:

const char *str = "const char *str = \"...\";";

Vedi il problema? Per stampare le virgolette interne, hai dovuto usare il carattere di escape \.

Ora, quando il programma esegue la printf, stamperà le virgolette "... ma non stamperà la barra \! Quindi l'output del tuo programma sarà diverso dal codice sorgente: nel codice sorgente hai scritto \", ma l'output mostrerà solo ". Il diff fallirà.

Per risolvere questo, dovresti aggiungere una barra per stampare la barra (\\")... ma allora dovresti aggiungere altre barre nella stringa per stampare quelle barre, entrando in un loop infinito da cui non uscirai mai.

___  clang -Wall -Wextra -Werror -o Colleen Colleen.c && ./Colleen > tmp_Colleen && diff tmp_Colleen Colleen.c ___

# Appunti relativi alle consegne

## Colleen
Cos'è lea?
lea sta per Load Effective Address (Carica Indirizzo Efficace).

La regola d'oro per distinguerla dal classico mov è questa:

mov va nella memoria, prende il contenuto di una scatola e lo copia nel registro.

lea non guarda cosa c'è dentro la scatola; prende solo l'etichetta con l'indirizzo della scatola e la copia nel registro.

La differenza è esattamente questa:

mov rax, [variabile]   // rax = variabile;  (Prende il valore)
lea rax, [variabile]   // rax = &variabile; (Prende il puntatore / indirizzo)

Esistono alternative? Sì, il mov assoluto
In teoria, in NASM, per copiare l'indirizzo di una stringa nel registro rdi potresti scrivere semplicemente:

mov rdi, s  ; In NASM, senza parentesi quadre, significa "prendi l'indirizzo di s"

Ma se si tratta di un progetto PIE (quindi senza flag -no-pie, come richiesto dal subject) si può usare solo lea

## Grace
### Macro
Le macro in Assembly si scrivono in questo modo:
%macro FILENAME 0
    "Grace_kid.s"
%endmacro

Il numero 0 indica il numero di argomenti necessari per la macro (in questo caso nessuno).
In certi casi sarebbe potuto servire un numero diverso, come:

%macro PRINT 3
    mov rax, 1      ; ID della syscall Linux per 'sys_write'
    mov rdi, %1     ; %1 riceverà il 1° argomento (il File Descriptor)
    mov rsi, %2     ; %2 riceverà il 2° argomento (il puntatore alla stringa)
    mov rdx, %3     ; %3 riceverà il 3° argomento (la lunghezza)
    syscall         ; Esegue la chiamata a Linux
%endmacro

Questo permette di avere un codice molto più pulito, ottenendo qualcosa come:
main:
    {...}
    PRINT 1, msg1, len1
    PRINT 1, msg2, len2
    {...}

### Tutti i modi di scrivere le macro
Nel subject è riportato:  Exactly three macros (or the closest equivalent for your assembler).
Ogni assembler ha la sua sintassi (non esiste uno standard unico come in C).

- NASM:
%macro EXAMPLE 0
    "example.s"
%endmacro

- NASM (A singola riga)
%define EXAMPLE "example.s"
%define DNA "..."

- GNU Assembler (GAS / as):
.macro EXAMPLE
    .ascii "example.s\0"
.endm

- MASM / TASM (Microsoft / DOS)
EXAMPLE MACRO
    DB "example.s", 0
ENDM

Spiegazione Grace con commenti:

main:
    push    rbp
    mov     rbp, rsp

    ; 1. fopen(file_name, mode)
    mov     rdi, file_name
    mov     rsi, mode
    call    fopen
    mov     r12, rax; salvo il puntatore del file in r12 (registro preservato)

    ; 2. fprintf(file, kid, ...)
    ; siccome abbiamo più di 6 argomenti, i primi vanno nei registri, i successivi nello stack (da destra a sinistra, perché lo stack cresce verso il basso)
    mov     rdi, r12        ; 1° arg: FILE *
    mov     rsi, kid        ; 2° arg: formato
    mov     rdx, 10         ; 3° arg: %c (newline dopo il commento)
    mov     rcx, 10         ; 4° arg: %c (newline dopo macro FILENAME)
    mov     r8, 34          ; 5° arg: %c (virgoletta aperta)
    mov     r9, 34          ; 6° arg: %c (virgoletta chiusa)
    
    ; tutti gli altri argomenti vanno pushati nello stack:
   
    
    mov     rax, 0 ; passo obbligatoriamente lo 0 perché fprintf
    call    fprintf

    ; 3. fclose(file)
    mov     rdi, r12
    call    fclose

    mov     rax, 0
    pop     rbp
    ret
%endmacro

PROGRAM

### Funzioni variadiche
Le funzioni variadiche possono accettare un numero variabile di argomenti. Un esempio comune è il printf:
int printf(const char *format, ...);
Queste funzioni si riconoscono proprio grazie ai ...

Dunque quando in assembly viene chiamata una funzione variadica come fprintf, la funzione non sa in anticipo quanti e quali tipi di argomenti le stai passando. In particolare, ha bisogno di sapere se le stai passando dei numeri decimali (i float o i double), perché in Assembly i numeri con la virgola non vanno nei registri normali (rdi, rsi), ma viaggiano su registri speciali chiamati registri vettoriali XMM (da xmm0 a xmm7).

Per questo motivo, la regola di Linux impone un accordo preciso:
### ___⚠️ La Regola d'Oro: Prima di chiamare una funzione variadica, devi usare il registro rax per dirle quanti argomenti di tipo "float" le stai passando nei registri XMM.
Se viene dimenticato questo passaggio, verrà letto un valore casuale rimasto dentro rax (es. 42, 128...) per cui poi la funzione variadica
(questo caso fprintf) penserà che le si stia passando decine di numeri float, causando quasi certamente un seg fault.

Volevo scrivere la stringa kid su più righe, in questo modo:
kid db "; comment", 10
        db "%%define FILENAME %cGrace_kid.s%c", 10
        db "%%define DNA %c...%c", 10
        db "section .data", 10
        db "    filename db FILENAME, 0", 10
        db "    mode db %cw%c, 0", 10
        {...}
Ma non è possibile su assembly usando una sola printf.
Trattandosi di un vero e proprio labirinto, ho optato per tenere l'itero codice sulla stessa riga (meno leggibile, ma più semplice)


