-- MySQL dump 10.13  Distrib 5.7.23-23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: wbpsczdi_craft3-cms
-- ------------------------------------------------------
-- Server version	5.7.23-23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vfogwibratoqlbvpoylimyoryowhubjkcfxp` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_seoelsqedwwumrctjeawzzldssvkcmrbxofa` (`dateRead`),
  KEY `fk_bjgxyvtqzrrqumnphbxliybkgzpyiecnnzxx` (`pluginId`),
  CONSTRAINT `fk_bjgxyvtqzrrqumnphbxliybkgzpyiecnnzxx` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eoyyvzvnoovhmpkubyifdducwhotzgaljfbr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unmgqpaymsoldvnxjvbiixfgllkozdzwdxlv` (`sessionId`,`volumeId`),
  KEY `idx_bgduvjrywleqbkojfytatflzkjdzmdizopmi` (`volumeId`),
  CONSTRAINT `fk_rdnmehglmkkblpiynoxkltcwbbswncubmlux` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztkijenasznebwkokynzpmahmnwpldmwwtty` (`filename`,`folderId`),
  KEY `idx_hgndxozvuffdoqyqrglyitycnaclgewphmcn` (`folderId`),
  KEY `idx_uehnlwrezdgmnsidxhvpjsnkwkqgocflajaz` (`volumeId`),
  KEY `fk_exakaojqvoujwxifxbttlxfspdxbsbjogfdh` (`uploaderId`),
  CONSTRAINT `fk_exakaojqvoujwxifxbttlxfspdxbsbjogfdh` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gcnlgdcsplmxcrzizudiniydfhajbwrjikys` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_korhmidczryblqqhewmdawcncvkfdeezniod` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtqoejcxzhaesryanvmnanaolphnndcueuvw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pgmqxkczxmneizbbmulihnghouymrrwcqjnt` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wrywxqcevupogtosjtiqizabvnjlrvrspqxa` (`name`),
  KEY `idx_akrabeookxabjondmfqsnnltdxikcpnfmjme` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rfljsrvfetwsrcskyhijfzhkbyjhfduozfgr` (`groupId`),
  KEY `fk_omlicuqjudojobmxxrfkhrflwfizrqhdvnwh` (`parentId`),
  CONSTRAINT `fk_hxvgbclaufthtwzhqhtwmllgogtqxjkkcrfr` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_omlicuqjudojobmxxrfkhrflwfizrqhdvnwh` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qpzhlxarqexqtvptycmdcnaienhmyxggxwaj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_powkkiycfmvsmgzlmvneentwluxkylzivfnr` (`name`),
  KEY `idx_jvolsrtlmkihcffmugyzmdrnpptytlrqoefi` (`handle`),
  KEY `idx_ltgsbesfidqlkixbtxmgbpkuyxarbwdatptf` (`structureId`),
  KEY `idx_fzmasgqvatxmxweaarhtnibnlfdcbhbxhzzu` (`fieldLayoutId`),
  KEY `idx_gewsbglcxryurzzifxuqkzvggjwusdfomngr` (`dateDeleted`),
  CONSTRAINT `fk_hvljaspaubduhlujoqpwlwdhijruisofqezv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_muomfowpyagszrlurizliujkleotilxhmoed` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_idbrinzttnmzkpsmrntnwvxdupwdkpvbdvja` (`groupId`,`siteId`),
  KEY `idx_rhtwkbzvuddnukqlayhnjljvtkncnwpiqszp` (`siteId`),
  CONSTRAINT `fk_denxojmanlbayavygmsvppsblgbuampcqomd` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_venqnnvvfeahrimryfepbeahxpmxdxmaozxx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_nibmgshxuyfjtscsujmpiqsgwuxfjbozdjbn` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_lkafjxwxgorfgwzolxogcdiwmacdovoevtlh` (`siteId`),
  KEY `fk_fouirupkqnlfrxkjorhrjsfddahymzfgaorv` (`userId`),
  CONSTRAINT `fk_aeoqunecprzlxgcrhmzzlehbvjuxaiwlblgq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fouirupkqnlfrxkjorhrjsfddahymzfgaorv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lkafjxwxgorfgwzolxogcdiwmacdovoevtlh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_ccyigqiptgerrbqbilulvlzfkmvrehcrmsda` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_iwdjmbayrbbajbtxpngqrgnozkfniwlylgxp` (`siteId`),
  KEY `fk_gesjqzljysketkgsxatvmahhfempyvmdnyte` (`fieldId`),
  KEY `fk_bzaohoitiutqzxvvlmayzntaiaopyhfqtucc` (`userId`),
  CONSTRAINT `fk_bzaohoitiutqzxvvlmayzntaiaopyhfqtucc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_gesjqzljysketkgsxatvmahhfempyvmdnyte` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iwdjmbayrbbajbtxpngqrgnozkfniwlylgxp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rjmroauopxuqhrpcuehrybfikvogqqxvpbut` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_contactUs_dhjrtrlr` text COLLATE utf8_unicode_ci,
  `field_phone_gkttygyz` text COLLATE utf8_unicode_ci,
  `field_email_zzzjscza` text COLLATE utf8_unicode_ci,
  `field_bodyContent_fsujtllx` text COLLATE utf8_unicode_ci,
  `field_heaing_rzhhkcdj` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wwkuhpkhcdpoqxcngookiepksgdxlajbsyul` (`elementId`,`siteId`),
  KEY `idx_eimpixtbzrnhjnaffjgyvwbqasinoorlhheg` (`siteId`),
  KEY `idx_akleekgdgeqpebymavihwagipzqdyyslrzaj` (`title`),
  CONSTRAINT `fk_ckcoqpbkwfebjaksapzkblvjmzuhbbkqpfzh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_igbnkyajuqknjenhhsaarsvrbrtzrwsnknhd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tbybpbwnwnwrpvxrwtisaqlhcvletprtsrju` (`userId`),
  CONSTRAINT `fk_tbybpbwnwnwrpvxrwtisaqlhcvletprtsrju` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xfobcpkybcrmwqcscskkovarilrzccvunpgm` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_jfeakcekgafojlvriwqqkeuhxbrsmatoelqf` (`creatorId`,`provisional`),
  KEY `idx_zauqhguamswmneosvrezwbwrtriubgzpiqqb` (`saved`),
  KEY `fk_omrwalvlgbnpsimlqbmycyfbnvqvdfwghlbr` (`sourceId`),
  CONSTRAINT `fk_omrwalvlgbnpsimlqbmycyfbnvqvdfwghlbr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vywdrkvmdokxkljzoqzyfaduzgrcyskhxipb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_idrcrxfxggqchzfmszvzvjufsndlxopdatpp` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mdisgokafypctrisxuqafjxkdqabwuyoxfeh` (`dateDeleted`),
  KEY `idx_pkaqsvuvvwmbsumppzzvwyttqkrajwjfcfao` (`fieldLayoutId`),
  KEY `idx_bzuyzzaobajgtocoknskizoastejpynxwlwm` (`type`),
  KEY `idx_fjkajogzvhbgpjcblygontiqjpfgyjuyoitf` (`enabled`),
  KEY `idx_tpsjspbqbmduvrdzesurkdmagvuvvowbjwze` (`archived`,`dateCreated`),
  KEY `idx_amxbmyjzgxalawkmwrlprfcdnzktoyvbxwuk` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `fk_cbeffxtmrvrjitmztdseimivxwczrtzwfoet` (`canonicalId`),
  KEY `fk_madxgwnarvkhoipxudawbpkxaijptqkkgmsx` (`draftId`),
  KEY `fk_pgpshjtkuaidemfagnwfzfcheqiktwirdtbn` (`revisionId`),
  CONSTRAINT `fk_cbeffxtmrvrjitmztdseimivxwczrtzwfoet` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_madxgwnarvkhoipxudawbpkxaijptqkkgmsx` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pgpshjtkuaidemfagnwfzfcheqiktwirdtbn` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wumzdsnpysmeveceqbhuhkperwjrwmbmkuyp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_naeaovrrfqumfuxsqxtxcmqyiyhfkaiowozt` (`elementId`,`siteId`),
  KEY `idx_kzhhbdkhjzncganbdlhqskvnwvvtgdijgjbj` (`siteId`),
  KEY `idx_qlymvectqtggatpdnytssxvrqxzqgyszdklz` (`slug`,`siteId`),
  KEY `idx_rhrfjlznroxgvvshmpxydnqalqlplbdjtunw` (`enabled`),
  KEY `idx_gosvexmcrzuwfjydszqbncwpgyktsziptgbi` (`uri`,`siteId`),
  CONSTRAINT `fk_smxohqewyfcbzbykzcpdnowbxwsurgxyljwx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xftzapljddedhsugvsfezdaqgkkfyhcnjvqk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pgkubpuxtxnelyltrcobvoilnlsnupaqbfhe` (`postDate`),
  KEY `idx_awrjulwrbknhudluvgucjmpdgfpmhdtrnojw` (`expiryDate`),
  KEY `idx_nwichocqugbcyopwncrcklpnyfxvahtckogt` (`authorId`),
  KEY `idx_uylangnrionqgfijxqoutuurdsknlbeynafp` (`sectionId`),
  KEY `idx_atlubszfsncwmxckdwruczibacjvvmjpbrhb` (`typeId`),
  KEY `fk_aobtqeilfcmrlscjaiagdjyuufvorptxswpd` (`parentId`),
  CONSTRAINT `fk_aobtqeilfcmrlscjaiagdjyuufvorptxswpd` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_clgiadlnbhabykmwkngjvzivljhhombavfuk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kblclobtleeqsvdimqahmvnlllseqbgdyqbr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mtybmfretzlfxceptlzicuijnvfdzxjeucxp` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrniyuksamyoqugwxmogsgpxivqnhherbtbv` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ccirgdhkjdzfslhosydrdlcdhaxyrzizkyyx` (`name`,`sectionId`),
  KEY `idx_xeeomkmlxvzinqwnxiwkeiogngnvyvdimhaj` (`handle`,`sectionId`),
  KEY `idx_vylkxwshjbmigpnzbwvkstaibzbeakhitlnw` (`sectionId`),
  KEY `idx_ppsvfoawioaazbzhlimideyzymxaximpjqho` (`fieldLayoutId`),
  KEY `idx_jksckztltnqzvjlcagcvhilauxcmhxnkswee` (`dateDeleted`),
  CONSTRAINT `fk_kcccuzdiungfywwdpdwywcjzjuuiahxxptsl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wlpagpfmzlxelunecqzonbetawzvtoyzblkv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lzixgntokqqjsjcdljfxiitzexpffqlydhfo` (`name`),
  KEY `idx_zyrrznigsrzgwoubjnoojsiaenfynriteflr` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_msfmzqfzyubcrgjtjcbepbzolgyrmlwwmiyv` (`layoutId`,`fieldId`),
  KEY `idx_pcgeokixaboisnebkdrtccrkqucklhhpecpa` (`sortOrder`),
  KEY `idx_hbcndazadncoverezhmuewhudyhofqsdlkoc` (`tabId`),
  KEY `idx_xsxzlurzkfvzphwbfcjbttngbxdovpsjqqho` (`fieldId`),
  CONSTRAINT `fk_ivsofuqfkdzlxfdqyfntmkjqpjlvvcfykmjk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pijqsrqegzcvfdjynzutfphzhhyltuxolklz` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcrlhztggaooyqtuwxwmbmovclzmcuuyqulv` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vytxttxjarhwjadwezhshtqcvzamybcdnqcb` (`dateDeleted`),
  KEY `idx_nmzfhdrylkkgiucnaepdytbmpevemuugoptg` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hpmhfshtojabtyxxavessjxjgxfvdfcexwyk` (`sortOrder`),
  KEY `idx_aceruuscyywncwkrdjpadjqzaftfdvqxcjfk` (`layoutId`),
  CONSTRAINT `fk_lgvmthtthzgzdkftmqrxijueywototkajwmu` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_joqjeszhjihnyaiufveiciklmcmzwbtbdvot` (`handle`,`context`),
  KEY `idx_hxhdtljlxkyccqcdkxeibclgbjwrrgvoayys` (`groupId`),
  KEY `idx_fuzqoaemstrukjscvjcbqatwnvztjwcpwuwu` (`context`),
  CONSTRAINT `fk_anmsfbfiftilhgzxslvnafmzoibdgsbaiovi` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_inmkcvmnopmnillnfzgbiaueutzntxtxsxoo` (`name`),
  KEY `idx_fsqwxaojshwpnxjdtiniuzlwwiuazsrlbqfq` (`handle`),
  KEY `idx_uwwkxbvojnloiwffqvvmiywgivbpgxffrqty` (`fieldLayoutId`),
  KEY `idx_vpqasvakksuxzkwunmaoiutegtbrgtxoqbiq` (`sortOrder`),
  CONSTRAINT `fk_aslhfsnoctfufbesfcewxstvvujjdknmlpnn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qvncmqunvqvpccllmejhcuujnzicshraykfb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpirdpqyxenvxkumxzrctnivhgdzdxjbqkhx` (`accessToken`),
  UNIQUE KEY `idx_jgqvandustarakzmdhgwuxwlyizgjmumqzuq` (`name`),
  KEY `fk_mryktdgqaounjuxkwoiwcnqbjbzulpiolwad` (`schemaId`),
  CONSTRAINT `fk_mryktdgqaounjuxkwoiwcnqbjbzulpiolwad` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rdyqtwzcfnqkjauxyezxhjxuzhjdefvqqjes` (`ownerId`),
  KEY `idx_muzpseeaskpmgfhbwbfdpdtuzysysajekcht` (`fieldId`),
  KEY `idx_qmcgwgjcwfbeadushkzxqqnrkugxayxpaidc` (`typeId`),
  KEY `idx_kvppzimbqflthsqzvztpdfomxxapsdfpwvro` (`sortOrder`),
  CONSTRAINT `fk_hyaqeznmqctjkoyclazvsflpskhfgngaiuug` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pypmyivdbogkcjmnjzllvkjcraydrupqbjkc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rmztkrhwpihtuuscyftwjsmyupqqnnxjjbhk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vvopgmqxhinafnrvwmpeheuxbtqagumanpsv` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ydcvawhsybuczdfkumncutujqvlxbhefsbvl` (`name`,`fieldId`),
  KEY `idx_wtiosopvzuvnzkekobmxtfkcbgntqgryxzrh` (`handle`,`fieldId`),
  KEY `idx_meryfwvbfgbyefrkrichmspbwbnobdaymxus` (`fieldId`),
  KEY `idx_hdwmbaxhkyjylvzeipgpkicrpypsfmcprjvw` (`fieldLayoutId`),
  CONSTRAINT `fk_daklchsljyayxtrhcqxlybpgyhlisxdknnie` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mhalqhsrmccilndhtsywbyjiotdxcluivytg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_homepage`
--

DROP TABLE IF EXISTS `matrixcontent_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_homepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_bannerContent_text` text COLLATE utf8_unicode_ci,
  `field_bannerContent_buttonLink` text COLLATE utf8_unicode_ci,
  `field_bannerContent_heading` text COLLATE utf8_unicode_ci,
  `field_bannerContent_buttonText` text COLLATE utf8_unicode_ci,
  `field_imageWithContent_buttonText` text COLLATE utf8_unicode_ci,
  `field_imageWithContent_bodyText` text COLLATE utf8_unicode_ci,
  `field_imageWithContent_heading` text COLLATE utf8_unicode_ci,
  `field_imageWithContent_buttonLink` text COLLATE utf8_unicode_ci,
  `field_bodyContent_show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kldtwicqjgupqchijyfggdjgzcbwifkjgcgv` (`elementId`,`siteId`),
  KEY `fk_qdkumzkjqejgpodcncfmzrdpzfmruhiyfnpc` (`siteId`),
  CONSTRAINT `fk_kpuqqpscvjpbxwixlctuxxnswfugncratymr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdkumzkjqejgpodcncfmzrdpzfmruhiyfnpc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqnmmfeckmdndxwdwngqbqhrgcooioymdgyx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xfcfjaapbaudhnfteuwluqbcnmhqrpjwgfra` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_wteydltptcbkpjtpkiqijpemjdanalkunkza` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_qddtsnpvdtnyyjwkxgbvkjynamssduwclpyq` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqjrivnmgrcnvpvgsasibawuxqkemksumccp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ddtguqxvswdirioszclvkipzrjslbjbsxajc` (`sourceId`),
  KEY `idx_imtjdtdkdouxinbkuediifpeqshoavyvncxq` (`targetId`),
  KEY `idx_cayvfelydteqnysfayjnbixtquxauxvrbaty` (`sourceSiteId`),
  CONSTRAINT `fk_dlbdndqowofqzipbzgethecuxunbundczecc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hjgjiaipnsjcrqfbgigicinrnomjrspoebnt` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqhtzzasxrxcqzpizhsfhxqwbumovhecvqpg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zfaokvuxdgifclnhiujxynlffajrfzpvevok` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qubqpfsfzvjjgnzmrvagnjpmfwrsdnpzfccs` (`sourceId`,`num`),
  KEY `fk_grnntwianssmewvldzxxmeuoxxmltfvnjzln` (`creatorId`),
  CONSTRAINT `fk_grnntwianssmewvldzxxmeuoxxmltfvnjzln` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pbjigaptahirlmcrbxgykufinuiunvytylzt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_byrieskkqafkheukpnhsfwkuzeohjlyxpdwb` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cooildmojomaolabmxospsnwidwspmdioxoi` (`handle`),
  KEY `idx_xnqmpafxbtmepkxdycuufdaplhbqcsxlctnl` (`name`),
  KEY `idx_wstudrbcdtycfnmvavqzcvgjpvdkgpxlbmww` (`structureId`),
  KEY `idx_zawwftdrwmlcvhizhwehrgbjbthjywkwlrzq` (`dateDeleted`),
  CONSTRAINT `fk_dpyfdzpzbvqjcweyavcanbohjyrermoatxyg` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dtooexpcwwnoczrpokxrpiyjsppacdurxxbc` (`sectionId`,`siteId`),
  KEY `idx_tfqmsvhcdffthpdrhpxtezstiznntfdokkfu` (`siteId`),
  CONSTRAINT `fk_amzggptzehurvexntyufjzgmjvbheecpacnr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xavaxsedxvxgqlfoppbvgtmhjnylpuuxoszw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fhfvkzceimcffhdeaylakufkovbosakdpdxv` (`uid`),
  KEY `idx_rzglyfcprkwmtnyfhpyippepqsmywodfbwxm` (`token`),
  KEY `idx_losrnqlnxeczvftavylnbhgqxosxvvwrofyd` (`dateUpdated`),
  KEY `idx_qicztmthygvldkeqyycswykslzsiltwpisct` (`userId`),
  CONSTRAINT `fk_yhdypwodoyhpinfzfwauynzkjueruitgkkrr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yghqneygcuuyriplvakwspzdvorcvbrtjfcl` (`userId`,`message`),
  CONSTRAINT `fk_kookfezblqlzaamqegmvzdqzcdijdhdwtjkj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rvjwbkbiildlojmfncvglgcypcxrwabwsxpi` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_huceabonhbpvushrhstwavqxsyyhzcvefnlx` (`dateDeleted`),
  KEY `idx_ayexnlodfsywbbdpprcolvhubzrzkzwjuqxt` (`handle`),
  KEY `idx_ddwylosuwwbdkvnneinmrhlexmkuifwhvqtw` (`sortOrder`),
  KEY `fk_mlgwjcqefdspaqmngvmhcbnmfjbjnjfnrrrr` (`groupId`),
  CONSTRAINT `fk_mlgwjcqefdspaqmngvmhcbnmfjbjnjfnrrrr` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_1_tabscontent`
--

DROP TABLE IF EXISTS `stc_1_tabscontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stc_1_tabscontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_stitle_kybmokwj` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qmebravxyqpqrtmlfvclhdzyvzghwarizgxk` (`elementId`,`siteId`),
  KEY `fk_hazsukarufyhhjwesduzdqknoqcxhgqmcncx` (`siteId`),
  CONSTRAINT `fk_hazsukarufyhhjwesduzdqknoqcxhgqmcncx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ocvthckfefotkgafuaeuftryocmocijnfeqz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_sociallinks`
--

