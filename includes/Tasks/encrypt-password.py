# crypt is set to be removed in Python 3.13
import crypt, getpass

pw = getpass.getpass()
print(crypt.crypt(pw))
