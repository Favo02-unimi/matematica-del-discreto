## Lez2 - 2024-03-05 - Relazione d'ordine, Massimo e minimo, Estremo superiore ed inferiore, Funzioni, Iniettività, Suriettività e Biiettività, Composizione, Operazione, Struttura algebrica, Elemento neutro, Inverso, Monoide, Gruppo

## Relazione d'ordine

- sia $R \subseteq A \times A$ una relazione

Diciamo che $R$ è una **relazione d'ordine** (parziale) quando è:

- **riflessiva**
- **antisimmetrica**
- **transitiva**

_Esempio_:

- $A = \lbrace a,b,c \rbrace$, $R \subseteq A^2 = \lbrace (a,a), (a,b), (a,c), (b,b), (c,c) \rbrace$
	- riflessiva: $(a,a), (b,b), (c,c) \in R$
	- antisimmetria: $a \sim_R b \text{ ma } b \nsim_R a$, $a \sim_R c \text{ ma } c \nsim_R a$
	- transitività: $a \sim_R a \land a \sim_R b \Rightarrow a \sim_R b$
- $A = \mathbb{N}, \mathbb{Z}, \mathbb{Q}, \mathbb{R}$, $R_\leq = \lbrace (a,b) \in A^2 \ | \ a \leq b \rbrace$: relazione d'ordine totale
	- $>$ e $<$ non sono relazioni d'ordine, dato che non sono riflessive ($1 \ngtr 1$, $1 \nless 1$)
	- $\geq$ e $\leq$ sono relazioni d'ordine totali, ovvero è possibile mettere in relazione ogni coppia: $\forall a,b \in A, a \sim_R b \lor b \sim_R a$
- $A = P(I)$, $R = \lbrace (S,T) \in P(I)^2 \ | \ S \subseteq T \rbrace$: relazione d'ordine parziale

### Massimo e Minimo

- sia $(X, \preceq)$ un insieme parzialmente ordinato

Un elemento $a \in X$ si dice **massimo** di $X$ se $\forall x \in X$ si ha $x \preceq a$.

Un elemento $b \in X$ si dice **minimo** di $X$ se $\forall x \in X$ si ha $b \preceq x$.

### Estremo superiore ed Estremo inferiore

- sia $Y \subseteq X$, anche $Y$ risulta parzialmente ordinato da $\preceq$

Un elemento $s \in X$ si dice **estremo superiore** di $Y$, e si scrive $s = \sup(Y)$, se:

- $\forall y \in Y$ si ha $y \preceq s$
- se $x \in X$ è tale che $y \preceq x, \forall y \in Y$, allora anche $s \preceq x$

Un elemento $t \in X$ si dice **estremo inferiore** di $Y$, e si scrive $t = \inf(Y)$, se:

- $\forall y \in Y$ si ha $t \preceq y$
- se $x \in X$ è tale che $x \preceq y, \forall y \in Y$, allora anche $x \preceq t$

## Funzioni

Una **funzione** $f : D \rightarrow C$ è una relazione $R_f$ tra $D$ e $C$ tale che $\forall d \in D, \exists ! \ c \in C$ per cui $d \sim_{R_f} c$. Ovvero ad ogni elemento di $D$ associa un **unico** ($\exists !$) elemento di $C$.

$D$ si dice dominio _(domain)_, $C$ si dice codominio _(codomain)_.

L'**immagine** _(image o range)_ di una funzione è un **sottoinsieme del codominio**, composto da tutti i valori che la funzione può assumere: $R(D) = \lbrace c \in C \ | \ \exists d \in D, c = R(d) \rbrace$

La **controimmagine** o retroimmagine _(preimage)_ di una funzione è un qualsiasi elemento $d \in D$ tale che $R(c) = d$. L'insieme delle controimmagini, denotato come $f^{-1} = \lbrace d \in D \ | \ R(d) = c \rbrace$, ovvero l'insieme degli elementi che vengono **mappati** a un particolare elemento nel codominio e viene indicata con $f^{-1}$.

_Esempio:_

- $D = C = \mathbb{Z}$
	- $R_1 : a \sim_{R_1} b$ se e solo se $2b = a$
	- È definita su tutto D?
	- È definita in modo unico?
	- $R_1$ non è una funzione
- $D = \mathbb{Z} = C$
	- $R_2 : a \sim_{R_2} b$ se e solo se $b^2 = a$ ($b = \sqrt{a}$)
	- $R_2$ non è una funzione
- $D = \mathbb{Z} = C$
	- $R_3 : a \sim_{R_3} b$ se e solo se $b = a+2$
	- $R_3$ è una funzione

### Iniettività, Suriettività e Biiettività

- sia $f : D \rightarrow C$