DROP TABLE IF EXISTS `stc_sociallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stc_sociallinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_surl_sbecucrj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_icon_hymsexyb` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bquksvrrobtfmnbndjwkrerzqpikkugnjqzb` (`elementId`,`siteId`),
  KEY `fk_iigryzeajeiqgnzkygoojshcyfgmdycpnchj` (`siteId`),
  CONSTRAINT `fk_iigryzeajeiqgnzkygoojshcyfgmdycpnchj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kheprebjlddcmgfqjnhfhgqneelucpxfcylt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kdiwcujckjgrokmihdddzrxhptjishbnrmks` (`structureId`,`elementId`),
  KEY `idx_uaibaeijbycoicayjrcqmpnnmiqeagstcjlt` (`root`),
  KEY `idx_owsvefusfnqmxpggzdoboxgrwalhsnccztxq` (`lft`),
  KEY `idx_fnhtruyhxrhhgvgmectmdwsdzqepfrwtbtlr` (`rgt`),
  KEY `idx_iqeabweonypsgtipebzlavdexhvcbvshudhd` (`level`),
  KEY `idx_klcmtjnxhsawmdffakrhfpwgrfniefpilynw` (`elementId`),
  CONSTRAINT `fk_ducrwcqeybssmvchjlmdpkmekxngdwcsgqmu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_etvawqvymewscflaywgahaznajsstkxdxmyw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cmjicgjywrfaswrdtgnvdzyezgfkhavttnnh` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sjykergdamovtwxkadqgqlzzgookcfkkwljg` (`ownerId`),
  KEY `idx_wqmirjlqtbydsazdpgrzftkppxcsgbirkvrr` (`fieldId`),
  KEY `idx_dnljudqbyqfvmgymgzbrhzzkfvnuqdpfeawj` (`typeId`),
  KEY `idx_gmssvqninzourmzmraytvkybbsyjuehinzvb` (`sortOrder`),
  CONSTRAINT `fk_qkxcmwqgjrxzzvjtufkdmnsaesuaxfilikfb` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzehienndzpsvwdtczblrsclbetaxacuheli` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xoyfhgublslrymtlnzymkhxusvhajclooujl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvahnhdaaygvfgiwuqbpkgvspezdkevfeyil` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ovjatyoyhxpvxdjatpdewnzcrydeddrztabf` (`fieldId`),
  KEY `idx_fmcuxfecpygbmjmuruemaqwdjrrxtbrenlsu` (`fieldLayoutId`),
  CONSTRAINT `fk_eeltmxsbonhsjxoznmnujqkyboavmnkjvdws` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_knuymuifdwqkwjznpfkoarvpeuwpqhubbseb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_schkpkfhxzzyryzrvrrldmklqqlldlsicjjc` (`key`,`language`),
  KEY `idx_cpmyzovvbptqobwypcsiinepfkgabzzfufrt` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fbulnysbinmxyqqbncsljrukwsmtaeudhvah` (`name`),
  KEY `idx_vicgltversgjljmdgqynfemthgzpkqnxqnbn` (`handle`),
  KEY `idx_nxxkhoagpotdryrwqzxveyolusihhdpneysq` (`dateDeleted`),
  KEY `fk_bzmxheepucizlcwiqekhbwoocnihcfkpmbtj` (`fieldLayoutId`),
  CONSTRAINT `fk_bzmxheepucizlcwiqekhbwoocnihcfkpmbtj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ylhrejroforhgitacxlvctrygayvdphiegxw` (`groupId`),
  CONSTRAINT `fk_eumtuaiiqlaezobcgggnwturspcnzumhjwij` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rcgvjrxktkyhxhawidwzrapvreikziswutnd` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pyvxagpfkiryjhckhruexnydkimgonoymonk` (`cacheId`),
  KEY `idx_ehbsihfqhjxfeptkrugmdvrmqcncjydiugkv` (`elementId`),
  CONSTRAINT `fk_acswrcdrqazrkazxaxiepcnvwjgpmpoakcah` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mnrddgnoxvhylkgjvujgflhqetadcwreovnu` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jebdpmmpyrxmsqkimfcislvncjuhodbilokm` (`cacheId`),
  KEY `idx_raxrcjrauifsypxnsdyyiwyswhyoseddbkon` (`type`),
  CONSTRAINT `fk_gcoocagsojakthjpfuqlpwrgkqitetbuuxon` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stygkexkionmpttuglmhwtsxetajfxncfxgw` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_qpbatojumcjbcacumbsfjcmrrntvqnhymrty` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_xcymcjoiaehvtwkbvncxdidavzkdxmebgxbp` (`siteId`),
  CONSTRAINT `fk_aslokevkmozfcntdbmlzhdzgyoxgpvpasihn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ghxfldpyscsvgekdtrepkvhrlfzwznuemlxy` (`token`),
  KEY `idx_syaihqkszqoejokjdsdikrsikokljqicucub` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uffmficagqvlrkfwzzfizplxfavjvymkxsth` (`handle`),
  KEY `idx_lxcdxitxvebzeqlwhrnbdupdnbitzdgllboa` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wzntwdyokexrzmvbbpuzsvevdxjlrvnjegng` (`groupId`,`userId`),
  KEY `idx_yzvlasfxfkwbsjzvecwrnflmlnbocjkgfsls` (`userId`),
  CONSTRAINT `fk_kdpugonuwfdreslvghuwzyctrelvduoniewb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ouiwzomprfezbgwxmpjapxxbbabxcoepsdsz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vuorjfqnxdcpfyknbqiwenzprkpgvzrripxv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xuzuqczhwlcynyxzpepbepfabzjyrpoflzwd` (`permissionId`,`groupId`),
  KEY `idx_awyqpjvdijcjacgknkutkwahzkpfiooiteag` (`groupId`),
  CONSTRAINT `fk_jbricxivofzmwrzwdmjltukhrpxphsuxgnks` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_olwyhlmnqnjjeswujlpmybftfwqkgsbzqyiu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qinerklginliapdriegvicyqyakggqetuvao` (`permissionId`,`userId`),
  KEY `idx_rwrxfrsevaejlnvijhdedynhixumnjyachtu` (`userId`),
  CONSTRAINT `fk_aqgepuimkdiefoulaiafduohnymyxpkievld` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udixheyzsayeaxoflqwwfypxqixcqhhghdyg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_pdvbtknbgafkuliglqnauxdcsmspqvtcqpyb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yxmiwrlhoqlaasezumsawxdchvrgufrcdnir` (`uid`),
  KEY `idx_eoyxfsqcycslixluugkfebelynqzjlmhlvmp` (`verificationCode`),
  KEY `idx_ppfmfmsfxqycbbjswzdojddqlpehnmklzgip` (`email`),
  KEY `idx_twdiarbploemmmvcunhwlakscalziznyzoqn` (`username`),
  KEY `fk_pfgamosfmhhxbuyxijcotfvchliapfxuccmm` (`photoId`),
  CONSTRAINT `fk_jsjxdbovqcrpbiifinadoothwmxcmunfkowd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pfgamosfmhhxbuyxijcotfvchliapfxuccmm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_teipcengzlfaywcficgbvfnqfhgdprallbst` (`name`,`parentId`,`volumeId`),
  KEY `idx_mnpzcemvrpjpfxawsrdsrgkryjvywmipwunr` (`parentId`),
  KEY `idx_jejdcnqpmxhsjwtunsdhsrlutvgaomzynefs` (`volumeId`),
  CONSTRAINT `fk_esoxfwwposxybtzruzzzjnfsmtsspobdlulj` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uormwgqsxzmxwpcphptoebwegkczgvcczjkt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ncehzrqzrvntdyejlrxlxuitzffwbszyiakj` (`name`),
  KEY `idx_zwkfyodwigmpmhumqsteyzgywmsqyzyrusme` (`handle`),
  KEY `idx_etvixwtdpltldmiciwztukeykvfmjufxiayd` (`fieldLayoutId`),
  KEY `idx_ctzsmlesolseldxtxtiwpskgsrkylvysrhrq` (`dateDeleted`),
  CONSTRAINT `fk_rjjjkkkbcobcehqyifiaeppffrzwezosqjdq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wheelform_form_fields`
--

DROP TABLE IF EXISTS `wheelform_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheelform_form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(3) NOT NULL DEFAULT '0',
  `index_view` tinyint(3) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `options` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hlyevehwirdibsofikufpqocswxgqljdtbny` (`active`),
  KEY `fk_glxjmlmmpnypmuzdmqiipcnzyixcnvbyuwrg` (`form_id`),
  CONSTRAINT `fk_glxjmlmmpnypmuzdmqiipcnzyixcnvbyuwrg` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wheelform_forms`
--

