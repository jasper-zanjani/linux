# SAS

<div class="grid cards" markdown>

-   #### SBE SAS

    ---


    SBE SAS             | Value
    ---                 | ---
    EAI                 | 5744
    Assignment group    | FXS_SPT_SbeSasAdminsApp5744
    Configuration item  | SBE-SAS-Prod-Infrastructure
    Management server   | prh90084.rsa.sbe.fedex.com
    Documentation       | [SBE RSA DevSecOps Notebook](https://myfedex.sharepoint.com/:o:/r/teams/SBERSADevSecOps/SiteAssets/SBE%20RSA%20DevSecOps%20Notebook?d=wdc8ec9f0f70140a1acb5fed2fbdf339b)<br/>[SUD](https://myfedex.sharepoint.com/:w:/r/teams/FedEx-TransitionCollaboration/Shared%20Documents/Datacenter/Knowledge%20Transfer/Session%20Understanding%20Document%20(SUD)/Linux/SAS%20LINUX/SBE%20SAS_SUD%20All%20Sessions.docx)

    CGI frontend        | Value
    ---                 | ---
    EAI                 | 681290
    Assignment group    | Revenue Management-Proxy-Authn

    CGI backend         | Value
    ---                 | ---
    EAI                 | 3536597
    Assignment group    | RMM-SAS-Prod-Infrastructure-CGI
    
    -   [WebLogic Server](https://support.sas.com/documentation/configuration/serverinstallations/weblogic/) is a Java server that provides the execution environment for SAS.

    -   [SASGSUB](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/gridref/p0bjesvjde359nn1bfikmlzfk80b.htm) is a command-line application that is used by some SAS users to run SAS code in place of SAS Studio or SAS Enterprise. 
        The only SASGSUB host is prh90131.rsa.sbe.fedex.com

-   #### Retired environments

    ---

    - SAS-AMEA-Marketing (EAI: 3539630)

    - FXO-SAS (EAI: 85416)

    - ECDS-SAS-BI (EAI: 3530756, "FedEx Services - Tech Connect SAS")

    - TRCI-SAS (InfoSec)


</div>

#### 01/10

Nathan examines user access issues in SCTASK8026225 for Pavar Kumar Gunti (6703355), whose access must mirror that of nt410991 and tw830471 on c0016472.
The user already had IAMGE roles and his account name already appeared within mkacct files.
The mkacct for test.cloud.fedex.com was checked (acctsbe.test.cloud.fedex.com -> c0046871)
The issue was eventually solved by running

```sh
ldappurge -d cloud 6703355
PushToMachine -dn c0016472.test.cloud.fedex.com
```

- SAS service accounts include one SSSD account and another made with mkacct

    - nt410991
    - tw830471
    - 830471

acct.sbe.fedex.com -> prh90082.rsa.sbe
acctsbe.test.cloud.fedex.com -> c0046871

/var/fedex/makcct/master/cluster 
/var/fedex/mkacct/master/passwd
/var/fedex/mkacct/includes/*.users


#### 01/21




## Tasks

#### Search for hosts

Go to [Atlas][atlas.pa] > Provision Hosts > Search for EAI (5744)
