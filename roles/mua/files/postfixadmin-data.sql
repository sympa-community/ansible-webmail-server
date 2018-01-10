USE `postfixadmin`;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('postmaster@gnothi.fr','$1$e1bf08c5$m14OlMNx3Rj6EfgkrWKI1/','2017-12-19 19:10:37','2017-12-19 19:10:37',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
INSERT INTO `alias` VALUES ('abuse@gnothi.fr','david@gnothi.fr','gnothi.fr','2017-12-19 19:11:47','2017-12-19 19:12:57',1),('hostmaster@gnothi.fr','david@gnothi.fr','gnothi.fr','2017-12-19 19:11:47','2017-12-19 19:13:04',1),('postmaster@gnothi.fr','david@gnothi.fr','gnothi.fr','2017-12-19 19:11:47','2017-12-19 19:13:11',1),('webmaster@gnothi.fr','david@gnothi.fr','gnothi.fr','2017-12-19 19:11:47','2017-12-19 19:13:16',1),('david@gnothi.fr','david@gnothi.fr','gnothi.fr','2017-12-19 19:12:44','2017-12-19 19:12:44',1),('root@gnothi.fr','david@gnothi.fr','gnothi.fr','2018-01-09 14:22:36','2018-01-09 14:22:36',1);
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `alias_domain` WRITE;
/*!40000 ALTER TABLE `alias_domain` DISABLE KEYS */;
INSERT INTO `alias_domain` VALUES ('gnothi.net','gnothi.fr','2017-12-21 17:24:51','2017-12-21 17:24:51',1),('gnothi.org','gnothi.fr','2017-12-21 17:24:55','2017-12-21 17:24:55',1);
/*!40000 ALTER TABLE `alias_domain` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'version','740');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('ALL','',0,0,0,0,'',0,'2000-01-01 00:00:00','2000-01-01 00:00:00',1),('gnothi.fr','Domaine principal',0,0,10,0,'virtual',1,'2017-12-19 19:11:47','2017-12-19 19:11:47',1),('gnothi.net','Domaine secondaire',0,0,0,0,'virtual',1,'2017-12-21 17:24:33','2017-12-21 17:57:35',1),('gnothi.org','Domaine secondaire',0,0,0,0,'virtual',1,'2017-12-21 17:24:45','2017-12-21 17:57:40',1);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `domain_admins` WRITE;
/*!40000 ALTER TABLE `domain_admins` DISABLE KEYS */;
INSERT INTO `domain_admins` VALUES ('postmaster@gnothi.fr','ALL','2017-12-19 19:10:37',1);
/*!40000 ALTER TABLE `domain_admins` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
INSERT INTO `mailbox` VALUES ('david@gnothi.fr','$1$018f015f$iXbOTIZccvIjFn6ZHdmoU0','David Verdin','david@gnothi.fr/',0,'david','gnothi.fr','2017-12-19 19:12:44','2017-12-21 15:42:52',1);
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

