# Scan hosts from a text file
nmap -iL hosts.txt

# Identify a host's operating system
nmap -A localhost.example.com

# Determine whether a host has a firewall enabled
nmap -sA localhost.example.com

# Scan a specified range of ports
nmap -p 10-300 localhost.example.com

# Perform a SYN TCP scan, stealthier than the TCP connect scan
nmap -sT localhost.example.com

# Aggressive scan
nmap -A 192.168.1.0/24

# Ping scan home network (not bothering with ports)
nmap -sn 192.168.1.0/24

# Fast port scan using SYN packets
nmap -sS -F 192.168.1.0/24

# Port scan using SYN ("synchronize") packet, first element of TCP handshake
nmap -sS 192.168.1.0/24

# Port scan using normal TCP
nmap -sT 192.168.1.0/24

# Port scan using UDP
nmap -sU 192.168.1.0/24

# Xmas scan
nmap -sX

# Scan a range of IP addressess
nmap 192.168.27.0/24 > hosts.txt

# Identify operating system and scan ports using TCP SYN packets
nmap -O -sS 192.168.27.0/24 > hosts.txt
