//       !!! IMPORTANT !!!
// Typst Compiler Version 0.11.0

#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.2.2"
#import "@preview/codly:0.2.0": *
#import "@preview/equate:0.2.0": equate

// pdf metadata
#set document(
  title: "Matematica del Discreto",
  author: ("Luca Favini"),
)

// codly setup
#show: codly-init.with()
#codly(
  languages: (python: (name: "Python", color: blue, icon: none)),
  zebra-color: white,
  stroke-width: 1.5pt,
  stroke-color: blue,
  enable-numbers: false
)

// evidenziare link
#show link: it => {
  if type(it.dest) != str {
    // link interni
    underline(it, stroke: 1.5pt + blue)
  }
  else {
    // link esterni
    underline(it, stroke: 1.5pt + red)
  }
}

// evidenziare link nell'indice
#show outline.entry: it => {
  underline(it, stroke: 1.5pt + blue)
}

// settings box colorati
#show: gentle-clues.with(breakable: true)

// settings equazioni
#show: equate.with(breakable: true)

// box colorati
#let nota(body) = { info(title: "Nota")[#body] }
#let attenzione(body) = { warning(title: "Attenzione")[#body] }
#let informalmente(body) = { idea(title: "Informalmente")[#body] }
#let dimostrazione(body) = { conclusion(title: "Dimostrazione")[#body] }
#let esempio(body) = { experiment(title: "Esempio")[#body] }
#let teorema(body) = { task(title: "Teorema")[#body] }

// testo matematico colorato
#let mg(body) = text(fill: olive, $#body$)
#let mm(body) = text(fill: maroon, $#body$)
#let mo(body) = text(fill: orange, $#body$)
#let mr(body) = text(fill: red, $#body$)
#let mp(body) = text(fill: purple, $#body$)
#let mb(body) = text(fill: blue, $#body$)

// references link usando @tag
#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#show ref: it => [#link(it.citation.key)[#lower(to-string(it.element))]]

// numerazione titoli
#set heading(numbering: "1.1.")

// pagina iniziale (titolo)
#page(align(left + horizon, block(width: 90%)[

  #text(3em)[*Matematica del Discreto*]
  #text(1.5em)[Università degli studi di Milano - Informatica]

  #link("https://github.com/Favo02")[
    #text(1.5em, "Luca Favini")
  ]

  #text("Ultima modifica:")
  #datetime.today().display("[day]/[month]/[year]")
]))

#set par(linebreaks: "optimized")

// impostazioni pagine
#let numberingH(c)={
  return numbering(c.numbering,..counter(heading).at(c.location()))
}

#let currentH(level: 1)={
  let elems = query(selector(heading).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#numberingH(elems.first()) #elems.first().body]
  } else {
    elems = query(selector(heading).before(here()))
    if elems.len() != 0 {
      return [#numberingH(elems.last()) #elems.last().body]
    }
  }
  return ""
}

#set page(
  numbering: "1",
  number-align: bottom + right,
  header: [
    #set text(8pt)
    _Statistica e Analisi dei dati_
    #h(1fr)
    #context[_ #currentH() _]
  ],
  footer: [
    #set text(8pt)

    #context[
      _Luca Favini - #datetime.today().display("[day]/[month]/[year]")_
      #h(1fr)
      #text(12pt)[#counter(page).display("1")]
    ]
  ],
)

#heading(outlined: false, bookmarked: false, numbering: none, "Matematica del Discreto")

Alcune grandezze non sono continue, ma c'è un salto tra un valore e l'altro: sono discrete.

#heading(outlined: false, bookmarked: false, numbering: none, "Autori, Ringraziamenti e Licenza")

/ Autori: #link("https://github.com/Favo02")[Luca Favini]
/ Ringraziamenti: #link("https://github.com/comitanigiacomo")[Giacomo Comitani] _(appunti)_
/ Sorgente e Licenza: #link("https://github.com/Favo02/matematica-del-discreto")[github.com/Favo02/matematica-del-discreto] (#link("https://creativecommons.org/licenses/by/4.0/")[CC-BY-4.0])
/ Ultima modifica: #datetime.today().display("[day]/[month]/[year]")

// indice
#outline(
  title: "Indice",
  indent: auto
)

