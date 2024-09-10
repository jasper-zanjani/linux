# Elasticsearch

<div class="grid cards" markdown>

-   #### Architecture

    ---

    An Elasticsearch cluster is made up of multiple [nodes](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html), each of which runs an instance of Elasticsearch.
    Each node has a config at **/etc/elasticsearch.yml** which designates the cluster it belongs to (**cluster.name**).

    Nodes can be:

    - **Primary-eligible nodes**: Every node is primary-eligible unless it is excluded specifically. Each cluster elects a primary node from among the primary-eligible nodes.
    - **Data nodes** store data shards and performs actions related to indexing, searching, and aggregating data.
    - **Client nodes**

-   #### Networking

    ---

    Each Elasticsearch node has two different [network interfaces](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-network.html#modules-network) which are configured separately in the configuration file. 

    - The **http** interface exposing REST APIs on port 9200
    - The **transport** interface used for binary communication between nodes on port 9300.

-   #### Certificates

    ---

    TLS is used for encryption and authentication of nodes by default.

    ```sh
    # When using TLS, any encrypted API call must be able to verify the certificate as well
    # as authenticate with username and password
    curl https://localhost:9200 --cacert $CA -u $USER:$PASSWORD

    # When TLS is enabled, any unencrypted API call will return an empty response
    curl localhost:9200 # => curl: (52) Empty reply from server
    ```

    This is enabled in the main config under **xpack.security.enabled**. (1)
    { .annotate }

    1. 
    ```yaml
    xpack.security.enabled: true
    xpack.security.authc.api_key.enabled: true
    xpack.security.http.ssl.enabled: true
    ```

    ??? info "Realms"

        The Elastic Stack authenticates users by using [**realms**](https://www.elastic.co/guide/en/elasticsearch/reference/current/realms.html) and one or more token-based authentication services.
        Realms refer to various means of authenticating providers that are explicitly specified under **xpack.security.authc.realms**.
        Multiple instances of many realms can be defined per node.

        The [native realm](https://www.elastic.co/guide/en/elasticsearch/reference/current/native-realm.html) refers to the use of REST APIs or Kibana to manage users, roles, and credentials.
        It is enabled by default but can be disabled.

        In [file-based authentication](https://www.elastic.co/guide/en/elasticsearch/reference/current/file-realm.html), users and roles are read from the **users** and **users\_roles** files, which are managed locally by the node (not the cluster). (1)

        1. 
        ```sh title="From /usr/share/elasticsearch"
        # Add user
        ./bin/elasticsearch-users useradd $USERNAME -p $PASSWORD

        #Confirm
        cat /etc/elasticsearch/users

        # Add role
        ./bin/elasticsearch-users roles --add superuser $USERNAME

        # Confirm
        ./bin/elasticsearch-users list # => "testuser       : superuser"
        ```

        In [PKI user authentication](https://www.elastic.co/guide/en/elasticsearch/reference/current/pki-realm.html), clients connecting to Elasticsearch must present X.509 certificates which are first accepted on the SSL/TLS layer before being optionally further validated by a PKI realm.

        rdeniro
        apacino

        ```yaml title="/etc/elasticsearch/elasticsearch.yml"
        xpack:
          security:
            authc:
              realms:
                pki:
                  pki1:
                    order: 1
        ```

</div>

## Tasks

<div class="grid cards" markdown>

-   #### Installation

    ---

    === ":material-docker: Docker"

        ```sh
        # Elasticsearch needs at least 18 bits of memory mapped areas
        sysctl -w vm.max_map_count=262144

        # Create network
        docker network create elastic

        # Pull the image
        docker pull docker.elastic.co/elasticsearch/elasticsearch:8.14.1

        # Run first node
        docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.14.1

        # Copy CA certificate
        docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .

        # Confirm node is up using TLS
        curl --cacert http_ca.crt -u elastic:$ELASTIC_PASSWORD https://localhost:9200

        # Generate enrollment token for new node
        docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node

        # Run additional node
        docker run -e ENROLLMENT_TOKEN=$ENROLLMENT_TOKEN --name es02 --net elastic -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.14.2 
        ```

    [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.17/rpm.html#rpm-repo) provides directions for installation to RPM distributions.

    ```sh
    # Download and install the public signing key.
    rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    ```

    Install the repository (note that it is disabled deliberately)

    ```ini title="/etc/yum.repos.d/elasticsearch.repo"
    [elasticsearch]
    name=Elasticsearch repository for 7.x packages
    baseurl=https://artifacts.elastic.co/packages/7.x/yum
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
    enabled=0
    autorefresh=1
    type=rpm-md
    ```

    ```sh
    # Download the package without enabling the repo for future updates
    dnf download --enablerepo=elasticsearch --arch x86_64 elasticsearch

    # Verify the package
    rpm -K elasticsearch-7.17.21-x86_64.rpm # => elasticsearch-7.17.21-x86_64.rpm: digests signatures OK

    # Install the package
    rpm -Uvh elasticsearch-7.17.21-x86_64.rpm
    ```

    The node will not be available from the network until the **http.host**

    ```yaml
    # Enable access from all network interfaces
    http.host: 0.0.0.0
    ```

    !!! info "Memory"

        Elasticsearch needs at least [262,144 (2<sup>18</sup>) memory-mapped areas](https://www.elastic.co/guide/en/elasticsearch/reference/8.14/max-size-virtual-memory-check.html).
        Memory map areas are used by various system calls such as [malloc, mmap, and mprotect](https://access.redhat.com/solutions/99913).
        On Linux, the **vm.max\_map\_count** kernel setting controls this and is set too low by default.
        If the limit is not changed any instance of Elasticsearch will fail its bootstrap checks.

        ```sh
        # By default, Linux has this value set to 65530.
        sysctl vm.max_map_count

        # Revise the value to allow Elasticsearch to start
        sysctl -w vm.max_map_count=262144
        ```

-   #### [Reconfigure a node to join an existing cluster](https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html#_reconfigure_a_node_to_join_an_existing_cluster_2)

    ---

    If security has been auto-configured, then a node enrollment token can be generated from one node to allow another node to join.

    ```sh
    # Generate a node enrollment token from any node in the existing cluster
    cd /usr/share/elasticsearch
    TOKEN=./bin/elasticsearch-create-enrollment-token -s node

    # Reconfigure the new node with the enrollment token
    cd /usr/share/elasticsearch
    ./bin/elasticsearch-reconfigure-node --enrollment-token $TOKEN
    ```

-   #### Access API

    ---

    To verify the status of a cluster's nodes, run the [cat nodes API](https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-nodes.html).
    When **xpack.security.enabled: true** curl will require both:
    
    - Valid Certificate Authority (either provided from the truststore or provided inline) and
    - Username and password
     
    Without both of these, it will return an [empty reply](https://stackoverflow.com/questions/35921195/curl-52-empty-reply-from-server-timeout-when-querying-elastiscsearch).
    
    ```sh
    curl --cacert $CA -u elastic:$ELASTIC_PASSWORD https://localhost:9200/_cat/nodes
    ```
    
    ``` title="Other endpoints"
    _cluster/health
    _server/health
    _ssl/certificates
    ```

-   #### Security

    ---

    ```yaml
    xpack.security.enabled: true
    ```

    ```sh
    # Reset password of builtin user interactively
    /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -i

    # Check status of service
    curl localhost:9200 -u elastic:$PASSWORD
    ```

    ```sh title="From /usr/share/elasticsearch"
    # Interactively create a PKI cert
    ./bin/elasticsearch-certutil http
    ```

    ```sh
    xpack:
      security:
        enabled: true
        http.ssl:
          enabled: true
          keystore.path: certs/http.p12
    ```

    Once a PKI certificate has been set, an API request needs to provide an appropriate certificate **in addition to** user credential and the request must use https explicitly.

    ```sh
    # Without -k, the request will fail # (1)
    curl https://elastic01:9200/ --cacert /etc/elasticsearch/certs/http.p12 -u elastic:$PASSWORD -k
    ```

    1. Error reading "curl: (77) error setting certificate file: /etc/elasticsearch/certs/http.p12"



-   #### Kibana

    ---

    === ":material-redhat: RHEL"

        Add the Kibana repo (1) then install the **kibana** package:
        { .annotate }

        1. 
        ```ini
        [kibana-8.x]
        name=Kibana repository for 8.x packages
        baseurl=https://artifacts.elastic.co/packages/8.x/yum
        gpgcheck=1
        gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
        enabled=1
        autorefresh=1
        type=rpm-md
        ```

        ```sh
        dnf install -y kibana
        ```

    An enrollment token is generated on an Elasticsearch node and output to STDOUT.

    ```sh
    ./bin/elasticsearch-create-enrollment-token -s kibana
    ```

    It must then be placed into the Kibana configuration under [**elasticsearch.serviceAccountToken**](https://www.elastic.co/guide/en/kibana/current/settings.html#elasticsearch-service-account-token)

    Alternatively use, the **kibana-setup** application:

    ```sh title="From /usr/share/kibana"
    ./bin/kibana-setup --enrollment-token $TOKEN
    ```


    Without changing default settings, Kibana will only be accessible from the server itself.
    In order to make the application accessible over the network, [**server.port**](https://www.elastic.co/guide/en/kibana/current/settings.html#server-port) and [**server.host**](https://www.elastic.co/guide/en/kibana/current/settings.html#server-host) have to be set.

    ```yaml title="/etc/kibana/kibana.yml"
    server.host: 0.0.0.0
    server.port: 5601
    ```

    A firewall rule must also be set manually to allow access to the web application over the network.

    ```sh
    firewall-cmd --add-port 5601/tcp --permanent
    firewall-cmd --reload
    ```

    The Elasticsearch nodes do not have to have xpack security enabled to connect to Kibana.

    !!! warn "Troubleshooting"
    
        A variety of errors are liable to be displayed when various problems arise with Elasticsearch.

        If the Elasticsearch node itself is down, Kibana will return a JSON referring to status code 503 (service unavailable).
        
        If the Elasticsearch node is up but xpack security is misconfigured, then Kibana will display text reading "Kibana server is not ready yet".
        In this context, xpack can be disabled and Kibana should work.


</div>

#### elasticsearch-certutil

The [**elasticsearch-certutil**](https://www.elastic.co/guide/en/elasticsearch/reference/current/certutil.html) utility simplifies the creation of certificates for use with TLS in the Elastic Stack.


!!! info "Subcommands"

    The various subcommands are called "modes" in the documentation.

    Note that elasticsearch-certutil is meant to be run from **/usr/share/elasticsearch/** since that is the default output directory and the documentation examples invoke the command by the relative path **./bin/elasticsearch-certutil**.
    However, absolute file paths can be explicitly specified with **--out** in all modes.

    === "ca"

        [**ca**](https://www.elastic.co/guide/en/elasticsearch/reference/current/certutil.html#certutil-ca) mode generates a new certificate authority

        ```sh
        # Without further arguments will output a PKCS#12 certificate valid for 3 years 
        # named elastic-stack-ca.p12 to /usr/share/elasticsearch 
        ./bin/elasticsearch-certutil ca

        # Specifying days and absolute file path of output
        ./bin/elasticsearch-certutil ca --days 7 --out /etc/elasticsearch/certs/ca.p12
        
        # PEM format for 10 years, outputting a zip file containing key and certificate
        ./bin/elasticsearch-certutil ca --pem --days 3650
        ```

    === "cert"

        [**cert**](https://www.elastic.co/guide/en/elasticsearch/reference/current/certutil.html#certutil-cert) mode generates X.509 certificates and private keys, by default for use on a single instance. All certificates generated by this command are signed by a CA unless the **--self-signed** parameter is specified.


        ```sh title="From /usr/share/elasticsearch"
        # Generate a certificate and private key from the specified CA (PEM) cert and key generated above
        ./bin/elasticsearch-certutil cert --ca-cert $CERT --ca-key $KEY --pem
        ```

        Using [Silent Mode](https://www.elastic.co/guide/en/elasticsearch/reference/current/certutil.html#certutil-silent), a YAML file can be input to specify information about instances

        ```sh
        ./bin/elasticsearch-certutil cert --silent --in instances.yml \ # (1)
            --ca-cert $CERT --ca-key $KEY --pem
        ```

        1. 
        ```yaml
        instances:
        - name: server01
        dns:
        - "server01.example.com"
        - name: server02
        dns:
        - "server02.example.com"
        - name: server03
        dns:
        - "server03.example.com"
        ```

    === "http"

        [**http**](https://www.elastic.co/guide/en/elasticsearch/reference/current/certutil.html#certutil-http) mode generates certificates for use on the REST interface.


??? info "Examples"

    ```yaml
    transport:
      ssl:
        enabled: true
        verification_mode: certificate
        keystore:
          path: certs/${node.name}/${node.name}.p12
        truststore:
          path: certs/${node.name}/${node.name}.p12
    ```
