## Teoremi

- (1) [Teorema di unicità dell'elemento neutro per una operazione associativa](#teorema-di-unicità-dellelemento-neutro-e-dellinverso-per-operazione-associativa) _(Lez2)_
- (1) [Teorema di unicità dell'elemento inverso per una operazione associativa dotata di elemento neutro](#teorema-di-unicità-dellelemento-neutro-e-dellinverso-per-operazione-associativa) _(Lez2)_
- Teorema di partizione di un insieme nelle classi di equivalenza indotte da una relazione di equivalenza data _(Lez3)_
- Teorema di esistenza della divisione euclidea _(Lez4)_
- Esistono infiniti numeri primi _(Lez5)_
- Teorema di Ruffini _(Lez7)_

## (1) Teorema di unicità dell'elemento neutro e dell'inverso per operazione associativa

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