#pagebreak()

= Insiemi

== Sottoinsieme

== Operazioni su insiemi

== Prodotto cartesiano

= Relazioni tra insiemi

== Commutativa <commutativa>

== Associativa <associativa>

== Relazione di equivalenza <relazione-equivalenza>

=== Classe di equivalenza <classe-equivalenza>

== Relazione di ordine <relazione-ordine>

=== Massimo, Minimo

=== Estremo superiore, Estremo inferiore

= Funzioni (Applicazioni)

Biiettiva <biiettiva>

== Composizione

= Strutture algebriche

== Operazioni

=== Elemento neutro <elemento-neutro>

=== Inverso <inverso>

== Monoide <monoide>

Un monoide $(M, star)$ è un insieme $M$ dotato di un'operazione $star$ tale che:
- $star$ è associativa
- $star$ è dotata di @elemento-neutro

#esempio[
  $(bb(N), +)$, (Stringhe di caratteri, Concatenazione), (Matrici quadrate, $dot$)
]

== Gruppo <gruppo>

Un gruppo $(G, star)$ è un insieme $G$ dotato di un'operazione $star$ tale che:
- $star$ è associativa
- $star$ è dotata di @elemento-neutro
- ogni $g in G$ ammette @inverso

#esempio[
  $(bb(Z), +)$, $(bb(Q), dot)$, (Matrici invertibili, $dot$)
]

=== Gruppo abeliano <gruppo-abeliano>

Un gruppo $(G, star)$ si dice abeliano se, oltre le proprietà elencate precedentemente:
- $star$ è @commutativa

=== Proprietà

1. L'@elemento-neutro è unico
2. Ogni elemento ha un unico @inverso
3. Vale la legge di cancellazione: $forall a, b, c in G, quad a star b = a star c => b = c$
4. $forall a,b in G, quad (a star b)^(-1) = a^(-1) star b^(-1)$
5. $forall a, b in G quad a star x = b$ ha una ed una sola soluzione $x = a^(-1) star b$

È possibile definire le potenze di un elemento:

$ cases(
  a^0 = e,
  a^1 = a,
  a^m = underbrace(a star ... star a, "m volte"),
  a^-m = underbrace(a^(-1) star ... star a^(-1), "m volte"),
) $

=== Sottogruppo

Sia $(G, star)$ un gruppo e $H subset.eq G$ non vuoto, $H$ si dice sottogruppo di $G$ se:
- $H$ è chiuso rispetto a $star$: $forall x, y in H, quad x star y in H$ (oppure $star : H times H -> H$)
- esiste l'@elemento-neutro di $H$ in $G$
- per ogni elemento esiste l'@inverso: $forall x in H, quad x^(-1) in H$

#nota[
  Se $star$ è @associativa in $G$, allora lo è anche in $H$
]

=== Omomorfismo di gruppi <omomorfismo>

Siano $(G, star)$, $(H, square.small)$ due gruppi. La funzione $f : G -> H$ è un omomorfismo di gruppi se:
- $forall a, b, c in G, quad f(a star b) =  f(a) square.small f(b)$

=== Isomorfismo di gruppi <isomorfismo>

Siano $(G, star)$, $(H, square.small)$ due gruppi. La funzione $f : G -> H$ è un isomorfismo di gruppi se:
- la funzione $f$ è @biiettiva

== Anello <anello>

Un anello $(A, +, dot)$ è:
- $(A, +)$ è un @gruppo-abeliano
- $(A, dot)$ è un @monoide
- valgono le proprietà distributive del prodotto rispetto alla somma: $a dot (b + c) = a dot b + a dot c$

#nota[
  Dato l'anello $(A, +, dot)$, allora:
  - $0$ il neutro rispetto a $+$
  - $1$ il neutro rispetto a $dot$
  - $-a$ l'inverso di $a$ rispetto a $+$
]

=== Anello commutativo

Un anello si dice commutativo se l'operazione $dot$ è @commutativa

=== Divisore dello zero

Un elemento $a in A$, con $a != 0$ si dice divisore dello zero se:
- $exists space b in a, quad b != 0, quad "t.c." quad a dot b = 0 quad "o" quad b dot a = 0$

== Campo <campo>

