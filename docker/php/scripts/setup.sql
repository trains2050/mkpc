DROP DATABASE IF EXISTS mkpc;
CREATE DATABASE mkpc;
USE mkpc;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arenes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publication_date` timestamp NULL DEFAULT NULL,
  `nom` tinytext COLLATE latin1_general_ci DEFAULT NULL,
  `auteur` tinytext COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `img_data` text COLLATE latin1_general_ci NOT NULL DEFAULT '{}',
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL DEFAULT 0,
  `nbnotes` int(11) NOT NULL DEFAULT 0,
  `pscore` float NOT NULL DEFAULT 0,
  `nbcomments` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `publication_date` (`publication_date`),
  KEY `pscore` (`pscore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arenes_data` (
  `id` int(10) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bananes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobombs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `rotation` double NOT NULL,
  `hauteur` tinyint(2) NOT NULL,
  `retardement` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carapaces` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `rotation` double NOT NULL,
  `collision` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carapacesBleue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `cible` int(10) NOT NULL,
  `retardement` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carapacesRouge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `rotation` double NOT NULL,
  `joueur` int(10) NOT NULL,
  `checkpoint` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuits` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `publication_date` timestamp NULL DEFAULT NULL,
  `nom` tinytext COLLATE latin1_general_ci DEFAULT NULL,
  `auteur` tinytext COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `img_data` text COLLATE latin1_general_ci NOT NULL DEFAULT '{}',
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL DEFAULT 0,
  `nbnotes` int(11) NOT NULL DEFAULT 0,
  `pscore` float NOT NULL DEFAULT 0,
  `nbcomments` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`),
  KEY `pscore` (`pscore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuits_data` (
  `id` int(10) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fauxobjets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `team` tinyint(1) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hack` (
  `email` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `code` varchar(30) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_bans` (
  `player` int(11) NOT NULL,
  `ip1` int(10) unsigned NOT NULL,
  `ip2` int(10) unsigned NOT NULL,
  `ip3` int(10) unsigned NOT NULL,
  `ip4` int(10) unsigned NOT NULL,
  UNIQUE KEY `player` (`player`,`ip1`,`ip2`,`ip3`,`ip4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `holder` int(11) NOT NULL,
  `updated_at` bigint(20) unsigned NOT NULL,
  `updated_by` int(11) NOT NULL,
  `data` varbinary(252) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mariokart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `map` tinyint(2) NOT NULL,
  `time` bigint(13) NOT NULL,
  `cup` int(10) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `link` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `map` (`map`,`time`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `circuit` int(11) NOT NULL,
  `identifiant` int(11) unsigned NOT NULL,
  `identifiant2` int(11) unsigned NOT NULL,
  `identifiant3` int(11) unsigned NOT NULL,
  `identifiant4` int(11) unsigned NOT NULL,
  `note` float NOT NULL,
  KEY `arene` (`circuit`,`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metaitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minichat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` tinytext COLLATE latin1_general_ci NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  `style` set('gras','souligne','italique') COLLATE latin1_general_ci NOT NULL,
  `r` tinyint(3) unsigned NOT NULL,
  `g` tinyint(3) unsigned NOT NULL,
  `b` tinyint(3) unsigned NOT NULL,
  `taille` tinyint(2) NOT NULL,
  `police` enum('Arial','Arial Black','Book Antiqua','Calibri','Comic Sans MS','Courier New','Decorative','Frosty','Garamond','Georgia','Impact','Monospace','Terminal','Times New Roman','Trebuchet MS','Verdana') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mka` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkadvent` (
  `user` int(11) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkavis` (
  `circuit` int(11) NOT NULL,
  `identifiant` int(11) unsigned NOT NULL,
  `identifiant2` int(11) unsigned NOT NULL,
  `identifiant3` int(11) unsigned NOT NULL,
  `identifiant4` int(11) unsigned NOT NULL,
  `note` float NOT NULL,
  UNIQUE KEY `circuit` (`circuit`,`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkawarded` (
  `user` int(11) NOT NULL,
  `award` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  UNIQUE KEY `user` (`user`,`award`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkawards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkb` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkbans` (
  `player` int(11) NOT NULL,
  `msg` text NOT NULL,
  UNIQUE KEY `player` (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkbrowsers` (
  `player` int(11) NOT NULL,
  `browser` varchar(255) COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `id` (`player`,`browser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkc` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `adminonly` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name1` varchar(255) NOT NULL,
  `name0` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkchallenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clist` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) NOT NULL DEFAULT '',
  `difficulty` tinyint(1) NOT NULL,
  `data` text NOT NULL,
  `avgrating` float NOT NULL DEFAULT 0,
  `nbratings` int(11) NOT NULL DEFAULT 0,
  `status` enum('pending_completion','pending_publication','pending_moderation','active','deleted') NOT NULL,
  `validation` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `clist` (`clist`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkchars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(255) DEFAULT NULL,
  `publication_date` timestamp NULL DEFAULT NULL,
  `identifiant` int(11) unsigned NOT NULL,
  `identifiant2` int(11) unsigned NOT NULL,
  `identifiant3` int(11) unsigned NOT NULL,
  `identifiant4` int(11) unsigned NOT NULL,
  `sprites` varchar(255) NOT NULL DEFAULT '',
  `speed` float NOT NULL DEFAULT 0,
  `music` varchar(255) DEFAULT NULL,
  `acceleration` float NOT NULL DEFAULT 0,
  `handling` float NOT NULL DEFAULT 0,
  `mass` float NOT NULL DEFAULT 0,
  `avgrating` float NOT NULL DEFAULT 0,
  `nbratings` int(11) NOT NULL DEFAULT 0,
  `playcount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprites` (`sprites`),
  KEY `publication_date` (`publication_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkchat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `auteur` int(10) NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkchats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned NOT NULL,
  `receiver` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`,`receiver`),
  KEY `receiver` (`receiver`,`sender`),
  KEY `unseen` (`receiver`,`seen`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkchisto` (
  `id` int(11) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `acceleration` float NOT NULL,
  `speed` float NOT NULL,
  `handling` float NOT NULL,
  `mass` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`,`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`),
  KEY `date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcircuits` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `publication_date` timestamp NULL DEFAULT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL DEFAULT 0,
  `nbnotes` int(11) NOT NULL,
  `pscore` float NOT NULL DEFAULT 0,
  `nbcomments` int(11) NOT NULL,
  `type` bit(1) NOT NULL,
  `map` tinyint(2) NOT NULL,
  `laps` tinyint(4) NOT NULL,
  `nom` tinytext COLLATE latin1_general_ci NOT NULL,
  `auteur` tinytext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`),
  KEY `pscore` (`pscore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclrace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('','arenes','circuits','mkcircuits','mkcups','mkmcups') NOT NULL DEFAULT '',
  `circuit` int(11) DEFAULT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`circuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclrecheck` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclrewardchs` (
  `reward` int(11) NOT NULL,
  `challenge` int(11) NOT NULL,
  PRIMARY KEY (`reward`,`challenge`),
  KEY `challenge` (`challenge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclrewarded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `player` (`player`,`reward`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclrewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clist` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcltry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `challenge` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkclwin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `creator` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rating` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge` (`challenge`,`player`),
  KEY `player` (`player`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `circuit` int(11) NOT NULL,
  `type` enum('arenes','circuits','mkcircuits','mkcups','mkmcups') COLLATE latin1_general_ci NOT NULL,
  `auteur` int(11) NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `circuit` (`circuit`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkconnectes` (
  `id` int(10) NOT NULL,
  `connecte` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkconvs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned NOT NULL,
  `receiver` int(10) unsigned NOT NULL,
  `writting` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender` (`sender`,`receiver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcountries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) CHARACTER SET utf8 NOT NULL,
  `name_fr` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ordering` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkcups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publication_date` timestamp NULL DEFAULT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL DEFAULT 0,
  `nbnotes` int(11) NOT NULL,
  `pscore` float NOT NULL DEFAULT 0,
  `nbcomments` int(11) NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `circuit0` int(10) unsigned NOT NULL,
  `circuit1` int(10) unsigned NOT NULL,
  `circuit2` int(10) unsigned NOT NULL,
  `circuit3` int(10) unsigned NOT NULL,
  `nom` tinytext COLLATE latin1_general_ci NOT NULL,
  `auteur` tinytext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publication_date` (`publication_date`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`),
  KEY `pscore` (`pscore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkd` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkdecors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `identifiant` int(10) unsigned NOT NULL,
  `sprites` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mke` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkf` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkfollowers` (
  `user` int(11) NOT NULL,
  `topic` int(11) NOT NULL,
  UNIQUE KEY `user` (`user`,`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkfollowusers` (
  `follower` int(11) NOT NULL,
  `followed` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`followed`,`follower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkg` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkgamecpu` (
  `course` int(11) NOT NULL,
  `min_id` int(11) NOT NULL,
  `max_id` int(11) NOT NULL,
  PRIMARY KEY (`course`),
  UNIQUE KEY `min_id` (`min_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkgameoptions` (
  `id` int(11) unsigned NOT NULL,
  `rules` text NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `public` (`public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkgamerank` (
  `game` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `pts` int(11) NOT NULL,
  PRIMARY KEY (`game`,`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkgamestates` (
  `id` int(11) NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkghostdata` (
  `ghost` int(11) NOT NULL,
  `frame` smallint(5) unsigned NOT NULL,
  `posX` smallint(6) NOT NULL,
  `posY` smallint(6) NOT NULL,
  `posZ` decimal(5,3) NOT NULL,
  `rotation` smallint(6) NOT NULL,
  `flags` bit(4) NOT NULL,
  UNIQUE KEY `ghost` (`ghost`,`frame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkghosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT 150,
  `circuit` int(11) NOT NULL,
  `perso` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `lap_times` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`,`class`,`circuit`) USING BTREE,
  KEY `perso` (`perso`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkghosts_bkp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ghost` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `rotation` float NOT NULL,
  `posZ` float DEFAULT NULL,
  `tombe` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ghost` (`ghost`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkh` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mki` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkignores` (
  `ignorer` int(10) unsigned NOT NULL,
  `ignored` int(10) unsigned NOT NULL,
  UNIQUE KEY `ignorer` (`ignorer`,`ignored`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkinvitations` (
  `demandeur` int(10) NOT NULL,
  `receveur` int(10) NOT NULL,
  `reponse` tinyint(1) NOT NULL,
  `connecte` int(10) unsigned NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  `battle` tinyint(1) NOT NULL,
  UNIQUE KEY `demandeur` (`demandeur`,`receveur`,`battle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkipcountry` (
  `ip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ip`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkips` (
  `player` int(10) unsigned NOT NULL,
  `ip1` int(10) unsigned NOT NULL,
  `ip2` int(10) unsigned NOT NULL,
  `ip3` int(10) unsigned NOT NULL,
  `ip4` int(10) unsigned NOT NULL,
  UNIQUE KEY `player` (`player`,`ip1`,`ip2`,`ip3`,`ip4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkj` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkjoueurs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` int(10) NOT NULL,
  `nom` tinytext COLLATE latin1_general_ci NOT NULL,
  `code` tinytext COLLATE latin1_general_ci NOT NULL,
  `joueur` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `choice_map` tinyint(2) NOT NULL,
  `choice_rand` tinyint(1) NOT NULL,
  `pts_vs` int(11) NOT NULL,
  `pts_battle` int(11) NOT NULL,
  `pts_challenge` int(11) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`(30)),
  KEY `pts` (`pts_vs`),
  KEY `course` (`course`),
  KEY `bPts` (`pts_battle`),
  KEY `pts_challenge` (`pts_challenge`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mklogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `auteur` int(11) NOT NULL,
  `log` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkmatches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkmcups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_date` timestamp NULL DEFAULT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL DEFAULT 0,
  `nbnotes` int(11) NOT NULL,
  `pscore` float NOT NULL DEFAULT 0,
  `nbcomments` int(11) NOT NULL,
  `mode` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `options` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `publication_date` (`publication_date`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`),
  KEY `pscore` (`pscore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkmcups_tracks` (
  `mcup` int(11) NOT NULL,
  `ordering` tinyint(4) NOT NULL,
  `cup` int(11) NOT NULL,
  UNIQUE KEY `mcup` (`mcup`,`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkmessages` (
  `id` int(10) NOT NULL,
  `topic` int(10) NOT NULL,
  `auteur` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `id` (`id`,`topic`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mkmessages_d` (
  `day` tinyint NOT NULL,
  `nb` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mkmessages_m` (
  `y` tinyint NOT NULL,
  `m` tinyint NOT NULL,
  `nb` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknewnicks` (
  `oldnick` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`oldnick`,`id`,`date`),
  KEY `id` (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `category` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `publication_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` enum('pending','accepted','rejected') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '\'\'',
  `nbcomments` int(11) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `publication_date` (`publication_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknewscoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `news` (`news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknewsdraft` (
  `author` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknewsread` (
  `user` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknotes` (
  `circuit` int(10) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`circuit`,`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknotifmute` (
  `user` int(11) NOT NULL,
  `type` enum('answer_comment','answer_forum','circuit_comment','news_moderated','news_comment','answer_newscom','forum_mention','forum_quote','follower_topic','follower_circuit','follower_news','follower_perso','new_followtopic','new_followuser','currently_online','challenge_moderated','follower_challenge','new_record','reaction_topic','reaction_newscom','reaction_news','reaction_trackcom') NOT NULL,
  PRIMARY KEY (`user`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mknotifs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('answer_comment','answer_forum','circuit_comment','news_moderated','news_comment','answer_newscom','forum_mention','forum_quote','follower_topic','follower_circuit','follower_news','follower_perso','new_followtopic','new_followuser','currently_online','challenge_moderated','follower_challenge','new_record','new_reaction') NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `identifiant` int(10) unsigned DEFAULT NULL,
  `identifiant2` int(10) unsigned DEFAULT NULL,
  `identifiant3` int(10) unsigned DEFAULT NULL,
  `identifiant4` int(10) unsigned DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`,`type`),
  KEY `user` (`user`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mko` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkp` (
  `id` tinyint(2) NOT NULL,
  `circuit` int(10) NOT NULL,
  `piece` tinyint(2) NOT NULL,
  PRIMARY KEY (`circuit`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkpassrecovery` (
  `token` varchar(255) NOT NULL,
  `player` int(11) NOT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`token`),
  KEY `expiry_date` (`expiry_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkpersos_bkp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `map` tinyint(2) NOT NULL,
  `perso` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `temps` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`,`map`),
  KEY `perso` (`perso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkpersosel` (
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `perso1` int(11) NOT NULL,
  `perso2` int(11) NOT NULL,
  PRIMARY KEY (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkplayers` (
  `id` int(10) NOT NULL,
  `course` int(10) NOT NULL DEFAULT 0,
  `team` tinyint(1) NOT NULL DEFAULT -1,
  `controller` int(11) NOT NULL DEFAULT 0,
  `x` double NOT NULL DEFAULT 0,
  `y` double NOT NULL DEFAULT 0,
  `z` double NOT NULL DEFAULT 0,
  `speed` double NOT NULL DEFAULT 0,
  `speedinc` double NOT NULL DEFAULT 0,
  `heightinc` double NOT NULL DEFAULT 0,
  `rotation` double NOT NULL DEFAULT 0,
  `rotincdir` double NOT NULL DEFAULT 0,
  `rotinc` double NOT NULL DEFAULT 0,
  `size` double NOT NULL DEFAULT 1,
  `tourne` tinyint(2) NOT NULL DEFAULT 0,
  `tombe` tinyint(2) NOT NULL DEFAULT 0,
  `arme` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `tours` tinyint(1) NOT NULL DEFAULT 0,
  `demitours` tinyint(1) NOT NULL DEFAULT 0,
  `ballons` tinyint(3) NOT NULL DEFAULT 1,
  `reserve` tinyint(3) NOT NULL DEFAULT 4,
  `champi` tinyint(2) NOT NULL DEFAULT 0,
  `etoile` tinyint(2) NOT NULL DEFAULT 0,
  `megachampi` tinyint(2) NOT NULL DEFAULT 0,
  `billball` tinyint(2) NOT NULL DEFAULT 0,
  `eclair` tinyint(3) NOT NULL DEFAULT 0,
  `place` tinyint(1) NOT NULL DEFAULT 0,
  `aipoint` smallint(6) NOT NULL DEFAULT 0,
  `aPts` int(11) NOT NULL DEFAULT 0,
  `connecte` bigint(11) NOT NULL DEFAULT 0,
  `finaltime` int(11) NOT NULL DEFAULT 0,
  `finalts` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `course` (`course`),
  KEY `connecte` (`connecte`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkpollres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll` (`poll`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkpolls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `type` enum('radio','checkbox') NOT NULL,
  `over` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkprivgame` (
  `id` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_used_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkprofiles` (
  `id` int(10) unsigned NOT NULL,
  `identifiant` int(10) unsigned DEFAULT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nick_color` text NOT NULL,
  `nbmessages` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `sub_date` date DEFAULT NULL,
  `last_connect` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkr` (
  `id` int(10) NOT NULL,
  `circuit` int(10) NOT NULL,
  `s` tinyint(2) NOT NULL,
  `r` tinyint(1) NOT NULL,
  PRIMARY KEY (`circuit`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkracehist` (
  `id` int(10) NOT NULL,
  `map` tinyint(2) NOT NULL,
  `time` bigint(13) NOT NULL,
  `cup` int(10) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `link` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `map` (`map`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('arenes','circuits','mkcircuits','mkcups','mkmcups') NOT NULL,
  `circuit` int(11) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rating` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`circuit`,`identifiant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkreactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('topic','news','newscom','trackcom') NOT NULL,
  `link` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `member` int(11) NOT NULL,
  `reaction` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`link`,`member`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(30) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `perso` varchar(255) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT 150,
  `type` enum('circuits','mkcircuits','') NOT NULL,
  `circuit` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `best` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perso` (`perso`(191)),
  KEY `type` (`class`,`type`,`circuit`) USING BTREE,
  KEY `player` (`player`,`class`,`type`,`circuit`) USING BTREE,
  KEY `identifiant` (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`,`class`,`type`,`circuit`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkrecords_bkp` (
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `nom` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `perso` varchar(255) NOT NULL,
  `type` enum('circuits','mkcircuits') NOT NULL,
  `circuit` int(10) NOT NULL,
  `temps` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`nom`,`type`,`circuit`),
  KEY `date` (`date`),
  KEY `perso` (`perso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkrights` (
  `player` int(11) NOT NULL,
  `privilege` enum('admin','moderator','organizer','publisher','clvalidator') NOT NULL,
  PRIMARY KEY (`player`,`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mksaves` (
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `scores` varchar(14) NOT NULL,
  PRIMARY KEY (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkt` (
  `circuit` int(10) NOT NULL,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  `t` tinyint(4) NOT NULL DEFAULT 0,
  KEY `circuit` (`circuit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkteststats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso` varchar(255) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `acceleration` tinyint(4) DEFAULT NULL,
  `speed` tinyint(4) DEFAULT NULL,
  `handling` tinyint(4) DEFAULT NULL,
  `mass` tinyint(4) DEFAULT NULL,
  `offroad` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perso` (`perso`,`identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mktopics` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `titre` tinytext COLLATE latin1_general_ci NOT NULL,
  `category` tinyint(3) NOT NULL,
  `language` bit(1) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `nbmsgs` int(11) NOT NULL,
  `dernier` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `dernier` (`dernier`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkttranking` (
  `player` int(11) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT 150,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`player`,`class`) USING BTREE,
  KEY `score` (`class`,`score`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkvisites` (
  `ip1` tinyint(11) unsigned NOT NULL,
  `ip2` tinyint(11) unsigned NOT NULL,
  `ip3` tinyint(11) unsigned NOT NULL,
  `ip4` tinyint(11) unsigned NOT NULL,
  `page` enum('mariokart','index') COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkvotes` (
  `user` int(11) NOT NULL,
  `answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkwcbets` (
  `console` char(3) NOT NULL,
  `player` int(11) NOT NULL,
  `vote` char(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`console`,`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkwins` (
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `cup` int(10) unsigned NOT NULL,
  `score` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`,`cup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkwrongtz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tz` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tz` (`tz`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `circuit` int(10) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previouspages` (
  `url` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `circuit` int(10) NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `note` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`circuit`,`identifiant`,`identifiant2`,`identifiant3`,`identifiant4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records_bkp` (
  `nom` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `identifiant` int(10) unsigned NOT NULL,
  `identifiant2` int(10) unsigned NOT NULL,
  `identifiant3` int(10) unsigned NOT NULL,
  `identifiant4` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL,
  `perso` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `circuit` enum('Circuit Mario 1','Plaine Donut 1','Plage Koopa 1','Île Choco 1','Lac Vanille 1','Vallée Fantôme 1','Circuit Mario 2','Château de Bowser 1','Plaine Donut 2','Château de Bowser 2','Île Choco 2','Circuit Mario 3','Plage Koopa 2','Lac Vanille 2','Vallée Fantôme 2','Plaine Donut 3','Vallée Fantôme 3','Circuit Mario 4','Château de Bowser 3','Route Arc-en-Ciel','Circuit Peach','Plage Maskass','Bord du Fleuve','Château de Bowser I','Circuit Mario','Lac Boo','Pays Fromage','Château de Bowser II','Circuit Luigi','Jardin volant','Île Cheep-Cheep','Pays Crépuscule','Royaume Sorbet','Route Ruban','Désert Yoshi','Château de Bowser III','Bord du Lac','Jetée cassée','Château de Bowser IV','Route  Arc-en-Ciel') COLLATE latin1_general_ci NOT NULL,
  `temps` smallint(6) unsigned NOT NULL,
  UNIQUE KEY `ip` (`nom`,`circuit`),
  KEY `perso` (`perso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writting` (
  `pseudo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `connecte` int(10) unsigned NOT NULL,
  `writting` tinyint(1) NOT NULL,
  PRIMARY KEY (`pseudo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP TABLE IF EXISTS `mkmessages_d`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`c0timothe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mkmessages_d` AS select cast(`mkmessages`.`date` as date) AS `day`,count(0) AS `nb` from `mkmessages` group by cast(`mkmessages`.`date` as date) order by cast(`mkmessages`.`date` as date) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `mkmessages_m`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`c0timothe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mkmessages_m` AS select year(`mkmessages`.`date`) AS `y`,month(`mkmessages`.`date`) AS `m`,count(0) AS `nb` from `mkmessages` group by year(`mkmessages`.`date`),month(`mkmessages`.`date`) order by year(`mkmessages`.`date`) desc,month(`mkmessages`.`date`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
INSERT INTO `mkcategories` VALUES (1,'Topics officiels','Official topics','Dans cette catÃ©gorie, vous trouverez toutes les annonces et informations officielles de Mario Kart PC. Il est obligatoire de lire ces topics avant de poster un message sur le Forum.','In this section you will find all the official information of Mario Kart PC. Read these topics before posting any message on the forum.',0,1,1),(2,'Annonces et prÃ©sentations','Announcements and presentations','Dans cette catÃ©gorie, postez toutes les annonces en rapport ou non avec MKPC : news, Ã©vÃ©nements, prÃ©sentations, absences et retours.','In this category, give all the ads related or not MKPC: news, events, presentations, absences and returns.',1,2,0),(3,'Le jeu','The game','Ici, parlez de tout ce qui a un rapport avec le jeu : organisez des tournois, prÃ©sentez vos crÃ©ations de circuits, donnez des suggestions d\'amÃ©lioration...','Here talk about everything that has to do with the game: organize tournaments, present your creations circuits, give suggestions for improvement, ...',2,3,0),(4,'Blabla divers','Various discussions','Section libre. Discutez de tout ce que vous voulez qui n\'a pas de rapport direct avec MKPC. Mini-fics, jeux vidÃ©os, Ã©nigmes... Tout est permis !','Here, talk about what you want that has no direct relation MKPC. Mini-fic, video games, puzzles ... Everything is possible!',3,4,0),(5,'Blabla international','International forum','Cette catÃ©gorie a pour but de de permettre l\'Ã©change avec les membres non-francophones du site. Vous pouvez y parler de tout, une seule rÃ¨gle : Ã©crivez en anglais !','The current forum is mainly used by French people. So if you are not French, this category is for you: its aim is to allow communication between people from every country. You can talk about everything on it, the only rule is: write in English!',4,0,0);
UPDATE `mkcategories` SET id=id-1 ORDER BY id;
INSERT INTO `mkcats` VALUES (1,'MKPC','MKPC','#00A433'),(2,'Switch','Switch','#CC002B'),(3,'3DS','3DS','#9100FF'),(4,'Mobile','Portable','#0000FF'),(5,'Various','Divers','#CC5900');
INSERT INTO `mkcountries` VALUES (1,'af','Afghanistan','Afghanistan',32767),(2,'al','Albanie','Albania',32767),(3,'aq','Antarctique','Antarctica',32767),(4,'dz','Algérie','Algeria',32767),(5,'as','Samoa Américaines','American Samoa',32767),(6,'ad','Andorre','Andorra',32767),(7,'ao','Angola','Angola',32767),(8,'ag','Antigua-et-Barbuda','Antigua and Barbuda',32767),(9,'az','Azerbaïdjan','Azerbaijan',32767),(10,'ar','Argentine','Argentina',32767),(11,'au','Australie','Australia',5),(12,'at','Autriche','Austria',32767),(13,'bs','Bahamas','Bahamas',32767),(14,'bh','Bahreïn','Bahrain',32767),(15,'bd','Bangladesh','Bangladesh',32767),(16,'am','Arménie','Armenia',32767),(17,'bb','Barbade','Barbados',32767),(18,'be','Belgique','Belgium',6),(19,'bm','Bermudes','Bermuda',32767),(20,'bt','Bhoutan','Bhutan',32767),(21,'bo','Bolivie','Bolivia',32767),(22,'ba','Bosnie-Herzégovine','Bosnia and Herzegovina',32767),(23,'bw','Botswana','Botswana',32767),(24,'bv','Île Bouvet','Bouvet Island',32767),(25,'br','Brésil','Brazil',32767),(26,'bz','Belize','Belize',32767),(27,'io','Océan Indien','Indian Ocean',32767),(28,'sb','Îles Salomon','Solomon Islands',32767),(29,'vg','Îles Vierges','Virgin Islands',32767),(30,'bn','Brunéi Darussalam','Brunei Darussalam',32767),(31,'bg','Bulgarie','Bulgaria',32767),(32,'mm','Myanmar','Myanmar',32767),(33,'bi','Burundi','Burundi',32767),(34,'by','Bélarus','Belarus',32767),(35,'kh','Cambodge','Cambodia',32767),(36,'cm','Cameroun','Cameroon',32767),(37,'ca','Canada','Canada',3),(38,'cv','Cap-vert','Cape Verde',32767),(39,'ky','Îles Caïmanes','Cayman Islands',32767),(40,'cf','République Centrafricaine','Central African',32767),(41,'lk','Sri Lanka','Sri Lanka',32767),(42,'td','Tchad','Chad',32767),(43,'cl','Chili','Chile',32767),(44,'cn','Chine','China',32767),(45,'tw','Taïwan','Taiwan',32767),(46,'cx','Île Christmas','Christmas Island',32767),(47,'cc','Îles Cocos','Cocos Islands',32767),(48,'co','Colombie','Colombia',32767),(49,'km','Comores','Comoros',32767),(50,'yt','Mayotte','Mayotte',32767),(51,'cd','République démocratique du Congo','Democratic Republic of the Congo',32767),(52,'cg','République du Congo','Republic of the Congo',32767),(53,'ck','Îles Cook','Cook Islands',32767),(54,'cr','Costa Rica','Costa Rica',32767),(55,'hr','Croatie','Croatia',32767),(56,'cw','Curaçao','Curaçao',32767),(57,'cu','Cuba','Cuba',32767),(58,'cy','Chypre','Cyprus',32767),(59,'cz','République Tchèque','Czech Republic',32767),(60,'bj','Bénin','Benin',32767),(61,'dk','Danemark','Denmark',32767),(62,'dm','Dominique','Dominica',32767),(63,'do','République Dominicaine','Dominican Republic',32767),(64,'ec','Équateur','Ecuador',32767),(65,'sv','El Salvador','El Salvador',32767),(66,'gq','Guinée Équatoriale','Equatorial Guinea',32767),(67,'et','Éthiopie','Ethiopia',32767),(68,'er','Érythrée','Eritrea',32767),(69,'ee','Estonie','Estonia',32767),(70,'fo','Îles Féroé','Faroe Islands',32767),(71,'fk','Îles Falkland','Falkland Islands',32767),(72,'gs','Géorgie du Sud','South Georgia',32767),(73,'fj','Fidji','Fiji',32767),(74,'fi','Finlande','Finland',32767),(75,'ax','Îles Åland','Åland Islands',32767),(76,'fr','France','France',1),(77,'gf','Guyane Française','French Guiana',32767),(78,'pf','Polynésie','Polynesia',32767),(79,'tf','Terres Australes Françaises','French Southern Territories',32767),(80,'dj','Djibouti','Djibouti',32767),(81,'ga','Gabon','Gabon',32767),(82,'ge','Géorgie','Georgia',32767),(83,'gm','Gambie','Gambia',32767),(84,'ps','Palestine','Palestine',32767),(85,'de','Allemagne','Germany',8),(86,'gh','Ghana','Ghana',32767),(87,'gi','Gibraltar','Gibraltar',32767),(88,'ki','Kiribati','Kiribati',32767),(89,'gr','Grèce','Greece',32767),(90,'gl','Groenland','Greenland',32767),(91,'gd','Grenade','Grenada',32767),(92,'gp','Guadeloupe','Guadeloupe',32767),(93,'gu','Guam','Guam',32767),(94,'gt','Guatemala','Guatemala',32767),(95,'gg','Guernsey','Guernsey',32767),(96,'gn','Guinée','Guinea',32767),(97,'gy','Guyana','Guyana',32767),(98,'ht','Haïti','Haiti',32767),(99,'hm','Îles Heard','Heard Island',32767),(100,'va','Vatican','Vatican',32767),(101,'hn','Honduras','Honduras',32767),(102,'hk','Hong-Kong','Hong Kong',32767),(103,'hu','Hongrie','Hungary',32767),(104,'is','Islande','Iceland',32767),(105,'in','Inde','India',32767),(106,'id','Indonésie','Indonesia',32767),(107,'ir','Iran','Iran',32767),(108,'iq','Iraq','Iraq',32767),(109,'ie','Irlande','Ireland',32767),(110,'il','Israël','Israel',32767),(111,'it','Italie','Italy',32767),(112,'ci','Côte d\'Ivoire','Côte d\'Ivoire',32767),(113,'jm','Jamaïque','Jamaica',32767),(114,'jp','Japon','Japan',32767),(115,'je','Jersey','Jersey',32767),(116,'kz','Kazakhstan','Kazakhstan',32767),(117,'jo','Jordanie','Jordan',32767),(118,'ke','Kenya','Kenya',32767),(119,'kp','Corée du Nord','North Korea',32767),(120,'kr','Corée du Sud','South Korea',32767),(121,'kw','Koweït','Kuwait',32767),(122,'kg','Kirghizistan','Kyrgyzstan',32767),(123,'la','Laos','Laos',32767),(124,'lb','Liban','Lebanon',32767),(125,'ls','Lesotho','Lesotho',32767),(126,'lv','Lettonie','Latvia',32767),(127,'lr','Libéria','Liberia',32767),(128,'ly','Libie','Libya',32767),(129,'li','Liechtenstein','Liechtenstein',32767),(130,'lt','Lituanie','Lithuania',32767),(131,'lu','Luxembourg','Luxembourg',32767),(132,'mo','Macao','Macao',32767),(133,'mk','Macédoine','Macedonia',32767),(134,'mg','Madagascar','Madagascar',32767),(135,'mw','Malawi','Malawi',32767),(136,'my','Malaisie','Malaysia',32767),(137,'mv','Maldives','Maldives',32767),(138,'ml','Mali','Mali',32767),(139,'mt','Malte','Malta',32767),(140,'mq','Martinique','Martinique',32767),(141,'mr','Mauritanie','Mauritania',32767),(142,'mu','Maurice','Mauritius',32767),(143,'mx','Mexique','Mexico',32767),(144,'mc','Monaco','Monaco',32767),(145,'me','Monténegro','Montenegro',32767),(146,'mn','Mongolie','Mongolia',32767),(147,'md','Moldova','Moldova',32767),(148,'ms','Montserrat','Montserrat',32767),(149,'ma','Maroc','Morocco',32767),(150,'mz','Mozambique','Mozambique',32767),(151,'om','Oman','Oman',32767),(152,'na','Namibie','Namibia',32767),(153,'nr','Nauru','Nauru',32767),(154,'np','Népal','Nepal',32767),(155,'nl','Pays-Bas','Netherlands',32767),(156,'an','Antilles Néerlandaises','Netherlands Antilles',32767),(157,'aw','Aruba','Aruba',32767),(158,'nc','Nouvelle-Calédonie','New Caledonia',32767),(159,'vu','Vanuatu','Vanuatu',32767),(160,'nz','Nouvelle-Zélande','New Zealand',32767),(161,'ni','Nicaragua','Nicaragua',32767),(162,'ne','Niger','Niger',32767),(163,'ng','Nigéria','Nigeria',32767),(164,'nu','Niué','Niue',32767),(165,'nf','Île Norfolk','Norfolk Island',32767),(166,'no','Norvège','Norway',32767),(167,'mp','Îles Mariannes du Nord','Northern Mariana Islands',32767),(168,'fm','Micronésie','Micronesia',32767),(169,'mh','Îles Marshall','Marshall Islands',32767),(170,'pw','Palaos','Palau',32767),(171,'pk','Pakistan','Pakistan',32767),(172,'pa','Panama','Panama',32767),(173,'pg','Papouasie-Nouvelle-Guinée','Papua New Guinea',32767),(174,'py','Paraguay','Paraguay',32767),(175,'pe','Pérou','Peru',32767),(176,'ph','Philippines','Philippines',32767),(177,'pn','Pitcairn','Pitcairn',32767),(178,'pl','Pologne','Poland',32767),(179,'pt','Portugal','Portugal',32767),(180,'gw','Guinée-Bissau','Guinea-Bissau',32767),(181,'tl','Timor-Leste','Timor-Leste',32767),(182,'pr','Porto Rico','Puerto Rico',32767),(183,'qa','Qatar','Qatar',32767),(184,'re','Réunion','Réunion',32767),(185,'ro','Roumanie','Romania',32767),(186,'ru','Fédération de Russie','Russian Federation',32767),(187,'rw','Rwanda','Rwanda',32767),(188,'bl','Saint Barthélemy','Saint Barthélemy',32767),(189,'sh','Sainte-Hélène','Saint Helena',32767),(190,'kn','Saint-Kitts-et-Nevis','Saint Kitts and Nevis',32767),(191,'ai','Anguilla','Anguilla',32767),(192,'lc','Sainte-Lucie','Saint Lucia',32767),(193,'pm','Saint-Pierre-et-Miquelon','Saint-Pierre and Miquelon',32767),(194,'vc','Saint-Vincent-et-les Grenadines','Saint Vincent and the Grenadines',32767),(195,'sm','Saint-Marin','San Marino',32767),(196,'st','Sao Tomé-et-Principe','Sao Tome and Principe',32767),(197,'sa','Arabie Saoudite','Saudi Arabia',32767),(198,'sn','Sénégal','Senegal',32767),(199,'sc','Seychelles','Seychelles',32767),(200,'sl','Sierra Leone','Sierra Leone',32767),(201,'sg','Singapour','Singapore',32767),(202,'sx','Saint Martin','Sint Maarten',32767),(203,'sk','Slovaquie','Slovakia',32767),(204,'vn','Viet Nam','Vietnam',32767),(205,'si','Slovénie','Slovenia',32767),(206,'so','Somalie','Somalia',32767),(207,'za','Afrique du Sud','South Africa',32767),(208,'zw','Zimbabwe','Zimbabwe',32767),(209,'es','Espagne','Spain',9),(210,'eh','Sahara Occidental','Western Sahara',32767),(211,'sd','Soudan','Sudan',32767),(212,'ss','Soudan du Sud','South Sudan',32767),(213,'sr','Suriname','Suriname',32767),(214,'sj','Svalbard etÎle Jan Mayen','Svalbard and Jan Mayen',32767),(215,'sz','Swaziland','Swaziland',32767),(216,'se','Suède','Sweden',32767),(217,'ch','Suisse','Switzerland',7),(218,'sy','Syrie','Syria',32767),(219,'tj','Tadjikistan','Tajikistan',32767),(220,'th','Thaïlande','Thailand',32767),(221,'tg','Togo','Togo',32767),(222,'tk','Tokelau','Tokelau',32767),(223,'to','Tonga','Tonga',32767),(224,'tt','Trinité-et-Tobago','Trinidad and Tobago',32767),(225,'ae','Émirats Arabes Unis','United Arab Emirates',32767),(226,'tn','Tunisie','Tunisia',32767),(227,'tr','Turquie','Turkey',32767),(228,'tm','Turkménistan','Turkmenistan',32767),(229,'tc','Îles Turks et Caïques','Turks and Caicos Islands',32767),(230,'tv','Tuvalu','Tuvalu',32767),(231,'ug','Ouganda','Uganda',32767),(232,'ua','Ukraine','Ukraine',32767),(233,'eg','Égypte','Egypt',32767),(234,'gb','Royaume-Uni','United Kingdom',4),(235,'im','Île de Man','Isle of Man',32767),(236,'tz','Tanzanie','Tanzania',32767),(237,'us','États-Unis','United States',2),(238,'bf','Burkina Faso','Burkina Faso',32767),(239,'uy','Uruguay','Uruguay',32767),(240,'uz','Ouzbékistan','Uzbekistan',32767),(241,'ve','Venezuela','Venezuela',32767),(242,'wf','Wallis et Futuna','Wallis and Futuna',32767),(243,'ws','Samoa','Samoa',32767),(244,'ye','Yémen','Yemen',32767),(245,'rs','Serbie','Serbia',32767),(246,'zm','Zambie','Zambia',32767);
INSERT INTO mkjoueurs SET id=1,course=0,nom="Wargor",code="$2y$10$DHPgMFxb56xU.ohu3ildtuhfHcFUcqwz0HilUn6p9UMnSM/tqGwnO",joueur="mario",choice_map=0,choice_rand=0,pts_vs=5000,pts_battle=5000,pts_challenge=0,online=0,deleted=0;
INSERT INTO mkprofiles SET id=1,identifiant=0,identifiant2=0,identifiant3=0,identifiant4=0,avatar="",nick_color="Wargor",nbmessages=0,email="",country=76,description="";
