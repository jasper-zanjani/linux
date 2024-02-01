    # Collect system configuration details
    # Without arguments, the report will be generated and stored in $TMPDIR
    sosreport

    # Specify alternative temporary directory
    sosreport --tmp-dir /opt

    # Specify alternative compression (`xz` by default)
    sosreport --compression-type gzip

    # Generate report for only specific plugins
    sosreport -o apache --batch