Un anello $(bb(K), +, dot)$ si dice campo se:
- $((bb(K) - {0}), dot)$ è un @gruppo
- $dot$ è @commutativa

#esempio[
  $(bb(Q), +, dot)$, $(bb(N), +, dot)$, $(bb(C), +, dot)$
]

#informalmente[
  Un @campo è un @anello commutativo in cui tutti gli elementi (diversi dallo zero) sono invertibili.
  Un @campo è privo di divisori dello zero, poichè non sono invertibili
]

= Classi di resto

== Relazione di congruenza

Si dice $a, b in bb(Z)$ sono congrui modulo $n$, se:
- esiste $h in bb(Z)$ tale che $a - b = h n$ (ovvero $a-b$ è multiplo di $n$)

$ a tilde b (mod n) $

#esempio[
  $-2 tilde 14 (mod 4)$ infatti $-2-14 = -16 = 4 dot (-4)$

  $-1 tilde.not 10 (mod 7)$ infatti $-1-10 = -11$
]

#teorema[
  La congruenza modulo $n$ è una @relazione-equivalenza in $bb(Z)$
]

== Insieme quoziente

L'insieme quoziente di $bb(Z) \/ tilde_n$ viene detto insieme delle classi di resto modulo $n$: $[ bb(Z) \/ n]$

#esempio[
  $bb(Z)_2$:

  $[0]_tilde = {a in bb(Z) | a tilde 0 mod 2} = "numeri pari"$

  $[1]_tilde = {a in bb(Z) | a tilde 1 mod 2} = "numeri dispari"$
]

== Classe di resto

Una @classe-equivalenza è una classe di resto modulo $n$ quando la sua @relazione-equivalenza è la congruenza modulo $n$.

#nota[
  $bb(Z)_n$ ha $n$ elementi
]

#nota[
  $(bb(Z), +_n, dot_n)$ è un anello commutativo
]

= Divisibilità in $bb(Z)$

La divisione non è un'operazione definita su $bb(N)$ o $bb(Z)$, dato che il risultato di una divisione non è per forza un intero.

Siano $a, b in bb(Z)$, con $b != 0$. Se esiste $y in bb(Z) "t.c." a = b dot q$, allora:
- $a$ è divisibile per $b$ ($b | a$)
- $a$ è multiplo di $b$
- $b$ è un divisore di $a$
- $b$ è un fattore di $a$

#nota[
  $ b | a quad <==> quad b | -a quad <==> quad -b | a quad <==> quad -b | -a $
]

== Massimo comun divisore <mcd>

Siano $a, b in bb(Z) - {0}$, si dice massimo comun divisore (_mcd_) di $a$ e $b$ un numero intero $d$ tale che:
- $a$ e $b$ sono divisibili per $d$: $d | a, space d | b$
- è il più grande tra i divisori comuni: se $exists t in bb(Z) - {0} "t.c." t | a, t | b => t | d$

== Minimo comune multiplo <mcm>

Siano $a, b in bb(Z) - {0}$, si dice minimo comune multiplo (_mcm_) di $a$ e $b$ un numero intero $m$ tale che:
- $m$ è divisibile sia per $a$ che per $b$: $a | m, space b | m$
- è il più piccolo tra i multipli comuni: se $exists t in bb(Z) - {0} "t.c." a | t, b | t => m | t$

== Polinomio irriducibile

Un polinomio $p(x)$ è irriducibile quando:
- non esistono dei polinomi $q(x)$ e $s(x)$ tali che $q(x) dot s(x) = p(x)$

#esempio[
  - un polinomio di grado 1 è irriducibile
  - $x^2 + 1 in bb(R)[x]$ è irriducibile
  - $(x^2 + 1)(x^2 + 2) in bb(R)[x]$ è riducibile e *non* ha @radici
  - un polinomio di grado $> 1$ che ammette una radice $epsilon$ è riducibile, infatti è divisibile per $x-epsilon$ (per Ruffini)
  - un polinomio di grado dispari ammette sempre una radice $epsilon$, quindi è sempre riducibile
  - i polinomi di grado $> 2$ sono sempre riducibili

  #nota[
    Le *radici* <radici> o *zeri* di un polinomio è i risultati dell'equazione $p(x) = 0$
  ]
]

