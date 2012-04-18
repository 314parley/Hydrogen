<?php
require 'config.php';
if($tc_db->Execute("ALTER TABLE `" . KU_DBPREFIX . "board_filetypes` CHANGE `boardid` `boardid` SMALLINT( 5 ) NOT NULL") &&
   $tc_db->Execute("ALTER TABLE `" . KU_DBPREFIX . "banlist` ADD `note` TEXT NOT NULL") &&
   $tc_db->Execute("ALTER TABLE `" . KU_DBPREFIX . "announcements` ADD `name` TEXT NOT NULL") &&
   $tc_db->Execute("ALTER TABLE `" . KU_DBPREFIX . "announcements` ADD `comments` TEXT NOT NULL") &&
   $tc_db->Execute(" CREATE TABLE IF NOT EXISTS `" . KU_DBPREFIX . "menu` (
					`id` int(4) NOT NULL auto_increment,
					`header` text NOT NULL,
					`body` text NOT NULL,
					`order` int(3) NOT NULL,
					PRIMARY KEY  (`id`)
					)")
   ) {
	echo 'Update completed';
}
else {
	die('Failed to update: ' . mysql_error());
}
?>