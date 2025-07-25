The body of all loops is bracketed between **do** and **done**.

<div class="grid cards" markdown>

-   Sequences of numbers can be generated by placing a number range between single braces

    ```sh
    for i in {01..07}
    do 
        # Doing stuff...
    done
    ```

-   Spaces delimit elements of an array

    ```sh
    for i in 1 2 3 4 5
    do 
        # Doing stuff...
    done
    ```


-   Extracting audio from mp4 files in the current working directory

    ```sh
    for f in *.mp4
    do 
        ffmpeg -i $f ${f/.mp4/.wav} 
    done
    ```

-   Traditional C-style for loop

    ```sh
    for ((i=0; i<N; i++))
    do 
        # Doing stuff...
    done
    ```

</div>

