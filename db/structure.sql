-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: flash
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

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

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afg_opportunities`
--

DROP TABLE IF EXISTS `afg_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afg_opportunities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imported` tinyint(1) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latlong` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `sponsoringOrganizationName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xml_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skills` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `reverse_geocoded` tinyint(1) DEFAULT '0',
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighborhood_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkins`
--

DROP TABLE IF EXISTS `checkins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_checkins_on_event_id_and_user_id` (`event_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_affiliations`
--

DROP TABLE IF EXISTS `event_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_affiliations_on_affiliate_id_and_event_id` (`affiliate_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created` date DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `neighborhood_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'WA',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_instructions` text COLLATE utf8_unicode_ci,
  `twitter_hashtags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosted_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_featured_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_featured_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_featured_file_size` int(11) DEFAULT NULL,
  `photo_featured_updated_at` datetime DEFAULT NULL,
  `photo_2_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_2_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_2_file_size` int(11) DEFAULT NULL,
  `photo_2_updated_at` datetime DEFAULT NULL,
  `photo_3_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_3_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_3_file_size` int(11) DEFAULT NULL,
  `photo_3_updated_at` datetime DEFAULT NULL,
  `photo_4_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_4_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_4_file_size` int(11) DEFAULT NULL,
  `photo_4_updated_at` datetime DEFAULT NULL,
  `photo_5_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_5_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_5_file_size` int(11) DEFAULT NULL,
  `photo_5_updated_at` datetime DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `vm_id` int(11) DEFAULT '0',
  `lonlat` point DEFAULT NULL,
  `moved_marker` tinyint(1) DEFAULT '1',
  `private` tinyint(1) DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_neighborhood_id` (`neighborhood_id`),
  KEY `index_events_on_creator_id` (`creator_id`),
  KEY `index_events_on_User_id` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_articles`
--

DROP TABLE IF EXISTS `help_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hubs`
--

DROP TABLE IF EXISTS `hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` point DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neighborhoods`
--

DROP TABLE IF EXISTS `neighborhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighborhoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region` polygon NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `center` point DEFAULT NULL,
  `name_friendly` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_friendly` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `index_neighborhoods_on_region` (`region`)
) ENGINE=MyISAM AUTO_INCREMENT=3784 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orgs_admins`
--

