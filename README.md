# privacyidea-helm

```bash
helm  install privacyidea .\
  --set mysql.password=changeit \
  --set mysql.rootPassword=changeit  \
  --set privacyidea.adminPassword=changeit \
  --set privacyidea.secretKey=changeit \
  --set privacyidea.piPepper=changeit
```