= Insiemi di tuple $bb(R)^n$

L'insieme $bb(R)^n$ è l'insieme i cui elementi sono $n$-tuple di numeri reali (con $n >= 1$):
$ bb(R)^n ) {vec(x_1, x_2, ..., x_n) "t.c. " x_i in bb(R) space forall i = 1, 2, ..., n} $

Un elemento di $bb(R)^n$ viene indicato con $underline(x) = vec(x_1, ..., x_n)$. $x_1, ..., x_n$ vengono chiamate le entrate di $x$.

= Insiemi di matrici $M_(a times b)(bb(R))$

L'insieme delle matrici $M_(a times b)(bb(R))$ è l'insieme i cui elementi sono le matrici con $a$ righe e $b$ colonne:
$ M_(a times b)(bb(R)) = { mat(
  x_(1,1), x_(1,2), ..., x_(1,b);
  x_(2,1), x_(2,2), ..., x_(2,b);
  dots.v, dots.v, dots.down, dots.v;
  x_(a,1), x_(a,2), ..., x_(a,b);
)} "t.c." x_(a,b) in bb(R) $

== Proprietà matrici

Una matrice $r in M_(a times b)(bb(R))$ si dice:
- *quadrata*: se il numero delle righe è uguale a quello delle colonne $a = b$
- *diagonale*: se è quadrata e tutti gli elementi non appartenenti alla diagonale sono $0$
- *triangolare superiore*: se tutti gli elementi sotto la diagonale sono $0$
- *triangolare inferiore*: se tutti gli elementi sopra la diagonale sono $0$
- *simmetrica*: se è quadrata e è simmetrica rispetto alla diagonale $m_(i,j) = m_(j,i)$
- *antisimmetrica*: se è quadrata e $m_(i,j) = -m_(j,i)$

== Matrice trasposta

Data una matrice $M in M_(a times b)(bb(R))$, la matrice $M^T$ è detta trasposta di $M$ se:
- $M^T in M_(a times b)(bb(R)) "t.c." $ vengono scambiate le righe con le colonne

== Prodotto tra matrici

$ mr(m in M_(a times b)(bb(R))) dot mb(n in M_(b times c)(bb(R))) = mg(r in M_(a times c)(bb(R))) "con " mg(r_(i,j)) = sum_(l=1)^b mr(m_(i,l)) dot mb(n_(j,l)) $

Il prodotto tra matrici è @commutativa ma non @associativa.

= Sistemi lineari

Il metodo di Gauss elimina le righe che sono *combinazioni lineari* delle altre _(sono superflue)_.

In un sistema ridotto a scalini, ogni riga _(diversa da $0$)_ *non* è una combinazione lineare di un'altra riga.

== Sistemi omogenei

Un sistema si dice omogeneo quando tutti i valori noti sono $0$.

== Numero di soluzioni di un sistema lineare

Un sistema lineare ha $0$, $1$ o $infinity$ soluzioni.

Esiste una soluzione (non ci sono righe vuote con il coefficiente $!= 0$)?
- No: il sistema ha *zero* soluzioni
- Si: il *numero di soluzioni* è lo stesso del *sistema omogeneo* associato (ovvero si possono ignorare i coefficienti)

== Sistemi e classi di equivalenza

L'insieme dei sistemi è partizionato da una relazione di equivalenza che li divide in classi, ognuna delle quali composta da sistemi riducibili tra loro attraverso il metodo di Gauss.

= Spazi vettoriali

Le proprietà da verificare sono spesso:
- chiusura sulla somma $+$
- chiusura sul prodotto $dot$

== Sottospazi vettoriali

Un sottoinsieme è un sottospazio se è esso stesso uno spazio vettoriale, quindi rispetta le due chiusure.

Il metodo più efficace per verificare è di prendere una generica _(quindi con le lettere)_ combinazione lineare, fattorizzare e verificare che vengano ancora rispettate le regole del sottoinsieme.

Un sottospazio vettoriale deve sempre contenere l'elemento $0$.

L'intersezione tra due sottospazi vettoriali è anche essa un sottospazio vettoriale.

L'union tra due sottospazi vettoriali *non* è detto che si aun sottospazio vettoriale.