DROP TABLE IF EXISTS `orgs_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgs_admins` (
  `user_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  KEY `index_orgs_admins_on_user_id_and_org_id` (`user_id`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orgs_followers`
--

DROP TABLE IF EXISTS `orgs_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgs_followers` (
  `user_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  KEY `index_orgs_followers_on_user_id_and_org_id` (`user_id`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `participations`
--

DROP TABLE IF EXISTS `participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participations` (
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `hours_volunteered` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_participations_on_user_id_and_event_id` (`user_id`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=680 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privacies`
--

DROP TABLE IF EXISTS `privacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `upcoming_events` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'everyone',
  PRIMARY KEY (`id`),
  KEY `index_privacies_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `props`
--

DROP TABLE IF EXISTS `props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giver_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_props_on_giver_id_and_receiver_id` (`giver_id`,`receiver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rails_admin_histories`
--

DROP TABLE IF EXISTS `rails_admin_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rails_admin_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_roles_users_on_role_id_and_user_id` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_found` int(11) DEFAULT '0',
  `orgs_found` int(11) DEFAULT '0',
  `events_found` int(11) DEFAULT '0',
  `help_articles_found` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills_events`
--

DROP TABLE IF EXISTS `skills_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills_events` (
  `skill_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  KEY `index_skills_events_on_skill_id_and_event_id` (`skill_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills_users`
--

DROP TABLE IF EXISTS `skills_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills_users` (
  `skill_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_skills_users_on_skill_id_and_user_id` (`skill_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_affiliations`
--

DROP TABLE IF EXISTS `user_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moderator` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_affiliations_on_affiliate_id_and_user_id` (`affiliate_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `notification_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_user_notifications_on_notification_id_and_user_id` (`notification_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `neighborhood_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `website` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_neighborhood_id_and_org_id` (`neighborhood_id`,`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_followers`
--

DROP TABLE IF EXISTS `users_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_followers` (
  `user_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  KEY `index_users_followers_on_user_id_and_follower_id` (`user_id`,`follower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volunteer_match_metadata`
--

DROP TABLE IF EXISTS `volunteer_match_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteer_match_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volunteer_matches`
--

DROP TABLE IF EXISTS `volunteer_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteer_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vm_id` int(11) DEFAULT NULL,
  `imported` tinyint(1) DEFAULT '0',
  `allow_group_invitations` tinyint(1) DEFAULT NULL,
  `allow_group_reservation` tinyint(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `beneficiary` int(11) DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `great_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_wait_list` tinyint(1) DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_age` int(11) DEFAULT NULL,
  `num_referred` int(11) DEFAULT NULL,
  `requires_address` tinyint(1) DEFAULT NULL,
  `requirements` text COLLATE utf8_unicode_ci,
  `skills_needed` text COLLATE utf8_unicode_ci,
  `spaces_available` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `virtual` tinyint(1) DEFAULT NULL,
  `vm_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volunteers_needed` int(11) DEFAULT NULL,
  `reverse_geocoded` tinyint(1) DEFAULT '0',
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighborhood_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_volunteer_matches_on_vm_id` (`vm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-19 16:14:29
INSERT INTO schema_migrations (version) VALUES ('20110724194133');

INSERT INTO schema_migrations (version) VALUES ('20110724220516');

INSERT INTO schema_migrations (version) VALUES ('20110724220744');

INSERT INTO schema_migrations (version) VALUES ('20110724221739');

INSERT INTO schema_migrations (version) VALUES ('20111210065204');

INSERT INTO schema_migrations (version) VALUES ('20111215024451');

INSERT INTO schema_migrations (version) VALUES ('20111216010338');

INSERT INTO schema_migrations (version) VALUES ('20111216041522');

INSERT INTO schema_migrations (version) VALUES ('20111216053101');

INSERT INTO schema_migrations (version) VALUES ('20111216053509');

INSERT INTO schema_migrations (version) VALUES ('20120115004638');

INSERT INTO schema_migrations (version) VALUES ('20120121230552');

INSERT INTO schema_migrations (version) VALUES ('20120211202839');

INSERT INTO schema_migrations (version) VALUES ('20120211203158');

INSERT INTO schema_migrations (version) VALUES ('20120211203306');

INSERT INTO schema_migrations (version) VALUES ('20120211221527');

INSERT INTO schema_migrations (version) VALUES ('20120211231644');

INSERT INTO schema_migrations (version) VALUES ('20120211234700');

INSERT INTO schema_migrations (version) VALUES ('20120211234726');

INSERT INTO schema_migrations (version) VALUES ('20120211234753');

INSERT INTO schema_migrations (version) VALUES ('20120218200040');

INSERT INTO schema_migrations (version) VALUES ('20120218200718');

INSERT INTO schema_migrations (version) VALUES ('20120219004038');

INSERT INTO schema_migrations (version) VALUES ('20120312015606');

INSERT INTO schema_migrations (version) VALUES ('20120312033449');

INSERT INTO schema_migrations (version) VALUES ('20120312040405');

INSERT INTO schema_migrations (version) VALUES ('20120324211637');

INSERT INTO schema_migrations (version) VALUES ('20120325174935');

INSERT INTO schema_migrations (version) VALUES ('20120401180623');

INSERT INTO schema_migrations (version) VALUES ('20120417035646');

INSERT INTO schema_migrations (version) VALUES ('20120420062309');

INSERT INTO schema_migrations (version) VALUES ('20120422214449');

INSERT INTO schema_migrations (version) VALUES ('20120505203828');

INSERT INTO schema_migrations (version) VALUES ('20120506060825');

INSERT INTO schema_migrations (version) VALUES ('20120603181644');

INSERT INTO schema_migrations (version) VALUES ('20120614031710');

INSERT INTO schema_migrations (version) VALUES ('20120617161000');

INSERT INTO schema_migrations (version) VALUES ('20120617161130');

INSERT INTO schema_migrations (version) VALUES ('20120621022910');

INSERT INTO schema_migrations (version) VALUES ('20120621044134');

INSERT INTO schema_migrations (version) VALUES ('20120624202445');

INSERT INTO schema_migrations (version) VALUES ('20120702043140');

INSERT INTO schema_migrations (version) VALUES ('20120703041302');

INSERT INTO schema_migrations (version) VALUES ('20120704192328');

INSERT INTO schema_migrations (version) VALUES ('20120704204138');

INSERT INTO schema_migrations (version) VALUES ('20121110224144');

INSERT INTO schema_migrations (version) VALUES ('20121110230242');

INSERT INTO schema_migrations (version) VALUES ('20130203053304');

INSERT INTO schema_migrations (version) VALUES ('20130223231803');

INSERT INTO schema_migrations (version) VALUES ('20130415042629');

INSERT INTO schema_migrations (version) VALUES ('20130416015940');

INSERT INTO schema_migrations (version) VALUES ('20130423021634');

INSERT INTO schema_migrations (version) VALUES ('20130425040744');

INSERT INTO schema_migrations (version) VALUES ('20130903064521');

INSERT INTO schema_migrations (version) VALUES ('20130906234916');

INSERT INTO schema_migrations (version) VALUES ('20130918021924');

INSERT INTO schema_migrations (version) VALUES ('20130923062946');

INSERT INTO schema_migrations (version) VALUES ('20131004231118');

INSERT INTO schema_migrations (version) VALUES ('20131129000000');

INSERT INTO schema_migrations (version) VALUES ('20140117050509');

INSERT INTO schema_migrations (version) VALUES ('20140207041648');

INSERT INTO schema_migrations (version) VALUES ('20140606032047');

INSERT INTO schema_migrations (version) VALUES ('20140620033947');

INSERT INTO schema_migrations (version) VALUES ('20140620034741');