DROP TABLE IF EXISTS `wheelform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheelform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `send_email` tinyint(3) NOT NULL DEFAULT '0',
  `recaptcha` tinyint(3) NOT NULL DEFAULT '0',
  `save_entry` tinyint(3) NOT NULL DEFAULT '1',
  `options` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dqfgerkqmcvosskgrutbrstbwnwpzqeuvyht` (`site_id`),
  CONSTRAINT `fk_dqfgerkqmcvosskgrutbrstbwnwpzqeuvyht` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wheelform_message_values`
--

DROP TABLE IF EXISTS `wheelform_message_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheelform_message_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_umtheavvvyzwzuhkrmdlxucvpcgtunbftsqp` (`message_id`),
  KEY `fk_jrwpbqlisbvngohwsyritcejetpjruutnikr` (`field_id`),
  CONSTRAINT `fk_jrwpbqlisbvngohwsyritcejetpjruutnikr` FOREIGN KEY (`field_id`) REFERENCES `wheelform_form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umtheavvvyzwzuhkrmdlxucvpcgtunbftsqp` FOREIGN KEY (`message_id`) REFERENCES `wheelform_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wheelform_messages`
--

DROP TABLE IF EXISTS `wheelform_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheelform_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `read` tinyint(3) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_vejbpcrojqaqqxrpklqccfwwawkxtehginwp` (`form_id`),
  CONSTRAINT `fk_vejbpcrojqaqqxrpklqccfwwawkxtehginwp` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mdpicwwouvabejzgaysbbbrubxecfhiaukcs` (`userId`),
  CONSTRAINT `fk_qkwlhwticsmcrzuiuayxaqyejqngwkypynmw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'wbpsczdi_craft3-cms'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25  0:43:25
-- MySQL dump 10.13  Distrib 5.7.23-23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: wbpsczdi_craft3-cms
-- ------------------------------------------------------
-- Server version	5.7.23-23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (16,1,1,1,'logo.png','image',140,60,501,NULL,NULL,NULL,'2021-10-22 16:08:00','2021-10-22 16:08:00','2021-10-22 16:08:00','27a560bb-17a2-41ba-802e-0d48e426a960'),(23,1,1,1,'placeholder-image-square3.png','image',580,418,367754,NULL,NULL,NULL,'2021-10-22 16:16:52','2021-10-22 16:16:52','2021-10-22 16:16:52','0b2f8b5a-ff1e-498e-b4ff-760e753f20d6'),(100,1,1,1,'image.png','image',373,240,167479,NULL,NULL,NULL,'2021-10-22 16:48:12','2021-10-22 16:48:12','2021-10-22 16:48:12','30dad5ad-c8bb-412a-8ca1-06a0e21dd297'),(103,1,1,1,'placeholder-image-square.jpg','image',373,240,102059,NULL,NULL,NULL,'2021-10-22 16:49:03','2021-10-22 16:49:03','2021-10-22 16:49:03','94e5f84f-ea62-41e9-a125-3e943f9a081d'),(106,1,1,1,'placeholder-image-square.png','image',373,240,128982,NULL,NULL,NULL,'2021-10-22 16:52:21','2021-10-22 16:52:21','2021-10-22 16:52:21','94d994fb-a47d-410b-beb6-6c15ca245cf6');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (99,1,'slug','2021-10-23 15:25:33',0,1),(99,1,'title','2021-10-23 15:25:33',0,1),(99,1,'uri','2021-10-23 15:25:33',0,1),(102,1,'slug','2021-10-23 15:25:22',0,1),(102,1,'title','2021-10-23 15:25:22',0,1),(102,1,'uri','2021-10-23 15:17:32',0,1),(105,1,'slug','2021-10-23 15:25:04',0,1),(105,1,'title','2021-10-23 15:25:04',0,1),(105,1,'uri','2021-10-23 15:17:28',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,8,'2021-10-24 10:49:45',0,1),(24,1,11,'2021-10-24 10:49:45',0,1),(24,1,12,'2021-10-22 16:27:30',0,1),(24,1,28,'2021-10-22 16:36:45',0,1),(29,1,19,'2021-10-22 16:36:45',0,1),(29,1,21,'2021-10-22 16:36:45',0,1),(29,1,22,'2021-10-22 16:36:45',0,1),(99,1,26,'2021-10-22 16:48:15',0,1),(99,1,27,'2021-10-23 15:14:19',0,1),(102,1,26,'2021-10-23 15:23:55',0,1),(102,1,27,'2021-10-23 15:25:22',0,1),(105,1,26,'2021-10-23 15:25:04',0,1),(105,1,27,'2021-10-23 15:25:04',0,1),(105,1,30,'2021-10-23 15:14:28',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-10-19 18:07:59','2021-10-19 18:07:59','4af4108c-2329-4e31-b337-0fbd5e85e5dd',NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,'2021-10-22 14:32:27','2021-10-24 10:35:08','6003a094-53c8-45ec-a286-1e648beda1a5',NULL,NULL,NULL,NULL,NULL),(3,3,1,'Homepage','2021-10-22 14:53:09','2021-10-24 10:49:45','cc1be944-9674-4611-a11b-f6d1e99c7270',NULL,NULL,NULL,NULL,NULL),(4,4,1,'Homepage','2021-10-22 14:53:10','2021-10-22 14:53:10','fea18a2f-bdad-4321-b562-0f4e919a3b33',NULL,NULL,NULL,NULL,NULL),(5,5,1,'Homepage','2021-10-22 14:53:11','2021-10-22 14:53:11','5835a2f9-1988-4b28-bdfb-cda35e60e287',NULL,NULL,NULL,NULL,NULL),(7,16,1,'Logo','2021-10-22 16:07:59','2021-10-22 16:07:59','7202a196-ee2b-4145-a287-1695aac83ab7',NULL,NULL,NULL,NULL,NULL),(8,23,1,'Placeholder image square3','2021-10-22 16:16:51','2021-10-22 16:16:51','23973a7d-c1bc-4d1d-9fe8-fe6f314a84a4',NULL,NULL,NULL,NULL,NULL),(9,31,1,'Homepage','2021-10-22 16:17:01','2021-10-22 16:17:01','bbea9680-9619-4cd6-a738-5d196a428d64',NULL,NULL,NULL,NULL,NULL),(11,47,1,'Homepage','2021-10-22 16:27:31','2021-10-22 16:27:31','3d397513-70f8-455a-8ab4-53f93984a32d',NULL,NULL,NULL,NULL,NULL),(13,72,1,'Homepage','2021-10-22 16:36:46','2021-10-22 16:36:46','584d18a0-def0-4ca9-9bdc-d945749acf3f',NULL,NULL,NULL,NULL,NULL),(15,92,1,'Homepage','2021-10-22 16:40:07','2021-10-22 16:40:07','939d550a-c87f-442c-b20f-04b02ddb0518',NULL,NULL,NULL,NULL,NULL),(16,99,1,'Inactive Tab','2021-10-22 16:47:47','2021-10-23 15:25:33','581a0473-94e8-4d93-81ac-4b29fdd3485d',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(17,100,1,'Image','2021-10-22 16:48:11','2021-10-22 16:48:11','7cc9df77-3fd9-4c73-a821-74a2df74e30c',NULL,NULL,NULL,NULL,NULL),(18,101,1,'This is a wide container title stretching two lines.','2021-10-22 16:48:28','2021-10-22 16:48:28','9b30eace-869b-499c-9007-f7e7c0924430',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(19,102,1,'Hovered Tab','2021-10-22 16:48:35','2021-10-23 15:25:22','37d6e0f2-7382-431f-8e69-d560e82f6845',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(20,103,1,'Placeholder image square','2021-10-22 16:49:03','2021-10-22 16:49:03','100a3b09-4d84-4722-a5cc-ffb4579f779b',NULL,NULL,NULL,NULL,NULL),(21,104,1,'This is a wide container title stretching two lines.','2021-10-22 16:49:13','2021-10-22 16:49:13','3dfd2508-5037-4531-b912-cc9d750d784e',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing<a href=\"https://wbhtbgovt.in/#\"><br /></a></p>\n',NULL),(22,105,1,'Active Tab','2021-10-22 16:51:47','2021-10-23 15:25:04','c61c7ed5-861e-4d5a-9b28-899abc9b3f77',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(23,106,1,'Placeholder image square','2021-10-22 16:52:20','2021-10-22 16:52:20','3ff35699-a6ca-4598-90e1-95dfa88c0727',NULL,NULL,NULL,NULL,NULL),(24,107,1,'This is a wide container title stretching two lines.','2021-10-22 16:52:56','2021-10-22 16:52:56','e01502c8-c574-4b3e-8ea6-b8dcf621268e',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing<a href=\"https://wbhtbgovt.in/#\"><br /></a></p>\n',NULL),(26,109,1,'Active Tab','2021-10-23 15:04:30','2021-10-23 15:04:30','a3913c81-13a3-4e20-82e2-609534f7b94e',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing<a href=\"https://wbhtbgovt.in/#\"><br /></a></p>\n',NULL),(28,111,1,'Hovered Tab','2021-10-23 15:06:00','2021-10-23 15:06:00','cfd022a8-4914-4feb-957a-9c5958110814',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing<a href=\"https://wbhtbgovt.in/#\"><br /></a></p>\n',NULL),(30,113,1,'Inactive Tab','2021-10-23 15:06:21','2021-10-23 15:06:21','2526c263-87bf-412c-ab75-3ef81146a3b3',NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(34,117,1,'Hovered Tab','2021-10-23 15:14:14','2021-10-23 15:14:14','35016bc2-51a5-4f1d-b313-ecd7a8e751e2',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(35,118,1,'Inactive Tab','2021-10-23 15:14:19','2021-10-23 15:14:19','134d9059-02c7-409b-a670-78d644245f62',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(36,119,1,'Active Tab','2021-10-23 15:14:28','2021-10-23 15:14:28','4ec57a75-4f8c-4dc0-bf7a-d7a0247fea4a',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n <p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(38,121,1,'Active Tab','2021-10-23 15:17:28','2021-10-23 15:17:28','1d43371b-7571-491c-baa9-f761e87df2a0',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n <p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(39,122,1,'Hovered Tab','2021-10-23 15:17:32','2021-10-23 15:17:32','dcca519b-1775-4171-9eff-f00d8714a888',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(40,123,1,'Inactive Tab','2021-10-23 15:17:37','2021-10-23 15:17:37','2c602111-6d88-4f86-aac6-90c5b32b2bdd',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(42,125,1,'This is a wide container title stretching two lines.','2021-10-23 15:23:27','2021-10-23 15:23:27','9b403a6f-694e-489f-9822-418561963a97',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(44,127,1,'This is a wide container title stretching two lines.','2021-10-23 15:23:55','2021-10-23 15:23:55','0095eb5c-0ff4-410c-8f4e-c9480202c9eb',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(46,129,1,'This is a wide container title stretching two lines.','2021-10-23 15:24:19','2021-10-23 15:24:19','f6f2b3c2-5d7a-4382-8deb-09c7c39a19af',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(48,131,1,'Active Tab','2021-10-23 15:25:04','2021-10-23 15:25:04','62ff1cc5-f263-464c-b16a-2f040a7dd758',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(50,133,1,'Hovered Tab','2021-10-23 15:25:22','2021-10-23 15:25:22','733efb25-22c3-4a94-b1e8-8e6c0a055435',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(52,135,1,'Inactive Tab','2021-10-23 15:25:33','2021-10-23 15:25:33','6254bb16-d0ef-473f-a6bc-8d517d2e1891',NULL,NULL,NULL,'<h3 class=\"bg-2h\">This is a wide container title stretching two lines.</h3>\n<p class=\"bg-2p\">Lorem ipsum dolor sit amet, consectetur adipisicing</p>',NULL),(54,146,1,'Homepage','2021-10-24 10:45:21','2021-10-24 10:45:21','6d55dedb-99ac-40f6-a430-715cb1f58503',NULL,NULL,NULL,NULL,NULL),(56,163,1,'Homepage','2021-10-24 10:49:45','2021-10-24 10:49:45','b340e14a-f09b-4217-b974-1d11ccec656f',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-10-19 18:07:56','2021-10-19 18:07:56',NULL,NULL,'12483b59-0339-447e-a4b2-184df3f308cb'),(2,NULL,NULL,NULL,8,'craft\\elements\\GlobalSet',1,0,'2021-10-22 14:32:27','2021-10-24 10:35:08',NULL,NULL,'8dc4fe8c-286a-442e-8bf6-c765c528e114'),(3,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2021-10-22 14:53:09','2021-10-24 10:49:45',NULL,NULL,'0e564947-557c-42d7-9074-301b28fee761'),(4,3,NULL,1,9,'craft\\elements\\Entry',1,0,'2021-10-22 14:53:09','2021-10-22 14:53:10',NULL,NULL,'fd6ca8b8-205f-4f6b-b6f9-43e933921393'),(5,3,NULL,2,9,'craft\\elements\\Entry',1,0,'2021-10-22 14:53:11','2021-10-22 14:53:11',NULL,NULL,'eaae7612-21e2-4824-a52d-f115cc5c7c20'),(7,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 14:54:46','2021-10-22 14:54:46',NULL,'2021-10-22 14:54:53','8a8ef584-6c88-4eb3-9f53-b0a48b1051c6'),(8,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 14:54:51','2021-10-22 14:54:51',NULL,'2021-10-22 14:54:56','a33e0153-96bf-402b-915a-04eccc0f986b'),(9,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 14:54:52','2021-10-22 14:54:52',NULL,'2021-10-22 14:54:56','7a2e61d9-6884-4664-8386-796dfc6a1c1a'),(10,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 14:54:52','2021-10-22 14:54:52',NULL,'2021-10-22 14:54:56','cb95b31a-291d-4460-88d5-2b786884c5ea'),(16,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-10-22 16:07:59','2021-10-22 16:07:59',NULL,NULL,'5f95709c-cfa6-4b19-bca4-a2d2ead8f007'),(17,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:15:52','2021-10-22 16:15:52',NULL,'2021-10-22 16:15:56','6bd2a4f0-9ea7-419e-ba2a-5c2f75e7fe1e'),(18,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:15:56','2021-10-22 16:15:56',NULL,'2021-10-22 16:16:00','19a2e86d-2f13-4cc3-89ee-4dc2f80a6455'),(19,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:16:00','2021-10-22 16:16:00',NULL,'2021-10-22 16:16:04','18c7748e-8e02-453a-ba6c-cf9c87d38e4c'),(20,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:16:00','2021-10-22 16:16:00',NULL,'2021-10-22 16:16:04','dc223b6a-f52f-4921-95ad-b0eb5b847521'),(23,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-10-22 16:16:51','2021-10-22 16:16:51',NULL,NULL,'b3245741-e7c5-41db-9f19-a05bbf156a1d'),(24,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-24 10:49:45',NULL,NULL,'502e4611-2f43-4c72-8c71-d5638e514b70'),(25,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','8e805681-8d25-46e5-a2aa-3a9ffb25238f'),(26,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','b40d59b7-9265-4932-8955-a2bd7aaae89a'),(27,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','d48e7183-a6be-47a9-8ed8-6b2829240455'),(28,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','d93b5f4b-dd46-4b34-b857-2b70a3db7dcf'),(29,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-24 10:49:45',NULL,NULL,'247ee61d-98d6-4f49-9d78-c58321aff937'),(30,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:35','64456db4-490c-44e4-bfb6-1da73c27ec5b'),(31,3,NULL,3,9,'craft\\elements\\Entry',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,NULL,'c3f956c1-794a-4e9d-8e51-d5b593f11762'),(32,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,NULL,'cbb07e7e-8319-429b-ae31-adaa37a36925'),(33,25,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,NULL,'b5f098ba-7ef8-47a6-9c6e-45544fd9001e'),(34,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','f6bac80b-4c78-42be-b7d9-2339d443781f'),(35,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','4afffccd-8a38-4990-93b1-c5cdc60f3a9e'),(36,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,'2021-10-22 16:35:34','1782375f-4069-4609-87bd-fecd9669a3eb'),(37,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,NULL,'a35ff057-52fd-4d79-a5d0-7044a9b88635'),(38,30,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:17:01','2021-10-22 16:17:01',NULL,NULL,'0d86082c-cf2d-44c9-9876-dd200e3edb4c'),(47,3,NULL,4,9,'craft\\elements\\Entry',1,0,'2021-10-22 16:27:30','2021-10-22 16:27:31',NULL,NULL,'81ebad51-c43f-4cb1-824f-be515a783945'),(48,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:27:31','2021-10-22 16:27:31',NULL,NULL,'48d66d42-199c-4548-898c-9709b9f80b60'),(49,25,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,NULL,'d366d3d6-579d-4c17-91c6-5b6b7902ab66'),(50,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,'2021-10-22 16:35:34','96312025-5fc3-4ac4-a39f-8cf610b7b255'),(51,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,'2021-10-22 16:35:34','31e916d4-f23d-4fbf-9140-2ab1d123331f'),(52,NULL,NULL,NULL,4,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,'2021-10-22 16:35:34','d4152232-0959-4b1a-a55c-26f5c825c1af'),(53,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,NULL,'e1bb3377-1f26-43e1-b481-094b9f83b55f'),(54,30,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:27:32','2021-10-22 16:27:32',NULL,NULL,'415af49c-79d9-4bcb-9b26-f4083b97ec2c'),(58,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:35:59','2021-10-22 16:35:59',NULL,'2021-10-22 16:36:02','ce07ca0e-2496-4c97-a0a1-5d04eb096088'),(59,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:02','2021-10-22 16:36:02',NULL,'2021-10-22 16:36:05','8755f5a9-71e1-4f12-ac9a-ef34b91b853b'),(60,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:02','2021-10-22 16:36:02',NULL,'2021-10-22 16:36:05','b1c719bd-951f-4501-b5f3-4cc9354bfd55'),(61,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:05','2021-10-22 16:36:05',NULL,'2021-10-22 16:36:08','5d133ac6-a590-4812-a5d7-fc14ee046826'),(62,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:05','2021-10-22 16:36:05',NULL,'2021-10-22 16:36:08','cf412d43-e66c-4822-8404-f2509b67aceb'),(63,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:08','2021-10-22 16:36:08',NULL,'2021-10-22 16:36:11','214d4876-afbf-45f7-878e-dc79dc6c29a2'),(64,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:08','2021-10-22 16:36:08',NULL,'2021-10-22 16:36:11','492af9b8-20b5-448e-92c5-7ad5720f9466'),(65,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:08','2021-10-22 16:36:08',NULL,'2021-10-22 16:36:11','668d1d52-0c52-4f77-b678-2b9d6e4b1d2b'),(69,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:45','2021-10-22 16:36:45',NULL,'2021-10-22 16:40:07','157dd354-7178-4d5e-9156-56d0bdc50872'),(70,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:45','2021-10-22 16:36:45',NULL,'2021-10-22 16:40:07','a8850690-7542-4513-9695-0b7510e5ec68'),(71,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:45','2021-10-22 16:36:45',NULL,'2021-10-22 16:40:07','08139a40-561b-44f5-a074-4e5759d1cb07'),(72,3,NULL,5,9,'craft\\elements\\Entry',1,0,'2021-10-22 16:36:45','2021-10-22 16:36:46',NULL,NULL,'8767a2d0-96c9-4903-9685-54c7ff28f838'),(73,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:36:46','2021-10-22 16:36:46',NULL,NULL,'e400e4ac-7000-4101-ac15-5d4daabdd9b6'),(74,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:46','2021-10-22 16:36:46',NULL,NULL,'af3162df-ceea-4800-924e-7dae36f812ce'),(75,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:46','2021-10-22 16:36:46',NULL,NULL,'fa46dd91-c8fb-49d0-8417-ef46df337746'),(76,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:36:46','2021-10-22 16:36:46',NULL,NULL,'26e6c20e-0f40-488a-b6c2-003c2008761e'),(77,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:36:46','2021-10-22 16:36:46',NULL,NULL,'0d3b2ec9-b29f-40ad-83c3-b0f5ece42dc1'),(84,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:39:51','2021-10-22 16:39:51',NULL,'2021-10-22 16:39:54','99bda19b-bb9d-453e-9a00-76acad11f236'),(85,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:39:54','2021-10-22 16:39:54',NULL,'2021-10-22 16:39:57','1fa9e3f2-e5d3-4158-ab78-c5a22707141c'),(86,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:39:57','2021-10-22 16:39:57',NULL,'2021-10-22 16:40:04','b3ac6d69-7157-4cad-83c3-2e428fae8442'),(88,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,'2021-10-24 10:45:19','1eb386d3-0a67-4caf-944c-ad258795b661'),(89,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,'2021-10-24 10:45:19','5d0d8b86-faa2-4c1e-a83f-89269947c9cb'),(90,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,'2021-10-24 10:45:19','5e7d1a2b-7f98-49b3-84b4-18138e466228'),(91,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:40:07','2021-10-24 10:49:45',NULL,NULL,'623942c7-c8df-4d13-ae90-c2c56a5fc526'),(92,3,NULL,6,9,'craft\\elements\\Entry',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'bd246bb4-cd45-4ae7-8174-b7481de57c6a'),(93,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'11f1ddd1-da29-48c9-bf19-6f6db802ca2a'),(94,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'3eb9a22d-7cd5-4268-997e-516f7d508595'),(95,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'9f6de141-adcc-4fff-be46-26066a883482'),(96,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'71dbb699-1341-4b9f-b349-b4cc30c04159'),(97,91,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'96cf432e-34f1-4cc2-8454-5fe5e57f1da3'),(98,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07',NULL,NULL,'62fd36fb-0c7f-4c2a-98ff-1a8a57127860'),(99,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:47:47','2021-10-23 15:25:33',NULL,NULL,'51f03389-d041-488e-88eb-228cb9887388'),(100,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-10-22 16:48:11','2021-10-22 16:48:11',NULL,NULL,'78697d2d-7fc2-4eda-8aaa-6cbc3b06a115'),(101,99,NULL,7,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:48:28','2021-10-22 16:48:28',NULL,NULL,'8ea645e8-248d-4fc4-919f-572473206f1c'),(102,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:48:35','2021-10-23 15:25:22',NULL,NULL,'e24d375b-5ebb-4695-a17b-f6a18dc13771'),(103,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-10-22 16:49:03','2021-10-22 16:49:03',NULL,NULL,'b7d236a6-8dfb-428b-bcbb-6a9aa15f43e4'),(104,102,NULL,8,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:49:13','2021-10-22 16:49:13',NULL,NULL,'34ce3089-6b17-4c3f-ba2e-9055e9b3fc86'),(105,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:51:47','2021-10-23 15:25:04',NULL,NULL,'14dccf8d-a9cf-4e29-b644-e4e570b05228'),(106,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-10-22 16:52:20','2021-10-22 16:52:20',NULL,NULL,'76880239-b933-470b-a48a-00795dbd3558'),(107,105,NULL,9,11,'craft\\elements\\Entry',1,0,'2021-10-22 16:52:56','2021-10-22 16:52:56',NULL,NULL,'6a585f79-b824-4a6d-8464-6052e485574c'),(109,105,NULL,10,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:04:30','2021-10-23 15:04:30',NULL,NULL,'9612f65e-3cce-4355-aa72-2dfda8178529'),(111,102,NULL,11,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:06:00','2021-10-23 15:06:00',NULL,NULL,'2cff3808-9721-4b3b-a700-418af3858de1'),(113,99,NULL,12,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:06:21','2021-10-23 15:06:21',NULL,NULL,'b8b9e359-d587-4c98-964b-6e7c18c21018'),(117,102,NULL,13,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:14:14','2021-10-23 15:14:14',NULL,NULL,'7f0816a2-be8e-46ee-829b-04461467a54d'),(118,99,NULL,14,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:14:19','2021-10-23 15:14:19',NULL,NULL,'ab28c2d2-6b39-45d4-9fb8-91700deca389'),(119,105,NULL,15,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:14:28','2021-10-23 15:14:28',NULL,NULL,'35a69410-fee7-4e10-9b6c-c365ecf38cd9'),(121,105,NULL,16,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:17:28','2021-10-23 15:17:28',NULL,NULL,'36851063-c6bc-4e48-bcaf-b4976f61686b'),(122,102,NULL,17,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:17:32','2021-10-23 15:17:32',NULL,NULL,'88996bfc-9196-4f67-85bc-8c5eb9a33ba7'),(123,99,NULL,18,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:17:37','2021-10-23 15:17:37',NULL,NULL,'a852c600-349f-4453-98df-f31a42772ec2'),(125,105,NULL,19,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:23:27','2021-10-23 15:23:27',NULL,NULL,'281b8c8c-2ba0-47ca-9439-d2824bb06994'),(127,102,NULL,20,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:23:55','2021-10-23 15:23:55',NULL,NULL,'a79dd673-636c-41a0-ae7c-b624109df485'),(129,99,NULL,21,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:24:19','2021-10-23 15:24:19',NULL,NULL,'65732798-53a9-46e4-9c88-539fc54eb909'),(131,105,NULL,22,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:25:04','2021-10-23 15:25:04',NULL,NULL,'5c01f21b-70d7-4344-92b8-be5a6825174c'),(133,102,NULL,23,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:25:22','2021-10-23 15:25:22',NULL,NULL,'428ab09f-492e-4bc0-b43d-b11a9e576efa'),(135,99,NULL,24,11,'craft\\elements\\Entry',1,0,'2021-10-23 15:25:33','2021-10-23 15:25:33',NULL,NULL,'e5102fcc-6d73-4cee-86f0-204702dc9a95'),(143,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:19','2021-10-24 10:45:19',NULL,'2021-10-24 10:49:45','8571a9ce-a06d-46dd-828c-78620828edf7'),(144,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:19','2021-10-24 10:45:19',NULL,'2021-10-24 10:49:45','d2ee19ce-8b73-4948-b854-ca6e32b63455'),(145,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:19','2021-10-24 10:45:19',NULL,'2021-10-24 10:49:45','678798d1-558d-4039-bea0-f848bc2c4a15'),(146,3,NULL,25,9,'craft\\elements\\Entry',1,0,'2021-10-24 10:45:19','2021-10-24 10:45:21',NULL,NULL,'6c692c9c-241b-4bef-b88a-f39c7c0e7b00'),(147,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'91198803-5574-4f7f-98bc-e540f07bb743'),(148,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'ccb2b94e-23d4-42c7-98f5-7b371ebc4488'),(149,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'5283e10d-359e-4e5e-91f5-3a9f6449035e'),(150,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'b924d97a-fc7f-4940-b6a0-fe5cbaefe5ad'),(151,91,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'605807ef-bab5-48f8-a56c-c5c1b5cdf978'),(152,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:45:21','2021-10-24 10:45:21',NULL,NULL,'ae5dd937-12d5-4f9e-b4b6-e270013066e7'),(160,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'cb1b6bc8-1eaa-48a8-90f4-43cd89b7c5c5'),(161,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'6d4730aa-21d7-4fb7-a49d-4a6c82cebca9'),(162,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'cbd5ecc8-156a-41e6-b6a3-3231b8ffb53f'),(163,3,NULL,26,9,'craft\\elements\\Entry',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'a7ef800c-f160-49d0-b3e9-6f87977ad2ed'),(164,24,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'4d8f8e9b-7cd5-4cf2-ae88-1e22789296d6'),(165,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'1647b8b2-959d-48c1-bf6a-aa39bb92f0db'),(166,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'833e95f6-e15b-4846-ab83-bae7cd0f162a'),(167,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'9b2f71b6-3979-4101-933b-9951fd3e792d'),(168,91,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'48437507-9d9d-4b13-9e7b-915bb9ae802b'),(169,29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-10-24 10:49:45','2021-10-24 10:49:45',NULL,NULL,'1fce1dfd-1b79-42ba-8feb-3b0f88862c42');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-10-19 18:07:57','2021-10-19 18:07:57','da4ea43d-b9d3-4750-9f87-d367677fc88f'),(2,2,1,NULL,NULL,1,'2021-10-22 14:32:27','2021-10-22 14:32:27','6643e909-a56c-49ef-b944-6d343d0099c3'),(3,3,1,'homepage','__home__',1,'2021-10-22 14:53:09','2021-10-22 14:53:09','e1de25ae-96ea-404d-94e7-71f42d3d457c'),(4,4,1,'homepage','__home__',1,'2021-10-22 14:53:10','2021-10-22 14:53:10','f2f664d2-f355-4cc6-b8c5-b3490ec39725'),(5,5,1,'homepage','__home__',1,'2021-10-22 14:53:11','2021-10-22 14:53:11','8fd2b99e-7151-43f4-9700-ad2af822052e'),(7,7,1,NULL,NULL,1,'2021-10-22 14:54:47','2021-10-22 14:54:47','da82ca98-4e34-4009-9d28-a9a6d39f1a41'),(8,8,1,NULL,NULL,1,'2021-10-22 14:54:51','2021-10-22 14:54:51','948df894-b0d5-43d7-9546-2e55d6c5c10e'),(9,9,1,NULL,NULL,1,'2021-10-22 14:54:52','2021-10-22 14:54:52','99e1d7e3-fd16-4fad-a024-9bdfc3171232'),(10,10,1,NULL,NULL,1,'2021-10-22 14:54:52','2021-10-22 14:54:52','786af4d7-7392-4614-a6f7-87ef8286107e'),(16,16,1,NULL,NULL,1,'2021-10-22 16:07:59','2021-10-22 16:07:59','6e6120ee-60db-4722-9d32-a56331e5079b'),(17,17,1,NULL,NULL,1,'2021-10-22 16:15:52','2021-10-22 16:15:52','b633ed31-0f1c-4c19-865a-6e282f459661'),(18,18,1,NULL,NULL,1,'2021-10-22 16:15:56','2021-10-22 16:15:56','5700d55a-d17c-4b71-8814-86af1bcac58f'),(19,19,1,NULL,NULL,1,'2021-10-22 16:16:00','2021-10-22 16:16:00','3af33f0c-959e-4f80-9600-efe08e6f42c5'),(20,20,1,NULL,NULL,1,'2021-10-22 16:16:00','2021-10-22 16:16:00','db284248-33a1-40c1-b689-270ef5c0456d'),(23,23,1,NULL,NULL,1,'2021-10-22 16:16:51','2021-10-22 16:16:51','a5637562-f9e7-4ad0-a145-72687f3425a1'),(24,24,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','f93445aa-069a-4451-b5bd-fd7dfe6ae85c'),(25,25,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','4ba36aa3-d81d-4f24-b1f6-f0eb729e5d82'),(26,26,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','454c67fb-01de-4bba-9688-153a6c4de7da'),(27,27,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','c9047277-05d3-4c31-b147-8136b578f7f9'),(28,28,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','888de76b-b86b-420a-b728-5d7aaa88aeee'),(29,29,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','552f017d-7030-43c3-8284-6b328884098e'),(30,30,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','39f04e6f-9ea4-4a84-b6f4-187fa9218e84'),(31,31,1,'homepage','__home__',1,'2021-10-22 16:17:01','2021-10-22 16:17:01','1004a43d-0aeb-4e74-aeff-d55443bc0d36'),(32,32,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','d2a44bbc-434a-4a30-ab79-be239cff17f3'),(33,33,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','f130be4d-bb69-453d-80a6-53129459a0bb'),(34,34,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','e3a33750-941d-45eb-a5e9-1b8c6746c393'),(35,35,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','ddb74be8-5afe-46b5-abc8-72c94ac1377f'),(36,36,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','aca2ab8d-8bb4-40c6-b014-89e80683d220'),(37,37,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','55d57f4b-7189-4500-87b6-88015da42886'),(38,38,1,NULL,NULL,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','e1dc669d-9f45-4aef-8f2a-d8a02ddd103f'),(47,47,1,'homepage','__home__',1,'2021-10-22 16:27:31','2021-10-22 16:27:31','02a7ea1f-872b-4747-9c5d-1eac15673209'),(48,48,1,NULL,NULL,1,'2021-10-22 16:27:31','2021-10-22 16:27:31','349c2535-8d95-4aeb-bbb5-d281620a459d'),(49,49,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','773c9326-a665-40cd-9a4c-50b80e6286ee'),(50,50,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','f9e3a4a8-4314-4a29-804e-dab85a71d1d0'),(51,51,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','88e0f58f-4bc2-409f-9e49-e15c1bff6f0b'),(52,52,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','207c4a21-0ecd-493a-bc13-fe598eca4ba5'),(53,53,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','37dba2dc-6613-4fa3-963d-89362a7ed6fb'),(54,54,1,NULL,NULL,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','82b99c0e-fd2c-4095-ba0a-87cfa57950d9'),(58,58,1,NULL,NULL,1,'2021-10-22 16:35:59','2021-10-22 16:35:59','b0ed44ca-22db-4614-b418-03dbade3dfc1'),(59,59,1,NULL,NULL,1,'2021-10-22 16:36:02','2021-10-22 16:36:02','40a81b10-1c54-4a69-a89f-b138738e9cc6'),(60,60,1,NULL,NULL,1,'2021-10-22 16:36:02','2021-10-22 16:36:02','c5b987bf-4489-41ce-ab47-d29ff6db79fe'),(61,61,1,NULL,NULL,1,'2021-10-22 16:36:05','2021-10-22 16:36:05','39f6c350-3829-46eb-bbef-71ae56280789'),(62,62,1,NULL,NULL,1,'2021-10-22 16:36:05','2021-10-22 16:36:05','c57ef2e9-09ef-463f-bf06-73d82dc73b92'),(63,63,1,NULL,NULL,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','92606653-e6e3-457f-9c6d-c61d91de40a3'),(64,64,1,NULL,NULL,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','6cca56b3-58f0-429b-a90c-dcae87428f5c'),(65,65,1,NULL,NULL,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','5fb333e0-962d-413a-92a6-a6b2dac9d760'),(69,69,1,NULL,NULL,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','a8ef4759-7757-438f-8f92-61bf3fe490a5'),(70,70,1,NULL,NULL,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','5fe47ff7-120a-457e-9b4d-8cd6b04ab5ea'),(71,71,1,NULL,NULL,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','18f9e48a-c869-4ddf-86ee-398bf2d2fcfd'),(72,72,1,'homepage','__home__',1,'2021-10-22 16:36:46','2021-10-22 16:36:46','b4efdebb-7e4d-4d90-99dd-d33d23eba529'),(73,73,1,NULL,NULL,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','6148f138-481e-42e6-b77f-2eb961af3486'),(74,74,1,NULL,NULL,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','e3824d3b-5a7f-4a28-be8e-67a1004baa90'),(75,75,1,NULL,NULL,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','95e987cd-df02-4d7c-a867-00b31aa76da9'),(76,76,1,NULL,NULL,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','a6a19c83-8f9c-4e69-ab69-0c4457b1e1a3'),(77,77,1,NULL,NULL,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','a0f57a93-1eed-47f0-acb0-4c0a77e140cc'),(84,84,1,NULL,NULL,1,'2021-10-22 16:39:51','2021-10-22 16:39:51','d6e3aab2-0ddb-47fa-9f8d-91277289d519'),(85,85,1,NULL,NULL,1,'2021-10-22 16:39:54','2021-10-22 16:39:54','ff614058-356a-448e-b16a-5318552d5952'),(86,86,1,NULL,NULL,1,'2021-10-22 16:39:57','2021-10-22 16:39:57','37c08d60-7c12-4d8a-8e4b-8245ab9938d4'),(88,88,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','b84f3fff-6ecb-447d-bbf1-1dbbfe614239'),(89,89,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','cf6f0550-a27a-4069-9093-a433a288d325'),(90,90,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','81d31fad-f800-4177-978d-420acf1ed1de'),(91,91,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','045bb021-a19d-45c8-afa9-2650aedca310'),(92,92,1,'homepage','__home__',1,'2021-10-22 16:40:07','2021-10-22 16:40:07','c19bcc2a-b685-4266-90db-24226de101bd'),(93,93,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','916cd2e3-2816-4e5f-9e42-e5bf67994809'),(94,94,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','b4907e48-f10a-4588-ba47-559e177ca81a'),(95,95,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','e1dbdfac-6daf-4ab0-9783-1d7f3e0d04ed'),(96,96,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','8fac65aa-35f6-4d78-ab55-f0c8fe7a5e29'),(97,97,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','c7f99ea4-a9f0-4138-a612-761ab8870bcf'),(98,98,1,NULL,NULL,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','fae1b0aa-24a9-42cd-a6d1-15951aee57d4'),(99,99,1,'inactive-tab','inactive-tab',1,'2021-10-22 16:47:47','2021-10-23 15:25:33','955176d7-933a-4461-8153-86502178dec2'),(100,100,1,NULL,NULL,1,'2021-10-22 16:48:11','2021-10-22 16:48:11','28f92695-6126-4479-9f22-dc6d1f092d02'),(101,101,1,'this-is-a-wide-container-title-stretching-two-lines','this-is-a-wide-container-title-stretching-two-lines',1,'2021-10-22 16:48:28','2021-10-22 16:48:28','2ad227a1-074e-4a4d-ae56-5cbb1a97c3d9'),(102,102,1,'hovered-tab','hovered-tab',1,'2021-10-22 16:48:35','2021-10-23 15:25:22','536060bd-f910-4554-aca5-112affca11a4'),(103,103,1,NULL,NULL,1,'2021-10-22 16:49:03','2021-10-22 16:49:03','10a93f18-6bf1-4be5-82c2-4c7828451b7b'),(104,104,1,'this-is-a-wide-container-title-stretching-two-lines-2','this-is-a-wide-container-title-stretching-two-lines-2',1,'2021-10-22 16:49:13','2021-10-22 16:49:13','d69ae45b-fff7-48d3-bb2e-a4cfab039a9c'),(105,105,1,'active-tab','active-tab',1,'2021-10-22 16:51:47','2021-10-23 15:25:04','118d5f9c-f7ff-435e-a9ae-7ce761ceb907'),(106,106,1,NULL,NULL,1,'2021-10-22 16:52:20','2021-10-22 16:52:20','33a2a312-af3f-4027-adef-ad39b1f1dce8'),(107,107,1,'this-is-a-wide-container-title-stretching-two-lines-3','this-is-a-wide-container-title-stretching-two-lines-3',1,'2021-10-22 16:52:56','2021-10-22 16:52:56','80834aa7-b66b-4b49-bf97-7e40987da720'),(109,109,1,'this-is-a-wide-container-title-stretching-two-lines-3','this-is-a-wide-container-title-stretching-two-lines-3',1,'2021-10-23 15:04:30','2021-10-23 15:04:30','e43091b6-bd28-4c67-a75f-4e65657aa500'),(111,111,1,'this-is-a-wide-container-title-stretching-two-lines-2','this-is-a-wide-container-title-stretching-two-lines-2',1,'2021-10-23 15:06:00','2021-10-23 15:06:00','81f8d15f-b718-46e8-ae6d-b5514b59f6a1'),(113,113,1,'this-is-a-wide-container-title-stretching-two-lines','this-is-a-wide-container-title-stretching-two-lines',1,'2021-10-23 15:06:21','2021-10-23 15:06:21','c92dd913-ba77-4261-9392-edcbf22366e2'),(117,117,1,'this-is-a-wide-container-title-stretching-two-lines-2','this-is-a-wide-container-title-stretching-two-lines-2',1,'2021-10-23 15:14:14','2021-10-23 15:14:14','4fdbc3d0-b774-4e83-adcb-546ac93536cc'),(118,118,1,'this-is-a-wide-container-title-stretching-two-lines','this-is-a-wide-container-title-stretching-two-lines',1,'2021-10-23 15:14:19','2021-10-23 15:14:19','bb85809c-eb56-4b0d-b916-fea1eec7956f'),(119,119,1,'this-is-a-wide-container-title-stretching-two-lines-3','this-is-a-wide-container-title-stretching-two-lines-3',1,'2021-10-23 15:14:28','2021-10-23 15:14:28','96c7114f-1041-4ea1-993c-6a89bb7420bf'),(121,121,1,'active-tab','active-tab',1,'2021-10-23 15:17:28','2021-10-23 15:17:28','1f28060a-2b9c-4782-8474-5dda11b1ce30'),(122,122,1,'hovered-tab','hovered-tab',1,'2021-10-23 15:17:32','2021-10-23 15:17:32','a6a425d0-8d56-4750-88b0-fcb9090e7fba'),(123,123,1,'inactive-tab','inactive-tab',1,'2021-10-23 15:17:37','2021-10-23 15:17:37','e7636579-7135-490a-9e39-097ebfdb02da'),(125,125,1,'this-is-a-wide-container-title-stretching-two-lines','this-is-a-wide-container-title-stretching-two-lines',1,'2021-10-23 15:23:27','2021-10-23 15:23:27','c0dd7340-0026-47f0-a2df-197f6e0a3e4b'),(127,127,1,'this-is-a-wide-container-title-stretching-two-lines-2','this-is-a-wide-container-title-stretching-two-lines-2',1,'2021-10-23 15:23:55','2021-10-23 15:23:55','3d7f56bd-fe4d-41ba-9648-dbba60969b71'),(129,129,1,'this-is-a-wide-container-title-stretching-two-lines-3','this-is-a-wide-container-title-stretching-two-lines-3',1,'2021-10-23 15:24:19','2021-10-23 15:24:19','e0e2a526-7b3b-4d83-9788-045779492fb8'),(131,131,1,'active-tab','active-tab',1,'2021-10-23 15:25:04','2021-10-23 15:25:04','47c89018-52dd-4dfc-bafd-e2a1ca7933fe'),(133,133,1,'hovered-tab','hovered-tab',1,'2021-10-23 15:25:22','2021-10-23 15:25:22','4a7014ce-8b30-4048-845e-e385bcec48fb'),(135,135,1,'inactive-tab','inactive-tab',1,'2021-10-23 15:25:33','2021-10-23 15:25:33','5256329e-fc20-440c-9e45-e8f180aee2f5'),(143,143,1,NULL,NULL,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','7dc9fd15-c301-471e-a117-6959088fcbc2'),(144,144,1,NULL,NULL,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','3b0685bc-a5ce-451f-aef2-3df04026e9db'),(145,145,1,NULL,NULL,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','5997fa9e-dc0c-4564-8fb5-36621a7b6485'),(146,146,1,'homepage','__home__',1,'2021-10-24 10:45:21','2021-10-24 10:45:21','f8701d97-ad6e-44c8-b306-f8aeecf625af'),(147,147,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','65cf473b-ef6d-426e-ac18-b1d50f365000'),(148,148,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','87750704-a886-4b02-b23f-29e5aa1515fc'),(149,149,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','13001299-a8be-464e-a09b-ce2e14116227'),(150,150,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','095ae9f3-88ff-41fd-af82-9c42e9258d7e'),(151,151,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','3aefc356-5f4b-40ff-8552-bae54e231de8'),(152,152,1,NULL,NULL,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','dea6d7b6-92e3-451a-9833-6bf53f5bd968'),(160,160,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','0a442baf-64ef-4ee7-a5f0-078617b378f5'),(161,161,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','3a874a01-3395-43a5-8cbe-5298d4a7b9fd'),(162,162,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','232db096-0aca-4363-ae2d-dc4b7b53041c'),(163,163,1,'homepage','__home__',1,'2021-10-24 10:49:45','2021-10-24 10:49:45','87b85465-55b0-414d-a684-ea788e734f46'),(164,164,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','171816fa-359d-4d65-8247-52eeeb05640a'),(165,165,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','f6d2efe8-54c1-45e9-871a-e6e5aa18b370'),(166,166,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','c7f81722-85bd-4118-91cd-29029b3da9f7'),(167,167,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','0a71ad76-9b39-441f-ba93-3084f958a4e3'),(168,168,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','5c3e73e9-006d-4634-9d19-ff14f3d795a5'),(169,169,1,NULL,NULL,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','bea46bd7-9894-48cf-bba6-4e0d807fe5e0');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 14:53:10','2021-10-22 14:53:10','d30a5b14-816b-41f7-b86a-6ae7b5e1b4e5'),(4,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 14:53:10','2021-10-22 14:53:10','5292afe6-bbb3-4035-ba6b-578bdf761da5'),(5,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 14:53:11','2021-10-22 14:53:11','ab875537-0252-4344-a9b1-5f32aa5249ce'),(31,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 16:17:01','2021-10-22 16:17:01','736ceb96-5abd-473f-b258-670495c1027d'),(47,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 16:27:31','2021-10-22 16:27:31','7855f43e-8fab-4718-bbac-a3e145f3e007'),(72,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','f42959ef-fb75-4457-99b3-31b63b2520b6'),(92,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','75b75617-5d1c-45d5-8381-cd981dff4855'),(99,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-22 16:47:47','2021-10-22 16:47:47','5c0b4099-87eb-4e4c-9067-010e3666f7ec'),(101,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-22 16:48:28','2021-10-22 16:48:28','11c6e942-02ee-4de0-ac61-7fa2f16b847c'),(102,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-22 16:48:35','2021-10-22 16:48:35','906b32e6-56d2-486b-88a1-076b5db0634b'),(104,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-22 16:49:13','2021-10-22 16:49:13','a30d3c73-7775-4747-94e9-4cf9062407a3'),(105,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-22 16:51:47','2021-10-22 16:51:47','3e1a70bc-d0b6-45cf-9841-db028baccc96'),(107,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-22 16:52:56','2021-10-22 16:52:56','827b907e-fad7-4c37-bfc4-51d4668e7f45'),(109,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-23 15:04:30','2021-10-23 15:04:30','59921b65-a6ec-4c81-8e6c-044f941be4b5'),(111,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-23 15:06:00','2021-10-23 15:06:00','6378c245-8431-418a-b9da-77bdb1c09996'),(113,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-23 15:06:21','2021-10-23 15:06:21','ea19262e-5b6c-4098-8fb3-5ba3a321ac4a'),(117,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-23 15:14:14','2021-10-23 15:14:14','7748d3b9-c3e7-46a1-b364-515be1ac67d1'),(118,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-23 15:14:19','2021-10-23 15:14:19','1a025edb-9786-40d3-8613-357b66c869c9'),(119,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-23 15:14:28','2021-10-23 15:14:28','4742d3e6-9bb6-441a-b790-f875a4797238'),(121,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-23 15:17:28','2021-10-23 15:17:28','104e96dc-2a93-4df6-abeb-3b8b59f39b60'),(122,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-23 15:17:32','2021-10-23 15:17:32','37fe1b3c-0e01-412c-9770-3ca562cfa25f'),(123,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-23 15:17:37','2021-10-23 15:17:37','5cb4befd-5bd0-4103-9f20-9b1624f1fa2e'),(125,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-23 15:23:27','2021-10-23 15:23:27','6e748779-6f24-4690-8520-15488a95abf4'),(127,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-23 15:23:55','2021-10-23 15:23:55','ff41caf9-64c5-496b-98ba-e646b72af8c0'),(129,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-23 15:24:19','2021-10-23 15:24:19','4eb7ae04-9dab-44af-94d0-1103a5670bfb'),(131,2,NULL,2,1,'2021-10-22 16:51:00',NULL,NULL,'2021-10-23 15:25:04','2021-10-23 15:25:04','3abb7aad-0707-4c28-8407-585562e4f12b'),(133,2,NULL,2,1,'2021-10-22 16:48:00',NULL,NULL,'2021-10-23 15:25:22','2021-10-23 15:25:22','72ae8db4-5dcf-41eb-bd84-d5a32950a1a6'),(135,2,NULL,2,1,'2021-10-22 16:47:00',NULL,NULL,'2021-10-23 15:25:33','2021-10-23 15:25:33','2d1ecb6d-a710-49e2-8f0b-e9f4614797c0'),(146,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','b73aa58d-2322-425f-9017-d397cd5e1fe2'),(163,1,NULL,1,NULL,'2021-10-22 14:53:00',NULL,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','7e377013-96a9-4898-a93f-6c7555c488aa');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,9,'Homepage','homepage',0,'site',NULL,'{section.name|raw}',1,'2021-10-22 14:53:08','2021-10-22 14:53:08',NULL,'b2de7c89-2fc2-427c-9721-1ee9177b7356'),(2,2,11,'Default','default',1,'site',NULL,NULL,1,'2021-10-22 16:28:42','2021-10-22 16:28:42',NULL,'924711b8-6399-4528-a9cb-0ab89f8aed4b');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-10-19 18:07:55','2021-10-19 18:07:55',NULL,'cf9274fd-b33f-4d02-98a4-c7d3ae548a7d'),(2,'Pages','2021-10-22 14:42:54','2021-10-22 16:29:19',NULL,'8b95c0d6-5b59-4b50-9d09-1f11641d4ac9');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,2,2,7,0,0,'2021-10-22 14:42:41','2021-10-22 14:42:41','a72a1d63-8fc2-457a-985b-10fc9b1f397f'),(2,2,2,6,0,1,'2021-10-22 14:42:41','2021-10-22 14:42:41','03b1c26d-5a00-4943-a9f5-bf32f542c47e'),(59,8,16,1,0,0,'2021-10-22 14:52:00','2021-10-22 14:52:00','3725f703-15c1-4491-9883-09cdd337c28c'),(60,8,16,2,0,1,'2021-10-22 14:52:00','2021-10-22 14:52:00','8bdae57d-2ad1-4e06-b707-730b0aa4e91a'),(61,8,16,3,0,2,'2021-10-22 14:52:00','2021-10-22 14:52:00','a567160c-399c-4650-96ae-6143c145fca3'),(62,8,16,4,0,3,'2021-10-22 14:52:00','2021-10-22 14:52:00','237bfd95-063c-4059-bc58-62b091c46a60'),(63,8,16,5,0,4,'2021-10-22 14:52:00','2021-10-22 14:52:00','2c289dc5-d13c-43b2-9536-a939ff686aba'),(64,9,18,8,0,1,'2021-10-22 14:53:37','2021-10-22 14:53:37','e43e9e52-c627-4e8f-a909-c92522c7189e'),(84,12,27,29,0,0,'2021-10-22 16:35:35','2021-10-22 16:35:35','a73e39c2-fe71-4103-95ab-43cbd9959664'),(85,3,28,11,0,0,'2021-10-22 16:35:35','2021-10-22 16:35:35','34e9e6cd-b68c-403f-8530-525dc1a9684b'),(86,3,28,12,0,1,'2021-10-22 16:35:35','2021-10-22 16:35:35','ec026d97-f477-4202-bdc8-f434897087d9'),(87,3,28,9,0,2,'2021-10-22 16:35:35','2021-10-22 16:35:35','7b755458-791a-40cf-acef-60c0e6b937e4'),(88,3,28,13,0,3,'2021-10-22 16:35:35','2021-10-22 16:35:35','8e8d9a1d-e55c-4b00-ad5c-ada1f0c5e537'),(89,3,28,10,0,4,'2021-10-22 16:35:35','2021-10-22 16:35:35','d878c398-f3aa-4fe0-b15c-e03f60e4b38e'),(90,3,28,28,0,5,'2021-10-22 16:35:35','2021-10-22 16:35:35','49b21111-945b-4d62-9ce9-2a3a7e00d4f7'),(91,10,29,25,0,0,'2021-10-22 16:35:35','2021-10-22 16:35:35','4d1ede72-fcdf-481b-922f-347bebf376bd'),(92,6,30,18,0,0,'2021-10-22 16:35:35','2021-10-22 16:35:35','adafda5c-fb8f-4712-9a66-f4fe51bdc9f5'),(93,6,30,21,0,1,'2021-10-22 16:35:35','2021-10-22 16:35:35','6d00796b-1d2e-46d9-8f7c-096f10d5c40a'),(94,6,30,20,0,2,'2021-10-22 16:35:35','2021-10-22 16:35:35','68999cb9-3664-43b7-89ea-5bfc10cabaf3'),(95,6,30,19,0,3,'2021-10-22 16:35:35','2021-10-22 16:35:35','e5b88cc4-358c-4e38-a377-80e491e79b70'),(96,6,30,22,0,4,'2021-10-22 16:35:35','2021-10-22 16:35:35','5b0cd31e-d853-4637-bd09-6d1a5cd9de14'),(100,11,32,26,0,1,'2021-10-23 15:13:37','2021-10-23 15:13:37','863b450e-c156-461f-ab2a-528a1db4e1d1'),(101,11,32,27,0,2,'2021-10-23 15:13:37','2021-10-23 15:13:37','24f7f4f4-7b7f-4af6-91ea-d80f663ee4e5');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2021-10-22 14:38:41','2021-10-22 14:38:41',NULL,'d6428fae-5e50-4758-91fa-952ff1069661'),(2,'verbb\\supertable\\elements\\SuperTableBlockElement','2021-10-22 14:42:40','2021-10-22 14:42:40',NULL,'e8d9e81f-a673-47b7-9cd1-47eba21df9e2'),(3,'craft\\elements\\MatrixBlock','2021-10-22 14:49:21','2021-10-22 14:49:21',NULL,'07675983-f4fa-4064-b712-1a8d75f654f8'),(4,'verbb\\supertable\\elements\\SuperTableBlockElement','2021-10-22 14:49:29','2021-10-22 14:49:29','2021-10-22 16:35:34','90b27aee-3ee4-4cdc-bac3-ad49383f28cc'),(5,'craft\\elements\\MatrixBlock','2021-10-22 14:49:31','2021-10-22 14:49:31','2021-10-22 16:35:34','24c47ad7-031d-44d9-b709-42d19e973638'),(6,'craft\\elements\\MatrixBlock','2021-10-22 14:49:34','2021-10-22 14:49:34',NULL,'e0f283cd-be8a-4660-b6e0-1fbed9719937'),(7,'craft\\elements\\MatrixBlock','2021-10-22 14:49:36','2021-10-22 14:49:36','2021-10-22 16:35:35','7754b99c-9322-4694-894d-88d22099befd'),(8,'craft\\elements\\GlobalSet','2021-10-22 14:51:40','2021-10-22 14:52:00',NULL,'9316774a-9c82-4f88-8305-2d93365c5ec0'),(9,'craft\\elements\\Entry','2021-10-22 14:53:08','2021-10-22 14:53:08',NULL,'6c81d756-9a7f-42de-a74c-53b2b338ced0'),(10,'craft\\elements\\MatrixBlock','2021-10-22 16:20:14','2021-10-22 16:20:14',NULL,'412b818d-016e-43f5-875d-148f97ee5d5b'),(11,'craft\\elements\\Entry','2021-10-22 16:28:42','2021-10-22 16:28:42',NULL,'49ecb90c-70d2-4cb3-98d6-33f84dca7cac'),(12,'verbb\\supertable\\elements\\SuperTableBlockElement','2021-10-22 16:35:35','2021-10-22 16:35:35',NULL,'9c2e8a77-ec7c-45df-9660-6bcb9ee3b353');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-10-22 14:38:41','2021-10-22 14:38:41','f7600e65-2f1a-41da-a593-72f76e1f5394'),(2,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f2cd26e6-7788-4eff-af30-742e694a5a7c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ab8de3ee-9120-4953-b576-4975c6062c7e\"}]',1,'2021-10-22 14:42:40','2021-10-22 14:42:40','0159dccb-2b32-4821-9ad5-eaad8e25a426'),(16,8,'General','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"eed9e3e0-1db0-4d0b-b661-6cdd274656db\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"638f556d-1ad1-4fb5-8a4d-a80d0a215159\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a6794ba-ba80-4267-a48b-e0d98b03a64b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"}]',1,'2021-10-22 14:52:00','2021-10-22 14:52:00','544dd29d-ee7f-430f-b5fc-b786c1438864'),(18,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e7d9aea0-37d2-4d59-964b-96f4530749bf\"}]',1,'2021-10-22 14:53:37','2021-10-22 14:53:37','f2799d31-bee0-4b23-a470-0189a564db37'),(20,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"86dbfa20-448c-4ac2-a06d-6e45d9dd269e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"36018626-d5ef-41b9-8cc4-c14a40b10a32\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3171d563-63be-4912-bbf3-99d886f8dfc3\"}]',1,'2021-10-22 16:20:14','2021-10-22 16:20:14','c87a056b-58be-4589-8e3e-e5a9f8315570'),(21,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d96fc9d-c8a6-4e68-871c-5ba0d4c9d184\"}]',1,'2021-10-22 16:20:14','2021-10-22 16:20:14','dcde9b5f-944e-4f35-b101-aa442d7a21f6'),(24,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a95eeb36-18e1-45a9-9cc1-73a6e00b2e45\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"78fc898b-8845-4479-8549-73b6a97f434a\"}]',1,'2021-10-22 16:20:14','2021-10-22 16:20:14','73aa0b23-aeea-4946-98ee-229ccc6425c9'),(27,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c33a868-c447-40ad-a53b-d54ca0bc10cc\"}]',1,'2021-10-22 16:35:35','2021-10-22 16:35:35','2554fef3-911f-4281-ab6c-5910618e712d'),(28,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"859d9734-b89e-4faf-93f4-52c65634903c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2232d2c6-49a9-4a24-8e43-713453f68f44\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"46de15ec-06c2-4806-adb2-eed7857e0941\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b5f1f961-69cf-4f2d-8e8a-46daba86628b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"87a92f44-7cd4-40f5-ad64-584dc22f14f0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f8d9408d-a357-4f37-bcb5-68804f63d24f\"}]',1,'2021-10-22 16:35:35','2021-10-22 16:35:35','e582cd53-5cba-47a0-9bff-35bfc2ca0d75'),(29,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"99047969-ef35-43a5-8aa9-3a05c1e28578\"}]',1,'2021-10-22 16:35:35','2021-10-22 16:35:35','ffc14630-33e3-415b-b5ca-32dad6569c9d'),(30,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2aa7ca58-f87f-4a70-81bc-d8950ce49611\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f81fea22-78b4-47c4-9543-fad60203e7c4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c58f894a-ce59-4c0a-93bf-2823c4e33774\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9ca8bde-a252-4202-99a5-974cc7b352e8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fc3226ee-c13a-40ca-9c54-1e265e46313d\"}]',1,'2021-10-22 16:35:35','2021-10-22 16:35:35','0c2a3723-11be-4d60-8a60-6bc047cd72cc'),(32,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"367de2f9-9d3f-4069-a8c1-8598589b1b95\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e13da284-b066-463b-9de1-21123bc6ab13\"}]',1,'2021-10-23 15:13:37','2021-10-23 15:13:37','70a53369-50d2-4a72-b298-1525efb84f81');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Site Logo','siteLogo','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-10-22 14:38:49','2021-10-22 14:39:15','eed9e3e0-1db0-4d0b-b661-6cdd274656db'),(2,1,'Contact US','contactUs','global','dhjrtrlr','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:41:02','2021-10-22 14:41:02','638f556d-1ad1-4fb5-8a4d-a80d0a215159'),(3,1,'Phone','phone','global','gkttygyz','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:41:18','2021-10-22 14:41:18','94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0'),(4,1,'Email','email','global','zzzjscza','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:41:29','2021-10-22 14:41:29','4a6794ba-ba80-4267-a48b-e0d98b03a64b'),(5,1,'Social Links','socialLinks','global',NULL,'',0,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"columns\":{\"e4282c89-6f37-48db-9f6d-d1456cc10d7b\":{\"width\":\"\"},\"4cab3961-bb9f-4139-9765-12411d19183c\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_sociallinks}}\",\"fieldLayout\":\"row\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"\",\"staticField\":\"\"}','2021-10-22 14:42:34','2021-10-22 14:42:34','c967ebc7-0652-4fca-84e6-e7b7fcbcca63'),(6,NULL,'URL','surl','superTableBlockType:dddb2681-fb8f-4500-b075-6722f2ea5fc0','sbecucrj','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}','2021-10-22 14:42:39','2021-10-22 14:42:39','ab8de3ee-9120-4953-b576-4975c6062c7e'),(7,NULL,'Icon','icon','superTableBlockType:dddb2681-fb8f-4500-b075-6722f2ea5fc0','hymsexyb','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:42:40','2021-10-22 14:42:40','f2cd26e6-7788-4eff-af30-742e694a5a7c'),(8,2,'Homepage','homepage','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_homepage}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2021-10-22 14:49:15','2021-10-22 14:49:15','e7d9aea0-37d2-4d59-964b-96f4530749bf'),(9,NULL,'Text','text','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:19','2021-10-22 16:20:13','46de15ec-06c2-4806-adb2-eed7857e0941'),(10,NULL,'Button Link','buttonLink','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:20','2021-10-22 16:20:13','87a92f44-7cd4-40f5-ad64-584dc22f14f0'),(11,NULL,'BG Image','bgImage','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-10-22 14:49:20','2021-10-22 16:20:13','859d9734-b89e-4faf-93f4-52c65634903c'),(12,NULL,'Heading','heading','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"2\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:20','2021-10-22 16:20:13','2232d2c6-49a9-4a24-8e43-713453f68f44'),(13,NULL,'Button Text','buttonText','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:21','2021-10-22 16:20:13','b5f1f961-69cf-4f2d-8e8a-46daba86628b'),(18,NULL,'Image','image','matrixBlockType:9825f9ae-c4e8-45f2-ab67-0506c877e512',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-10-22 14:49:31','2021-10-22 16:20:14','2aa7ca58-f87f-4a70-81bc-d8950ce49611'),(19,NULL,'Button Text','buttonText','matrixBlockType:9825f9ae-c4e8-45f2-ab67-0506c877e512',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:31','2021-10-22 16:20:14','c9ca8bde-a252-4202-99a5-974cc7b352e8'),(20,NULL,'Body Text','bodyText','matrixBlockType:9825f9ae-c4e8-45f2-ab67-0506c877e512',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-10-22 14:49:32','2021-10-22 16:20:14','c58f894a-ce59-4c0a-93bf-2823c4e33774'),(21,NULL,'Heading','heading','matrixBlockType:9825f9ae-c4e8-45f2-ab67-0506c877e512',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"2\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:33','2021-10-22 16:20:14','f81fea22-78b4-47c4-9543-fad60203e7c4'),(22,NULL,'Button Link','buttonLink','matrixBlockType:9825f9ae-c4e8-45f2-ab67-0506c877e512',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 14:49:33','2021-10-22 16:20:14','fc3226ee-c13a-40ca-9c54-1e265e46313d'),(25,NULL,'Show','show','matrixBlockType:9547c6d1-d635-42b9-8de3-ea1303d84646',NULL,'',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":\"Hide\",\"onLabel\":\"Show\"}','2021-10-22 16:20:14','2021-10-22 16:35:35','99047969-ef35-43a5-8aa9-3a05c1e28578'),(26,2,'Image','image','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-10-22 16:30:51','2021-10-22 16:30:51','367de2f9-9d3f-4069-a8c1-8598589b1b95'),(27,2,'Body Content','bodyContent','global','fsujtllx','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-10-22 16:31:22','2021-10-22 16:31:22','e13da284-b066-463b-9de1-21123bc6ab13'),(28,NULL,'Tabs Content','tabsContent','matrixBlockType:06391b20-af49-49ed-83aa-5615e94be31e',NULL,'',0,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"contentTable\":\"{{%stc_1_tabscontent}}\",\"fieldLayout\":\"row\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"\",\"staticField\":\"\"}','2021-10-22 16:35:35','2021-10-22 16:35:35','f8d9408d-a357-4f37-bcb5-68804f63d24f'),(29,NULL,'Title','stitle','superTableBlockType:891345e1-e400-4509-bc59-51520c50a249','kybmokwj','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-22 16:35:35','2021-10-22 16:35:35','5c33a868-c447-40ad-a53b-d54ca0bc10cc'),(30,1,'Heading','heaing','global','rzhhkcdj','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-10-23 15:11:20','2021-10-23 15:11:33','4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (2,'Globals','globals',8,1,'2021-10-22 14:32:28','2021-10-22 14:51:41','8dc4fe8c-286a-442e-8bf6-c765c528e114');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.7.17.2','3.7.8',0,'uxkldmbahcoq','bzpsqofldgjj','2021-10-19 18:07:55','2021-10-24 11:02:40','962bd39a-37ce-43ea-b583-73c1a8edbdea');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (24,3,8,1,1,NULL,'2021-10-22 16:17:01','2021-10-22 16:17:01','2ca6cd67-57e5-4cc5-887f-a279d3350bee'),(29,3,8,3,3,NULL,'2021-10-22 16:17:01','2021-10-22 16:40:07','b06cf3c8-afd9-4bac-ac46-6f84fdd3c28c'),(32,31,8,1,1,NULL,'2021-10-22 16:17:01','2021-10-22 16:17:01','ad88a7b1-0bae-42a5-91fd-40be16542f36'),(37,31,8,3,3,NULL,'2021-10-22 16:17:01','2021-10-22 16:17:01','86523d56-13f6-44eb-b0fc-bd371adad4fe'),(48,47,8,1,1,NULL,'2021-10-22 16:27:31','2021-10-22 16:27:31','0589a620-cb60-411d-ac7d-85c343654c54'),(53,47,8,3,3,NULL,'2021-10-22 16:27:32','2021-10-22 16:27:32','49a6e18e-3536-4210-9af5-3756c505771a'),(73,72,8,1,1,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','4c30cc3c-26b0-435a-a607-7a0fe06b4637'),(77,72,8,3,2,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','d6460ab7-19aa-4db6-a046-521c60352ccd'),(91,3,8,5,2,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','9efa1534-c155-4bf5-88ad-d250e271820a'),(93,92,8,1,1,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','629238e1-0e9e-4f98-87e8-67f248d70e7d'),(97,92,8,5,2,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','50a15fc3-b432-4900-be8e-a11351cae5c9'),(98,92,8,3,3,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','862a0016-e038-4548-b70e-d795a71aabf7'),(147,146,8,1,1,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','83627d69-3884-46df-9080-8f7cafd64940'),(151,146,8,5,2,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','470a3676-e371-45b3-8085-5f6ee9af5e11'),(152,146,8,3,3,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','dfec2770-3486-4d81-92e5-714a2d6c191c'),(164,163,8,1,1,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','e3fca841-95e9-4e5e-813d-286e0c58bfb5'),(168,163,8,5,2,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','67169966-6727-4e29-8203-e965160aa514'),(169,163,8,3,3,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','599835e5-6538-4d55-aa40-ddfc319f9415');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,8,3,'Banner Content','bannerContent',1,'2021-10-22 14:49:22','2021-10-22 14:49:22','06391b20-af49-49ed-83aa-5615e94be31e'),(3,8,6,'Image With Content','imageWithContent',3,'2021-10-22 14:49:34','2021-10-22 16:35:35','9825f9ae-c4e8-45f2-ab67-0506c877e512'),(5,8,10,'Body Content','bodyContent',2,'2021-10-22 16:20:14','2021-10-22 16:35:35','9547c6d1-d635-42b9-8de3-ea1303d84646');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_homepage`
--