La somma tra due sottospazi vettoriali è anche essa un sottospazio vettoriale.

Siano $U, W$ dei sottospazi vettoriali di $V$:
$ dim(U) + dim(W) = dim(U sect W) + dim(U+W) $

== Indipendenza lineare

Per verificare che degli elementi (spesso vettori) sono *linearmente indipendenti* basta verificare che la soluzione all'equazione _combinazione lineare degli elementi_ $= 0$ è soddsfatta solo dalla soluzione banale $0$:
$ c_1(e_1) + ... + c_n(e_n) = 0 quad --> quad e_1, ..., e_n = 0 $

_Nota_: in un qualsiasi equazione di un sistema, ridotto con Gauss ad una matrice a scalini, le righe $!= 0$ sono linearmente indipendenti (*se tutte le variabili sono legate*). Omettere tutti gli elementi che sono moltiplicati con le variabili non legate permette di ottenere solo gli elementi linearmente indipendenti.

== Basi e Copertura

Una base di uno spazio vettoriale è una sequenza (*ordinata*) di elementi _(spesso vettori)_ che è *linearmente indipendente* e *copre* _(span)_ tutto lo spazio.

Per verifica che copra tutto lo spazio basta cercare se esistono soluzioni all'equazione $c_1(e_1) + ... + c_n (e_n) = "condizioni dello spazio"$, ad esempio:

$ P_1 = {a+b x | a,b in bb(R)}, quad "Basi" = angle.l 1+x, 1-x angle.r \
  c_1(1+x) + c_2(1-x) = a + b x \
  c_1 = (a+b)/2, quad c_2 = (a-b)/2 $

Una sequenza di elementi è una base se e solo se ogni elemento dello spazio vettoriale può essere espressa come combinazione lineare degli elementi della sequenza in uno e solo un modo.

Per estrarre una base da uno spazio vettoriale è sufficiente parametrizzare ("raccogliere") rispetto alle costanti. Gli elementi ottenuti sono una base:
$ { a + b + c x^2 | a - 2b = 0 } -> { 2b + b x + c x^2 | b,c in bb(R)} \
  b(2 + x) + c(x^2) quad -> quad "Base" = angle.l 2+x, x^2 angle.r $


== Rappresentazione di un elemento rispetto ad una base

La rappresentazione di un elemento _(spesso un vettore)_ rispetto ad una base è il vettore dei *coefficienti* da assegnare alla *combinazione lineare* degli elementi della base per ottenere l'elemento che vogliamo raggiungere:
$ "Basi" = angle.l vec(1,0), vec(0,1) angle.r, quad arrow(a) = vec(5,4) \
  c_1 vec(1,0) + c_2 vec(0,1) = vec(5,4) quad -> quad c_1 = 5, c_2 = 4 quad -> quad "Im"(arrow(a)) = vec(5,4) $
_Nota:_ dato che le basi sono le basi "standard" del piano 2D, allora la rappresentazione è la stessa del vettore stesso.

== Dimensione di uno spazio vettoriale

La dimensione di uno spazio vettoriale è la *dimensione* (numero di elementi) di una *qualsiasi sua base*. Tutte le basi di uno spazio vettoriale sono della *stessa dimensione*.

== Rango di un sistema

Il rango (rank) di una matrice è il numero di righe del sistema che hanno variabili legate come primo elemento non nullo _(righe non nulle a "scalini")_.

Per ogni sistema lineare con $n$ incognite e rango (della matrice associata) $r$, il numero di variabili *non legate* è $n - r$

== Isomorfismo tra spazi vettoriali

Un isomorfismo tra due spazi vettoriali $V$ e $W$ è una funzione $f : V -> W$ che preserva la struttura:
$ f(arrow(v_1) + arrow(v_2)) = f(arrow(v_1)) + f(arrow(v_2)) $

Proprietà da verificare:
- $f$ deve essere biiettiva: $arrow(v_1), arrow(v_2) in V, quad f(arrow(v_1)) = f(arrow(v_2)) -> arrow(v_1) = arrow(v_2)$
- chiusura sulla somma: $arrow(v_1), arrow(v_2) in V, quad f(arrow(v_1) + arrow(v_2)) -> f(arrow(v_1)) + f(arrow(v_2))$
- chiusura sulla moltiplicazione: $arrow(v_1), arrow(v_2) in V, quad f(arrow(v_1) dot arrow(v_2)) -> f(arrow(v_1)) dot f(arrow(v_2))$

