# Matematica del discreto

## Indice

- [Insiemi](#insiemi)
  - [Definizione e Notazioni](#definizione-e-notazioni)
  - [Operazioni su insiemi](#operazioni-su-insiemi)
    - [Insieme delle parti](#insieme-delle-parti)
    - [Descrizione di un insieme](#descrizione-di-un-insieme)
    - [Partizione](#partizione)
    - [Prodotto cartesiano](#prodotto-cartesiano)
  - [Relazioni tra insiemi](#relazioni-tra-insiemi)
  - [Relazione di equivalenza](#relazione-di-equivalenza)
  - [Relazione d'ordine](#relazione-dordine)
- [Funzioni (Applicazioni)](#funzioni-applicazioni)
  - [Proprietà delle funzioni](#proprietà-delle-funzioni)
  - [Composizione di funzioni](#composizione-di-funzioni)
  - [Funzione inversa](#funzione-inversa)
  - [Teorema: funzione biunivoca ammette inversa](#teorema-funzione-biunivoca-ammette-inversa)

# Insiemi

## Definizione e Notazioni

Un insieme è una **collezione di oggetti**, detti elementi che soddisfa le seguenti caratteristiche:

- è possibile **stabilire** se un elemento **appartiene** ($\in$) all'insieme
- gli elementi devono essere tutti **distinti** tra loro

#### Cardinalità

Se $X$ è un insieme con un numero finito di elementi, la **cardinalità** è il numero di elementi che contiene. Si indica con $|X|$.

#### Appartenenza

Se $a$ è un elemento di $A$, allora diremo che $a$ **appartiene** ad $A$ e scriveremo $a \in A$. Altrimenti, se $a$ **non appartiene** ad $A$, scriveremo $a \notin A$.

#### Sottoinsieme

Se $A$ e $B$ sono due insiemi, diremo che $B$ è contenuto in $A$ ($B$ **sottoinsieme** di $A$) e scriveremo $B \subseteq A$ se $\forall b \in B, b \in A$.

#### Sottoinsieme proprio

Un **sottoinsieme proprio** è un sottoinsieme strettaente contenuto in un insieme. Diremo che $B$ è un sottoinsieme proprio di $A$ e scriveremo $B \subset A$ se $B \subseteq A$ e $B \neq A$.

#### Uguaglianza

Due insiemi $A$ e $B$ sono **uguali** se contengono gli stessi elementi. Diremo che $A$ è uguale a $B$ e scriveremo $A = B$ se $A \subseteq B$ e $B \subseteq A$.

#### Insieme vuoto

L'insieme privo di elementi è chiamato **insieme vuoto** e viene indicato con $\emptyset$. $\emptyset \subset A, \forall A$.

## Operazioni su insiemi

Siano $A$ e $B$ due sottoinsiemi di $X$:

- l'**intersezione** di $A$ e $B$ è l'insieme $A \cap B = \lbrace x \in X \ | \ x \in A \land x \in B \rbrace$
- l'**unione** di $A$ e $B$ è l'insieme $A \cup B = \lbrace x \in X \ | \ x \in A \lor x \in B \rbrace$
- il **complementare** di $A$ è l'insieme $A^c = \lbrace x \in X \ | \ x \notin A \rbrace$
- la **differenza** tra $A$ e $B$ è l'insieme $A - B = \lbrace x \in X \ | \ x \in A \land x \notin B \rbrace$

Valgono le proprietà:

- $A \cap B \subset A$ e $A \cap B \subset B$
- $A \subset A \cup B$ e $B \subset A \cup B$
- $A \cap B \subset A \cup B$

### Insieme delle parti

Dato un insieme $X$, l'**insieme delle parti** di $X$ è l'insieme di tutti i sottoinsiemi di $X$ e si indica con $P(X)$:

$$P(X) := \lbrace A \ | \ A \subset X \rbrace$$

Nota: $\emptyset \in P(X), \forall X$.

Il numero di elementi dell'insieme delle parti di un insieme $X$ è $2^{|X|}$.

Il numero di sottoinsiemi di $n$ elementi di un insieme $X$ è $|X| \choose n$.

### Descrizione di un insieme

Ci sono due modi di descrivere un insieme $A$:

- per **elencazione**: $A = \lbrace a, b, c, ... \rbrace$
- per **proprietà**: $A = \lbrace a \in X \ | \ P(x) \rbrace$, $P$ è una proprietà

Esempio:

- $A := \lbrace 0, 1, 2, 3, 4 \rbrace$, per elencazione
- $B := \lbrace x \in \mathbb{N} \ | \ x \leq 4 \rbrace$, per proprietà
- $C := \lbrace 0, 2, 4 \rbrace$, per elencazione
- $D := \lbrace x \in \mathbb{N} \ | \ x \text{ è pari} \rbrace$, per proprietà

Nota: $D$ ha un _numero infinito_ di elementi, quindi non può essere definito per elencazione

### Partizione

Dato un insieme $X$ non vuoto, una **partizione** è una collezione di sottoinsiemi non vuoti $A_i$ di $X, i \in I$, tali che:

- $A_i \cap A_j = \emptyset, \forall i \neq j$, tutti i sottoinsiemi sono disgiunti
- $\displaystyle X = \bigcup_{i \in I} A_i$, l'unione di tutti i sottoinsiemi è uguale all'insieme di partenza

Esempio:

- $X = \mathbb{N}$, partizione:
  - $A_1 = \lbrace \text{numeri pari} \rbrace$
  - $A_2 = \lbrace \text{numeri dispari} \rbrace$
- $B = \lbrace 0,1,2,3,4 \rbrace$, $C = \lbrace 0,2,4 \rbrace$, partizione:
  - $A_1 = B \cap C$
  - $A_2 = B - C$
- $B = \lbrace 0,1,2,3,4 \rbrace$
  - $A_1 = \lbrace 0,3 \rbrace$
  - $A_2 = \lbrace 2 \rbrace$
  - $A_3 = \lbrace 1 \rbrace$
  - $A_4 = \lbrace 4 \rbrace$

### Prodotto cartesiano

Dati due insiemi $A$ e $B$, il **prodotto cartesiano** di $A$ e $B$, $A \times B$, è l'insieme costituito da tutte le coppie ordinate ($(a,b) \neq (b,a)$) di elementi $A$ e $B$:

$$A \times B = \lbrace (a,b) \ | \ a \in A, b \in B \rbrace$$

Nota: se $A = B, A \times A$ si denota anche con $A^2$.

Se $A$ ha cardinalità $|A| = h$ e $B$ ha cardinalità $|B| = k$, allora $A \times B$ ha _cardinalità_ $hk$.

È possibile _estendere_ il prodotto a più insiemi:

$$A_1 \times A_2 \times \cdots A_n = \lbrace (a_1, a_2, \dots, a_n) \ | \ a_i \in A_i, \forall i = 1, \dots n \rbrace$$

#### Coppia ordinata

Per dare la definizione di prodotto cartesiano, serve la definizione di **coppia ordinata** $(-,-)$:
$$a \in A, b \in B \quad (a,b) := \lbrace \lbrace a \rbrace, \lbrace a,b \rbrace \rbrace \subseteq P(A \cup B)$$

ovvero, una coppia ordinata è un **elemento dell'insieme delle parti** dell'insieme delle parti di $A$ unione $B$: $P(P(A \cup B))$.

Nota: $(a,b) \neq (b,a)$. $(b,a)$ è definito su $\lbrace \lbrace b \rbrace, \lbrace a,b \rbrace \rbrace$.

Nota: la scrittura $\lbrace a, b \rbrace$ denota l'insieme i cui elementi sono $a, b$, quindi $\lbrace a, b \rbrace = \lbrace b, a \rbrace$, mentre la scrittura $(a,b)$ denota la coppia ordinata, quindi $(a,b) \neq (b,a)$.

## Relazioni tra insiemi

Siano $A$ e $B$ due insiemi. In modo informale, una **relazione** $R$ tra $A$ e $B$ è una legge che associa qualche elemento di $A$ a qualche elemento di $B$.

Quindi data una relazione si creano delle coppie $(a,b)$ formate da $a \in A$ e $b \in B$, tale che $a$ è in relazione con $b$.

#### Definizione

Una **relazione** (binaria) $R$ tra due insiemi $A$ e $B$ è un sottoinsieme del prodotto cartesiano $A \times B$.

Sia $R \subset A \times B$ una relazione. Se $(a,b) \in R$, si diche che $a$ è in relazione con $b$ e si scrive $aRb$, $a \sim b$, $a \sim_R b$, $(a,b) \in R$.

Se invece $a$ e $b$ non sono in relazione, si scrive $(a,b) \notin R$, $a \nsim b$, $a \nsim_R b$.

Esempio:

- $A = \lbrace x \in \mathbb{N} \ | \ 1 \leq x \leq 7 \rbrace$, $B = \lbrace 2, 4 \rbrace$
  - $R$: $a \in A$ è in relazione con $b \in B$ solo se $a$ è divisore di $b$
  - $R = \lbrace (1,2), (2,2), (1,4), (2,4), (4,4) \rbrace$
- $A = \lbrace \text{rette del piano} \rbrace$, $B = \lbrace \text{punti del piano} \rbrace$
  - $R$: $r \in A$ è in relazione con $p \in B$ se e solo se $p \in r$

#### Identità

Se $A = B$ e $R = \lbrace (a,a), \forall a \in A \rbrace \subset A \times A$, diciamo che $R$ è la relazione **identica** (ogni elemento $a$ è in relazione solo con _se stesso_).

#### Totalità

Se $R = A \times B$ diciamo che $R$ è la relazione **totale**, cioè ogni elemento di $A$ è in relazione con _ogni elemento_ di $B$.

### Proprietà realzioni

Sia $R$ una relazione su un insieme $X$ (quindi $R \subset X \times X$), allora diciamo che $R$ è:

#### Riflessiva

Se $(x,x) \in R, \forall x \in X$: ogni elemento è in relazione (almeno) con _se stesso_.

#### Simmetrica

Se $(x,y) \in R \Rightarrow (y,x) \in R$: se $x$ è in relazione con $y$, allora $y$ è in relazione con $x$.

#### Antisimmetrica

Se $(x,y) \in R$ e $(y,x) \in R \Rightarrow x = y$: due coppie _possono essere_ simmetriche solo se $x = y$.

#### Transitiva

Se $(x,y) \in R$ e $(y,z) \in R \Rightarrow (x,z) \in R$: se $x$ è in relazione con $y$ e $y$ è in relazione con $z$, allora $x$ è in relazione con $z$.

Esempio:

- $A = \lbrace 0,1,2,3,4 \rbrace$ e $R_1 = \text{essere minore di}$
  - $R_1$ è antisimmetrica e transitiva
- $A = \lbrace 0,1,2,3,4 \rbrace$ e $R_2 = \text{essere minore o uguale di}$
  - $R_2$ è riflessiva, antisimmetrica e transitiva

## Relazione di equivalenza

#### Definizione

Sia $R$ una relazione in $X$, diciamo che $R$ è una **relazione di equivalenza** se è **riflessiva**, **simmetrica** e **transitiva**.

Nota: spesso la relazione di equivalenza è indicata con $\sim$.

## Relazione d'ordine

#### Definizione

Sia $R$ una relazione su un insieme $X$, diciamo che $R$ è una **relazione d'ordine** se è **riflessiva**, **antisimmetrica** e **transitiva**.

Nota: spesso la relazione d'ordine è indicata con $\preceq$.

#### Insieme parzialmente ordinato

Sia $X$ un insieme e $\preceq$ una relazione d'ordine su $X$, si dice che l'insieme $X$ con la relazione $\preceq$ è un insieme **parzialmente ordinato**.

Nota: sia $Y \subseteq X$, allora anche $Y$ risulta parzialmente ordinato da $\preceq$.

#### Confrontabilità

Due elementi $x$ e $y$ si dicono **confrontabili** se $x \preceq y$ oppure $y \preceq x$.

#### Insieme totalmente ordinato

Un insieme si dice **totalmente ordinato** se l'insieme è _parzialmente ordinato_ e ogni coppia di elementi è _confrontabile_. In questo caso la relazione si dice **relazione d'ordine totale**.

Esempio:

- $(\mathbb{N}, \leq)$ è un insieme totalmente ordinato
- L'insieme $\mathbb{C}$ non ammette una relazione di ordine totale
- $A = \lbrace a,b,c \rbrace$, $R := \lbrace (a,a), (a,b), (a,c), (b,b), (c,c) \rbrace$
  - $R$ è riflessiva, antisimmetrica, transitiva, quindi è una relazione d'ordine
  - $b$ e $c$ non sono confrontabili, quindi $R$ non è una relazione d'ordine totale

Sia $(X, \preceq)$ un insieme parzialmente ordinato e sia $Y \subseteq X$:

#### Massimo

Un elemento $a \in X$ si dice **massimo** di $X$ se $\forall x \in X$ si ha $x \preceq a$.

#### Minimo

Un elemento $b \in X$ si dice **minimo** di $X$ se $\forall x \in X$ si ha $b \preceq x$.

#### Estremo superiore

Un elemento $s \in X$ si dice **estremo superiore** di $Y$
e si scrive $s = Sup(Y)$ se:

- $\forall y \in Y$ si ha $y \preceq s$
- se $x \in X$ è tale che $y \preceq x, \forall y \in Y$, allora anche $s \preceq x$

Ovvero il più piccolo elemento di $X$ che è maggiore o uguale a tutti gli elementi di $Y$.

#### Estremo inferiore

Un elemento $t \in X$ si dice **estremo inferiore** di $Y$ e si scrive $t = Inf(Y)$ se:

- $\forall y \in Y$ si ha $t \preceq y$
- se $x \in X$ è tale che $x \preceq y, \forall y \in Y$, allora anche $x \preceq t$

Ovvero il più grande elemento di $X$ che è minore o uguale a tutti gli elementi di $Y$.

# Funzioni (applicazioni)

#### Definizione

Una **funzione** (o applicazione) $R : D \rightarrow C$ è una relazione $R$ tra $D$ e $C$ tale che $\forall d \in D, \exists ! \ c \in C$ per cui $dRc$ ($c = R(d)$). Ovvero ad ogni elemento di $D$ associa un **unico** ($\exists !$) elemento di $C$.

#### Dominio e codominio

$D$ si dice dominio _(domain)_, $C$ si dice codominio _(codomain)_.

#### Immagine

L'**immagine** _(image o range)_ di una funzione è un sottoinsieme del codominio, composto da tutti i valori che la funzione può assumere: $R(D) = \lbrace c \in C \ | \ \exists d \in D, c = R(d) \rbrace$

#### Controimmagine

La **controimmagine** o retroimmagine _(preimage)_ di $c \in C$ è un qualsiasi elemento di $d \in D$ tale che $R(d) = c$, ovvero un elemento del dominio che viene mappato a $c$.

L'insieme _(può essere vuoto)_ delle controimmagini di $c \in C$ viene indicato con $R^{-1}(c) = \lbrace d \in D \ | \ R(d) = c \rbrace$.

#### Uguaglianza

Due funzioni $F$ e $G$ tali che $F, G : X \rightarrow Y$ si dicono uguali ($F = G$) se $\forall x \in X, F(x) = G(x)$.

### Proprietà delle funzioni

Sia $F : A \rightarrow B$ un'applicazione, si dice che $F$ è:

#### Iniettiva

Se $F(a) = F(b) \Rightarrow a = b$: ogni elemento di $B$ ammette al massimo una controimmagine.

#### Suriettiva

Se $\forall b \in B, \exists a \in A$ tale che $F(a) = B$: ogni elemento di $B$ ammette almeno una controimmagine.

#### Biettiva (biunivoca)

Se è sia iniettiva che suriettiva: ogni elemento $b \in B$ ammette esattamente una controimmagine.

### Composizione di funzioni

Date due applicazioni, la loro **composizione** $F : A \rightarrow B$ e $G : B \rightarrow C$, si può definire un applicazione $(G \circ F)(a) = G(F(a)), \forall a \in A$.

Nota: in generale, se si può considerare $F \circ G$, non è detto che si possa considerare $G \circ F$.

La composizione di funzioni, in caso i _domini siano compatibili_, è **associativa**, ovvero $(H \circ G) \circ F = H \circ (G \circ F)$.

#### Funzione identità

Dato un insieme $A$, l'applicazione $id_A : A \rightarrow A$, definita da $id_A(a) = a, \forall a \in A$ viene detta identica o **identità**.

Nota: la composizione di una funzione $F$ con la funzione identità $id_A$ è uguale a $F$.

### Funzione inversa

Date due applicazioni $f : A \rightarrow B$ e $g : B \rightarrow A$, se $g \circ f = id_A$, allora $f$ è detta **inversa di destra** di $g$ e $g$ è detta **inversa di sinistra** di $f$.

Se $g \circ f = id_A$ e $f \circ g = id_B$, allora $f$ e $g$ sono l'una l'inversa dell'altra.

### Teorema: funzione biunivoca ammette inversa

#### Proposizione

Le applicazioni biunivoche ammettono inversa.

#### Dimostrazione

Sia $F : X \rightarrow Y$ biunivoca. Per ogni $y \in Y$ esiste uno e un solo $x_y \in X$ tale che $F(x_y) = y$.

Considero la funzione $G : Y \rightarrow X$ tale che $y \mapsto x_y$.

Si verifica che:

- $(G \circ F)(x) = G(F(x)) = G(y) = x$
- $(F \circ G)(y) = F(G(y)) = F(x_y) = y$

Quindi:

- $\forall x \in X, (G \circ F)(x) = x$, quindi $G \circ F = id_X$
- $\forall y \in Y, (F \circ G)(y) = y$, quindi $F \circ G = id_Y$

Di conseguenza $F$ e $G$ sono inverse e in particolare $F$ ammette un'inversa.
