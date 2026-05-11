-- Practica_710_06
-- Los comandos  se ejecutan en una consola
-- 1 accede al modo consola 
mysql -h localhost -u root

-- 2 comando sql
show databases;
use geslibros
show tables;
select host,user,password from mysql.user
show grants for root@localhost;
show grants for CURRENT_USER;


-- 3
CREATE USER lopez@localhost IDENTIFIED BY '123456';
GRANT CREATE,ALTER,UPDATE ON maratoon.corredores TO lopez@localhost;

-- 4 cambiar password usuario anterior
SET PASSWORD FOR lopez@localhost = PASSWORD ('654321')