_Esempio:_ $P_2$ (polinomi) isomorfo a $bb(R)^3$:
$ f(a_0 + a_1 x + a_2 x^2) = vec(a_0, a_1, a_2) quad f(1 + 2x + 3 x^2) = vec(1,2,3) $

=== Risultati su isomorfismi

Un isomorfismo mappa sempre un elemento $0$ all'elemento $0$.

Un isomorfismo preserva la combinazioni lineari tra gli spazi vettoriali mappati:
$ f(c_1 arrow(v_1) + ... + c_n arrow(v_2)) = c_1 f(arrow(v_1)) + ... + c_n f(arrow(v_n)) $

L'inverso di un isomorfismo è esso stesso un isomorfismo.

Gli isomorfismi sono una relazione di equivalenza tra spazi vettoriali.

Degli spazi vettoriali possono avere un isomorfismo solo se hanno la stessa dimensione.

Ogni spazio vettoriale è isomorfo ad uno e un solo $R^n$.

== Automorfismo tra spazi vettoriali

Un automorfismo è un isomorfismo di uno spazio vettoriale su sè stesso.

Esempio: $f : bb(R)^2 -> bb(R)^2 |-> a -> 2 a$ _(dilata tutti i vettori del doppio)_

Gli automorfismi dimostrano che tutto lo spazio di uno spazio vettoriale è uguale, uniforme (si comporta in modo uguale spostando gli elementi)!

== Trasformazione lineare (Omomorfismo)

Un omomorfismo è una funzione tra due spazi vettoriali $h : V -> W$ che è preserva la somma e la moltiplicazione per scalare:
$ arrow(v_1), arrow(v_2) in V, quad h(arrow(v_1) + arrow(v_2)) = h(arrow(v_1)) + h(arrow(v_2)) $
$ arrow(v) in V, r in bb(R), quad h(r arrow(v)) = r + h(arrow(v)) $

Ogni isomorfismo è anche un omomorfismo (ma non è detto il contrario).

Un omomorfismo trasforma le basi di uno spazio vettoriale $V$ nelle basi dello spazio vettoriale $W$. L'omomorfismo che le trasforma è unico.

L'insieme delle trasformazioni lineari da $V$ a $W$ è esso stesso uno spazio vettoriale, sottospazio dell'insieme delle funzioni da $V$ a $W$.

