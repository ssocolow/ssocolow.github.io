---
title: "Group Theory Explainer"
date: 2024-12-5
categories:
  - math
tags:
  - info
  - study
mathjax: true
---

# Group Theory
I learned group theory from Misha for Michaelmas term and his last assignment was for us to create a document to help us remember what we've learned in the course. I think this final assignment was helpful because it forced me to create a cohesive big-picture view of the subject as a whole. The original latex is [here](https://www.overleaf.com/read/bxwmnpfssjmq#d4739b), this markdown was generated with pandoc.

# Groups

Definition of a Group: Let G be a set and \* be a binary operation. Then
(G, \*) is a group if:

-   \* is a associative: so if
    $g_1,g_2,g_3 \in G, g_1*(g_2*g_3) = (g_1 * g_2) * g_3$

-   G contains an identity element (which I will denote as $e$): there
    is $e \in G$ where for any $g \in G$, $g*e=e*g=g$

-   every element of G has an inverse: if $g \in G$, there exists
    $g^{-1} \in G$ where $g*g^{-1}=g^{-1}*g=e$

-   G is closed under \*: for any $g_1, g_2 \in G, g_1*g_2 \in G$

If $G$ is finite, we write $|G|$ for the number of elements in $G$. Note
that people usually write $g_1g_2$ to mean $g_1*g_2$.

## Examples

