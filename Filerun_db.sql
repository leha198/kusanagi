-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2021 at 02:10 AM
-- Server version: 10.3.28-MariaDB-log
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Filerun_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `df_collections`
--

CREATE TABLE `df_collections` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_collections_items`
--

CREATE TABLE `df_collections_items` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `share_id` int(9) DEFAULT NULL,
  `added` datetime NOT NULL DEFAULT current_timestamp(),
  `uid` mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_file_handlers`
--

CREATE TABLE `df_file_handlers` (
  `id` mediumint(9) NOT NULL,
  `uid` mediumint(9) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handler` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handler_edit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weblink_handler` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weblink_edit_handler` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_file_handlers`
--

INSERT INTO `df_file_handlers` (`id`, `uid`, `type`, `ext`, `handler`, `handler_edit`, `weblink_handler`, `weblink_edit_handler`) VALUES
(1, NULL, 'txt', NULL, 'plain_text_viewer', 'code_editor', 'plain_text_viewer', 'code_editor'),
(2, NULL, 'code', NULL, 'code_editor', 'code_editor', 'code_editor', 'code_editor'),
(3, NULL, 'img', NULL, 'image_viewer', 'image_editor', 'image_viewer', 'image_editor'),
(4, NULL, 'img2', NULL, 'image_viewer', 'image_editor', 'image_viewer', 'image_editor'),
(5, NULL, 'raw', NULL, 'image_viewer', 'image_editor', 'image_viewer', NULL),
(6, NULL, 'wvideo', NULL, 'video_player', NULL, 'video_player', NULL),
(7, NULL, 'mp3', NULL, 'audio_player', NULL, 'audio_player', NULL),
(8, NULL, 'office', NULL, 'office_web_viewer', NULL, 'libreoffice_viewer', NULL),
(9, NULL, 'ooffice', NULL, 'office_web_viewer', NULL, 'libreoffice_viewer', NULL),
(10, NULL, 'arch', NULL, 'arch', NULL, NULL, NULL),
(11, NULL, '3d', NULL, '3d_viewer', NULL, '3d_viewer', NULL),
(12, NULL, 'cad', NULL, 'autodesk', NULL, 'autodesk', NULL),
(13, NULL, NULL, 'odt', 'webodf', NULL, 'webodf', NULL),
(14, NULL, NULL, 'ods', 'webodf', NULL, 'webodf', NULL),
(15, NULL, NULL, 'odp', 'webodf', NULL, 'webodf', NULL),
(16, NULL, NULL, 'pdf', 'open_in_browser', NULL, 'open_in_browser', NULL),
(17, NULL, NULL, 'url', 'handle_url', NULL, 'handle_url', NULL),
(18, NULL, NULL, 'html', 'html_editor', 'html_editor', 'html_editor', 'html_editor'),
(19, NULL, NULL, 'kml', 'kml_viewer', NULL, 'kml_viewer', NULL),
(20, NULL, NULL, 'kmz', 'kml_viewer', NULL, 'kml_viewer', NULL),
(21, NULL, NULL, 'gpx', 'bing_kml_viewer', NULL, 'bing_kml_viewer', NULL),
(22, NULL, NULL, 'md', 'markdown_viewer', 'code_editor', 'markdown_viewer', 'code_editor'),
(23, NULL, NULL, 'epub', 'epub_reader', NULL, 'epub_reader', NULL),
(24, NULL, NULL, 'csv', 'code_editor', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `df_file_logs`
--

CREATE TABLE `df_file_logs` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_logs`
--

CREATE TABLE `df_logs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '2002-02-02 00:00:00',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` mediumint(9) NOT NULL DEFAULT 0,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_folders_notifications`
--

CREATE TABLE `df_modules_folders_notifications` (
  `id` mediumint(9) NOT NULL,
  `uid` int(9) NOT NULL,
  `pathid` int(10) NOT NULL,
  `shareid` int(8) DEFAULT NULL,
  `notify_write` int(1) NOT NULL DEFAULT 0,
  `notify_read` int(1) NOT NULL DEFAULT 0,
  `notify_social` int(1) NOT NULL DEFAULT 0,
  `notify_misc` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_metadata_dt`
--

CREATE TABLE `df_modules_metadata_dt` (
  `id` mediumint(9) NOT NULL,
  `owner` mediumint(9) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` smallint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_modules_metadata_dt`
--

INSERT INTO `df_modules_metadata_dt` (`id`, `owner`, `name`, `description`, `ext`, `file_types`, `system`) VALUES
(1, 0, 'Documents', 'System type', 'pdf,txt', 'office,ooffice', 1),
(2, 0, 'Photos', 'System type', 'psb,psd,tiff,tif,bmp', 'img,raw', 1),
(3, 0, 'Audio', 'System type', '', 'mp3,audio', 1),
(4, 0, 'Video', 'System type', '', 'wvideo,video', 1);

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_metadata_fields`
--

CREATE TABLE `df_modules_metadata_fields` (
  `id` mediumint(9) NOT NULL,
  `fsid` mediumint(9) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autocomplete` smallint(1) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_fieldset_name_in_column` smallint(1) NOT NULL DEFAULT 0,
  `hide_field_via_weblinks` smallint(1) NOT NULL DEFAULT 0,
  `show_column_by_default` smallint(1) NOT NULL DEFAULT 0,
  `system` smallint(1) NOT NULL DEFAULT 0,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_modules_metadata_fields`
--

INSERT INTO `df_modules_metadata_fields` (`id`, `fsid`, `name`, `description`, `type`, `autocomplete`, `options`, `hide_fieldset_name_in_column`, `hide_field_via_weblinks`, `show_column_by_default`, `system`, `source`, `sort`) VALUES
(1, 0, 'comment', 'Comments (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(2, 0, 'filelog', 'File Logs (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(3, 0, 'label', 'Labels (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(4, 0, 'star', 'Stars (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(5, 0, 'filename', 'Search (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(6, 0, 'zoho_collab', 'Zoho Collaborative Editing (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(7, 0, 'autodesk_urn', 'Autodesk Viewer (System)', '', NULL, '', 0, 0, 0, 1, NULL, NULL),
(8, 0, 'Tags', '', 'multiple', NULL, '', 0, 0, 0, 1, 'MWG->Keywords', NULL),
(9, 3, 'Width', '', 'small', NULL, '', 1, 0, 0, 0, 'MWG->width', 1),
(10, 3, 'Height', '', 'small', NULL, '', 1, 0, 0, 0, 'MWG->height', 2),
(11, 3, 'Date taken', '', 'date', NULL, '', 1, 0, 0, 0, 'MWG->DateCreated', 3),
(12, 3, 'Author', '', 'multiple', NULL, '', 1, 0, 0, 0, 'MWG->Creator', 4),
(13, 3, 'Description', '', 'large', NULL, '', 1, 0, 0, 0, 'MWG->Description', 5),
(14, 3, 'Copyright', '', '', NULL, '', 1, 0, 0, 0, 'MWG->Copyright', 6),
(15, 3, 'GPS latitude', '', 'small', NULL, '', 1, 0, 0, 0, 'MWG->GPSlatitude', 7),
(16, 3, 'GPS longitude', '', 'small', NULL, '', 1, 0, 0, 0, 'MWG->GPSlongitude', 8),
(17, 4, 'Date taken', '', 'date', NULL, '', 1, 0, 0, 0, 'info->quicktime->moov->subatoms->0->creation_time_unix', 1),
(18, 4, 'Movie title', '', '', NULL, '', 1, 0, 0, 0, 'info->quicktime->moov->subatoms->3->subatoms->0->subatoms->1->subatoms->0->data', 2),
(19, 4, 'Width', '', 'small', NULL, '', 1, 0, 0, 0, 'info->video->resolution_x', 3),
(20, 4, 'Height', '', 'small', NULL, '', 1, 0, 0, 0, 'info->video->resolution_y', 4),
(21, 4, 'Codec', '', '', NULL, '', 1, 0, 0, 0, 'info->video->dataformat', 5),
(22, 4, 'GPS latitude', '', 'small', NULL, '', 1, 0, 0, 0, 'info->tags->quicktime->gps_latitude', 6),
(23, 4, 'GPS longitude', '', 'small', NULL, '', 1, 0, 0, 0, 'info->tags->quicktime->gps_longitude', 7),
(24, 5, 'Artist', '', '', NULL, '', 1, 0, 0, 0, 'info->comments->artist', 1),
(25, 5, 'Title', '', '', NULL, '', 1, 0, 0, 0, 'info->comments->title', 2),
(26, 5, 'Album', '', '', NULL, '', 1, 0, 0, 0, 'info->comments->album', 3),
(27, 5, 'Duration', '', 'small', NULL, '', 1, 0, 0, 0, 'info->playtime_string', 4),
(28, 5, 'Codec', '', '', NULL, '', 1, 0, 0, 0, 'info->audio->codec', 5),
(29, 6, 'Author', '', '', NULL, '', 1, 0, 0, 0, NULL, 1),
(30, 6, 'Description', '', '', NULL, '', 1, 0, 0, 0, NULL, 2),
(31, 0, 'Rating', '', 'stars', NULL, '', 1, 0, 0, 1, 'Rating', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_metadata_fieldsets`
--

CREATE TABLE `df_modules_metadata_fieldsets` (
  `id` mediumint(9) NOT NULL,
  `owner` mediumint(9) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic` smallint(1) NOT NULL DEFAULT 0,
  `system` smallint(1) NOT NULL DEFAULT 0,
  `visible` smallint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_modules_metadata_fieldsets`
--

INSERT INTO `df_modules_metadata_fieldsets` (`id`, `owner`, `name`, `description`, `generic`, `system`, `visible`) VALUES
(1, 0, 'Comments (System)', 'Required for the file commenting system', 1, 1, 0),
(2, 0, 'Label (System)', 'Required for the label system', 1, 1, 0),
(3, 0, 'Image properties', '', 0, 1, 1),
(4, 0, 'Video properties', '', 0, 1, 1),
(5, 0, 'Audio properties', '', 0, 1, 1),
(6, 0, 'Various information', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_metadata_files`
--

CREATE TABLE `df_modules_metadata_files` (
  `id` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `type_id` mediumint(9) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_metadata_values`
--

CREATE TABLE `df_modules_metadata_values` (
  `id` int(10) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `uid` mediumint(9) NOT NULL,
  `share_id` mediumint(9) DEFAULT NULL,
  `file_id` mediumint(9) NOT NULL,
  `field_id` mediumint(9) NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_notifications`
--

CREATE TABLE `df_modules_notifications` (
  `id` mediumint(9) NOT NULL,
  `owner` mediumint(9) DEFAULT NULL,
  `object_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `object_id` mediumint(9) NOT NULL DEFAULT 0,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_search_index_queue`
--

CREATE TABLE `df_modules_search_index_queue` (
  `id` mediumint(9) NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_shares`
--

CREATE TABLE `df_modules_shares` (
  `id` mediumint(9) NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `created` datetime NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `with_gid` mediumint(9) DEFAULT NULL,
  `with_uid` mediumint(9) DEFAULT NULL,
  `anonymous` smallint(1) NOT NULL DEFAULT 0,
  `perms_upload` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `perms_download` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `perms_comment` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `perms_read_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `perms_alter` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `perms_share` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_trash`
--

CREATE TABLE `df_modules_trash` (
  `id` mediumint(9) NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `relative_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_deleted` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_user_groups`
--

CREATE TABLE `df_modules_user_groups` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` mediumint(9) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_user_roles`
--

CREATE TABLE `df_modules_user_roles` (
  `id` mediumint(9) NOT NULL,
  `system` smallint(1) NOT NULL DEFAULT 0,
  `owner` mediumint(9) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_users` smallint(1) NOT NULL DEFAULT 0,
  `admin_roles` smallint(1) NOT NULL DEFAULT 0,
  `admin_notifications` smallint(1) NOT NULL DEFAULT 0,
  `admin_logs` smallint(1) NOT NULL DEFAULT 0,
  `admin_metadata` smallint(1) NOT NULL DEFAULT 0,
  `admin_over` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_max_users` smallint(7) NOT NULL DEFAULT 0,
  `admin_homefolder_template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homefolder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_folder` smallint(1) NOT NULL DEFAULT 1,
  `space_quota_max` int(20) DEFAULT NULL,
  `space_quota_current` int(20) NOT NULL DEFAULT 0,
  `readonly` smallint(1) DEFAULT NULL,
  `upload` smallint(1) DEFAULT NULL,
  `upload_max_size` bigint(20) DEFAULT NULL,
  `upload_limit_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download` smallint(1) DEFAULT NULL,
  `preview` smallint(1) DEFAULT 1,
  `download_folders` smallint(1) DEFAULT NULL,
  `read_comments` smallint(1) DEFAULT NULL,
  `write_comments` smallint(1) DEFAULT NULL,
  `email` smallint(1) NOT NULL DEFAULT 0,
  `weblink` smallint(1) NOT NULL DEFAULT 0,
  `share` smallint(1) NOT NULL DEFAULT 0,
  `share_guests` smallint(1) NOT NULL DEFAULT 0,
  `metadata` smallint(1) NOT NULL DEFAULT 0,
  `file_history` smallint(1) NOT NULL DEFAULT 0,
  `users_may_see` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_pass` smallint(1) NOT NULL DEFAULT 1,
  `edit_profile` smallint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_modules_user_roles`
--

INSERT INTO `df_modules_user_roles` (`id`, `system`, `owner`, `name`, `description`, `admin_type`, `admin_users`, `admin_roles`, `admin_notifications`, `admin_logs`, `admin_metadata`, `admin_over`, `admin_max_users`, `admin_homefolder_template`, `homefolder`, `create_folder`, `space_quota_max`, `space_quota_current`, `readonly`, `upload`, `upload_max_size`, `upload_limit_types`, `download`, `preview`, `download_folders`, `read_comments`, `write_comments`, `email`, `weblink`, `share`, `share_guests`, `metadata`, `file_history`, `users_may_see`, `change_pass`, `edit_profile`) VALUES
(1, 1, NULL, 'Guest', 'Automatically deleted when there are no files shared with.', '', 0, 0, 0, 0, 0, '', 0, '', '', 0, NULL, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '-ALL-', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `df_modules_weblinks`
--

CREATE TABLE `df_modules_weblinks` (
  `id` int(10) NOT NULL,
  `id_rnd` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uid` mediumint(9) NOT NULL,
  `pathid` int(10) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `share_id` mediumint(9) DEFAULT NULL,
  `short_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `download_limit` mediumint(6) DEFAULT NULL,
  `allow_uploads` int(1) NOT NULL DEFAULT 0,
  `allow_editing` int(1) NOT NULL DEFAULT 0,
  `allow_downloads` int(1) NOT NULL DEFAULT 1,
  `system` smallint(1) NOT NULL DEFAULT 0,
  `notify` mediumint(1) NOT NULL DEFAULT 0,
  `download_terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_comments` tinyint(1) NOT NULL DEFAULT 0,
  `show_comments_names` tinyint(1) NOT NULL DEFAULT 0,
  `show_metadata` tinyint(1) NOT NULL DEFAULT 0,
  `require_login` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_notifications_logs`
--

CREATE TABLE `df_notifications_logs` (
  `id` mediumint(9) NOT NULL,
  `date` datetime NOT NULL,
  `has_errors` smallint(1) NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_access_tokens`
--

CREATE TABLE `df_oauth_access_tokens` (
  `id` mediumint(8) NOT NULL,
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sid` mediumint(8) NOT NULL,
  `expiry` int(11) NOT NULL,
  `device_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_access_token_scopes`
--

CREATE TABLE `df_oauth_access_token_scopes` (
  `id` mediumint(8) NOT NULL,
  `access_token_id` mediumint(8) NOT NULL,
  `scope` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_auth_codes`
--

CREATE TABLE `df_oauth_auth_codes` (
  `id` mediumint(8) NOT NULL,
  `auth_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` mediumint(8) NOT NULL,
  `redirect_uri` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_auth_code_scopes`
--

CREATE TABLE `df_oauth_auth_code_scopes` (
  `id` mediumint(9) NOT NULL,
  `auth_code_id` mediumint(9) NOT NULL,
  `scope` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_clients`
--

CREATE TABLE `df_oauth_clients` (
  `id` mediumint(9) NOT NULL,
  `enabled` smallint(1) NOT NULL DEFAULT 0,
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_oauth_clients`
--

INSERT INTO `df_oauth_clients` (`id`, `enabled`, `cid`, `secret`, `logo_url`, `name`, `publisher`, `description`, `website`, `publisher_website`) VALUES
(1, 1, 'FileRun0000000000000000000Mobile', '0000000000000000NoSecret0000000000000000', 'https://filerun.com/images/logo-mobile-app.png', 'FileRun Mobile', 'Afian AB', 'Authentication for the mobile apps', 'https://filerun.com', 'https://afian.se'),
(2, 1, 'Nextcloud0000000000000000000Apps', '0000000000000000NoSecret0000000000000000', 'https://filerun.com/images/nextcloud-square-logo.png', 'Nextcloud', 'Nextcloud GmbH', 'Authentication for the Nextcloud mobile apps', 'https://nextcloud.com/clients/', 'https://nextcloud.com'),
(3, 1, 'Generic0000000000000000000WebDAV', '0000000000000000NoSecret0000000000000000', '', 'WebDAV', '', 'Authentication for the WebDAV apps', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_client_redirect_uris`
--

CREATE TABLE `df_oauth_client_redirect_uris` (
  `id` mediumint(8) NOT NULL,
  `cid` mediumint(8) NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_oauth_client_redirect_uris`
--

INSERT INTO `df_oauth_client_redirect_uris` (`id`, `cid`, `uri`) VALUES
(1, 1, 'filerun://'),
(2, 2, 'nc://');

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_refresh_tokens`
--

CREATE TABLE `df_oauth_refresh_tokens` (
  `id` mediumint(8) NOT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` mediumint(9) NOT NULL,
  `expiry` int(11) NOT NULL,
  `device_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_scopes`
--

CREATE TABLE `df_oauth_scopes` (
  `id` mediumint(8) NOT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_oauth_scopes`
--

INSERT INTO `df_oauth_scopes` (`id`, `scope`, `description`) VALUES
(1, 'profile', ''),
(2, 'download', ''),
(3, 'upload', ''),
(4, 'modify', ''),
(5, 'delete', ''),
(6, 'list', ''),
(7, 'email', ''),
(8, 'weblink', ''),
(9, 'upload.sandbox', ''),
(10, 'weblink.sandbox', ''),
(11, 'delete.sandbox', ''),
(12, 'admin', ''),
(13, 'list.sandbox', ''),
(14, 'download.sandbox', ''),
(15, 'share', ''),
(16, 'share.sandbox', ''),
(17, 'metadata', ''),
(18, 'webdav', '');

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_sessions`
--

CREATE TABLE `df_oauth_sessions` (
  `id` mediumint(8) NOT NULL,
  `owner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid` mediumint(8) NOT NULL,
  `redirect_uri` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `client_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nc_login_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_oauth_session_scopes`
--

CREATE TABLE `df_oauth_session_scopes` (
  `id` mediumint(9) NOT NULL,
  `sid` mediumint(9) NOT NULL,
  `scope` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `df_paths`
--

CREATE TABLE `df_paths` (
  `id` int(10) NOT NULL,
  `path` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` smallint(3) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `uniq` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_paths`
--

INSERT INTO `df_paths` (`id`, `path`, `filename`, `depth`, `date_added`, `uniq`) VALUES
(1, '/home/kusanagi', 'kusanagi', 2, '2021-04-21 09:04:26', '62483e8cfda7e8506d7cb1a04cfb6b94');

-- --------------------------------------------------------

--
-- Table structure for table `df_relationships`
--

CREATE TABLE `df_relationships` (
  `id` mediumint(9) NOT NULL,
  `related_to_id` mediumint(9) NOT NULL DEFAULT 0,
  `object_id` mediumint(9) NOT NULL DEFAULT 0,
  `relation_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_relationships`
--

INSERT INTO `df_relationships` (`id`, `related_to_id`, `object_id`, `relation_type`) VALUES
(1, 2, 3, 'meta-fs2dt'),
(2, 4, 4, 'meta-fs2dt'),
(3, 3, 5, 'meta-fs2dt'),
(4, 4, 5, 'meta-fs2dt'),
(5, 1, 6, 'meta-fs2dt');

-- --------------------------------------------------------

--
-- Table structure for table `df_settings`
--

CREATE TABLE `df_settings` (
  `id` mediumint(9) NOT NULL,
  `var` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_settings`
--

INSERT INTO `df_settings` (`id`, `var`, `val`) VALUES
(1, 'currentVersion', '2021.03.26'),
(2, 'app_title', 'File Manager'),
(3, 'smtp_enable', '0'),
(4, 'smtp_host', ''),
(5, 'smtp_port', ''),
(6, 'smtp_username', ''),
(7, 'smtp_password', ''),
(8, 'smtp_auth', '0'),
(9, 'smtp_security', 'ssl'),
(10, 'last_email_notification', '8'),
(11, 'instant_email_notifications', '1'),
(12, 'default_notification_address', 'configure-me@example.com'),
(13, 'user_registration_enable', '0'),
(14, 'user_registration_generate_passwords', '1'),
(15, 'user_registration_email_verification', '0'),
(16, 'user_registration_approval', '0'),
(17, 'user_registration_reqfields_email', '1'),
(18, 'user_registration_reqfields_company', '0'),
(19, 'user_registration_reqfields_website', '0'),
(20, 'user_registration_reqfields_description', '0'),
(21, 'user_registration_default_groups', 'a:0:{}'),
(22, 'user_registration_default_role', ''),
(23, 'user_registration_change_pass', '1'),
(24, 'captcha', '0'),
(25, 'allow_change_pass', '1'),
(26, 'max_login_attempts', '5'),
(27, 'allow_persistent_login', '1'),
(28, 'logout_redirect', ''),
(29, 'password_recovery_enable', '1'),
(30, 'password_recovery_force_change', '1'),
(31, 'search_enable', '0'),
(32, 'search_elastic_host_url', 'http://localhost:9200'),
(33, 'search_default_mode', 'filename'),
(34, 'search_tika_path', '/path/to/tika-app-1.22.jar'),
(35, 'search_tika_port', '9998'),
(36, 'search_include_img', '0'),
(37, 'search_tika_server_ocr_pdf', '0'),
(38, 'thumbnails_enable', '1'),
(39, 'thumbnails_imagemagick', '0'),
(40, 'thumbnails_imagemagick_path', '/usr/bin/convert'),
(41, 'thumbnails_size', '170'),
(42, 'thumbnails_imagemagick_ext', 'psd,psb,eps,tst,plt,ai,pdf,jpg,jpeg,gif,png,jpe,erf,dng,cr2,cr3,crw,3fr,fff,ppm,raw,kdc,dcr,nef,mef,mos,nrw,orf,raf,mrw,mdc,rw2,pef,x3f,srw,arw,iiq,svg,tif,tiff,heic,webp,exr'),
(43, 'thumbnails_ffmpeg', '0'),
(44, 'thumbnails_ffmpeg_path', '/usr/bin/ffmpeg'),
(45, 'thumbnails_ffmpeg_ext', 'mpg,mpeg,mp4,mov,avi,divx,mkv,wmv,rm,flv,asx,asf,swf,3gp,3g2,m4v,m2ts,mts,m2v,ogv,webm'),
(46, 'thumbnails_filesize_limit_min', '8'),
(47, 'thumbnails_small_filesize_check_res', '1'),
(48, 'ui_preview_size', 'automatic'),
(49, 'ui_preview_filesize_limit_min', '4'),
(50, 'ui_preview_small_filesize_check_res', '1'),
(51, 'weblinks_default_mode', 'list'),
(52, 'versioning_max', '2'),
(53, 'quota_warning_level', '90'),
(54, 'ui_default_language', 'english'),
(55, 'ui_display_language_menu', '1'),
(56, 'ui_double_click', 'preview'),
(57, 'ui_login_logo', ''),
(58, 'ui_login_text', ''),
(59, 'ui_login_title', 'File Manager'),
(60, 'ui_title_logo', '1'),
(61, 'ui_logo_url', NULL),
(62, 'ui_default_view', 'list'),
(63, 'ui_enable_collections', '0'),
(64, 'gravatar_enabled', '1'),
(65, 'upload_blocked_types', ''),
(66, 'allow_folder_notifications', '0'),
(67, 'disable_file_history', '0'),
(68, 'pushercom_app_id', ''),
(69, 'pushercom_app_key', ''),
(70, 'pushercom_app_secret', ''),
(71, 'pushercom_enable', '0'),
(72, 'file_history_entry_lifetime', '7'),
(73, 'user_activity_logs_entry_lifetime', '7'),
(74, 'maintenance', '0'),
(75, 'maintenance_message_public', 'Our FileRun website is currently undergoing scheduled maintenance. Will be back online shortly.\nThank you for your patience!'),
(76, 'maintenance_message_users', 'This application is currently undergoing scheduled maintenance. Will be back online shortly.\nThank you for your patience!'),
(77, 'send_from_custom_email', '0'),
(78, 'passwords_min_length', '4'),
(79, 'passwords_letters_and_digits', '0'),
(80, 'passwords_requires_uppercase', '0'),
(81, 'passwords_requires_special', '0'),
(82, 'passwords_prevent_seq', '0'),
(83, 'passwords_prevent_common', '0'),
(84, 'passwords_life_time', '365'),
(85, 'logout_inactivity', '30'),
(86, 'auth_plugin', ''),
(87, 'auth_allow_local', '1'),
(88, 'notifications_template', '<div style=\"font-family:tahoma,arial,verdana,sans-serif;font-size:13px;\">\n		Hi {$info.userInfo.name},<br>\n		<br>\n\n		{foreach from=$info.actions item=action}\n			{$action.message}\n		{/foreach}\n\n		<br>\n		Best regards,<br>\n		<br>\n		<a href=\"{$config.url.root}\">{$config.url.root}</a>\n</div>'),
(89, 'notifications_subject_template', '{$settings.app_title|safeHTML} notifications ({$info.actions[0].info.userInfo.name}: {$info.actions[0].info.actionDescription})'),
(90, 'ui_media_folders_music_enable', '0'),
(91, 'ui_media_folders_photos_enable', '0'),
(92, 'guest_users', '0'),
(93, 'guest_users_delete', '1m'),
(94, 'ui_thumbs_in_detailed', '1'),
(95, 'ui_enable_rating', '0'),
(96, 'ui_photos_thumbnail_size', '200'),
(97, 'ui_theme', 'blue'),
(98, 'ui_enable_download_cart', '0'),
(99, 'search_result_limit', '200'),
(100, 'search_mode', 'broad'),
(101, 'disable_custom_action_admin_thumbnail_troubleshooter', '1'),
(102, 'thumbnails_libreoffice', '0'),
(103, 'thumbnails_libreoffice_ext', 'doc,docx,ods,xls,xlsx,odt,ppt,pps,pptx,odp,rtf,txt,html,csv,tsv,md'),
(104, 'thumbnails_libreoffice_path', 'soffice'),
(105, 'ui_media_folders_videos_enable', '0'),
(106, 'weblinks_hide_download_all', '0'),
(107, 'ui_login_bg', ''),
(108, 'ui_logo_link_url', ''),
(109, 'ui_help_url', ''),
(110, 'ui_welcome_message', ''),
(111, 'ui_theme_load_custom', '0');

-- --------------------------------------------------------

--
-- Table structure for table `df_users`
--

CREATE TABLE `df_users` (
  `id` mediumint(9) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_step_enabled` int(1) NOT NULL DEFAULT 0,
  `two_step_secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_otp` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_pass_change` datetime DEFAULT NULL,
  `cookie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` mediumint(9) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `activated` smallint(1) NOT NULL DEFAULT 0,
  `expiration_date` datetime DEFAULT NULL,
  `require_password_change` int(1) NOT NULL DEFAULT 0,
  `failed_login_attempts` smallint(1) NOT NULL DEFAULT 0,
  `last_access_date` timestamp NULL DEFAULT NULL,
  `last_notif_delivery_date` timestamp NULL DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_logout_date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_notifications` smallint(1) NOT NULL DEFAULT 0,
  `new_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_users`
--

INSERT INTO `df_users` (`id`, `username`, `password`, `two_step_enabled`, `two_step_secret`, `last_otp`, `last_pass_change`, `cookie`, `owner`, `registration_date`, `activated`, `expiration_date`, `require_password_change`, `failed_login_attempts`, `last_access_date`, `last_notif_delivery_date`, `last_login_date`, `last_logout_date`, `email`, `receive_notifications`, `new_email`, `name`, `name2`, `phone`, `company`, `website`, `description`, `logo_url`, `avatar`) VALUES
(1, 'superuser', '$2y$10$/wAJYER51K7MJtGvdoqGEexhnruwqvNEkP36P/EXEE5yYO2ysIdEu', 0, NULL, NULL, NULL, NULL, NULL, '2021-04-21 09:03:12', 1, NULL, 0, 0, '2021-04-21 02:09:50', '2021-04-21 02:03:26', '2021-04-21 09:05:02', NULL, '', 0, NULL, 'admin', '', '', '', '', NULL, '', '{\"type\":\"generated\",\"color\":[89,69,209],\"text\":\"Ad\",\"lastUpdate\":1618970641}');

-- --------------------------------------------------------

--
-- Table structure for table `df_users_permissions`
--

CREATE TABLE `df_users_permissions` (
  `id` mediumint(9) NOT NULL,
  `uid` mediumint(9) NOT NULL,
  `role` mediumint(9) DEFAULT NULL,
  `admin_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_users` smallint(1) NOT NULL DEFAULT 0,
  `admin_roles` smallint(1) NOT NULL DEFAULT 0,
  `admin_notifications` smallint(1) NOT NULL DEFAULT 0,
  `admin_logs` smallint(1) NOT NULL DEFAULT 0,
  `admin_metadata` smallint(1) NOT NULL DEFAULT 0,
  `admin_over` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_max_users` smallint(7) NOT NULL DEFAULT 0,
  `admin_homefolder_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homefolder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `space_quota_max` int(20) DEFAULT NULL,
  `space_quota_current` int(20) NOT NULL DEFAULT 0,
  `readonly` smallint(1) DEFAULT NULL,
  `upload` smallint(1) DEFAULT NULL,
  `upload_max_size` bigint(20) DEFAULT NULL,
  `upload_limit_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download` smallint(1) DEFAULT NULL,
  `preview` smallint(1) DEFAULT 1,
  `download_folders` smallint(1) DEFAULT NULL,
  `read_comments` smallint(1) DEFAULT NULL,
  `write_comments` smallint(1) DEFAULT NULL,
  `email` smallint(1) NOT NULL DEFAULT 0,
  `weblink` smallint(1) NOT NULL DEFAULT 0,
  `share` smallint(1) NOT NULL DEFAULT 0,
  `share_guests` smallint(1) NOT NULL DEFAULT 0,
  `metadata` smallint(1) NOT NULL DEFAULT 0,
  `file_history` smallint(1) NOT NULL DEFAULT 0,
  `users_may_see` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_pass` smallint(1) NOT NULL DEFAULT 1,
  `edit_profile` smallint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `df_users_permissions`
--

INSERT INTO `df_users_permissions` (`id`, `uid`, `role`, `admin_type`, `admin_users`, `admin_roles`, `admin_notifications`, `admin_logs`, `admin_metadata`, `admin_over`, `admin_max_users`, `admin_homefolder_template`, `homefolder`, `space_quota_max`, `space_quota_current`, `readonly`, `upload`, `upload_max_size`, `upload_limit_types`, `download`, `preview`, `download_folders`, `read_comments`, `write_comments`, `email`, `weblink`, `share`, `share_guests`, `metadata`, `file_history`, `users_may_see`, `change_pass`, `edit_profile`) VALUES
(1, 1, NULL, '', 0, 0, 0, 0, 0, '-ALL-', 0, '', '/home/kusanagi', NULL, 0, 0, 1, NULL, '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '-ALL-', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `df_users_sessions`
--

CREATE TABLE `df_users_sessions` (
  `id` mediumint(9) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `csrf_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `df_collections`
--
ALTER TABLE `df_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_collections_items`
--
ALTER TABLE `df_collections_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_pid` (`cid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `cid` (`cid`,`uid`);

--
-- Indexes for table `df_file_handlers`
--
ALTER TABLE `df_file_handlers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_file_logs`
--
ALTER TABLE `df_file_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `action` (`action`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `df_logs`
--
ALTER TABLE `df_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `df_modules_folders_notifications`
--
ALTER TABLE `df_modules_folders_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`pathid`);

--
-- Indexes for table `df_modules_metadata_dt`
--
ALTER TABLE `df_modules_metadata_dt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_metadata_fields`
--
ALTER TABLE `df_modules_metadata_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `system` (`system`);

--
-- Indexes for table `df_modules_metadata_fieldsets`
--
ALTER TABLE `df_modules_metadata_fieldsets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_metadata_files`
--
ALTER TABLE `df_modules_metadata_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `df_modules_metadata_values`
--
ALTER TABLE `df_modules_metadata_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_added` (`date_added`),
  ADD KEY `uid` (`uid`,`file_id`,`field_id`),
  ADD KEY `file_id` (`file_id`,`field_id`),
  ADD KEY `uid_2` (`uid`,`field_id`),
  ADD KEY `val` (`val`(100)),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `df_modules_notifications`
--
ALTER TABLE `df_modules_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_search_index_queue`
--
ALTER TABLE `df_modules_search_index_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_shares`
--
ALTER TABLE `df_modules_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`path`(248));

--
-- Indexes for table `df_modules_trash`
--
ALTER TABLE `df_modules_trash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_user_groups`
--
ALTER TABLE `df_modules_user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_user_roles`
--
ALTER TABLE `df_modules_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_modules_weblinks`
--
ALTER TABLE `df_modules_weblinks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_rnd` (`id_rnd`),
  ADD KEY `uid` (`uid`,`pathid`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `df_notifications_logs`
--
ALTER TABLE `df_notifications_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_oauth_access_tokens`
--
ALTER TABLE `df_oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `df_oauth_access_token_scopes`
--
ALTER TABLE `df_oauth_access_token_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_token_id` (`access_token_id`),
  ADD KEY `scope` (`scope`);

--
-- Indexes for table `df_oauth_auth_codes`
--
ALTER TABLE `df_oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `df_oauth_auth_code_scopes`
--
ALTER TABLE `df_oauth_auth_code_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_code_id` (`auth_code_id`),
  ADD KEY `scope` (`scope`);

--
-- Indexes for table `df_oauth_clients`
--
ALTER TABLE `df_oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cid` (`cid`);

--
-- Indexes for table `df_oauth_client_redirect_uris`
--
ALTER TABLE `df_oauth_client_redirect_uris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `df_oauth_refresh_tokens`
--
ALTER TABLE `df_oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `refresh_token` (`refresh_token`),
  ADD KEY `access_token_id` (`access_token_id`);

--
-- Indexes for table `df_oauth_scopes`
--
ALTER TABLE `df_oauth_scopes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `df_oauth_sessions`
--
ALTER TABLE `df_oauth_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `df_oauth_session_scopes`
--
ALTER TABLE `df_oauth_session_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`sid`),
  ADD KEY `scope` (`scope`);

--
-- Indexes for table `df_paths`
--
ALTER TABLE `df_paths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`uniq`),
  ADD KEY `filename` (`filename`(248),`depth`),
  ADD KEY `path` (`path`(250));

--
-- Indexes for table `df_relationships`
--
ALTER TABLE `df_relationships`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `object_id` (`object_id`,`relation_type`);

--
-- Indexes for table `df_settings`
--
ALTER TABLE `df_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `var` (`var`);

--
-- Indexes for table `df_users`
--
ALTER TABLE `df_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `expiration_date` (`expiration_date`);

--
-- Indexes for table `df_users_permissions`
--
ALTER TABLE `df_users_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `df_users_sessions`
--
ALTER TABLE `df_users_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `df_collections`
--
ALTER TABLE `df_collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_collections_items`
--
ALTER TABLE `df_collections_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_file_handlers`
--
ALTER TABLE `df_file_handlers`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `df_file_logs`
--
ALTER TABLE `df_file_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_logs`
--
ALTER TABLE `df_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_folders_notifications`
--
ALTER TABLE `df_modules_folders_notifications`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_metadata_dt`
--
ALTER TABLE `df_modules_metadata_dt`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `df_modules_metadata_fields`
--
ALTER TABLE `df_modules_metadata_fields`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `df_modules_metadata_fieldsets`
--
ALTER TABLE `df_modules_metadata_fieldsets`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `df_modules_metadata_files`
--
ALTER TABLE `df_modules_metadata_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_metadata_values`
--
ALTER TABLE `df_modules_metadata_values`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_notifications`
--
ALTER TABLE `df_modules_notifications`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_search_index_queue`
--
ALTER TABLE `df_modules_search_index_queue`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_shares`
--
ALTER TABLE `df_modules_shares`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_trash`
--
ALTER TABLE `df_modules_trash`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_user_groups`
--
ALTER TABLE `df_modules_user_groups`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_modules_user_roles`
--
ALTER TABLE `df_modules_user_roles`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `df_modules_weblinks`
--
ALTER TABLE `df_modules_weblinks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_notifications_logs`
--
ALTER TABLE `df_notifications_logs`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_access_tokens`
--
ALTER TABLE `df_oauth_access_tokens`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_access_token_scopes`
--
ALTER TABLE `df_oauth_access_token_scopes`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_auth_codes`
--
ALTER TABLE `df_oauth_auth_codes`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_auth_code_scopes`
--
ALTER TABLE `df_oauth_auth_code_scopes`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_clients`
--
ALTER TABLE `df_oauth_clients`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `df_oauth_client_redirect_uris`
--
ALTER TABLE `df_oauth_client_redirect_uris`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `df_oauth_refresh_tokens`
--
ALTER TABLE `df_oauth_refresh_tokens`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_scopes`
--
ALTER TABLE `df_oauth_scopes`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `df_oauth_sessions`
--
ALTER TABLE `df_oauth_sessions`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_oauth_session_scopes`
--
ALTER TABLE `df_oauth_session_scopes`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `df_paths`
--
ALTER TABLE `df_paths`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `df_relationships`
--
ALTER TABLE `df_relationships`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `df_settings`
--
ALTER TABLE `df_settings`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `df_users`
--
ALTER TABLE `df_users`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `df_users_permissions`
--
ALTER TABLE `df_users_permissions`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `df_users_sessions`
--
ALTER TABLE `df_users_sessions`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `df_oauth_access_tokens`
--
ALTER TABLE `df_oauth_access_tokens`
  ADD CONSTRAINT `df_oauth_access_tokens_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `df_oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_access_token_scopes`
--
ALTER TABLE `df_oauth_access_token_scopes`
  ADD CONSTRAINT `df_oauth_access_token_scopes_ibfk_1` FOREIGN KEY (`access_token_id`) REFERENCES `df_oauth_access_tokens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `df_oauth_access_token_scopes_ibfk_2` FOREIGN KEY (`scope`) REFERENCES `df_oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_auth_codes`
--
ALTER TABLE `df_oauth_auth_codes`
  ADD CONSTRAINT `df_oauth_auth_codes_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `df_oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_auth_code_scopes`
--
ALTER TABLE `df_oauth_auth_code_scopes`
  ADD CONSTRAINT `df_oauth_auth_code_scopes_ibfk_1` FOREIGN KEY (`auth_code_id`) REFERENCES `df_oauth_auth_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `df_oauth_auth_code_scopes_ibfk_2` FOREIGN KEY (`scope`) REFERENCES `df_oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_client_redirect_uris`
--
ALTER TABLE `df_oauth_client_redirect_uris`
  ADD CONSTRAINT `df_oauth_client_redirect_uris_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `df_oauth_clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_refresh_tokens`
--
ALTER TABLE `df_oauth_refresh_tokens`
  ADD CONSTRAINT `df_oauth_refresh_tokens_ibfk_1` FOREIGN KEY (`access_token_id`) REFERENCES `df_oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_sessions`
--
ALTER TABLE `df_oauth_sessions`
  ADD CONSTRAINT `df_oauth_sessions_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `df_oauth_clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `df_oauth_session_scopes`
--
ALTER TABLE `df_oauth_session_scopes`
  ADD CONSTRAINT `df_oauth_session_scopes_ibfk_1` FOREIGN KEY (`scope`) REFERENCES `df_oauth_scopes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `df_oauth_session_scopes_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `df_oauth_sessions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