La combinazione di due applicazioni lineari è rappresentata dalla moltiplicazione delle due matrici rappresentative _(nell'ordine corretto)_:
$ f circle.small g = "Rep"(f) dot "Rep"(g) $

=== Estensione lineare

Un omomorfismo non ha bisogno per forza della definizione della funzione trasformazione, basta avere i valori delle nuove basi. Avendo i valori delle nuove basi è possibile trasformare qualsiasi elemento dello spazio vettoriale (estensione lineare).

== Kernel (Null space)

Il *kernel* (nucleo) di una trasformazione lineare $h : V -> W$ è la controimmagine di $arrow(0)_W$
$ "Ker"(h) = h^(-1) (arrow(0)_W) = { arrow(v) in V | h(arrow(v)) = arrow(0)_W } subset.eq V $

La dimensione del kernel è la *nullità* della trasformazione lineare.

La somma tra il *rango* _(oppure l'immagine)_ della trasformazione lineare e la *nullità* della trasformazione lineare è uguale alla *dimensione del dominio* della trasformazione. Intuitivamente, se il dominio viene ridotto, allora sorgono dei kernel, quindi la nullità cresce.

Il kernel è un sottospazio vettoriale.

Una trasformazione è iniettiva se il kernel è $0$.

== Immagine

L'*immagine* di una trasformazione lineare $h : V -> W$ sono tutti gli elementi "raggiungibili" da $V$:
$ "Imm"(h) = { arrow(w) in W | exists arrow(v) in V | h(arrow(v)) = arrow(w) } subset.eq W $

L'immagine è un sottospazio vettoriale.

= Matrici

== Matrice permutazione

Matrice che ha esattamente un $1$ per ogni riga e un $1$ per ogni colonna (ma non nella diagonale principale). L'effetto è quello di permutare le righe (se moltiplicata da sinistra) o le colonne (se moltiplicata da destra).

== Matrice inversa

La matrice inversa di una matrice $A$ è la matrice che moltiplicata alla matrice originale porta alla matrice identità: $A A^(-1) = I$

Se esiste, la matrice inversa è unica.

La matrice inversa di una moltiplicazione tra matrici è distributiva: $(G H)^(-1) = H^(-1) G^(-1)$ (l'ordine è inverso!).

Una matrice è invertibile se e solo se il suo determinante è $!= 0$.

Per calcolare l'inversa di una matrice invertibile, si può sfruttare la riduzione di Gauss-Jordan, riducendo la matrice orlata con la matrice identità
$ mat(4,-2,3, 1,0,0; 1,2,5, 0,1,0; 0,-3,-1, 0,0,1; augment: #3) $

Dopo aver ridotto (sia renderla a scalini, che rendere tutti gli elementi a destra dei pivot $0$, quindi sia verso il basso che verso l'alto), la matrice inversa è l'orlo (dove c'era la matrice identità).

== Equivalenza tra matrici

L'insieme delle matrici è partizionato dalla relazione di equivalenza che associa matrici dello stesso rango.

== Determinante di una matrice

Il determinante di una matrice determina se essa è invertibile (o non singolare).

Determinante di una matrice $2 times 2$: $mat(a,b;c,d) = a d - b c$

Determinante di una matrice $3 times 3$: (3 diagonali da sinistra a destra) - (3 diagonali da destra a sinistra)

Determinante di una matrice $n times n$: ridurre con Gauss, una volta che è a scalini, moltiplicare la diagonale. _NB:_ quando vengono scambiate delle righe, il determinante cambia di segno.

Il determinante della matrice trasposta è uguale al determinante della matrice: $det(A) = det(A^T)$

Il determinante è moltiplicativo: $det(A B) = det(A) det(B)$

Il determinante della matrice inversa è il reciproco: $det(A^(-1)) = 1/det(A)$

Il determinante si comporta in maniera multilineare:
$ det(r_1 + ... + r_i + r_j + ... + r_n) = det(r_1 + ... + r_i + ... + r_n) + det(r_1 + ... + r_j + ... + r_n) $
$ det(r_1 + ... + k r_i +... + r_n) = k det(r_1 + ... + r_i + ... + r_n) $

Esempio: $ det(mat(1,2;3,4)) = det(mat(1,0;3,4)) + det(mat(0,2;,3,4)) $

=== Formula di Laplace

È possibile calcolare il determinante di una matrice attraverso la formula di Laplace: scegliendo una qualsiasi riga o colonna di entrare della matrice $a_1, ..., a_n$ e sommando i cofattori calcolati.

Un cofattore è il determinante della matrice ottenuta rimuovendo la riga e la colonna associata all'elemento e con segno positivo se riga+colonna è pari, segno negativo altrimenti.

== Regola di Cramer

Dato un sistema lineare $A arrow(x) = arrow(b)$, se il determinante di $A != 0$, allora è possibile calcolare il valore delle incognite, ottenendo la matrice $B_i$ sostituendo la $i$-esima colonna con il vettore $arrow(b)$:
$ x_i = det(B_i) / det(A) $
Se qualsiasi matrice $B_i$ ha determinante $0$, allora il sistema non ha un'unica soluzione

== Diagonalizzabilità



= Polinomi

È possibile scomporre il polinomio $p(x)$ in un quoziente e un resto in modo che:
$ p(x) = d(x) dot q(x) + r(x) $
dove il grado di $d(x)$ è minore del grao di $d(x)$.

Se $lambda$ è la radice di un polinomio $p(x)$, allora $(x - lambda)$ divide $p(x)$ senza resto (ovvero è un fattore di $p(x)$).

== Fattorizzazione sui numeri reali

- Ogni polinomio di grado $0$ è irriducibile
- Ogni polinomio di grado $1$ è irriducibile
- Un polinomio di grado $2$ è irriducibile se il suo discriminante è negativo
- Nessun polinomio di grado $>2$ è irriducibile
