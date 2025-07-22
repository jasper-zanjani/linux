By default, text is adjusted at both margins, or fully justified.

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/raven-00.roff"
```

```
--8<-- "includes/roff/raw/raven-00-output.txt"
```

</div>

Filling can be disabled with `nf`, preserving newlines.

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/raven-01.roff"
```

```
--8<-- "includes/roff/raw/raven-01-output.txt"
```

</div>

Manual line breaks can be inserted even in filled text with `br`.

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/raven-02.roff"
```

```
--8<-- "includes/roff/raw/raven-02-output.txt"
```

</div>

Justification can be disabled with `na` ("no adjust"), producing text that is not perfectly even but still filled. 
Adjustment can be enabled again with `ad`, which takes an optional argument.

-   `b` (default) adjust both margins
-   `l` adjust left margin only
-   `r` adjust right margin only
-   `c` center filled line between margins (?)

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/raven-03.roff"
```

```
--8<-- "includes/roff/raw/raven-03-output.txt"
```

</div>

Text cannot be justified it is not filled.
Here we see that `ad b` (which should produce fully adjusted text) has no effect because filling is disabled.

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/raven-04.roff"
```

```
--8<-- "includes/roff/raw/raven-04-output.txt"
```

</div>

Adjustment requests do not insert breaks, so they must be manually inserted.

<div class="grid cards" markdown>

```groff
--8<-- "includes/roff/raw/utp-4-2.roff"
```

```
--8<-- "includes/roff/raw/utp-4-2-output.txt"
```

</div>