LOCK TABLES `matrixcontent_homepage` WRITE;
/*!40000 ALTER TABLE `matrixcontent_homepage` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_homepage` VALUES (1,7,1,'2021-10-22 14:54:47','2021-10-22 14:54:47','ed0d8283-e7ec-47af-b3ce-89b258b9d4b8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,8,1,'2021-10-22 14:54:51','2021-10-22 14:54:51','49e1f911-b41f-4c20-9888-752f7d48dd66',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,9,1,'2021-10-22 14:54:52','2021-10-22 14:54:52','6655c757-8c34-4191-ab38-59fb1bfe6f73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,24,1,'2021-10-22 16:17:01','2021-10-24 10:49:45','25deaa4c-d639-4fb1-a23d-f62705b6d436','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(9,25,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','9aee2d0f-5820-4a15-8129-07c3f6dc3c46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,29,1,'2021-10-22 16:17:01','2021-10-24 10:49:45','0f5b16b8-c04c-4c7b-8737-282e77e076c8',NULL,NULL,NULL,NULL,'Link & Arrow','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two\nline display','#',NULL),(11,30,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','26602a76-b700-43d6-aabf-af345ef51493',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,32,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','b0990689-bada-42ae-ba78-9d82c9f84f41','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line <br />\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(13,33,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','3414a7c0-85ee-4d87-b3cb-1a83a204b6ed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,37,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','7bd241db-79ea-4bf0-b2d6-6f04a3fa8745',NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two<br />\n                  line display',NULL,NULL),(15,38,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','991612de-7af9-4782-8774-ce11aca97b9d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,48,1,'2021-10-22 16:27:31','2021-10-22 16:27:31','1076b156-3ad9-4d6c-9085-6304380f3972','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(21,49,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','30d89dfc-566d-4ba1-b41a-2e5e8630c114',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,53,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','08b242a2-781c-404d-bff5-78faa5e2d5c5',NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two<br />\n                  line display',NULL,NULL),(23,54,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','617b0881-652c-4e4d-b53a-d03507e8b2c3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,73,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','66cfae0c-5650-4d54-bd33-83b475af3364','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(27,77,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','ea7e0fd7-a2bf-4758-9d1f-cc8bdb5f9af1',NULL,NULL,NULL,NULL,'Link & Arrow','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two\nline display','#',NULL),(30,84,1,'2021-10-22 16:39:51','2021-10-22 16:39:51','51e85cef-a53e-4242-af3b-b9f213bc522d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,85,1,'2021-10-22 16:39:54','2021-10-22 16:39:54','543cf662-326b-47f1-a47e-9d6d27b5d342',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(32,86,1,'2021-10-22 16:39:57','2021-10-22 16:39:57','0af882ac-d573-4f5d-be1b-1ac89f94857f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(34,91,1,'2021-10-22 16:40:07','2021-10-24 10:49:45','e2229385-d812-43c5-a0d6-3135d70a7cbe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(35,93,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','536f10b7-f666-4952-964c-9865c898130a','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(36,97,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','d4145c3c-da99-460f-9ebe-90ac4db22714',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(37,98,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','4e1bbc64-25f9-4581-b34a-1bf4c963a98d',NULL,NULL,NULL,NULL,'Link & Arrow','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two\nline display','#',NULL),(41,147,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','d6034539-2b22-4c91-841b-b8f9c3e00a58','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(42,151,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','a77051aa-7706-4bdf-b802-9c06bcf77d6e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(43,152,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','9047c006-e410-4374-aa0e-615ac776e11f',NULL,NULL,NULL,NULL,'Link & Arrow','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two\nline display','#',NULL),(47,164,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','c768beb2-0ea5-452f-b3b1-ef346ce259d0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','#','Here we have a two line\n display intro.','Link & Arrow',NULL,NULL,NULL,NULL,NULL),(48,168,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','d4eb9f76-0b6f-4f7a-af60-cbe9c3f08109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(49,169,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','840718f6-0d1c-4616-a0ea-6b3669ff0624',NULL,NULL,NULL,NULL,'Link & Arrow','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>\n<p> consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','Here we have a two\nline display','#',NULL);
/*!40000 ALTER TABLE `matrixcontent_homepage` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-10-19 18:08:03','2021-10-19 18:08:03','2021-10-19 18:08:03','f4be2a87-4b11-44b2-9ed8-4fd401fabbc9'),(2,'craft','m150403_183908_migrations_table_changes','2021-10-19 18:08:03','2021-10-19 18:08:03','2021-10-19 18:08:03','999a9eb9-24e4-45b9-aeca-ecacff8d6a98'),(3,'craft','m150403_184247_plugins_table_changes','2021-10-19 18:08:03','2021-10-19 18:08:03','2021-10-19 18:08:03','cd5bfd54-aba3-4e56-8abc-4208322bb4d5'),(4,'craft','m150403_184533_field_version','2021-10-19 18:08:03','2021-10-19 18:08:03','2021-10-19 18:08:03','c01f3810-86c0-4f35-a48c-57618968df7a'),(5,'craft','m150403_184729_type_columns','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','10737d09-a474-4f0f-9ebd-deb93e51d17f'),(6,'craft','m150403_185142_volumes','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','a1e12ea0-80a5-4651-ad54-1bbe701749fb'),(7,'craft','m150428_231346_userpreferences','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','1e2bcbae-9287-4d61-b9e5-82262dd4af52'),(8,'craft','m150519_150900_fieldversion_conversion','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','4c7e8e82-3427-4543-a985-ff6bc87f4fc6'),(9,'craft','m150617_213829_update_email_settings','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','1b2ac244-ff28-423f-b4ec-9d5553cbc430'),(10,'craft','m150721_124739_templatecachequeries','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','02ef5ba9-4bb1-47f6-ac9c-65ca7127be03'),(11,'craft','m150724_140822_adjust_quality_settings','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','5e8ba315-fd17-4fcf-90ee-e1e95119e252'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','03bbb2e6-2c3c-44d8-936b-52c4d83b66f7'),(13,'craft','m151002_095935_volume_cache_settings','2021-10-19 18:08:04','2021-10-19 18:08:04','2021-10-19 18:08:04','74e5be5c-0fb8-4825-b083-923dc8b7d14a'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-10-19 18:08:05','2021-10-19 18:08:05','2021-10-19 18:08:05','5e7f495f-73d3-41b5-ac81-a5975b1f5ebc'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-10-19 18:08:05','2021-10-19 18:08:05','2021-10-19 18:08:05','bd6cea66-b831-49da-84ee-60b9af4e7f7c'),(16,'craft','m151209_000000_move_logo','2021-10-19 18:08:05','2021-10-19 18:08:05','2021-10-19 18:08:05','bca4f447-e1f4-4a6d-beb0-8febe19bd116'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-10-19 18:08:05','2021-10-19 18:08:05','2021-10-19 18:08:05','58b375f4-d905-47f4-a390-b9dbb861a658'),(18,'craft','m151215_000000_rename_asset_permissions','2021-10-19 18:08:06','2021-10-19 18:08:06','2021-10-19 18:08:06','7e73be6d-b7e4-4ce1-b3c5-bdf3c8bcbc12'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-10-19 18:08:06','2021-10-19 18:08:06','2021-10-19 18:08:06','286301db-1fe1-41f3-94fc-55e9df95afd4'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-10-19 18:08:06','2021-10-19 18:08:06','2021-10-19 18:08:06','691d915b-0b45-4c0e-af7d-691c904e4863'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-10-19 18:08:06','2021-10-19 18:08:06','2021-10-19 18:08:06','8dd85ee5-6df8-449c-8799-3106749f530a'),(22,'craft','m160727_194637_column_cleanup','2021-10-19 18:08:07','2021-10-19 18:08:07','2021-10-19 18:08:07','77341f76-a06b-407f-863d-f7edb1778d31'),(23,'craft','m160804_110002_userphotos_to_assets','2021-10-19 18:08:07','2021-10-19 18:08:07','2021-10-19 18:08:07','10fec669-5005-4694-bdb3-851eee57f818'),(24,'craft','m160807_144858_sites','2021-10-19 18:08:07','2021-10-19 18:08:07','2021-10-19 18:08:07','1a054fde-b437-4f2b-be82-2c7c4e9b439f'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-10-19 18:08:07','2021-10-19 18:08:07','2021-10-19 18:08:07','d698d526-9d83-4f14-b216-086dc5de297e'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-10-19 18:08:07','2021-10-19 18:08:07','2021-10-19 18:08:07','f3d2d8bb-81cb-4c12-918b-0e29997a5d12'),(27,'craft','m160912_230520_require_entry_type_id','2021-10-19 18:08:08','2021-10-19 18:08:08','2021-10-19 18:08:08','ebf9585b-afd0-4ec5-8695-7efdef1bdb07'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-10-19 18:08:08','2021-10-19 18:08:08','2021-10-19 18:08:08','b0f52f5d-aa26-470c-a2a7-511c7f5a5b15'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-10-19 18:08:08','2021-10-19 18:08:08','2021-10-19 18:08:08','86dd6cf7-b35c-48fa-b8a3-594e457d01d7'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-10-19 18:08:09','2021-10-19 18:08:09','2021-10-19 18:08:09','edde0c4c-20f9-4d67-baa0-a183566e8a5d'),(31,'craft','m160925_113941_route_uri_parts','2021-10-19 18:08:09','2021-10-19 18:08:09','2021-10-19 18:08:09','b6cfcd5c-324f-47c3-9b8a-d92168eb95ac'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-10-19 18:08:09','2021-10-19 18:08:09','2021-10-19 18:08:09','783daf7c-6822-426e-b192-3adfdc51688d'),(33,'craft','m161007_130653_update_email_settings','2021-10-19 18:08:09','2021-10-19 18:08:09','2021-10-19 18:08:09','dca81daa-043d-4cfe-b58d-fee6f24ecbc7'),(34,'craft','m161013_175052_newParentId','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','7e86b275-ad02-4546-bf11-fb567122f55e'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','8706f385-88bb-48f4-ad2d-ff5e06b74583'),(36,'craft','m161021_182140_rename_get_help_widget','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','ef6fd563-139e-45d9-a376-7f44652811d7'),(37,'craft','m161025_000000_fix_char_columns','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','6953534d-591a-4aae-a1de-da58916031c5'),(38,'craft','m161029_124145_email_message_languages','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','c996d95b-964c-4e12-b3d6-eef44b69e740'),(39,'craft','m161108_000000_new_version_format','2021-10-19 18:08:10','2021-10-19 18:08:10','2021-10-19 18:08:10','59d13f26-56ab-4094-a7f6-e07747666da3'),(40,'craft','m161109_000000_index_shuffle','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','4da372c9-7fef-4e14-a444-ee3b2d01e220'),(41,'craft','m161122_185500_no_craft_app','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','81fca5fd-f13e-49d8-b8cc-6bd066c296e1'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','ae2b6e1a-fdf9-4907-a579-6270a920fe0c'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','d8910afb-7af1-4b54-9dcf-57e1c684a695'),(44,'craft','m170114_161144_udates_permission','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','802d568c-baf4-4483-98b5-298cf5d4c4a0'),(45,'craft','m170120_000000_schema_cleanup','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','0d70d7a7-61d1-42d2-94ab-be756ae5f65c'),(46,'craft','m170126_000000_assets_focal_point','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','38b7eeed-189e-4541-860b-99bce4a5cb04'),(47,'craft','m170206_142126_system_name','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','67c4e31e-a38f-4515-89d1-ab0113a0ec2b'),(48,'craft','m170217_044740_category_branch_limits','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','95d68a23-f0c0-4745-8777-ab47aef25a83'),(49,'craft','m170217_120224_asset_indexing_columns','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','d44bec7a-b965-4cca-947c-1a6ef5d8bb52'),(50,'craft','m170223_224012_plain_text_settings','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','db37bd56-3730-4fff-9fb9-c22d06d15914'),(51,'craft','m170227_120814_focal_point_percentage','2021-10-19 18:08:11','2021-10-19 18:08:11','2021-10-19 18:08:11','7dd54648-7efd-4a0d-b6a0-ce6e7effd0e5'),(52,'craft','m170228_171113_system_messages','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','cdf26542-b182-4b1d-b6c1-df6336ee32d7'),(53,'craft','m170303_140500_asset_field_source_settings','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','dd95e98f-513d-42b8-9165-2d315a070113'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','4a005cb5-5153-4ecf-b316-ff32f09a5570'),(55,'craft','m170523_190652_element_field_layout_ids','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','e75f7c88-ed80-451e-b7c9-de264fab0de9'),(56,'craft','m170621_195237_format_plugin_handles','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','9fc8554f-6b20-42ca-8216-3c7907fa4946'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','c082f78a-ef4e-4e7a-acbb-b4e6552835b1'),(58,'craft','m170630_161028_deprecation_changes','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','fbf1866a-7acd-4519-b5d4-9f20d11bc673'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','c1f700cb-090c-4415-b35c-6be29ab4e059'),(60,'craft','m170704_134916_sites_tables','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','55ce8eaf-aa0a-40ae-9d99-2d15f9d780fd'),(61,'craft','m170706_183216_rename_sequences','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','940a058e-a97c-44b5-8cf8-a012c303ab15'),(62,'craft','m170707_094758_delete_compiled_traits','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','cf198733-2497-404e-9e9f-4283e6943386'),(63,'craft','m170731_190138_drop_asset_packagist','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','bc99f289-3582-41cc-bb88-ad69bb105f7a'),(64,'craft','m170810_201318_create_queue_table','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','32e12766-5f19-4812-adb8-53b29a1ec73f'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','0b28e5c7-afd6-4567-a725-8b5c2ad3c9e5'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-10-19 18:08:12','2021-10-19 18:08:12','2021-10-19 18:08:12','a43a659b-5ac6-4ff6-a733-b79e38e79cfb'),(67,'craft','m171011_214115_site_groups','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','cf0e8c76-3011-4ac8-949b-68ed0be464a8'),(68,'craft','m171012_151440_primary_site','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','6f09cc78-74f2-4e7b-b169-859efecd1609'),(69,'craft','m171013_142500_transform_interlace','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','d7d95a84-dd52-4399-9b65-70e9754d65f9'),(70,'craft','m171016_092553_drop_position_select','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','17142d74-ad42-4510-9c9f-14e25d9b11f9'),(71,'craft','m171016_221244_less_strict_translation_method','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','666f8c2a-4d0d-4377-acac-3c438a7dd8cc'),(72,'craft','m171107_000000_assign_group_permissions','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','7f16b377-0d28-4890-8302-32c745f11f23'),(73,'craft','m171117_000001_templatecache_index_tune','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','6ec5df90-fbbb-4e0d-9e47-a0828b607428'),(74,'craft','m171126_105927_disabled_plugins','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','7b539b6b-6f53-48e7-b2bf-0e451469f0fd'),(75,'craft','m171130_214407_craftidtokens_table','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','f22ef222-0d6f-4fc2-bcd2-0eb807f07cf4'),(76,'craft','m171202_004225_update_email_settings','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','d87e6e9b-d22c-42b0-bc33-bd3f19a6cdef'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','7a622967-b046-486b-a823-96fbf4ca13ed'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','667869c3-22c6-4fed-b2e4-63506d293754'),(79,'craft','m171218_143135_longtext_query_column','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','43e4b8e7-9881-4ea2-a8f7-b9672643a0f1'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','91144d82-b032-4e20-9290-7da8ef693461'),(81,'craft','m180113_153740_drop_users_archived_column','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','9264993c-7679-48a8-bc52-e7f0079642b2'),(82,'craft','m180122_213433_propagate_entries_setting','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','7ac400c6-5b11-4ac4-9872-69d5cd308c85'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','345dbafd-6a69-4e15-a723-86c23d4a7242'),(84,'craft','m180128_235202_set_tag_slugs','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','2b7eea50-cafc-48dd-bb64-f8456c7cded0'),(85,'craft','m180202_185551_fix_focal_points','2021-10-19 18:08:13','2021-10-19 18:08:13','2021-10-19 18:08:13','0cbce323-d344-44e0-8a21-8f52c22d5783'),(86,'craft','m180217_172123_tiny_ints','2021-10-19 18:08:14','2021-10-19 18:08:14','2021-10-19 18:08:14','a97e54c3-9c98-4a2c-9e6d-3fff06602577'),(87,'craft','m180321_233505_small_ints','2021-10-19 18:08:14','2021-10-19 18:08:14','2021-10-19 18:08:14','e068dfa6-9456-490b-a062-bedac46e45bc'),(88,'craft','m180404_182320_edition_changes','2021-10-19 18:08:14','2021-10-19 18:08:14','2021-10-19 18:08:14','4ad93452-d34d-4af1-b069-e8b74bb27418'),(89,'craft','m180411_102218_fix_db_routes','2021-10-19 18:08:14','2021-10-19 18:08:14','2021-10-19 18:08:14','943ff3b2-2575-4117-97d8-cdf38e2741d7'),(90,'craft','m180416_205628_resourcepaths_table','2021-10-19 18:08:14','2021-10-19 18:08:14','2021-10-19 18:08:14','269c5235-2695-4526-a1bb-d36aa6442b5f'),(91,'craft','m180418_205713_widget_cleanup','2021-10-19 18:08:15','2021-10-19 18:08:15','2021-10-19 18:08:15','cb59dd47-7c22-4aff-b21d-b33232d0ebca'),(92,'craft','m180425_203349_searchable_fields','2021-10-19 18:08:15','2021-10-19 18:08:15','2021-10-19 18:08:15','a4ecfee7-6343-4ea6-8fe4-341e01cdd911'),(93,'craft','m180516_153000_uids_in_field_settings','2021-10-19 18:08:15','2021-10-19 18:08:15','2021-10-19 18:08:15','203f5227-7a4d-4b40-b9f1-bb27b63ecf60'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-10-19 18:08:16','2021-10-19 18:08:16','2021-10-19 18:08:16','0241676c-0cde-4121-aa8d-2e0ad4b54af9'),(95,'craft','m180518_173000_permissions_to_uid','2021-10-19 18:08:17','2021-10-19 18:08:17','2021-10-19 18:08:17','e70a0143-9803-47b0-a922-0d6be24172bb'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-10-19 18:08:17','2021-10-19 18:08:17','2021-10-19 18:08:17','dd021002-24cd-491f-a1d6-0635618cf7b5'),(97,'craft','m180521_172900_project_config_table','2021-10-19 18:08:17','2021-10-19 18:08:17','2021-10-19 18:08:17','2ffe3362-cfe7-43d1-abec-fd3b2d37a4a0'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','9772572f-3ff8-48d1-bdd1-79b70bb50182'),(99,'craft','m180731_162030_soft_delete_sites','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','58689f9a-3876-42c3-8ce0-2a22281c2866'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','9f27cb34-4c14-4366-9d1e-c10c7a393f1e'),(101,'craft','m180810_214439_soft_delete_elements','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','f28a0d19-eea1-4139-8503-e49e9a728f7a'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','fca51114-fe86-4c39-8e44-135c5ae5e67f'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','63a414cf-4dc6-43d6-b8e6-221ecd29e667'),(104,'craft','m180904_112109_permission_changes','2021-10-19 18:08:18','2021-10-19 18:08:18','2021-10-19 18:08:18','870e8b11-1a34-4054-a9b8-7c0ed32e3a16'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','df9a91be-4c62-429e-a596-76988267ef65'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','2374bc02-7298-4668-9d0e-8a6728c91969'),(107,'craft','m181016_183648_set_default_user_settings','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','4f0966b2-b454-43fe-b2d5-26e8ad59075c'),(108,'craft','m181017_225222_system_config_settings','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','ba0767b0-1352-4284-9f7a-b03df84d0267'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','820f282c-3079-434b-86d4-25217d94105b'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','40ffaef0-1d47-4191-9c2d-fdf3f616f349'),(111,'craft','m181112_203955_sequences_table','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','32f4e262-e291-4a4a-8bd9-78479c77cc9a'),(112,'craft','m181121_001712_cleanup_field_configs','2021-10-19 18:08:19','2021-10-19 18:08:19','2021-10-19 18:08:19','dfbeeb49-c24b-4ec3-bb12-1772c64c94c9'),(113,'craft','m181128_193942_fix_project_config','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','45431bd6-13dc-4806-8263-dfaf37a8ddd2'),(114,'craft','m181130_143040_fix_schema_version','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','73989131-a481-45dd-aab0-25b4a0411061'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','d086e6aa-d439-4c35-ac56-f0a38b04c3af'),(116,'craft','m181217_153000_fix_structure_uids','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','b9ed5b02-334e-4340-91ed-b6b5fe9f8b9f'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','5bf225f9-56fe-47d1-80ef-e85d3e4f3113'),(118,'craft','m190108_110000_cleanup_project_config','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','0c4fcaf2-1c44-44be-b5ec-c3a105aa6ee6'),(119,'craft','m190108_113000_asset_field_setting_change','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','78eef15d-1c14-496c-90ad-eeb9f3d440e1'),(120,'craft','m190109_172845_fix_colspan','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','7a4a7c55-4d1c-4a6f-b0dd-496f0a466bcb'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','c3b7a08b-d786-4cfb-86b3-75d97a936b6f'),(122,'craft','m190110_214819_soft_delete_volumes','2021-10-19 18:08:20','2021-10-19 18:08:20','2021-10-19 18:08:20','dcad2cf0-2295-41a9-9b8d-3f6758f39f6c'),(123,'craft','m190112_124737_fix_user_settings','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','403b1586-cfdd-461d-b6d3-deeaadd81a18'),(124,'craft','m190112_131225_fix_field_layouts','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','5d926c83-6aa8-42f6-a6f7-c9abaaacf624'),(125,'craft','m190112_201010_more_soft_deletes','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','f20369e2-72b2-46a0-bebf-b53918023f7f'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','3318cd81-cbec-4fea-8aea-11383864acbe'),(127,'craft','m190121_120000_rich_text_config_setting','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','fa83c9bb-0ca3-457f-85ae-d8116b3188d6'),(128,'craft','m190125_191628_fix_email_transport_password','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','b5986f65-b8ab-40de-8be8-ad25e053e15e'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','b799c637-73da-462b-81ff-b0c1a501ea4c'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','54e47c7e-9f57-43dd-853e-7a40b699fcaf'),(131,'craft','m190218_143000_element_index_settings_uid','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','f8a4ae61-0361-4c5d-8ab4-f0c3e3224385'),(132,'craft','m190312_152740_element_revisions','2021-10-19 18:08:21','2021-10-19 18:08:21','2021-10-19 18:08:21','1bfac752-75d7-4ce1-aed9-888e5f20b424'),(133,'craft','m190327_235137_propagation_method','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','6c923ea6-3ec2-4aed-80c7-bfc9b7332699'),(134,'craft','m190401_223843_drop_old_indexes','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','5df72841-9686-45ed-9ebe-2a151a377e78'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','53f43531-fafd-460b-8f06-f21b231d1914'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','062312f6-4ca5-47e7-9d18-7300f48eae54'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','85469638-80e5-4ba8-bd85-4a4d3364d4e6'),(138,'craft','m190504_150349_preview_targets','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','790cef7e-225e-4084-ae25-2ef6772c2bed'),(139,'craft','m190516_184711_job_progress_label','2021-10-19 18:08:22','2021-10-19 18:08:22','2021-10-19 18:08:22','f285e6a1-a391-427b-8cfc-b3dbdf31ba53'),(140,'craft','m190523_190303_optional_revision_creators','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','fbfbc9ed-7af8-4486-9215-4381eb57ac91'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','5752ef4f-99a3-405c-8c96-0d44ca303a09'),(142,'craft','m190605_223807_unsaved_drafts','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','6a904015-5285-43d7-a9f1-4fe1f6aba2ae'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','1b5db8ac-9dc7-4269-b3df-e51d34685eea'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','ef9536fb-af9e-45a2-af2e-aa0ee952f150'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','77f1e8a1-2753-4a84-9eec-1b72ef97cedc'),(146,'craft','m190624_234204_matrix_propagation_method','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','215a086c-e384-4e3e-8a0b-41abf33eac95'),(147,'craft','m190711_153020_drop_snapshots','2021-10-19 18:08:23','2021-10-19 18:08:23','2021-10-19 18:08:23','f94e0657-2f46-4f38-943e-8a212a666c51'),(148,'craft','m190712_195914_no_draft_revisions','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','060d39cb-90e9-4e06-8c40-52172c28f6d8'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','f5934cc3-0cf6-450b-9245-c892e98b1367'),(150,'craft','m190820_003519_flush_compiled_templates','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','c40416af-d3c5-4244-a308-cc2beda98c88'),(151,'craft','m190823_020339_optional_draft_creators','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','b3f54222-0319-4f01-9fe6-27c5bd082806'),(152,'craft','m190913_152146_update_preview_targets','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','a1578d3d-2fc7-4119-abdf-79d378d33806'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','002518ee-b1a2-4289-a49f-315bb76953d5'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-10-19 18:08:24','2021-10-19 18:08:24','2021-10-19 18:08:24','e746f917-cd23-4001-936c-be02c1ab147f'),(155,'craft','m191206_001148_change_tracking','2021-10-19 18:08:25','2021-10-19 18:08:25','2021-10-19 18:08:25','ae3b8bc7-5791-4741-92e6-37327b577e31'),(156,'craft','m191216_191635_asset_upload_tracking','2021-10-19 18:08:25','2021-10-19 18:08:25','2021-10-19 18:08:25','67fa8983-d267-4fc9-a4b1-0562ac5f03f3'),(157,'craft','m191222_002848_peer_asset_permissions','2021-10-19 18:08:25','2021-10-19 18:08:25','2021-10-19 18:08:25','971ce560-49d3-49ff-92eb-905e465cb194'),(158,'craft','m200127_172522_queue_channels','2021-10-19 18:08:25','2021-10-19 18:08:25','2021-10-19 18:08:25','1689a0fe-651d-4965-bcb8-a705b4603dc9'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-10-19 18:08:25','2021-10-19 18:08:25','2021-10-19 18:08:25','ebc4f3fc-4c01-464d-8ab2-16edac3b5605'),(160,'craft','m200213_172522_new_elements_index','2021-10-19 18:08:26','2021-10-19 18:08:26','2021-10-19 18:08:26','44bfbe0b-0892-4efe-bb27-ed818883c261'),(161,'craft','m200228_195211_long_deprecation_messages','2021-10-19 18:08:26','2021-10-19 18:08:26','2021-10-19 18:08:26','6eb5b55d-642d-4846-ba4d-29cf45cf83a0'),(162,'craft','m200306_054652_disabled_sites','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','16fe1541-4f12-4386-8cf6-cb0d0cf5b803'),(163,'craft','m200522_191453_clear_template_caches','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','bc2f0b42-714a-444c-9b5e-61aa864c976f'),(164,'craft','m200606_231117_migration_tracks','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','a0366f72-cd9d-4ccd-938f-d66eb6781caa'),(165,'craft','m200619_215137_title_translation_method','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','586aaa57-d0f4-417c-ab99-dfce18b67fdf'),(166,'craft','m200620_005028_user_group_descriptions','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','db133473-0009-4e74-bbf3-3bfaeb494b1a'),(167,'craft','m200620_230205_field_layout_changes','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','f0a520d5-6a49-4feb-b61f-09a83aca7e26'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','12ab7ccb-910c-45cd-af3a-8f5b33973ccd'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','f1ed6827-0c6e-4832-a1f1-ca6340156500'),(170,'craft','m200630_183000_drop_configmap','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','e68b96e0-34c8-4a94-99ea-1656fbb78039'),(171,'craft','m200715_113400_transform_index_error_flag','2021-10-19 18:08:27','2021-10-19 18:08:27','2021-10-19 18:08:27','8a2edd55-cd80-4c96-ae05-2889b2623c02'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','895bf080-4a5b-4b23-8697-b83aee6ca9cf'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','7745696c-1e3f-48fc-a214-4078704a6c31'),(174,'craft','m200720_175543_drop_unique_constraints','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','6affabcb-9ef6-4ddf-88ee-0a6b99a4b146'),(175,'craft','m200825_051217_project_config_version','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','9bc0a75e-2743-4a94-b3a0-530e31110bca'),(176,'craft','m201116_190500_asset_title_translation_method','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','fdd255e3-b7ee-4203-b13c-040b7bdec603'),(177,'craft','m201124_003555_plugin_trials','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','0e1abf0a-285c-43d5-aab3-fddeed9e2e19'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','d0378347-c521-4ace-b150-b33b582e47c7'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','4b253fad-bf59-4603-9c14-f775d4911526'),(180,'craft','m210214_202731_track_saved_drafts','2021-10-19 18:08:28','2021-10-19 18:08:28','2021-10-19 18:08:28','f9f1ab11-ccb2-4689-8c5d-8c3d42064b03'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-10-19 18:08:29','2021-10-19 18:08:29','2021-10-19 18:08:29','8f02d939-a3a7-48a9-94c5-0914fa98ae5e'),(182,'craft','m210302_212318_canonical_elements','2021-10-19 18:08:29','2021-10-19 18:08:29','2021-10-19 18:08:29','6766038d-d8c9-48cc-bb97-bb675bdf46e8'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-10-19 18:08:29','2021-10-19 18:08:29','2021-10-19 18:08:29','7e5107b6-8221-4a33-837e-227df243dbc0'),(184,'craft','m210329_214847_field_column_suffixes','2021-10-19 18:08:29','2021-10-19 18:08:29','2021-10-19 18:08:29','abcef43d-3206-4789-a0e3-633bf4f07207'),(185,'craft','m210331_220322_null_author','2021-10-19 18:08:30','2021-10-19 18:08:30','2021-10-19 18:08:30','6546eb7f-05af-40d0-89a0-2d44b52e706e'),(186,'craft','m210405_231315_provisional_drafts','2021-10-19 18:08:30','2021-10-19 18:08:30','2021-10-19 18:08:30','779b5b72-de70-403d-9a9e-67631b5b151a'),(187,'craft','m210602_111300_project_config_names_in_config','2021-10-19 18:08:30','2021-10-19 18:08:30','2021-10-19 18:08:30','c5bc62d4-544a-4c1a-a19b-87496961423a'),(188,'craft','m210611_233510_default_placement_settings','2021-10-19 18:08:30','2021-10-19 18:08:30','2021-10-19 18:08:30','0a7ae593-f1dd-4148-a594-9d154dc23037'),(189,'craft','m210613_145522_sortable_global_sets','2021-10-19 18:08:31','2021-10-19 18:08:31','2021-10-19 18:08:31','e6643325-c6e5-4712-8753-4f32e76202e5'),(190,'craft','m210613_184103_announcements','2021-10-19 18:08:31','2021-10-19 18:08:31','2021-10-19 18:08:31','20f23f88-f792-4429-85c2-704fa5a152e1'),(191,'craft','m210829_000000_element_index_tweak','2021-10-19 18:08:31','2021-10-19 18:08:31','2021-10-19 18:08:31','574a79ac-88c7-4f01-b53b-df7222dc2511'),(192,'plugin:super-table','Install','2021-10-19 18:17:42','2021-10-19 18:17:42','2021-10-19 18:17:42','26f3a42d-b858-4100-aac8-dcf448e45da8'),(193,'plugin:super-table','m180210_000000_migrate_content_tables','2021-10-19 18:17:43','2021-10-19 18:17:43','2021-10-19 18:17:43','ce665720-b48b-4da7-9a0b-e85c06071445'),(194,'plugin:super-table','m180211_000000_type_columns','2021-10-19 18:17:43','2021-10-19 18:17:43','2021-10-19 18:17:43','20d077e1-5b08-4192-bdff-81d65bb81845'),(195,'plugin:super-table','m180219_000000_sites','2021-10-19 18:17:44','2021-10-19 18:17:44','2021-10-19 18:17:44','2cca23c4-dd4d-442d-ac67-e13611c10dd4'),(196,'plugin:super-table','m180220_000000_fix_context','2021-10-19 18:17:44','2021-10-19 18:17:44','2021-10-19 18:17:44','3bdf10ba-85f4-436d-83dd-46a17f8c3023'),(197,'plugin:super-table','m190117_000000_soft_deletes','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','f5b2bef6-1f27-40e3-9013-15077b80cc47'),(198,'plugin:super-table','m190117_000001_context_to_uids','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','ec9e0186-7e32-4e99-a01a-84d713269cf0'),(199,'plugin:super-table','m190120_000000_fix_supertablecontent_tables','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','f83dabec-cee2-4d0f-9a42-3a3d4aa9001c'),(200,'plugin:super-table','m190131_000000_fix_supertable_missing_fields','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','e9727c0f-2dac-4545-a3be-3a04750d78b1'),(201,'plugin:super-table','m190227_100000_fix_project_config','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','4c7bfad0-65bd-4bca-ac57-a479a1cea98a'),(202,'plugin:super-table','m190511_100000_fix_project_config','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','30f60424-3341-4ebe-807a-09e2a6da5573'),(203,'plugin:super-table','m190520_000000_fix_project_config','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','9beb35ed-f71b-4a4f-a6c5-1778edddbfdc'),(204,'plugin:super-table','m190714_000000_propagation_method','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','7e8fe608-96c7-4520-ad56-2cd69802f3e7'),(205,'plugin:super-table','m191127_000000_fix_width','2021-10-19 18:17:45','2021-10-19 18:17:45','2021-10-19 18:17:45','562eef9f-7e41-46b9-bad8-67d8b84c4ead'),(206,'plugin:redactor','m180430_204710_remove_old_plugins','2021-10-19 18:18:56','2021-10-19 18:18:56','2021-10-19 18:18:56','f245ddab-08a0-4d46-988e-5c085f72d93d'),(207,'plugin:redactor','Install','2021-10-19 18:18:56','2021-10-19 18:18:56','2021-10-19 18:18:56','4853a7ac-fbeb-4862-81e1-175097465325'),(208,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-10-19 18:18:56','2021-10-19 18:18:56','2021-10-19 18:18:56','dca77d20-ed7b-4499-9b75-3b4f2a79ce31'),(209,'plugin:wheelform','Install','2021-10-22 14:31:40','2021-10-22 14:31:40','2021-10-22 14:31:40','863cd9c4-5e98-40cb-877f-739b7a7ecfce'),(210,'plugin:wheelform','m180407_040301_add_index_view_column_to_form_fields_table','2021-10-22 14:31:40','2021-10-22 14:31:40','2021-10-22 14:31:40','cd51fca2-8a4b-4d85-bed4-9da52e54ad7d'),(211,'plugin:wheelform','m180407_170219_add_active_column_to_form_fields','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','24855ea6-6e7e-4f1c-91a6-23404ed4d453'),(212,'plugin:wheelform','m180430_232743_add_read_column_to_message','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','87aee7b7-6931-43a2-b672-897cf316fc6a'),(213,'plugin:wheelform','m180602_051517_AddOrderToField','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','49dcc4a5-87ee-4ebe-bd06-89c935bcc94f'),(214,'plugin:wheelform','m180802_015031_save_entry_to_forms_table','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','c137207b-11f2-4d96-8e57-5113428083af'),(215,'plugin:wheelform','m180804_230709_add_options_to_form_fields','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','ba668cfd-eaa4-4507-856a-ed3390ed9c26'),(216,'plugin:wheelform','m180814_230614_add_options_column_forms_table','2021-10-22 14:31:41','2021-10-22 14:31:41','2021-10-22 14:31:41','a5f38897-5c88-4970-82db-d05b91439a29');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'element-api','2.8.3','1.0.0','unknown',NULL,'2021-10-19 18:16:26','2021-10-19 18:16:26','2021-10-25 00:42:36','03f01212-07d2-4f91-8171-e84572382446'),(2,'super-table','2.6.8','2.2.1','unknown',NULL,'2021-10-19 18:17:28','2021-10-19 18:17:28','2021-10-25 00:42:36','6b38c3e6-2824-4901-90a8-3c0799791406'),(3,'redactor','2.8.8','2.3.0','unknown',NULL,'2021-10-19 18:18:55','2021-10-19 18:18:55','2021-10-25 00:42:36','dae1ac48-b093-4b40-b6a4-390956135fd0'),(4,'wheelform','2.6.2','2.0.0','unknown',NULL,'2021-10-22 14:31:25','2021-10-22 14:31:25','2021-10-25 00:42:36','41487d71-2b13-4582-a629-306d1d6d6ae8');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1635073360'),('email.fromEmail','\"jagritithapar@gmail.com\"'),('email.fromName','\"Abz Abdi\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.command','\"\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.autocapitalize','true'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.autocomplete','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.autocorrect','true'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.class','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.disabled','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.id','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.instructions','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.label','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.max','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.min','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.name','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.orientation','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.placeholder','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.readonly','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.requirable','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.size','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.step','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.tip','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.title','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.warning','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.0.width','100'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.fieldUid','\"367de2f9-9d3f-4069-a8c1-8598589b1b95\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.instructions','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.label','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.required','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.tip','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.warning','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.1.width','100'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.fieldUid','\"e13da284-b066-463b-9de1-21123bc6ab13\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.instructions','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.label','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.required','false'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.tip','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.warning','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.elements.2.width','100'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.name','\"Content\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.fieldLayouts.49ecb90c-70d2-4cb3-98d6-33f84dca7cac.tabs.0.sortOrder','1'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.handle','\"default\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.hasTitleField','true'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.name','\"Default\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.section','\"864aabaf-3221-432e-b6ba-048934b68587\"'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.sortOrder','1'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.titleFormat','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.titleTranslationKeyFormat','null'),('entryTypes.924711b8-6399-4528-a9cb-0ab89f8aed4b.titleTranslationMethod','\"site\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.autocomplete','false'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.autocorrect','true'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.class','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.disabled','false'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.id','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.instructions','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.label','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.max','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.min','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.name','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.orientation','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.placeholder','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.readonly','false'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.requirable','false'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.size','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.step','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.tip','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.title','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.warning','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.elements.0.width','100'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.name','\"Content\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.fieldLayouts.6c81d756-9a7f-42de-a74c-53b2b338ced0.tabs.0.sortOrder','1'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.handle','\"homepage\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.hasTitleField','false'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.name','\"Homepage\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.section','\"e10f280e-99bb-4e92-9dcc-7f20d74da2df\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.sortOrder','1'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.titleFormat','\"{section.name|raw}\"'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.titleTranslationKeyFormat','null'),('entryTypes.b2de7c89-2fc2-427c-9721-1ee9177b7356.titleTranslationMethod','\"site\"'),('fieldGroups.8b95c0d6-5b59-4b50-9d09-1f11641d4ac9.name','\"Pages\"'),('fieldGroups.cf9274fd-b33f-4d02-98a4-c7d3ae548a7d.name','\"Common\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.columnSuffix','null'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.contentColumnType','\"string\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.fieldGroup','\"8b95c0d6-5b59-4b50-9d09-1f11641d4ac9\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.handle','\"image\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.instructions','\"\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.name','\"Image\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.searchable','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.allowedKinds.0','\"image\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.allowSelfRelations','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.allowUploads','true'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.defaultUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.defaultUploadLocationSubpath','\"\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.limit','\"1\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.localizeRelations','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.previewMode','\"full\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.restrictFiles','\"1\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.selectionLabel','\"\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.showSiteMenu','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.showUnpermittedFiles','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.showUnpermittedVolumes','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.singleUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.singleUploadLocationSubpath','\"\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.source','null'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.sources','\"*\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.targetSiteId','null'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.useSingleFolder','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.validateRelatedElements','false'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.settings.viewMode','\"list\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.translationKeyFormat','null'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.translationMethod','\"site\"'),('fields.367de2f9-9d3f-4069-a8c1-8598589b1b95.type','\"craft\\\\fields\\\\Assets\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.columnSuffix','\"zzzjscza\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.contentColumnType','\"text\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.handle','\"email\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.instructions','\"\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.name','\"Email\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.searchable','false'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.byteLimit','null'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.charLimit','null'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.code','\"\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.columnType','null'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.initialRows','\"4\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.multiline','\"\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.placeholder','null'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.settings.uiMode','\"normal\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.translationKeyFormat','null'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.translationMethod','\"none\"'),('fields.4a6794ba-ba80-4267-a48b-e0d98b03a64b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.columnSuffix','\"rzhhkcdj\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.contentColumnType','\"text\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.handle','\"heaing\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.instructions','\"\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.name','\"Heading\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.searchable','false'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.byteLimit','null'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.charLimit','null'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.code','\"\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.columnType','null'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.initialRows','\"4\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.multiline','\"\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.placeholder','null'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.settings.uiMode','\"normal\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.translationKeyFormat','null'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.translationMethod','\"none\"'),('fields.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc.type','\"craft\\\\fields\\\\PlainText\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.columnSuffix','\"dhjrtrlr\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.contentColumnType','\"text\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.handle','\"contactUs\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.instructions','\"\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.name','\"Contact US\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.searchable','false'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.byteLimit','null'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.charLimit','null'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.code','\"\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.columnType','null'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.initialRows','\"4\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.multiline','\"1\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.placeholder','null'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.settings.uiMode','\"normal\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.translationKeyFormat','null'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.translationMethod','\"none\"'),('fields.638f556d-1ad1-4fb5-8a4d-a80d0a215159.type','\"craft\\\\fields\\\\PlainText\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.columnSuffix','\"gkttygyz\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.contentColumnType','\"text\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.handle','\"phone\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.instructions','\"\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.name','\"Phone\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.searchable','false'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.byteLimit','null'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.charLimit','null'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.code','\"\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.columnType','null'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.initialRows','\"4\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.multiline','\"\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.placeholder','null'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.settings.uiMode','\"normal\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.translationKeyFormat','null'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.translationMethod','\"none\"'),('fields.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0.type','\"craft\\\\fields\\\\PlainText\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.columnSuffix','null'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.contentColumnType','\"string\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.handle','\"socialLinks\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.instructions','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.name','\"Social Links\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.searchable','false'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.0.0','\"e4282c89-6f37-48db-9f6d-d1456cc10d7b\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.0.1.__assoc__.0.0','\"width\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.0.1.__assoc__.0.1','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.1.0','\"4cab3961-bb9f-4139-9765-12411d19183c\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.1.1.__assoc__.0.0','\"width\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.columns.__assoc__.1.1.__assoc__.0.1','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.contentTable','\"{{%stc_sociallinks}}\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.fieldLayout','\"row\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.maxRows','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.minRows','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.placeholderKey','null'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.propagationMethod','\"all\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.selectionLabel','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.settings.staticField','\"\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.translationKeyFormat','null'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.translationMethod','\"site\"'),('fields.c967ebc7-0652-4fca-84e6-e7b7fcbcca63.type','\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.columnSuffix','\"fsujtllx\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.contentColumnType','\"text\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.fieldGroup','\"8b95c0d6-5b59-4b50-9d09-1f11641d4ac9\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.handle','\"bodyContent\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.instructions','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.name','\"Body Content\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.searchable','false'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.availableTransforms','\"*\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.availableVolumes','\"*\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.cleanupHtml','true'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.columnType','\"text\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.configSelectionMode','\"choose\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.defaultTransform','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.manualConfig','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.purifierConfig','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.purifyHtml','\"1\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.redactorConfig','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.removeEmptyTags','\"1\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.removeInlineStyles','\"1\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.removeNbsp','\"1\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.showUnpermittedFiles','false'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.showUnpermittedVolumes','false'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.settings.uiMode','\"enlarged\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.translationKeyFormat','null'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.translationMethod','\"none\"'),('fields.e13da284-b066-463b-9de1-21123bc6ab13.type','\"craft\\\\redactor\\\\Field\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.columnSuffix','null'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.contentColumnType','\"string\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.fieldGroup','\"8b95c0d6-5b59-4b50-9d09-1f11641d4ac9\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.handle','\"homepage\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.instructions','\"\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.name','\"Homepage\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.searchable','false'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.settings.contentTable','\"{{%matrixcontent_homepage}}\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.settings.maxBlocks','\"\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.settings.minBlocks','\"\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.settings.propagationKeyFormat','null'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.settings.propagationMethod','\"all\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.translationKeyFormat','null'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.translationMethod','\"site\"'),('fields.e7d9aea0-37d2-4d59-964b-96f4530749bf.type','\"craft\\\\fields\\\\Matrix\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.columnSuffix','null'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.contentColumnType','\"string\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.fieldGroup','\"cf9274fd-b33f-4d02-98a4-c7d3ae548a7d\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.handle','\"siteLogo\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.instructions','\"\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.name','\"Site Logo\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.searchable','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.allowedKinds.0','\"image\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.allowSelfRelations','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.allowUploads','true'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.defaultUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.defaultUploadLocationSubpath','\"\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.limit','\"1\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.localizeRelations','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.previewMode','\"full\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.restrictFiles','\"1\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.selectionLabel','\"\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.showSiteMenu','true'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.showUnpermittedFiles','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.showUnpermittedVolumes','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.singleUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.singleUploadLocationSubpath','\"\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.source','null'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.sources','\"*\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.targetSiteId','null'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.useSingleFolder','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.validateRelatedElements','false'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.settings.viewMode','\"list\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.translationKeyFormat','null'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.translationMethod','\"site\"'),('fields.eed9e3e0-1db0-4d0b-b661-6cdd274656db.type','\"craft\\\\fields\\\\Assets\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.fieldUid','\"eed9e3e0-1db0-4d0b-b661-6cdd274656db\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.0.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.fieldUid','\"638f556d-1ad1-4fb5-8a4d-a80d0a215159\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.1.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.fieldUid','\"94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.2.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.fieldUid','\"4a6794ba-ba80-4267-a48b-e0d98b03a64b\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.3.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.fieldUid','\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.elements.4.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.name','\"General\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.3812d403-0c1e-4742-9cb2-b66e7c574348.tabs.0.sortOrder','1'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.fieldUid','\"eed9e3e0-1db0-4d0b-b661-6cdd274656db\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.0.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.fieldUid','\"638f556d-1ad1-4fb5-8a4d-a80d0a215159\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.1.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.fieldUid','\"94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.2.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.fieldUid','\"4a6794ba-ba80-4267-a48b-e0d98b03a64b\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.3.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.fieldUid','\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.elements.4.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.name','\"General\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9316774a-9c82-4f88-8305-2d93365c5ec0.tabs.0.sortOrder','1'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.fieldUid','\"eed9e3e0-1db0-4d0b-b661-6cdd274656db\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.0.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.fieldUid','\"638f556d-1ad1-4fb5-8a4d-a80d0a215159\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.1.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.fieldUid','\"94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.2.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.fieldUid','\"4a6794ba-ba80-4267-a48b-e0d98b03a64b\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.3.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.fieldUid','\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.elements.4.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.name','\"General\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.9529185b-a806-455b-8bf0-6b74fe8e4e58.tabs.0.sortOrder','1'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.fieldUid','\"eed9e3e0-1db0-4d0b-b661-6cdd274656db\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.0.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.fieldUid','\"638f556d-1ad1-4fb5-8a4d-a80d0a215159\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.1.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.fieldUid','\"94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.2.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.fieldUid','\"4a6794ba-ba80-4267-a48b-e0d98b03a64b\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.3.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.fieldUid','\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.instructions','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.label','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.required','false'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.tip','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.warning','null'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.elements.4.width','100'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.name','\"General\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.fieldLayouts.c02ba5bd-362d-4127-ab96-3b4e2c95ab07.tabs.0.sortOrder','1'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.handle','\"globals\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.name','\"Globals\"'),('globalSets.8dc4fe8c-286a-442e-8bf6-c765c528e114.sortOrder','1'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.field','\"e7d9aea0-37d2-4d59-964b-96f4530749bf\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.fieldUid','\"859d9734-b89e-4faf-93f4-52c65634903c\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.0.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.fieldUid','\"2232d2c6-49a9-4a24-8e43-713453f68f44\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.1.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.fieldUid','\"46de15ec-06c2-4806-adb2-eed7857e0941\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.2.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.fieldUid','\"b5f1f961-69cf-4f2d-8e8a-46daba86628b\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.3.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.fieldUid','\"87a92f44-7cd4-40f5-ad64-584dc22f14f0\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.4.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.fieldUid','\"f8d9408d-a357-4f37-bcb5-68804f63d24f\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.instructions','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.label','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.required','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.tip','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.warning','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.elements.5.width','100'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.name','\"Content\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fieldLayouts.07675983-f4fa-4064-b712-1a8d75f654f8.tabs.0.sortOrder','1'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.contentColumnType','\"text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.handle','\"heading\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.name','\"Heading\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.byteLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.charLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.code','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.columnType','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.initialRows','\"2\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.multiline','\"1\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.placeholder','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.settings.uiMode','\"normal\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.translationMethod','\"none\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.2232d2c6-49a9-4a24-8e43-713453f68f44.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.contentColumnType','\"text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.handle','\"text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.name','\"Text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.byteLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.charLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.code','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.columnType','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.initialRows','\"4\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.multiline','\"1\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.placeholder','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.settings.uiMode','\"normal\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.translationMethod','\"none\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.46de15ec-06c2-4806-adb2-eed7857e0941.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.contentColumnType','\"string\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.handle','\"bgImage\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.name','\"BG Image\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.allowSelfRelations','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.allowUploads','true'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.defaultUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.limit','\"1\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.localizeRelations','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.previewMode','\"full\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.restrictFiles','\"1\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.selectionLabel','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.showSiteMenu','true'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.showUnpermittedFiles','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.singleUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.source','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.sources','\"*\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.targetSiteId','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.useSingleFolder','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.validateRelatedElements','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.settings.viewMode','\"list\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.translationMethod','\"site\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.859d9734-b89e-4faf-93f4-52c65634903c.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.contentColumnType','\"text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.handle','\"buttonLink\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.name','\"Button Link\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.byteLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.charLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.code','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.columnType','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.initialRows','\"4\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.multiline','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.placeholder','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.settings.uiMode','\"normal\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.translationMethod','\"none\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.87a92f44-7cd4-40f5-ad64-584dc22f14f0.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.contentColumnType','\"text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.handle','\"buttonText\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.name','\"Button Text\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.byteLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.charLimit','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.code','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.columnType','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.initialRows','\"4\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.multiline','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.placeholder','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.settings.uiMode','\"normal\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.translationMethod','\"none\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.b5f1f961-69cf-4f2d-8e8a-46daba86628b.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.columnSuffix','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.contentColumnType','\"string\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.fieldGroup','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.handle','\"tabsContent\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.instructions','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.name','\"Tabs Content\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.searchable','false'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.contentTable','\"{{%stc_1_tabscontent}}\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.fieldLayout','\"row\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.maxRows','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.minRows','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.placeholderKey','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.propagationMethod','\"all\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.selectionLabel','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.settings.staticField','\"\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.translationKeyFormat','null'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.translationMethod','\"site\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.fields.f8d9408d-a357-4f37-bcb5-68804f63d24f.type','\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.handle','\"bannerContent\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.name','\"Banner Content\"'),('matrixBlockTypes.06391b20-af49-49ed-83aa-5615e94be31e.sortOrder','1'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.field','\"e7d9aea0-37d2-4d59-964b-96f4530749bf\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.fieldUid','\"99047969-ef35-43a5-8aa9-3a05c1e28578\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.label','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.required','false'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.tip','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.warning','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.elements.0.width','100'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.name','\"Content\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fieldLayouts.412b818d-016e-43f5-875d-148f97ee5d5b.tabs.0.sortOrder','1'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.columnSuffix','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.contentColumnType','\"boolean\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.fieldGroup','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.handle','\"show\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.instructions','\"\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.name','\"Show\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.searchable','false'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.settings.default','true'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.settings.offLabel','\"Hide\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.settings.onLabel','\"Show\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.translationKeyFormat','null'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.translationMethod','\"none\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.fields.99047969-ef35-43a5-8aa9-3a05c1e28578.type','\"craft\\\\fields\\\\Lightswitch\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.handle','\"bodyContent\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.name','\"Body Content\"'),('matrixBlockTypes.9547c6d1-d635-42b9-8de3-ea1303d84646.sortOrder','2'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.field','\"e7d9aea0-37d2-4d59-964b-96f4530749bf\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.fieldUid','\"2aa7ca58-f87f-4a70-81bc-d8950ce49611\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.label','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.required','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.tip','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.warning','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.0.width','100'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.fieldUid','\"f81fea22-78b4-47c4-9543-fad60203e7c4\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.label','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.required','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.tip','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.warning','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.1.width','100'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.fieldUid','\"c58f894a-ce59-4c0a-93bf-2823c4e33774\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.label','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.required','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.tip','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.warning','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.2.width','100'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.fieldUid','\"c9ca8bde-a252-4202-99a5-974cc7b352e8\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.label','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.required','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.tip','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.warning','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.3.width','100'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.fieldUid','\"fc3226ee-c13a-40ca-9c54-1e265e46313d\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.label','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.required','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.tip','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.warning','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.elements.4.width','100'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.name','\"Content\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fieldLayouts.e0f283cd-be8a-4660-b6e0-1fbed9719937.tabs.0.sortOrder','1'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.columnSuffix','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.contentColumnType','\"string\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.fieldGroup','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.handle','\"image\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.instructions','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.name','\"Image\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.searchable','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.allowSelfRelations','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.allowUploads','true'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.defaultUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.limit','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.localizeRelations','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.previewMode','\"full\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.restrictFiles','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.selectionLabel','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.showSiteMenu','true'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.showUnpermittedFiles','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.singleUploadLocationSource','\"volume:3cc1e7c1-d4a2-411e-91a3-93db58a3c44d\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.source','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.sources','\"*\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.targetSiteId','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.useSingleFolder','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.validateRelatedElements','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.settings.viewMode','\"list\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.translationKeyFormat','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.translationMethod','\"site\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.2aa7ca58-f87f-4a70-81bc-d8950ce49611.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.columnSuffix','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.contentColumnType','\"text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.fieldGroup','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.handle','\"bodyText\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.instructions','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.name','\"Body Text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.searchable','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.availableTransforms','\"*\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.availableVolumes','\"*\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.cleanupHtml','true'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.columnType','\"text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.defaultTransform','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.manualConfig','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.purifierConfig','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.purifyHtml','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.redactorConfig','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.removeNbsp','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.showUnpermittedFiles','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.translationKeyFormat','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.translationMethod','\"none\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c58f894a-ce59-4c0a-93bf-2823c4e33774.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.columnSuffix','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.contentColumnType','\"text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.fieldGroup','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.handle','\"buttonText\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.instructions','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.name','\"Button Text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.searchable','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.byteLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.charLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.code','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.columnType','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.initialRows','\"4\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.multiline','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.placeholder','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.settings.uiMode','\"normal\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.translationKeyFormat','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.translationMethod','\"none\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.c9ca8bde-a252-4202-99a5-974cc7b352e8.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.columnSuffix','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.contentColumnType','\"text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.fieldGroup','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.handle','\"heading\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.instructions','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.name','\"Heading\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.searchable','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.byteLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.charLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.code','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.columnType','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.initialRows','\"2\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.multiline','\"1\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.placeholder','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.settings.uiMode','\"normal\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.translationKeyFormat','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.translationMethod','\"none\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.f81fea22-78b4-47c4-9543-fad60203e7c4.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.columnSuffix','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.contentColumnType','\"text\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.fieldGroup','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.handle','\"buttonLink\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.instructions','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.name','\"Button Link\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.searchable','false'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.byteLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.charLimit','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.code','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.columnType','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.initialRows','\"4\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.multiline','\"\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.placeholder','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.settings.uiMode','\"normal\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.translationKeyFormat','null'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.translationMethod','\"none\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.fields.fc3226ee-c13a-40ca-9c54-1e265e46313d.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.handle','\"imageWithContent\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.name','\"Image With Content\"'),('matrixBlockTypes.9825f9ae-c4e8-45f2-ab67-0506c877e512.sortOrder','3'),('meta.__names__.06391b20-af49-49ed-83aa-5615e94be31e','\"Banner Content\"'),('meta.__names__.1d96fc9d-c8a6-4e68-871c-5ba0d4c9d184','\"Tabs Content\"'),('meta.__names__.2232d2c6-49a9-4a24-8e43-713453f68f44','\"Heading\"'),('meta.__names__.2aa7ca58-f87f-4a70-81bc-d8950ce49611','\"Image\"'),('meta.__names__.3171d563-63be-4912-bbf3-99d886f8dfc3','\"Body Text\"'),('meta.__names__.36018626-d5ef-41b9-8cc4-c14a40b10a32','\"Heading\"'),('meta.__names__.367de2f9-9d3f-4069-a8c1-8598589b1b95','\"Image\"'),('meta.__names__.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d','\"Uploads\"'),('meta.__names__.46de15ec-06c2-4806-adb2-eed7857e0941','\"Text\"'),('meta.__names__.4a6794ba-ba80-4267-a48b-e0d98b03a64b','\"Email\"'),('meta.__names__.4bbcd7ba-0bfb-4ce9-84f7-fae3bbbb5dbc','\"Heading\"'),('meta.__names__.5c33a868-c447-40ad-a53b-d54ca0bc10cc','\"Title\"'),('meta.__names__.638f556d-1ad1-4fb5-8a4d-a80d0a215159','\"Contact US\"'),('meta.__names__.78fc898b-8845-4479-8549-73b6a97f434a','\"Contact Number\"'),('meta.__names__.859d9734-b89e-4faf-93f4-52c65634903c','\"BG Image\"'),('meta.__names__.864aabaf-3221-432e-b6ba-048934b68587','\"News\"'),('meta.__names__.86dbfa20-448c-4ac2-a06d-6e45d9dd269e','\"Title\"'),('meta.__names__.87a92f44-7cd4-40f5-ad64-584dc22f14f0','\"Button Link\"'),('meta.__names__.883e0e3c-5fa0-4334-a018-1eefddbe218f','\"Milad\"'),('meta.__names__.8b95c0d6-5b59-4b50-9d09-1f11641d4ac9','\"Pages\"'),('meta.__names__.8dc4fe8c-286a-442e-8bf6-c765c528e114','\"Globals\"'),('meta.__names__.924711b8-6399-4528-a9cb-0ab89f8aed4b','\"Default\"'),('meta.__names__.94bd7f6e-a32f-474d-83b1-e1ba88d7c7d0','\"Phone\"'),('meta.__names__.9547c6d1-d635-42b9-8de3-ea1303d84646','\"Body Content\"'),('meta.__names__.9825f9ae-c4e8-45f2-ab67-0506c877e512','\"Image With Content\"'),('meta.__names__.99047969-ef35-43a5-8aa9-3a05c1e28578','\"Show\"'),('meta.__names__.a95eeb36-18e1-45a9-9cc1-73a6e00b2e45','\"Heading\"'),('meta.__names__.ab8de3ee-9120-4953-b576-4975c6062c7e','\"URL\"'),('meta.__names__.b2de7c89-2fc2-427c-9721-1ee9177b7356','\"Homepage\"'),('meta.__names__.b5f1f961-69cf-4f2d-8e8a-46daba86628b','\"Button Text\"'),('meta.__names__.c58f894a-ce59-4c0a-93bf-2823c4e33774','\"Body Text\"'),('meta.__names__.c6c6ba8c-4d35-4289-a66f-a3723426c0ac','\"Milad\"'),('meta.__names__.c967ebc7-0652-4fca-84e6-e7b7fcbcca63','\"Social Links\"'),('meta.__names__.c9ca8bde-a252-4202-99a5-974cc7b352e8','\"Button Text\"'),('meta.__names__.cf9274fd-b33f-4d02-98a4-c7d3ae548a7d','\"Common\"'),('meta.__names__.e10f280e-99bb-4e92-9dcc-7f20d74da2df','\"Homepage\"'),('meta.__names__.e13da284-b066-463b-9de1-21123bc6ab13','\"Body Content\"'),('meta.__names__.e7d9aea0-37d2-4d59-964b-96f4530749bf','\"Homepage\"'),('meta.__names__.eed9e3e0-1db0-4d0b-b661-6cdd274656db','\"Site Logo\"'),('meta.__names__.f2cd26e6-7788-4eff-af30-742e694a5a7c','\"Icon\"'),('meta.__names__.f81fea22-78b4-47c4-9543-fad60203e7c4','\"Heading\"'),('meta.__names__.f8d9408d-a357-4f37-bcb5-68804f63d24f','\"Tabs Content\"'),('meta.__names__.fc3226ee-c13a-40ca-9c54-1e265e46313d','\"Button Link\"'),('plugins.element-api.edition','\"standard\"'),('plugins.element-api.enabled','true'),('plugins.element-api.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"2.2.1\"'),('plugins.wheelform.edition','\"standard\"'),('plugins.wheelform.enabled','true'),('plugins.wheelform.schemaVersion','\"2.0.0\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.defaultPlacement','\"end\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.enableVersioning','true'),('sections.864aabaf-3221-432e-b6ba-048934b68587.handle','\"news\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.name','\"News\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.propagationMethod','\"all\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.enabledByDefault','true'),('sections.864aabaf-3221-432e-b6ba-048934b68587.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.hasUrls','true'),('sections.864aabaf-3221-432e-b6ba-048934b68587.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.template','\"news/_entry\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.uriFormat','\"{slug}\"'),('sections.864aabaf-3221-432e-b6ba-048934b68587.type','\"channel\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.defaultPlacement','\"end\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.enableVersioning','true'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.handle','\"homepage\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.name','\"Homepage\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.propagationMethod','\"all\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.enabledByDefault','true'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.hasUrls','true'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.template','\"home\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.siteSettings.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.uriFormat','\"__home__\"'),('sections.e10f280e-99bb-4e92-9dcc-7f20d74da2df.type','\"single\"'),('siteGroups.883e0e3c-5fa0-4334-a018-1eefddbe218f.name','\"Milad\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.baseUrl','\"@web\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.enabled','true'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.handle','\"default\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.hasUrls','true'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.language','\"en-US\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.name','\"Milad\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.primary','true'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.siteGroup','\"883e0e3c-5fa0-4334-a018-1eefddbe218f\"'),('sites.c6c6ba8c-4d35-4289-a66f-a3723426c0ac.sortOrder','1'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.field','\"f8d9408d-a357-4f37-bcb5-68804f63d24f\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.fieldUid','\"5c33a868-c447-40ad-a53b-d54ca0bc10cc\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.label','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.required','false'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.tip','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.warning','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.elements.0.width','100'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.name','\"Content\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fieldLayouts.9c2e8a77-ec7c-45df-9660-6bcb9ee3b353.tabs.0.sortOrder','1'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.columnSuffix','\"kybmokwj\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.contentColumnType','\"text\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.fieldGroup','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.handle','\"stitle\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.instructions','\"\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.name','\"Title\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.searchable','false'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.byteLimit','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.charLimit','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.code','\"\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.columnType','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.initialRows','\"4\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.multiline','\"\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.placeholder','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.settings.uiMode','\"normal\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.translationKeyFormat','null'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.translationMethod','\"none\"'),('superTableBlockTypes.891345e1-e400-4509-bc59-51520c50a249.fields.5c33a868-c447-40ad-a53b-d54ca0bc10cc.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.field','\"c967ebc7-0652-4fca-84e6-e7b7fcbcca63\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.fieldUid','\"f2cd26e6-7788-4eff-af30-742e694a5a7c\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.label','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.required','false'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.tip','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.warning','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.0.width','100'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.fieldUid','\"ab8de3ee-9120-4953-b576-4975c6062c7e\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.label','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.required','false'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.tip','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.warning','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.elements.1.width','100'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.name','\"Content\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fieldLayouts.e8d9e81f-a673-47b7-9cd1-47eba21df9e2.tabs.0.sortOrder','1'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.columnSuffix','\"sbecucrj\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.contentColumnType','\"string(255)\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.fieldGroup','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.handle','\"surl\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.instructions','\"\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.name','\"URL\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.searchable','false'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.settings.maxLength','\"255\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.settings.placeholder','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.settings.types.0','\"url\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.translationKeyFormat','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.translationMethod','\"none\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.ab8de3ee-9120-4953-b576-4975c6062c7e.type','\"craft\\\\fields\\\\Url\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.columnSuffix','\"hymsexyb\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.contentColumnType','\"text\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.fieldGroup','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.handle','\"icon\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.instructions','\"\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.name','\"Icon\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.searchable','false'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.byteLimit','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.charLimit','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.code','\"\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.columnType','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.initialRows','\"4\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.multiline','\"\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.placeholder','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.settings.uiMode','\"normal\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.translationKeyFormat','null'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.translationMethod','\"none\"'),('superTableBlockTypes.dddb2681-fb8f-4500-b075-6722f2ea5fc0.fields.f2cd26e6-7788-4eff-af30-742e694a5a7c.type','\"craft\\\\fields\\\\PlainText\"'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Home Page Created By Milad\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.7.8\"'),('system.timeZone','\"Europe/London\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.autocapitalize','true'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.autocomplete','false'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.autocorrect','true'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.class','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.disabled','false'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.id','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.instructions','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.label','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.max','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.min','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.name','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.orientation','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.placeholder','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.readonly','false'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.requirable','false'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.size','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.step','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.tip','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.title','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.warning','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.elements.0.width','100'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.name','\"Content\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.fieldLayouts.d6428fae-5e50-4758-91fa-952ff1069661.tabs.0.sortOrder','1'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.handle','\"uploads\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.hasUrls','true'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.name','\"Uploads\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.settings.path','\"@webroot/assets/uploads\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.sortOrder','1'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.titleTranslationKeyFormat','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.titleTranslationMethod','null'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.type','\"craft\\\\volumes\\\\Local\"'),('volumes.3cc1e7c1-d4a2-411e-91a3-93db58a3c44d.url','\"@web/assets/uploads\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (1,1,2,NULL,16,1,'2021-10-22 16:08:06','2021-10-22 16:08:06','b776ec13-c82b-420c-acd4-b6ffc67dff53'),(3,18,29,NULL,23,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','444a52f0-0793-431d-a796-4e139dca0bdb'),(4,18,37,NULL,23,1,'2021-10-22 16:17:01','2021-10-22 16:17:01','44663dfd-9252-4c01-a887-31693261af21'),(6,18,53,NULL,23,1,'2021-10-22 16:27:32','2021-10-22 16:27:32','a1c6d710-e139-43cc-a5e7-c08820e0a557'),(8,18,77,NULL,23,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','f2b3b670-c5a9-430e-b15e-29e569177f26'),(10,18,98,NULL,23,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','75123a6c-a1f7-4928-ac8b-5c3e305b5d62'),(11,26,99,NULL,100,1,'2021-10-22 16:48:15','2021-10-22 16:48:15','35702b89-0c7f-48a6-8430-12a0e5a0131d'),(12,26,101,NULL,100,1,'2021-10-22 16:48:28','2021-10-22 16:48:28','293883c9-dd62-4279-a1e8-805d76f1da37'),(13,26,102,NULL,103,1,'2021-10-22 16:49:09','2021-10-22 16:49:09','7f058ee8-f99f-4b9c-a383-1af8287c0b9d'),(14,26,104,NULL,103,1,'2021-10-22 16:49:13','2021-10-22 16:49:13','a3697f94-9bb7-441f-a4a1-59b11af09cc0'),(15,26,105,NULL,106,1,'2021-10-22 16:52:23','2021-10-22 16:52:23','3c208aeb-bc00-4dfb-b685-dfeef87e56c2'),(16,26,107,NULL,106,1,'2021-10-22 16:52:56','2021-10-22 16:52:56','0d2b7b41-e5c8-4938-a6b7-c0c3f83d87d7'),(18,26,109,NULL,106,1,'2021-10-23 15:04:30','2021-10-23 15:04:30','9fea65a7-d402-4437-8f0e-8c0b8f59f171'),(20,26,111,NULL,103,1,'2021-10-23 15:06:00','2021-10-23 15:06:00','748d2da2-bce1-4c07-8f1f-4fe5b00d6008'),(22,26,113,NULL,100,1,'2021-10-23 15:06:21','2021-10-23 15:06:21','845de2cd-ca4c-4a10-8d8d-be333f6e1701'),(26,26,117,NULL,103,1,'2021-10-23 15:14:14','2021-10-23 15:14:14','e8aeca51-5374-44e3-9320-726ea1539880'),(27,26,118,NULL,100,1,'2021-10-23 15:14:19','2021-10-23 15:14:19','1b3e261b-ad63-48f6-82c8-9b8f7e6797fb'),(28,26,119,NULL,106,1,'2021-10-23 15:14:28','2021-10-23 15:14:28','94dac96a-f5f8-4cad-9320-e4ef27bb7dcc'),(30,26,121,NULL,106,1,'2021-10-23 15:17:28','2021-10-23 15:17:28','143427fe-ef86-4992-ad4e-0f73873d3b66'),(31,26,122,NULL,103,1,'2021-10-23 15:17:32','2021-10-23 15:17:32','85eb14e2-2a55-4d8e-b0a3-46c8d6819c19'),(32,26,123,NULL,100,1,'2021-10-23 15:17:37','2021-10-23 15:17:37','9fdb3b51-a319-4e24-aa00-1812d59d5ddd'),(34,26,125,NULL,106,1,'2021-10-23 15:23:27','2021-10-23 15:23:27','cdad2027-9a9b-4597-9a86-0f24cdec928d'),(36,26,127,NULL,103,1,'2021-10-23 15:23:55','2021-10-23 15:23:55','e0968fd7-ba59-4a49-a92c-fdeec8fb6272'),(38,26,129,NULL,100,1,'2021-10-23 15:24:19','2021-10-23 15:24:19','d85a299e-d171-4f28-9cb4-50a9254ed34d'),(40,26,131,NULL,106,1,'2021-10-23 15:25:04','2021-10-23 15:25:04','cd2810c3-4987-45a7-bcc9-a65aa42d91a6'),(42,26,133,NULL,103,1,'2021-10-23 15:25:22','2021-10-23 15:25:22','de87c2bf-5305-48dc-ba13-24daa7627d5a'),(44,26,135,NULL,100,1,'2021-10-23 15:25:33','2021-10-23 15:25:33','4e11162a-8527-48d8-aadc-34728a8098ab'),(47,11,24,NULL,100,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','6d66a1bd-294d-4612-bb02-6e6892ff95bb'),(48,11,147,NULL,100,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','629fe1ad-4479-4fd7-8702-8cee24b5a11e'),(49,18,152,NULL,23,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','722418ff-de26-4941-8d74-28a1664aca58'),(53,11,164,NULL,100,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','48a222f6-4e86-458d-97ed-45e1f2b83de8'),(54,18,169,NULL,23,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','77117dd5-7d61-4439-a2aa-90203ff800d0');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('1113688e','@craft/web/assets/matrixsettings/dist'),('11b640c0','@lib/xregexp'),('121887de','@lib/iframe-resizer'),('15b82955','@craft/web/assets/login/dist'),('16dd5806','@craft/redactor/assets/field/dist'),('1729b994','@craft/web/assets/dbbackup/dist'),('1bda044a','@lib/selectize'),('1dbe9e98','@craft/web/assets/craftsupport/dist'),('1ebbb8c9','@lib/fileupload'),('1f46d96d','@app/web/assets/updateswidget/dist'),('1f785f5','@lib/jquery-touch-events'),('21b1e992','@lib/jquery-ui'),('22aba3dc','@craft/web/assets/feed/dist'),('24976946','@craft/web/assets/cp/dist'),('25b1e4d3','@lib/selectize'),('28fa7514','@craft/web/assets/recententries/dist'),('2b66a9db','@lib/axios'),('2d7eeaf4','@lib/picturefill'),('2e0d5ade','@lib/fabric'),('2e553fd5','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('2fbc23bc','@app/web/assets/dashboard/dist'),('2fdda059','@lib/xregexp'),('376478a3','@craft/web/assets/editentry/dist'),('3822020a','@craft/web/assets/updater/dist'),('38e7aa42','@app/web/assets/recententries/dist'),('39d60431','@craft/web/assets/editsection/dist'),('3b4b8ee0','@lib/garnishjs'),('3f0f5823','@craft/web/assets/plugins/dist'),('40f3c1b8','@craft/web/assets/cp/dist'),('4101099f','@lib/d3'),('4422667b','@craft/web/assets/matrixsettings/dist'),('46a19261','@craft/web/assets/pluginstore/dist'),('46fdf06d','@craft/redactor/assets/field/dist'),('4800150c','@lib/jquery-touch-events'),('49809c3f','@craft/web/assets/pluginstore/dist'),('4a861f85','@lib/prismjs'),('4cd7fe80','@lib/garnishjs'),('4fa429ce','@lib/picturefill'),('51072ebf','@lib/element-resize-detector'),('52086567','@app/web/assets/login/dist'),('54150c73','@app/web/assets/pluginstore/dist'),('574c2830','@lib/fileupload'),('59912abe','@lib/fabric'),('5be88517','@craft/web/assets/dashboard/dist'),('5bef1727','@lib/iframe-resizer'),('5d612a06','@verbb/base/resources/dist'),('63e5033b','@verbb/supertable/resources/dist'),('6584f7be','@lib/iframe-resizer'),('67faca27','@lib/fabric'),('68d0aae','@lib/vue'),('6927c8a9','@lib/fileupload'),('692d4769','@verbb/base/resources/dist'),('6f187237','@lib/velocity'),('71cfc957','@lib/picturefill'),('7232407e','@app/web/assets/cp/dist'),('72bc1e19','@lib/garnishjs'),('733fdddf','@lib/jquery.payment'),('736c83fa','@lib/xregexp'),('746c5fee','@app/web/assets/plugins/dist'),('75fc3b85','@craft/web/assets/editsection/dist'),('766bf595','@lib/jquery-touch-events'),('7900c770','@lib/selectize'),('7b4e4717','@craft/web/assets/editentry/dist'),('7b53b93b','@app/web/assets/craftsupport/dist'),('7c568d63','@craft/web/assets/admintable/dist'),('7e7597be','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('7e97854a','@bower/jquery/dist'),('7f6ae906','@lib/d3'),('7fb19516','@craft/web/assets/installer/dist'),('8184603c','@craft/redactor/assets/redactor-plugins/dist/video'),('8260b7ab','@app/web/assets/recententries/dist'),('84a82aff','@craft/web/assets/recententries/dist'),('857f7a34','@lib/vue'),('8751dd25','@lib/jquery.payment'),('8af985b0','@bower/jquery/dist'),('8b5b1ad3','@wheelform/assets'),('8f69966','@lib/d3'),('9052cb96','@craft/web/assets/dashboard/dist'),('93d088b6','@lib/timepicker'),('953b3e55','@app/web/assets/dashboard/dist'),('95aa264e','@app/web/assets/feed/dist'),('968cac7d','@craft/web/assets/fields/dist'),('96ff39d8','@lib/axios'),('9c287991','@lib/jquery-ui'),('9cb04d33','@craft/redactor/assets/redactor/dist'),('a06cb100','@craft/web/assets/cp/dist'),('a2439908','@lib/jquery-ui'),('a5692e45','@lib/element-resize-detector'),('a6439449','@lib/selectize'),('a7745346','@craft/web/assets/matrix/dist'),('a894d941','@lib/axios'),('abc69f83','@craft/web/assets/updater/dist'),('ac2fd0c3','@lib/xregexp'),('ad10ead6','@craft/web/assets/installer/dist'),('b05b210e','@lib/velocity'),('b1e7111d','@craft/redactor/assets/redactor/dist'),('b33d3cca','@craft/web/assets/generalsettings/dist'),('b59496bb','@app/web/assets/updater/dist'),('b7514bc8','@craft/web/assets/fieldsettings/dist'),('ba126891','@craft/web/assets/updateswidget/dist'),('bb149aad','@lib/vue'),('bfe03355','@lib/datepicker-i18n'),('c1d4a4d2','@app/web/assets/craftsupport/dist'),('c30e1549','@bower/jquery/dist'),('c7195695','@craft/web/assets/login/dist'),('c842bed3','@craft/web/assets/cp/dist'),('cea64ddc','@lib/jquery.payment'),('cf258e1a','@lib/garnishjs'),('d1a4c857','@craft/redactor/assets/redactor-plugins/dist/video'),('d281e234','@lib/velocity'),('d2f55e25','@lib/element-resize-detector'),('d3886b1c','@craft/web/assets/admintable/dist'),('d5dfe968','@lib/jquery-ui'),('d604d019','@craft/web/assets/craftsupport/dist'),('d9ce5997','@lib/vue'),('da635a24','@lib/fabric'),('daa693c9','@craft/web/assets/fields/dist'),('df08a921','@lib/axios'),('e2071019','@verbb/supertable/resources/dist'),('e4461be9','@craft/web/assets/sites/dist'),('e6768724','@lib/iframe-resizer'),('ead5b833','@lib/fileupload'),('ec9ebebc','@lib/element-resize-detector'),('ecea02ad','@lib/velocity'),('ee92119a','@app/web/assets/pluginstore/dist'),('f00adc1c','@craft/web/assets/feed/dist'),('f0cdad45','@lib/jquery.payment'),('f138b52','@app/web/assets/updater/dist'),('f19449cf','@app/web/assets/login/dist'),('f23db9cd','@lib/picturefill'),('f2455db3','@craft/web/assets/matrix/dist'),('f599850f','@lib/jquery-touch-events'),('f5b063b','@craft/web/assets/updateswidget/dist'),('f71f8f86','@lib/prismjs'),('fa833f15','@app/web/assets/cp/dist'),('fa9e89ca','@craft/web/assets/utilities/dist'),('fb7b747c','@craft/web/assets/fieldsettings/dist'),('fc268f88','@craft/web/assets/pluginstore/dist'),('fc98999c','@lib/d3'),('fd65f5d0','@bower/jquery/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,3,1,3,'Applied “Draft 1”'),(4,3,1,4,''),(5,3,1,5,'Applied “Draft 1”'),(6,3,1,6,'Applied “Draft 1”'),(7,99,1,1,''),(8,102,1,1,''),(9,105,1,1,''),(10,105,1,2,''),(11,102,1,2,''),(12,99,1,2,''),(13,102,1,3,''),(14,99,1,3,'Applied “Draft 1”'),(15,105,1,3,'Applied “Draft 1”'),(16,105,1,4,''),(17,102,1,4,''),(18,99,1,4,''),(19,105,1,5,'Applied “Draft 1”'),(20,102,1,5,'Applied “Draft 1”'),(21,99,1,5,'Applied “Draft 1”'),(22,105,1,6,'Applied “Draft 1”'),(23,102,1,6,'Applied “Draft 1”'),(24,99,1,6,''),(25,3,1,7,'Applied “Draft 1”'),(26,3,1,8,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' yogeshyadav8868 gmail com '),(1,'slug',0,1,''),(2,'slug',0,1,''),(3,'title',0,1,' homepage '),(3,'slug',0,1,' homepage '),(24,'slug',0,1,''),(25,'slug',0,1,''),(26,'slug',0,1,''),(27,'slug',0,1,''),(16,'filename',0,1,' logo png '),(16,'extension',0,1,' png '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' logo '),(28,'slug',0,1,''),(29,'slug',0,1,''),(23,'filename',0,1,' placeholder image square3 png '),(23,'extension',0,1,' png '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' placeholder image square3 '),(30,'slug',0,1,''),(69,'slug',0,1,''),(70,'slug',0,1,''),(71,'slug',0,1,''),(88,'slug',0,1,''),(89,'slug',0,1,''),(90,'slug',0,1,''),(91,'slug',0,1,''),(105,'slug',0,1,' active tab '),(105,'title',0,1,' active tab '),(145,'slug',0,1,''),(160,'slug',0,1,''),(100,'filename',0,1,' image png '),(100,'extension',0,1,' png '),(100,'kind',0,1,' image '),(100,'slug',0,1,''),(100,'title',0,1,' image '),(102,'slug',0,1,' hovered tab '),(102,'title',0,1,' hovered tab '),(161,'slug',0,1,''),(162,'slug',0,1,''),(103,'filename',0,1,' placeholder image square jpg '),(103,'extension',0,1,' jpg '),(103,'kind',0,1,' image '),(103,'slug',0,1,''),(103,'title',0,1,' placeholder image square '),(99,'slug',0,1,' inactive tab '),(99,'title',0,1,' inactive tab '),(143,'slug',0,1,''),(144,'slug',0,1,''),(106,'filename',0,1,' placeholder image square png '),(106,'extension',0,1,' png '),(106,'kind',0,1,' image '),(106,'slug',0,1,''),(106,'title',0,1,' placeholder image square ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all','end',NULL,'2021-10-22 14:53:07','2021-10-22 14:53:07',NULL,'e10f280e-99bb-4e92-9dcc-7f20d74da2df'),(2,NULL,'News','news','channel',1,'all','end',NULL,'2021-10-22 16:28:42','2021-10-22 16:28:42',NULL,'864aabaf-3221-432e-b6ba-048934b68587');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home',1,'2021-10-22 14:53:07','2021-10-22 14:53:07','676a2a50-1939-4f8e-8669-48948e895cd7'),(2,2,1,1,'{slug}','news/_entry',1,'2021-10-22 16:28:42','2021-10-22 16:28:42','7d50ba42-790f-4edf-82fe-d9eb59425ae5');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Milad','2021-10-19 18:07:55','2021-10-24 11:02:40',NULL,'883e0e3c-5fa0-4334-a018-1eefddbe218f');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Milad','default','en-US',1,'@web',1,'2021-10-19 18:07:55','2021-10-24 11:02:02',NULL,'c6c6ba8c-4d35-4289-a66f-a3723426c0ac');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_1_tabscontent`
--

LOCK TABLES `stc_1_tabscontent` WRITE;
/*!40000 ALTER TABLE `stc_1_tabscontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `stc_1_tabscontent` VALUES (1,58,1,'2021-10-22 16:35:59','2021-10-22 16:35:59','3a076f23-abf2-4cdd-901b-e970337849cb',NULL),(2,59,1,'2021-10-22 16:36:02','2021-10-22 16:36:02','03498631-d292-4eb9-9640-929e49fa4e6f','Innovation Partner'),(3,60,1,'2021-10-22 16:36:02','2021-10-22 16:36:02','c01f091d-3018-4297-a90d-42baf9b41455',NULL),(4,61,1,'2021-10-22 16:36:05','2021-10-22 16:36:05','150a6e5a-17a9-410f-a3e4-fc0aa7188e7f','Innovation Partner'),(5,62,1,'2021-10-22 16:36:05','2021-10-22 16:36:05','086eebf5-f4c3-4d74-9a92-13704a329bff','Top Class Team'),(6,63,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','661c0375-ba7b-4fad-9daf-101a1b19b2f9','Innovation Partner'),(7,64,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','68c647e4-e30e-4229-a66b-33f4cd86b430','Top Class Team'),(8,65,1,'2021-10-22 16:36:08','2021-10-22 16:36:08','1e326821-a5d8-409f-8d1d-8ed58be471de',NULL),(12,69,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','581982ed-9d86-4bdc-bf95-dd91d531d7d7','Innovation Partner'),(13,70,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','5785b865-bfe3-4315-aa13-012782173caa','Top Class Team'),(14,71,1,'2021-10-22 16:36:45','2021-10-22 16:36:45','6c864612-09de-4f6d-9fe8-dd710c2e0df8','Corporate Solutions'),(15,74,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','e5c051a4-ce7c-48ac-b087-395807c092e5','Innovation Partner'),(16,75,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','b5e2a28b-e8df-4366-9763-d39f75a25fff','Top Class Team'),(17,76,1,'2021-10-22 16:36:46','2021-10-22 16:36:46','0ad867a5-8147-4e48-ad6a-41879e057dca','Corporate Solutions'),(21,88,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','487da4fe-6fb3-42c0-b780-9ddf21cd0c69','Innovation Partner'),(22,89,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','9734e90a-b668-4999-97d5-4430412f0d69','Top Class Team'),(23,90,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','31e64115-fdce-44b7-b883-8610c679d2ec','Corporate Solutions'),(24,94,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','76dc57d5-0984-489e-b5bf-a847bb1752d8','Innovation Partner'),(25,95,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','57b6fd4b-8edd-42f0-8921-ed29f99b162d','Top Class Team'),(26,96,1,'2021-10-22 16:40:07','2021-10-22 16:40:07','71735c44-f5e2-45cc-9c58-cee220251757','Corporate Solutions'),(30,143,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','15a896c5-8e15-496d-8379-734eed82863a','Innovation Partner'),(31,144,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','4bd70707-e37a-4ff4-acd3-6f8445a0c892','Top Class Team'),(32,145,1,'2021-10-24 10:45:19','2021-10-24 10:45:19','681a5cd5-7836-4c3f-af6b-1b6ace15c753','Corporate Solutions'),(33,148,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','04f36f0b-2eca-4609-8bac-6d40d6a33216','Innovation Partner'),(34,149,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','ddad3a84-45f1-44ef-bc97-dc3f6d683c55','Top Class Team'),(35,150,1,'2021-10-24 10:45:21','2021-10-24 10:45:21','680f3828-57aa-4c3a-8913-bfb97637a7c7','Corporate Solutions'),(39,160,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','3e27a843-8a5c-47be-b5a6-94b481688128','Innovation Partner'),(40,161,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','a2c62c47-f807-4bcc-abb6-80fa93ec13bd','Top Class Team'),(41,162,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','57ca5d28-daee-470b-bd49-6deaecfc3da2','Corporate Solutions'),(42,165,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','f3b38e1f-3053-437a-b8a7-b7b6c14b544b','Innovation Partner'),(43,166,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','38f6e860-ec5e-4350-b1fe-c3c079b0147e','Top Class Team'),(44,167,1,'2021-10-24 10:49:45','2021-10-24 10:49:45','77745356-f58a-4119-8277-4c57ed779828','Corporate Solutions');
/*!40000 ALTER TABLE `stc_1_tabscontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_sociallinks`
--

LOCK TABLES `stc_sociallinks` WRITE;
/*!40000 ALTER TABLE `stc_sociallinks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stc_sociallinks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `supertableblocks` VALUES (69,24,28,3,1,0,'2021-10-22 16:36:45','2021-10-22 16:36:45','d5f57d57-0178-45d4-bba2-eec722ae2b95'),(70,24,28,3,2,0,'2021-10-22 16:36:45','2021-10-22 16:36:45','7d504c3f-9bdb-4f06-b1bd-be7f30bdb681'),(71,24,28,3,3,0,'2021-10-22 16:36:45','2021-10-22 16:36:45','e6c15879-1f03-497f-9d0a-f47334b8ce1c'),(74,73,28,3,1,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','3d32cf94-f16b-4577-be8b-bdabc2ef8813'),(75,73,28,3,2,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','ba239e9e-9cbe-4648-89f6-d7b5443eaade'),(76,73,28,3,3,NULL,'2021-10-22 16:36:46','2021-10-22 16:36:46','526f4f70-a420-497e-81d5-f248dabd9fab'),(88,24,28,3,1,0,'2021-10-22 16:40:07','2021-10-22 16:40:07','b4ba5c70-8c80-449b-932b-cf81b5cbdc37'),(89,24,28,3,2,0,'2021-10-22 16:40:07','2021-10-22 16:40:07','b39783c5-5310-400d-a2d0-bdce7824c2e2'),(90,24,28,3,3,0,'2021-10-22 16:40:07','2021-10-22 16:40:07','2b11a69b-5435-4d34-b574-5f295809bcbb'),(94,93,28,3,1,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','9f9b9b24-e9e5-40e8-ab97-ea6260cb543d'),(95,93,28,3,2,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','8508e0ea-562a-4b96-a8a3-190d876eede9'),(96,93,28,3,3,NULL,'2021-10-22 16:40:07','2021-10-22 16:40:07','7a1b48d4-3b50-4cec-9551-77e2eb0da06c'),(143,24,28,3,1,0,'2021-10-24 10:45:19','2021-10-24 10:45:19','acb6b1c9-2bae-48fb-a06a-69855166a7b0'),(144,24,28,3,2,0,'2021-10-24 10:45:19','2021-10-24 10:45:19','0fcef4b3-5920-4f7a-a989-c789612260f9'),(145,24,28,3,3,0,'2021-10-24 10:45:19','2021-10-24 10:45:19','4a6a77c0-a0bf-42ac-894f-a6ede060ddc4'),(148,147,28,3,1,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','8cb6e9f5-7b65-4fc0-90f6-bfa74c6ffafb'),(149,147,28,3,2,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','f0e0afbd-ca2c-4bfd-8806-1923ac52ef26'),(150,147,28,3,3,NULL,'2021-10-24 10:45:21','2021-10-24 10:45:21','3fc979c3-a7e1-4ca2-8807-d4466345f0ed'),(160,24,28,3,1,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','cca9cb32-b463-4f16-86d8-44c444f4a105'),(161,24,28,3,2,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','c1602241-5fee-498d-82a6-eb10a3c482a2'),(162,24,28,3,3,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','be0d133f-5cdc-4102-9f01-9ad59164d0ca'),(165,164,28,3,1,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','ccb6f4bb-86b3-4882-bbe1-09138fe391e5'),(166,164,28,3,2,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','cada1cd9-f35f-4497-bce8-cc19dfe3b2a6'),(167,164,28,3,3,NULL,'2021-10-24 10:49:45','2021-10-24 10:49:45','1dc6027f-b45f-465b-af85-660d53c945e1');
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `supertableblocktypes` VALUES (1,5,2,'2021-10-22 14:42:41','2021-10-22 14:42:41','dddb2681-fb8f-4500-b075-6722f2ea5fc0'),(3,28,12,'2021-10-22 16:35:35','2021-10-22 16:35:35','891345e1-e400-4509-bc59-51520c50a249');
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'yogeshyadav8868@gmail.com','$2y$13$Z9aDjeDiHBItDmqmJ.Ljeus8gw9.mMcubbBPbBAacHsR5H6RhTfOy',1,0,0,0,'2021-10-25 00:42:27',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-10-19 18:08:00','2021-10-19 18:08:00','2021-10-25 00:42:27','d31547ff-e94f-405b-a934-8b62db0a1e3b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Uploads','','2021-10-22 14:38:41','2021-10-22 14:38:41','ec4b1c90-3753-4a27-88fb-55dfa02c3ec8'),(2,NULL,NULL,'Temporary source',NULL,'2021-10-22 14:52:28','2021-10-22 14:52:28','79c4df11-7843-4fb3-bccc-a93322fe1587'),(3,2,NULL,'user_1','user_1/','2021-10-22 14:52:28','2021-10-22 14:52:28','9934a4de-1e95-4832-8a9d-95c7e5ac2fda');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Uploads','uploads','craft\\volumes\\Local',1,'@web/assets/uploads','site',NULL,'{\"path\":\"@webroot/assets/uploads\"}',1,'2021-10-22 14:38:41','2021-10-22 14:38:41',NULL,'3cc1e7c1-d4a2-411e-91a3-93db58a3c44d');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `wheelform_form_fields`
--

LOCK TABLES `wheelform_form_fields` WRITE;
/*!40000 ALTER TABLE `wheelform_form_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `wheelform_form_fields` VALUES (1,1,'email','email',1,0,1,1,'{\"label\":\"\",\"containerClass\":\"\",\"fieldClass\":\"\",\"is_reply_to\":false,\"placeholder\":\"\",\"is_user_notification_field\":false,\"display_required_attribute\":false}','2021-10-22 14:31:40','2021-10-22 14:56:42','81e10906-3dbe-425b-8691-0e7a5a6e9e5f'),(2,1,'name','text',0,0,2,1,'{\"label\":\"\",\"containerClass\":\"\",\"fieldClass\":\"\",\"placeholder\":\"\",\"display_required_attribute\":false}','2021-10-22 14:31:40','2021-10-22 14:56:42','5e486746-a73c-4aac-94e3-ff0c9a83c526'),(3,1,'message','text',1,0,4,1,'{\"label\":\"\",\"containerClass\":\"\",\"fieldClass\":\"\",\"placeholder\":\"\",\"display_required_attribute\":false}','2021-10-22 14:31:40','2021-10-22 14:56:42','e2384428-244b-47d4-b80a-58e318c42c0a'),(4,1,'topics','select',0,0,3,0,'{\"label\":\"Topics\",\"containerClass\":\"\",\"fieldClass\":\"\",\"selectEmpty\":false,\"validate\":false,\"items\":[\"Option\",\"Option 2\",\"Option 3\"],\"display_required_attribute\":false}','2021-10-22 14:56:38','2021-10-22 14:56:42','6474611a-3685-4f3f-8096-d5bcecf90d0b'),(5,1,'topics','select',0,0,3,1,'{\"label\":\"Topics\",\"containerClass\":\"\",\"fieldClass\":\"\",\"selectEmpty\":false,\"validate\":false,\"items\":[\"Option\",\"Option 2\",\"Option 3\"],\"display_required_attribute\":false}','2021-10-22 14:56:42','2021-10-22 14:56:42','04aa7bb4-32e9-46ae-9635-a8feba20eff1');
/*!40000 ALTER TABLE `wheelform_form_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `wheelform_forms`
--

LOCK TABLES `wheelform_forms` WRITE;
/*!40000 ALTER TABLE `wheelform_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `wheelform_forms` VALUES (1,1,'Contact Form','user@example.com',1,1,0,1,'{\"honeypot\":\"\",\"honeypot_value\":\"\",\"email_subject\":\"\",\"user_notification\":0}','2021-10-22 14:31:40','2021-10-22 14:56:42','9317cebf-fade-490e-8644-0c6385a748cc');
/*!40000 ALTER TABLE `wheelform_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `wheelform_message_values`
--

LOCK TABLES `wheelform_message_values` WRITE;
/*!40000 ALTER TABLE `wheelform_message_values` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wheelform_message_values` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `wheelform_messages`
--

LOCK TABLES `wheelform_messages` WRITE;
/*!40000 ALTER TABLE `wheelform_messages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wheelform_messages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-10-19 18:13:07','2021-10-19 18:13:07','d18c94fc-2881-4e6b-ac9d-1bfa705d8d7f'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-10-19 18:13:07','2021-10-19 18:13:07','0cd8a16a-7b87-4cfe-8df8-e4f7c4e76f85'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-10-19 18:13:07','2021-10-19 18:13:07','4a0bda7b-9807-4e9a-a4cc-a980f54338a1'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-10-19 18:13:07','2021-10-19 18:13:07','def91253-cea7-4124-beb7-5c3a9609e42b');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'wbpsczdi_craft3-cms'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25  0:43:26
