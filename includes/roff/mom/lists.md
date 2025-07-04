Bulleted lists begin with the [`LIST`](https://www.schaffter.ca/mom/momdoc/docelement.html#list) macro with no arguments.

```groff title="mom/03" hl_lines="10-16"
--8<-- "includes/roff/mom/03.mom"
```

In fact, for any other list type LIST requires an enumerator, but the default is the bullet.
Various kinds of bullet types can be defined by providing LIST with one argument (enumerator) or two (enumerator and separator). (1)
{: .annotate }

1.  For example, the same example above but using lowercase roman numerals:

    ```groff title="mom/04" hl_lines="10"
    --8<-- "includes/roff/mom/04.mom"
    ```
