# Display status of subscriptions and products
subscription-manager status

# Display installed products
subscription-manager list

# Register system with a subscription service, then automatically subscribe
subscription-manager register --username $USERNAME --password $PASSWORD --auto-attach

# Attach the best-fitting subscriptions to the system, as identified by the subscription service
subscription-manager subscribe --auto
subscription-manager register --autosubscribe

# Attach a subscription to a system using the individual product or subscription
subscription-manager subscribe --pool=