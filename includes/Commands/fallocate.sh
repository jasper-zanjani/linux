# Create a sparse file of a given size
fallocate -l 1GB $FILENAME # 1 gigabyte
fallocate -l 1G $FILENAME  # 1 gibibyte