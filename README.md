# magento-project


Username:
    admin
Email:
    admin@mail.com
Password:
    admin123
Your Store Address:
    http://magento-project.local/ 
Magento Admin Address:
    http://magento-project.local/admin/ 
Be sure to bookmark your unique URL and record it offline.
Encryption Key:
    483e917caec793c30cdf4dbf2317c0e5

Database Info:

Database Name:
    magento
Username:
    root
Password:
    root

///////////////////////////////////////////////

Instalar tema
sudo php bin/magento setup:upgrade
sudo php bin/magento setup:static-content:deploy -f

Limpiar Cache
sudo php bin/magento cache:flush

Crear backup de la base de datos
mysqldump -uroot -proot magento > magento-project.sql

Recuperar DB desde backup 
mysql -uroot -proot magento < magento-project.sql