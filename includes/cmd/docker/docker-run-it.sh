# Create a Hyper-V container interactively
docker run -it --isolation=hyperv microsoft/windowsservercore powershell

# Bind port 80 of the container to port 8080 of the host
docker run -it -p 8080:80 microsoft/windowsservercore powershell

# Create a container with a static IP address on the network you created
docker run -it --network=$NETWORK --ip=10.0.0.16 --dns=10.0.0.10 microsoft/windowsservercore powershell
