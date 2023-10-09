# Switch authentication provider to SSSD
authselect select sssd with-mkhomedir

# Configure NSS to allow the SSSD local files provider 
authselect enable-feature with-files-provider

# Prevent authselect from managing the switch file
authselect opt-out