$f$ è **iniettiva** _(injective)_ se per ogni elemento $c \in C$ esiste al più un elemento $d \in D$ tale che $f(d) = c$.

$f$ è **suriettiva** _(surjective)_ se per ogni elemento $c \in C$ esiste almeno un elemento $d \in D$ tale che $f(d) = c$, ovvero $\forall c \in C, \exists \ d \in D, f(d) = c$.

$f$ è **biiettiva** o biunivoca _(bijective)_ se è iniettiva e suriettiva.

### Composizione di funzioni

È possibile comporre due funzioni $f$ e $g$, a patto che il dominio di $g$ sia un sottoinsieme dell'immagine di $f$ e si indica con:

$$f \circ g : D \rightarrow H, Im(f) \subseteq Dom(g)$$
$$g \circ f(d) = g(f(d))$$

_Esempio:_

- $F : \mathbb{Z} \rightarrow \mathbb{Z}, G : \mathbb{Z} \rightarrow \mathbb{Z}$
	- $F(z) = 3z, G(z) = 3z^2 + 1$
	- $(F \circ G)(z) = F(G(z)) = 3 (z^2 +1) = 3z^2 +3$
	- $(G \circ F)(z) = G(F(z)) = (3z)^2 +1 = 9z^2 + 1$
	- $(F \circ G) \neq (G \circ F)$

La composizione di una funzione con la sua controimmagine viene detta **identità**:

$$f : D \rightarrow Im(f), f^{-1} : Im(f) \rightarrow D$$
$$f^{-1} \circ f = id_{D}$$

**Teorema**:

- sia $F : A \rightarrow B$ una funzione biiettiva

Allora $\exists \ G : B \rightarrow A$ tale che $G \circ F = id_A$ e $F \circ G = id_B$.

## Operazione

- sia $S$ un insieme

Un'operazione $*$ su $S$ è una funzione:

$$* : S \times S \rightarrow S$$
$$(s_1, s_2) \rightarrow s_1 * s_2$$

_Esempio:_

- insieme: $\mathbb{N, Z, Q, R, C}$, operazione: $+, \cdot$
- insieme: $P(S)$, operazione: $\cap, \cup$
- insieme: $\lbrace f | f : S \rightarrow S$ è una funzione $\rbrace$, operazione: composizione $(g \in S^S, f \in S^S) \rightarrow g \circ f$
- insieme: $\mathbb{N}$, la sottrazione $-$ **NON** è un'operazione ($(1, 2) \rightarrow 1-2 = -1 \notin \mathbb{N}$)

## Struttura algebrica

Una struttura algebrica è un insieme $S$ su cui sono definite una o più operazioni, in breve $(S, *)$.

### Proprietà

Sia $* : S^2 \rightarrow S$ un'operazione, diciamo che è

- **associativa** quando $\forall a, b, c \in S, (a * b) * c = a * (b * c)$
- **commutativa** quando $\forall a, b \in S, a * b = b * a$

_Esempio:_

- associatività:
	- $+, \cdot$ sono associative su $\mathbb{Z, Q, R, C}$
	- $\circ$ è associativa su $S^S$
	- $a \diamond b = \frac{a+b}{2}$ NON è associativa su $\mathbb{Q}$, infatti $((4 \diamond 6) \diamond 3 = 4) \neq (4 \diamond (6 \diamond 3) = \frac{17}{4})$
- commutatività
	- $+, \cdot$ sono commutative su $\mathbb{N, Z, Q, R, C}$
	- $-$ NON lo è, infatti $2-1 \neq 1-2$
	- $\circ$ non è commutativa su $S^S$
	- $\diamond$ è commutativa

### Elemento neutro

- sia $*$ un'operazione in $A$

Un elemento $e_s \in A$ si dice **elemento neutro a sinistra** o unità sinistra _(left neutral element)_, se $\forall a \in A$, si ha $e_s * a = a$.

Un elemento $e_d \in A$ si dice **elemento neutro a destra** o unità destra _(right neutral element)_, se $\forall a \in A$, si ha $a * e_d = a$.

Un elemento $e \in A$ si dice **elemento neutro** o unità _(neutral element)_, se $\forall a \in A$, si ha $e * a = a * e = a$.

_Esempio:_

- in $\mathbb{N, Z, Q, R, C}$, $+$ ha come elemento neutro $0$, $\cdot$ ha per elemento neutro $1$
- $(S^S, \circ)$ ha come elemento neutro $id_s$
- $(P(A), \cup)$ ha come elemento neutro $\emptyset$
- $(P(A), \cap)$ ha come elemento neutro $A$

### Inverso

- sia $*$ un'operazione in $A$ dotata di elemento neutro $e$ e si fissi un elemento $a \in A$

