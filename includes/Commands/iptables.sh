# Display rules as written on disk
iptables -S 
#        --list-rules

# Reload configuration file
iptables -F 
#        --flush

# Accept SSH traffic from a particular IP
iptables -A INPUT -p ssh -s '10.0.222.222' -j ACCEPT
#        --append INPUT --protocol ssh --source '10.0.222.222' --jump ACCEPT

# Allow incoming SSH connections only from a single IP address
iptables -A INPUT -p tcp --dport 22 -j DROP
iptables -A INPUT -p tcp --dport 22 -s 1.2.3.4 -j ACCEPT

# Accept incoming TCP traffic to port 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Change FORWARD chain policy. By default, the INPUT chain accepts incoming packets.
# However, this policy can be changed by specifying a DROP rule specification.
iptables -P FORWARD ACCEPT
#        --policy

# Do not respond to pings
iptables -t filter -A INPUT -p icmp -j DROP
#        --table filter --append INPUT --protocol icmp --jump DROP