# create databases
CREATE DATABASE IF NOT EXISTS `iztool`;
CREATE DATABASE IF NOT EXISTS `account_iztool`;

GRANT ALL PRIVILEGES ON *.* TO 'iztooluser'@'%' IDENTIFIED BY 'iztoolpw';