Un elemento $\overline{a}_s \in A$ si dice **inverso a sinistra** _(left inverse element)_ di $a$, se $\overline{a}_s * a = e$.

Un elemento $\overline{a}_s \in A$ si dice **inverso a destra** _(right inverse element)_ di $a$, se $a * \overline{a}_d = e$.

Un elemento $\overline{a}_s \in A$ si dice **inverso** _(inverse element)_ di $a$, se $\overline{a} * a = a * \overline{a} = e$.

_Esempio:_

-  $(\mathbb{N}, +)$ ha inverso solo per $0$
- in $\mathbb{Z, Q, R, C}$, $+$ ha come inverso di $a$, $-a$
- $(S^S, \circ)$ gli elementi invertibili sono le funzioni biiettive

## Teorema di unicità dell'elemento neutro e dell'inverso per operazione associativa

- sia $A$ un insieme dotato di un'operazione associativa $* : A^2 \rightarrow A$ che è dotata di elemento neutro $e$

Allora:

1. l'elemento neutro è **unico**
2. sia $a \in A$ un elemento che ammette un inverso, allora anche l'inverso è **unico**

**Dimostrazione**:

1. supponiamo per assurdo $\exists \ e_1 \neq e_2 \in A$ elementi neutri, allora
	- $e_1 * e_2 = e_1$, ma anche $e_1 * e_2 = e_2$
	- quindi $e_2 = e_1 * e_2 = e_1$, **assurdo**
2. supponiamo per assurdo che $\exists \ a_1 \neq a_2 \in A$ inversi per $a$, allora
	- $e = (a * a_1)$, $e = (a * a_2)$
	- $a_1 = a_1 * e = a_1 * (a * a_2)$
	- $a_2 = a_2 * e = a_2 * (a * a_1)$
	- per associatività: $a_1 = a_1 * e = a_1 * (a * a_2) = (a_1 * a) * a_2 = e * a_2 = a_2$, **assurdo**

## Monoide

Un **monoide** _(monoid)_ $(M, *)$ è un insieme $M$ dotato di una operazione $*$ tale che:

1. $*$ è **associativa**
2. $*$ è dotata di **elemento neutro** $e$

_Esempio_:

- $\mathbb{N, Z, Q, R, C}$ con $+$ è un monoide con elemento neutro $0$
- $S^S$ è un monoide con $\circ$ ed elemento neutro $id_S$
- $P(S)$ è un monoide con $\cap$ ed elemento neutro $S$
- $P(S)$ è un monoide con $\cup$ ed elemento neutro $\emptyset$

## Gruppo

Un **gruppo** _(group)_ $(G, *)$ è un insieme $G$ dotato di una operazione $*$ tale che:

1. $(x * y) * z = x * (y * z), \forall x, y, z \in G$ ($*$ è **associativa**)
2. $\exists \ e \in G$ tale che $e * x = x * e = x, \forall x \in G$ (esiste **elemento neutro** $e$)
3. $\forall x \in G, \exists \ x^{-1} \ \in G$ tale che $x * x^{-1} = x^{-1} * x = e$ (ogni $x$ ammette **inverso**)

Un gruppo si dice **abeliano** _(abelian group)_ o **commutativo** se verifica anche:

4. $x * y = y * x, \forall x, y \in G$ ($x$ è **commutativa**)

_Esempio:_

- $\mathbb{Z, Q, R, C}$ con $+$ sono gruppi ed elemento neutro $0$
- le funzioni biiettive in $S^S$ formano un gruppo con $\circ$ ed elemento neutro $id_S$
- $\mathbb{Q}^* = \mathbb{Q} \textbackslash \lbrace 0 \rbrace$, $\mathbb{R}^* = \mathbb{R} \textbackslash \lbrace 0 \rbrace$, $\mathbb{C}^* = \mathbb{C} \textbackslash \lbrace 0 \rbrace$ con $\cdot$ sono gruppi con elemento neutro $1$

**Teorema**:

- sia $(G, *, e)$ un gruppo

Allora valgono le proprietà:

- in un gruppo l'_elemento neutro_ è **unico**
- in un gruppo ogni elemento ha un **unico** _inverso_
- vale la _"legge della cancellazione"_, cioè
	- $a * b = a * c \Rightarrow b = c$
	- $a * b = c * b \Rightarrow a = c$
- $\forall a, b \in G$ l'equazione $a * x = b$ ha _una ed una sola soluzione_: $x = a^{-1} * b$ (anche $x * a = b$ ha $x = b * a^{-1}$ come unica soluzione)
- $(a * b)^{-1} = b^{-1} * a^{-1}, \forall a, b \in G$
- $(a^{-1})^{-1} = a, \forall a \in G$
