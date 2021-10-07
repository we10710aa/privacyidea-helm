# privacyidea-helm
A sample privacyidea and mysql helm chart.

This chart is not published to anywhere, you should clone this repo to use it.

### Getting Started
Variables like database password or privacyidea secret key are intentionally blanked, you should provide it via cli or put it in values file.

```bash
git clone https://github.com/we10710aa/privacyidea-helm.git
cd privacyidea-helm

helm  install privacyidea .\
  --set mysql.password=changeit \
  --set mysql.rootPassword=changeit  \
  --set privacyidea.adminPassword=changeit \
  --set privacyidea.secretKey=changeit \
  --set privacyidea.piPepper=changeit
```

### Privacyidea configuration file
Configs below are set by helm chart, do not set it yourself
* SQLALCHEMY_DATABASE_URI
* SECRET_KEY
* PI_PEPPER
* PI_ENCFILE
* PI_AUDIT_KEY_PRIVATE
* PI_AUDIT_KEY_PUBLIC


For any extra configurations, change `pi.cfg` file.

Refer to [here](https://privacyidea.readthedocs.io/en/latest/installation/system/inifile.html) for more information on privacyidea configuration.