The integers under addition is a group with $e = 0$ and $g^{-1}=-g$. The
cyclic group of two elements, $C_2$, is a group $\{e,a\}$ where $aa=e$.
$C_3$ is a group $\{e,a,a^2\}$ where $a^2 = aa$ and $a^3=e$. In general,
the cyclic group $C_n$ is like a clock with $n$ points (and is the "same
as\" = isomorphic to the integers mod n). There are other cool groups
like the [symmetric
group](#https://en.wikipedia.org/wiki/Symmetric_group), [dihedral
group](#https://en.wikipedia.org/wiki/Dihedral_group), the [free
group](#https://en.wikipedia.org/wiki/Free_group), \... I would like to
remember that taking time to play around with groups is generally worth
it - seeing how they interact makes it easier to reason about them.

## Homomorphism

A map of groups $\phi: (G_1, \ast) \to (G_2, \circ)$ is called a
*homomorphism* if it preserves the group operation:
$$\phi(g \ast h) = \phi(g) \circ \phi(h) \quad \text{for all } g, h \in G_1.$$

I found concrete examples of homomorphisms hard to find so here is one:
the homomorphism defined from $\mathbb{Z}$ to $\mathbb{Z}\text{ mod 3}$
as $0+3n\xrightarrow{}0, 1+3n\xrightarrow{}1,2+3n\xrightarrow{}2$ where
$n$ is an integer.

## Isomorphism

One important question in group theory is: given two groups A and B, is
A the "same\" as B? One great definition of "sameness\" of two groups is
an isomorphism. An isomorphism is a map between two groups that
preserves their structure and is also reversible. Formally, an
isomorphism is a bijective homomorphism. Remember that "bijective\"
means both injective (one-to-one) and surjective (onto).

## Conjugation

Two elements $h,k \in G$ are *conjugate* in $G$ if there exists $g\in G$
such that $h=g^{-1}kg$. Conjugation of an element $k$ *by* an element
$g$ gives $g^{-1}kg$. If $b=g^{-1}kg$ then $b$ and $g$ are in the same
conjugacy class. I found conjugacy classes hard to wrap my head around.
Conjugacy classes partition a group, and we can see this with
$D_6=\{e,r,r^2,s,sr,sr^2\}$, the symmetries of the triangle under
rotation and reflection. The rotations $\{r,r^2\}$ are a conjugacy class
because if we conjugate a rotation by any rotation we will end up with a
rotation and if we do so with any reflection we will end up reflecting
twice so also end up with a rotation.

# Subgroups

Basically, a subgroup is a group that exists inside a group. Definition:
$(H,*)$ is a subgroup of $(G,*)$ if $H \subseteq G$ and $(H,*)$
satisfies the properties of a group. We write $H \leq G$.

## Lagrange's Theorem

If $G$ is finite and $H \leq G$, then $|H|$ divides $|G|$. For example,
one subgroup of the cyclic group $C_6$ is $C_2$ because $\{e,a^3\}$ is a
subgroup of $\{e,a,a^2,a^3,a^4,a^5\}$ and 2 divides 6.

## Normal Subgroups

A group $N$ is normal in $G$ if for every $n\in N$, conjugation by any
$g\in G$ gives an element of $N$. If $N$ is normal in $G$, we write
$N \triangleleft G$. Normal subgroups are important because they allow
for the creation of groups at another level of abstraction - quotient
groups.

# Quotient Groups

Quotient groups can be really confusing. I think that's because I had a
hard time visualizing them and how they work. To start, let $G$ be a
group and $H$ be a subgroup of $G$. $G/H$ is the set of (typically left)
[cosets](#https://en.wikipedia.org/wiki/Coset) of $H$ in $G$. So,
$G/H = \{gH |$ for all $g\in G\}$. Here, $gH$ means take the element
$g \in G$ and make a set containing the result of the group action of
$g$ with every element of $H$. There might be some $g_1,g_2 \in G$ where
$g_1H=g_2H$. You can think of the quotient $G/H$ as "modding out\" from
$G$ all the elements $g_1,g_2,...$ where $g_1H=g_2H=...$ so that you are
left with one element in $G/H$ that represents $g_1,g_2,...$. Example
below. If $N$ is a *normal* subgroup in $G$, then $G/N$ is a group with
group operation $g_1N * g_2N = (g_1g_2)N$.

## Example

The quotient group $\mathbb{Z}/8\mathbb{Z}$ is the integers mod 8 =
$\{0,1,2,3,4,5,6,7\}$. $8\mathbb{Z}$ are the multiples of 8 under
addition, so $8\mathbb{Z} =\{...,-16,-8,0,8,16,...\}$. If we take any
$g \in \mathbb{Z}$ (so any integer $g$), then
$g(8\mathbb{Z}) = \{...,-16+g,-8+g,0+g,8+g,16+g,...\}$. We can see that
$0(8\mathbb{Z})=8(8\mathbb{Z})$ because
$\{...,-16+0,-8+0,0+0,8+0,16+0,...\} = \{...,-16+8,-8+8,0+8,8+8,16+8,...\}$.

# First Isomorphism Theorem

If $\phi:G\xrightarrow{}H$ is a homomorphism between groups then the
kernel of $\phi$ is $\ker\phi=\{g\in G: \phi(g)=e_H\}$. So the kernel is
what elements in $G$ that $\phi$ sends to the identity in $H$. The image
of $\phi$ is the set of elements in $H$ that $\phi$ can send elements in
$G$ to. So Im$\phi=\{\phi(g):g\in G\}$. The First Isomorphism Theorem
tells us that $G/\ker\phi$ is isomorphic to Im$\phi$ by the map
$g\ker\phi\rightarrow{\phi(g)}$. I didn't understand why this was
important, but Peter helped me see that $G/\ker\phi$ can be thought of
as ["things in $G$ that don't map to the
identity\"](#https://www.math3ma.com/blog/the-first-isomorphism-theorem-intuitively)
which is a foundational fact about group structure which I would like to
remember.

# Free Groups

Free groups are the "most free\" kind of group because they have the
fewest restrictions on what elements are allowed to exist. There is a
theorem that any group is isomorphic to the quotient of a free group.
Definition: For any set $S$, the free group $F(S)$ are all the "reduced
words\" that can be created from the "alphabet\" $S$ (the alphabet
includes inverse characters). So if $S=\{a,b\}$ then $aa$ is a word,
$ab$ is a word, $ba$ is a word, and $a^{-1}b$ is also a word. The group
operation is concatenation, so $ab*ba=abba$. A word is "reduced\" if no
element is next to its inverse, so $aa^{-1}bab$ reduces to $bab$.

Having the background of computer science made me feel comfortable with
free groups because I could think of the free group elements as
variables representing strings and I know how string concatenation works
(just have to remember to simplify, e.g. $baa^{-1}=b$). I'd like to
remember that any group can be thought of as a free group with some
restrictions imposed. That segues nicely into

# Presentations

Presentations are just another way to define a group. When I talk about
$D_8$, the group of symmetries of the square under reflection and
rotation with the group operation being composition of those actions, I
can tell you the elements of $D_8$ are
$\{e,r,r^{2},r^{3},s,sr,sr^{2},sr^{3}\}$ where $r$ means a rotation by
$\frac{\pi}{2}$ and $s$ means a reflection about the vertical axis or I
could tell you that there are two generators $r$ - a rotation - and
$s$ - a reflection - , where $r^4=s^2=e$ (because rotating 4 times gets
you back where you started and flipping twice does too) and
$srs=s^{-1}$. So, I have the free group on the set $\{r,s\}$ but there
are restrictions on what elements can exist. In the notation, I would
write $D_8=<r,s|r^4=e,s^2=e,srs=s^{-1}>$. I struggled with identifying a
group from it's presentation - even if it was obvious!. I'd like to
remember that anything familiar can be made unfamiliar if you view it
from a different perspective.

# Jordan-Holder Theorem

A group can contain nested subgroups, and one of the biggest questions
in group theory is how we can analyze a group by breaking it into
smaller pieces to see the structure of the bigger group. A finite group
$G$ has a *composition series*
$\{e\}\triangleleft G_1 \triangleleft ... \triangleleft G_n=G$ where
$G_1,...,G_n$ are subgroups of $G$. The Jordan-Holder Theorem (JHT) is
very similar to the fundamental theorem of arithmetic (the
prime-factorization theorem: "every integer greater than 1 can be
represented uniquely as a product of prime numbers, up to the order of
the factors\"). What the JHT tells us is: if $G$ is a finite group, all
composition series of $G$ have the same length and the same composition
factors, in some order. So you can kind of think that the composition
factors for the group are like the prime factors for a number (but there
can be different groups with the same composition factors). For an
example, we can see that the composition factors of $D_8$ are
$C_2,C_2,C_2$. We can write the composition series as
$\{e\}\triangleleft C_2 \triangleleft C_4 \triangleleft D_8$ or
$\{e\}\triangleleft C_2 \triangleleft D_4 \triangleleft D_8$ where
$D_4=C_2\times C_2$. I didn't realize I could put $D_4$ in the
composition series for $D_8$ on week 5's problem set. I'd like to
remember that the same group composition factors can join into a bigger
group structure in different ways - that $C_8$ has the same composition
series as $D_8$ but they are DIFFERENT groups.

## Classification of Finite Simple Groups

Simple groups are groups with no proper (different than the original
group) nontrivial (different than $\{e\}$) normal subgroups. A landmark
achievement in group theory was the [classification of finite simple
groups](#https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups).
Humanity now knows which exact group types are the building blocks for
ALL finite groups (because of the Jordan-Holder Theorem). There are some
crazy finite simple groups, like the
[Monster](#https://www.youtube.com/watch?v=mH0oCDa74tE).

# Semi-Direct Products

First, what is a direct product? A direct product combines two groups
and forms a new group, but the elements from the two groups don't
interact. For example,
$\mathbb{Z}\times\mathbb{Z}=\{(a,b):a,b\in\mathbb{Z}\}$. So the direct
product of the integers with itself gives the group of points on the
Cartesian (integer) plane. And $(a,b)*(c,d)=(a*c,b*d)$. Semi-direct
products are more interesting because they let elements in both groups
interact. To define a semi-direct product, it will be helpful to know
what an automorphism is. An automorphism is an isomorphism from a group
to itself. The identity automorphism sends every element back to itself,
and a non-identity automorphism basically relabels elements but
crucially maintains the structure of the group (so the identity element
is always sent to itself). If we have two groups $H$ and $N$, and a
homomorphism $\phi:H\xrightarrow{}Aut(N)$, we can define
$(N \rtimes H, \circ)$ to be the set of pairs $(n,h):n\in N,h\in H$ with
the group operation
$(n_1,h_1)\circ(n_2,h_2)=(n_1\phi(h_1)(n_2),h_1,h_2)$. $\phi(h_1)$ is an
automorphism of N, so it will relabel $n_2$ to be another (or the same)
element in $N$. I was confused whether the automorphisms of $N$ was the
same as conjugation. I would like to remember that statements like the
one I just made are ambiguous because "conjugation\" is not an action -
"conjugation *by* an element is an action. Similarly, saying a group $N$
is normal doesn't mean anything - the property of being normal requires
a group $G$ to be normal *in*. Big people also get confused with these
specifics sometimes. In the case of automorphisms of a group $N$, there
are inner automorphisms of $N$ (which are conjugations of elements of
$N$ *by* elements of $N$) and outer automorphisms (conjugation of
elements of $N$ by elements outside the subgroup $N$). For the
homomorphism $\phi:H\xrightarrow{}Aut(N)$, I think
$\phi \text{ sends } h\xrightarrow{}(n\xrightarrow{}hnh^{-1})$.

# Sylow's Theorems

Given a group with a certain number of elements, what do we know about
the subgroups that exist within this group? Lagrange's Theorem tells us
the order of a subgroup divides the order of the group. Ok, but wouldn't
it be nice to know
*[which](#https://math.stackexchange.com/questions/4415922/why-are-sylow-theorems-and-sylow-subgroups-significant)*
divisors of the group correspond to subgroups? To answer this question,
Sylow's Theorems are useful. If $G$ is a group with order $p^am$ where
$p$ is prime and $p$ doesn't divide $m$, we call a subgroup $H$ of $G$ a
Sylow p-subgroup if $H$ has order $p^a$. For a finite group $G$ and
prime number $p$, we can uniquely write $|G|=p^am$ where $a\geq0$,
$m\geq1$ and $p$ does not divide $m$. Sylow's First Theorem tells us
that there is a Sylow p-subgroup of $G$. Sylow's Second Theorem tells us
that two Sylow p-subgroups are conjugate, so if there are multiple
p-subgroups we can get between all of them through conjugation with
elements in $G$. Sylow's Third Theorem says $n_p$, the number of Sylow
p-subgroups, is congruent to $1$ mod $p$ and $n_p$ divides $m$. I
struggled using Sylow's Theorems to show that a group of order $pq$
(where $p$ and $q$ are prime) was simple. I would like to remember that
these theorems are useful to count the number of p-subgroups in a bigger
group, and if that number is 1 then we know the bigger group is not
simple because that p-subgroup is normal in the bigger group. A more
general takeaway is that Sylow's Theorems gives us insight into what
kind of subgroups (order $p^a$) - and how many - exist within a finite
group.