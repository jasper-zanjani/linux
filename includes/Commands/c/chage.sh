# Expire password in 30 days"
chage -E $(date -d +6month +%F) $USER
