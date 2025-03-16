**coredumpctl** is a tool that can be used to retrieve and process core dumps saved by **systemd-coredumps**.

```sh
# Display captured core dumps
coredumpctl


coredumpctl -q list

# Retrieve core dump metadata matching a specified PID
coredumpctl info $PID
```
