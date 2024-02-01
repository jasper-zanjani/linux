# Display ELF header
readelf -h /bin/ls # (2)
      # --file-header 

# Display program header table
readelf -l /bin/ls # (1)
      # --program-headers

# section header table
readelf -S /bin/ls # (3)
      # --sections
      # --section-headers

# symbol table
readelf -s /bin/ls # (4)
      # --symbols
      # --syms

# ELF file header data
readelf -e /bin/ls # (5)
      # --headers

# relocation entries
readelf -r /bin/ls # (6)
      # --relocs

# dynamic segment
readelf -d /bin/ls # (7)
      # --dynamic