import crypt
import getpass

pw = getpass.getpass()
print(crypt.crypt(pw))
