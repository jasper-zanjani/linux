# Omit commented lines
sed '/^\s*#/d' $CONFIG | bat -l yml --style=plain