The term _macro_ is often used interchangeably with request, however strictly speaking a macro is a custom sequence of requests defined by the user.
The reason for the confusion is that roff has long been used with one of several [_macro packages_](https://www.gnu.org/software/groff/manual/groff.html#Macro-Package-Intro), collections of macro definitions like mom, man, or ms.
These packages have existed for so long that their macros have become synonymous with base roff itself.
roff documents that do not use a macro package are called _raw_.

Custom macros are defined with `de` and delimited with `.`

```groff
." Top margin
.de TM
.sp 1i
..

." Bottom margin
.de BM
.bp
..
```
