--
-- Table structure for table `moderator_news`
--

CREATE TABLE `PREFIX_announcements` (
  `id` smallint(5) NOT NULL auto_increment,
  `news` varchar(2750) NOT NULL,
  `postedby` varchar(75) NOT NULL,
  `postedat` int(20) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `PREFIX_banlist` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL default '0',
  `allowread` tinyint(1) NOT NULL default '1',
  `ip` varchar(50) NOT NULL,
  `ipmd5` char(32) NOT NULL,
  `globalban` tinyint(1) NOT NULL default '0',
  `boards` varchar(255) NOT NULL,
  `by` varchar(75) NOT NULL,
  `at` int(20) NOT NULL,
  `until` int(20) NOT NULL,
  `reason` text NOT NULL,
  `note` text NOT NULL,
  `appealat` int(20) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `bannedhashes`
--

CREATE TABLE `PREFIX_bannedhashes` (
  `id` int(10) NOT NULL auto_increment,
  `md5` varchar(255) NOT NULL,
  `bantime` int(10) NOT NULL default '0',
  `description` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `blotter`
--

CREATE TABLE `PREFIX_blotter` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `important` tinyint(1) NOT NULL,
  `at` int(20) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `PREFIX_boards` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `order` tinyint(5) NOT NULL default '0',
  `name` varchar(75) collate utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL default '0',
  `uploadtype` tinyint(1) NOT NULL default '0',
  `desc` varchar(75) collate utf8_unicode_ci NOT NULL,
  `image` varchar(255) collate utf8_unicode_ci NOT NULL,
  `section` tinyint(2) NOT NULL default '0',
  `maximagesize` int(20) NOT NULL default '1024000',
  `maxpages` int(20) NOT NULL default '10',
  `maxage` int(20) NOT NULL default '0',
  `markpage` tinyint(4) NOT NULL default '9',
  `maxreplies` int(5) NOT NULL default '200',
  `messagelength` int(10) NOT NULL default '8192',
  `createdon` int(20) NOT NULL,
  `locked` tinyint(1) NOT NULL default '0',
  `includeheader` text collate utf8_unicode_ci NOT NULL,
  `redirecttothread` tinyint(1) NOT NULL default '0',
  `anonymous` varchar(255) collate utf8_unicode_ci NOT NULL default 'Anonymous',
  `forcedanon` tinyint(1) NOT NULL default '0',
  `trial` tinyint(1) NOT NULL default '0',
  `popular` tinyint(1) NOT NULL default '0',
  `defaultstyle` varchar(50) character set latin1 NOT NULL,
  `locale` varchar(30) character set latin1 NOT NULL,
  `showid` tinyint(1) NOT NULL default '0',
  `compactlist` tinyint(1) NOT NULL default '0',
  `enablereporting` tinyint(1) NOT NULL default '1',
  `enablecaptcha` tinyint(1) NOT NULL default '0',
  `enablefaptcha` int(1) NOT NULL,
  `enableporn` int(1) NOT NULL,
  `enablenofile` tinyint(1) NOT NULL default '0',
  `enablearchiving` tinyint(1) NOT NULL default '0',
  `enablecatalog` tinyint(1) NOT NULL default '1',
  `loadbalanceurl` varchar(255) character set latin1 NOT NULL,
  `loadbalancepassword` varchar(255) character set latin1 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `board_filetypes`
--

CREATE TABLE `PREFIX_board_filetypes` (
  `boardid` smallint(5) NOT NULL default '0',
  `typeid` mediumint(5) NOT NULL default '0'
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `PREFIX_events` (
  `name` varchar(255) NOT NULL,
  `at` int(20) NOT NULL
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `faptcha_attempts`
--

CREATE TABLE `PREFIX_faptcha_attempts` (
  `ip` varchar(20) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE `PREFIX_filetypes` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `filetype` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_w` int(7) NOT NULL default '0',
  `image_h` int(7) NOT NULL default '0',
  `force_thumb` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE `PREFIX_loginattempts` (
  `username` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `PREFIX_menu` (
  `id` int(4) NOT NULL auto_increment,
  `header` text NOT NULL,
  `body` text NOT NULL,
  `order` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

--
-- Table structure for table `modlog`
--

CREATE TABLE `PREFIX_modlog` (
  `entry` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `category` tinyint(2) NOT NULL default '0',
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `PREFIX_module_settings` (
  `module` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL default 'string'
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `PREFIX_news` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `postedat` int(20) NOT NULL,
  `postedby` varchar(75) NOT NULL,
  `postedemail` varchar(75) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `PREFIX_reports` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `cleared` tinyint(1) NOT NULL default '0',
  `board` varchar(255) NOT NULL,
  `postid` int(20) NOT NULL,
  `when` int(20) NOT NULL,
  `ip` varchar(75) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `PREFIX_sections` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `order` tinyint(3) NOT NULL default '0',
  `hidden` tinyint(1) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `PREFIX_staff` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL default '0',
  `boards` text,
  `addedon` int(20) NOT NULL,
  `lastactive` int(20) NOT NULL default '0',
  `suspended` int(1) NOT NULL,
  `access` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `watchedthreads`
--

CREATE TABLE `PREFIX_watchedthreads` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `threadid` int(20) NOT NULL,
  `board` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `lastsawreplyid` int(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `wordfilter`
--

CREATE TABLE `PREFIX_wordfilter` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `word` varchar(75) NOT NULL,
  `replacedby` varchar(75) NOT NULL,
  `boards` text NOT NULL,
  `time` int(20) NOT NULL,
  `regex` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE `PREFIX_spamfilter` (
  `id` bigint(20) NOT NULL auto_increment,
  `url` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=442 ;

INSERT INTO `PREFIX_spamfilter` VALUES (1, 'siroutomovie.com');
INSERT INTO `PREFIX_spamfilter` VALUES (2, 'hamedori-tousatsu.com');
INSERT INTO `PREFIX_spamfilter` VALUES (3, 'enkou-hamedori.com');
INSERT INTO `PREFIX_spamfilter` VALUES (4, 'uradvderos.com');
INSERT INTO `PREFIX_spamfilter` VALUES (5, 'k.excite.co.jp/hp/u/m-a12/');
INSERT INTO `PREFIX_spamfilter` VALUES (6, 'adult-live.tv/');
INSERT INTO `PREFIX_spamfilter` VALUES (7, 'osaif.com/?-gantz-');
INSERT INTO `PREFIX_spamfilter` VALUES (8, 'littleteengallery.com');
INSERT INTO `PREFIX_spamfilter` VALUES (9, 'beautynude.com');
INSERT INTO `PREFIX_spamfilter` VALUES (10, 'psyche.ugmax.com');
INSERT INTO `PREFIX_spamfilter` VALUES (11, 'moromie-douga.com');
INSERT INTO `PREFIX_spamfilter` VALUES (12, 'bakunyu.info');
INSERT INTO `PREFIX_spamfilter` VALUES (13, 'hamedoricinema.com');
INSERT INTO `PREFIX_spamfilter` VALUES (14, 'gekideai.com');
INSERT INTO `PREFIX_spamfilter` VALUES (15, 'fruitmail.net');
INSERT INTO `PREFIX_spamfilter` VALUES (16, 'track.bannerbridge.net');
INSERT INTO `PREFIX_spamfilter` VALUES (17, 'shiroutomania.com');
INSERT INTO `PREFIX_spamfilter` VALUES (18, 'enkou-kyonyuu.com');
INSERT INTO `PREFIX_spamfilter` VALUES (19, 'adultshoping.com');
INSERT INTO `PREFIX_spamfilter` VALUES (20, 'liphouse.net');
INSERT INTO `PREFIX_spamfilter` VALUES (21, 'enkoumusume.com');
INSERT INTO `PREFIX_spamfilter` VALUES (22, 'hustle-rank.com');
INSERT INTO `PREFIX_spamfilter` VALUES (23, 'acport.com');
INSERT INTO `PREFIX_spamfilter` VALUES (24, 'waraineco.com');
INSERT INTO `PREFIX_spamfilter` VALUES (25, 'dpsleep.net');
INSERT INTO `PREFIX_spamfilter` VALUES (26, 'freepe.com');
INSERT INTO `PREFIX_spamfilter` VALUES (27, 'splove.net');
INSERT INTO `PREFIX_spamfilter` VALUES (28, '1682hoheto.com/system/');
INSERT INTO `PREFIX_spamfilter` VALUES (29, 'waiwaiwai.com');
INSERT INTO `PREFIX_spamfilter` VALUES (30, 'kyonyuu-mania.com');
INSERT INTO `PREFIX_spamfilter` VALUES (31, 'shiroutohamedori.com');
INSERT INTO `PREFIX_spamfilter` VALUES (32, 'nonhead.net');
INSERT INTO `PREFIX_spamfilter` VALUES (33, 'book-i.net');
INSERT INTO `PREFIX_spamfilter` VALUES (34, 'kissbomb.com');
INSERT INTO `PREFIX_spamfilter` VALUES (35, 'fuelheart.net');
INSERT INTO `PREFIX_spamfilter` VALUES (36, 'oilspxxx.com');
INSERT INTO `PREFIX_spamfilter` VALUES (37, 'fivenights.net');
INSERT INTO `PREFIX_spamfilter` VALUES (38, 'sweetlive.com');
INSERT INTO `PREFIX_spamfilter` VALUES (39, '52902.net');
INSERT INTO `PREFIX_spamfilter` VALUES (40, 'gesnomia.notlong.com');
INSERT INTO `PREFIX_spamfilter` VALUES (41, 'ura-video-world.com');
INSERT INTO `PREFIX_spamfilter` VALUES (42, 'hamedori-tousatsu.com');
INSERT INTO `PREFIX_spamfilter` VALUES (43, 'pakopako.misty.ne.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (44, 'xrl.us');
INSERT INTO `PREFIX_spamfilter` VALUES (45, 'curio-city.com');
INSERT INTO `PREFIX_spamfilter` VALUES (46, 'bbs.ws');
INSERT INTO `PREFIX_spamfilter` VALUES (47, 'zgsm.com');
INSERT INTO `PREFIX_spamfilter` VALUES (48, 'lol.to');
INSERT INTO `PREFIX_spamfilter` VALUES (49, 'compactURL.com/vojh');
INSERT INTO `PREFIX_spamfilter` VALUES (50, 'karigirls.404servers.com');
INSERT INTO `PREFIX_spamfilter` VALUES (51, 'savehits.com/hardcore.porn');
INSERT INTO `PREFIX_spamfilter` VALUES (52, 'enkouvideohanbai.com');
INSERT INTO `PREFIX_spamfilter` VALUES (53, 'ss.iij4u.or.jp/~best01');
INSERT INTO `PREFIX_spamfilter` VALUES (54, 'gyaruge.sexushost.com');
INSERT INTO `PREFIX_spamfilter` VALUES (55, 'moro-eroanime.com');
INSERT INTO `PREFIX_spamfilter` VALUES (56, 'www1.adult-jp.com/~flapo');
INSERT INTO `PREFIX_spamfilter` VALUES (57, 'pichi-pichi.com');
INSERT INTO `PREFIX_spamfilter` VALUES (58, '1251.to');
INSERT INTO `PREFIX_spamfilter` VALUES (59, 'sailor-loose.com');
INSERT INTO `PREFIX_spamfilter` VALUES (60, 'moromie-douga.com');
INSERT INTO `PREFIX_spamfilter` VALUES (61, 'buruseragirl.com');
INSERT INTO `PREFIX_spamfilter` VALUES (62, 'uraviya.com');
INSERT INTO `PREFIX_spamfilter` VALUES (63, 'lolinser.com');
INSERT INTO `PREFIX_spamfilter` VALUES (64, 'minkmail.com');
INSERT INTO `PREFIX_spamfilter` VALUES (65, 'freeprice.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (66, '1682hoheto.com');
INSERT INTO `PREFIX_spamfilter` VALUES (67, 'heromes.net');
INSERT INTO `PREFIX_spamfilter` VALUES (68, 'sanyo-cash.com');
INSERT INTO `PREFIX_spamfilter` VALUES (69, 'life-a.com');
INSERT INTO `PREFIX_spamfilter` VALUES (70, 'j-girlmovie.net');
INSERT INTO `PREFIX_spamfilter` VALUES (71, 'geisyagirl.net');
INSERT INTO `PREFIX_spamfilter` VALUES (72, 'csx.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (73, 'enkou.000.ro');
INSERT INTO `PREFIX_spamfilter` VALUES (74, 'g-castle.com');
INSERT INTO `PREFIX_spamfilter` VALUES (75, 'rolix.net');
INSERT INTO `PREFIX_spamfilter` VALUES (76, 'aiba-cash.com');
INSERT INTO `PREFIX_spamfilter` VALUES (77, '420.ne.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (78, 'www5f.biglobe.ne.jp/~heaven-s-star');
INSERT INTO `PREFIX_spamfilter` VALUES (79, 'p-cha.com');
INSERT INTO `PREFIX_spamfilter` VALUES (80, 'serio.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (81, 'bbslolita.18.to');
INSERT INTO `PREFIX_spamfilter` VALUES (82, 'savehits.com');
INSERT INTO `PREFIX_spamfilter` VALUES (83, 'ss.iij4u.or.jp/~best01');
INSERT INTO `PREFIX_spamfilter` VALUES (84, 'mero-mero.net');
INSERT INTO `PREFIX_spamfilter` VALUES (85, 'soundpage.by.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (86, 'hpcgi1.nifty.com/mineto');
INSERT INTO `PREFIX_spamfilter` VALUES (87, 'videoangel.hk.st');
INSERT INTO `PREFIX_spamfilter` VALUES (88, 'lolinser2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (89, 'ncdonald.com');
INSERT INTO `PREFIX_spamfilter` VALUES (90, 'rei.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (91, 'ns2.goldennet.co.kr');
INSERT INTO `PREFIX_spamfilter` VALUES (92, 'blue-alessi.com');
INSERT INTO `PREFIX_spamfilter` VALUES (93, 'zyuuzika.on.pc1.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (94, 'freeipods.com');
INSERT INTO `PREFIX_spamfilter` VALUES (95, 'freephotoipods.com');
INSERT INTO `PREFIX_spamfilter` VALUES (96, 'freeminimacs.com');
INSERT INTO `PREFIX_spamfilter` VALUES (97, 'macminiforfree.com');
INSERT INTO `PREFIX_spamfilter` VALUES (98, 'freehandbags.com');
INSERT INTO `PREFIX_spamfilter` VALUES (99, 'freeipodshuffle.com');
INSERT INTO `PREFIX_spamfilter` VALUES (100, 'freepsps.com');
INSERT INTO `PREFIX_spamfilter` VALUES (101, 'freeflatscreens.com');
INSERT INTO `PREFIX_spamfilter` VALUES (102, 'freedesktoppc.com');
INSERT INTO `PREFIX_spamfilter` VALUES (103, 'freegamingsystems.com');
INSERT INTO `PREFIX_spamfilter` VALUES (104, 'iceglow.com');
INSERT INTO `PREFIX_spamfilter` VALUES (105, 'hp-ranking.net');
INSERT INTO `PREFIX_spamfilter` VALUES (106, 'blog.livedoor.jp/nofikusyon/');
INSERT INTO `PREFIX_spamfilter` VALUES (107, 'indies-gogo.tv');
INSERT INTO `PREFIX_spamfilter` VALUES (108, 'danerd.com');
INSERT INTO `PREFIX_spamfilter` VALUES (109, 'greenzap.com');
INSERT INTO `PREFIX_spamfilter` VALUES (110, 'blograffiti.com');
INSERT INTO `PREFIX_spamfilter` VALUES (111, 'yuripuri.h.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (112, 'stoptazmo.com');
INSERT INTO `PREFIX_spamfilter` VALUES (113, 'diarystyle.h.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (114, 'chiharu.fkserver.net');
INSERT INTO `PREFIX_spamfilter` VALUES (115, 'blog.livedoor.jp/manilove/');
INSERT INTO `PREFIX_spamfilter` VALUES (116, 'netbux.org');
INSERT INTO `PREFIX_spamfilter` VALUES (117, 'geocities.jp/empire_of_tashiro/');
INSERT INTO `PREFIX_spamfilter` VALUES (118, 'peach-girl.cheap.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (119, 'gazoutokusyuu.fc2web.com');
INSERT INTO `PREFIX_spamfilter` VALUES (120, 'uhauha.frenchkiss.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (121, 'get-men77.main.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (122, 'quuchan-hasiru.heavy.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (123, 'serebu-net.mine.nu');
INSERT INTO `PREFIX_spamfilter` VALUES (124, 'loveve.h.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (125, 'ilovemisty.net');
INSERT INTO `PREFIX_spamfilter` VALUES (126, 'hrevolution.webcindario.com');
INSERT INTO `PREFIX_spamfilter` VALUES (127, 'yayoipv.h.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (128, 's1.freexy.net');
INSERT INTO `PREFIX_spamfilter` VALUES (129, 'f-mon.tv');
INSERT INTO `PREFIX_spamfilter` VALUES (130, '1sth.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (131, 'x-beat.com');
INSERT INTO `PREFIX_spamfilter` VALUES (132, 'martijn.org');
INSERT INTO `PREFIX_spamfilter` VALUES (133, 'spamfreeforums.com');
INSERT INTO `PREFIX_spamfilter` VALUES (134, 'rompicoglioni.blogspot.com');
INSERT INTO `PREFIX_spamfilter` VALUES (135, 'madpage.com');
INSERT INTO `PREFIX_spamfilter` VALUES (136, 'art.milt.eu.org');
INSERT INTO `PREFIX_spamfilter` VALUES (137, 'kukowski.art.pl');
INSERT INTO `PREFIX_spamfilter` VALUES (138, '104-gallery.com');
INSERT INTO `PREFIX_spamfilter` VALUES (139, 'duvx.com');
INSERT INTO `PREFIX_spamfilter` VALUES (140, 'www.videopilot.net');
INSERT INTO `PREFIX_spamfilter` VALUES (141, 'all4over.com');
INSERT INTO `PREFIX_spamfilter` VALUES (142, 'maya-dvd.com');
INSERT INTO `PREFIX_spamfilter` VALUES (143, 'love-town.net/bbs-gazousenyou');
INSERT INTO `PREFIX_spamfilter` VALUES (144, '98.to');
INSERT INTO `PREFIX_spamfilter` VALUES (145, 'shiauchan.net');
INSERT INTO `PREFIX_spamfilter` VALUES (146, 'moeloli.com');
INSERT INTO `PREFIX_spamfilter` VALUES (147, 'darkthrone.com');
INSERT INTO `PREFIX_spamfilter` VALUES (148, 'seohawk.com');
INSERT INTO `PREFIX_spamfilter` VALUES (149, 'carpetmunchworld.blogspot.com');
INSERT INTO `PREFIX_spamfilter` VALUES (150, 'onlinesportdiscount.com');
INSERT INTO `PREFIX_spamfilter` VALUES (151, '.pp.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (152, 'bargainpools.org');
INSERT INTO `PREFIX_spamfilter` VALUES (153, 'fancyasian.com');
INSERT INTO `PREFIX_spamfilter` VALUES (154, 'niketrading.org');
INSERT INTO `PREFIX_spamfilter` VALUES (155, 'eronaruto.de.vu');
INSERT INTO `PREFIX_spamfilter` VALUES (156, 'kanasfeelings.web.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (157, 'max2.nm.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (158, 'massaxid.by.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (159, '86.120.197.66');
INSERT INTO `PREFIX_spamfilter` VALUES (160, 'phentermine.webpark.pl');
INSERT INTO `PREFIX_spamfilter` VALUES (161, 'phentermine-support.com');
INSERT INTO `PREFIX_spamfilter` VALUES (162, 'millionpixelpage.net');
INSERT INTO `PREFIX_spamfilter` VALUES (163, 'poolsmart.net');
INSERT INTO `PREFIX_spamfilter` VALUES (164, 'kdzonne8.100free.com');
INSERT INTO `PREFIX_spamfilter` VALUES (165, 'jogurta.szm.sk');
INSERT INTO `PREFIX_spamfilter` VALUES (166, 'ouragent.net');
INSERT INTO `PREFIX_spamfilter` VALUES (167, 'postagepaid.net');
INSERT INTO `PREFIX_spamfilter` VALUES (168, 'computers-store.info');
INSERT INTO `PREFIX_spamfilter` VALUES (169, 'bbs.freele.net');
INSERT INTO `PREFIX_spamfilter` VALUES (170, 'musicalinstruments-store.info');
INSERT INTO `PREFIX_spamfilter` VALUES (171, 'beauty-onlinestore.info');
INSERT INTO `PREFIX_spamfilter` VALUES (172, 'metasart.com');
INSERT INTO `PREFIX_spamfilter` VALUES (173, 'pills-sale.com');
INSERT INTO `PREFIX_spamfilter` VALUES (174, 'talented-doctor.com');
INSERT INTO `PREFIX_spamfilter` VALUES (175, 'just-pills.com');
INSERT INTO `PREFIX_spamfilter` VALUES (176, 'rainbowfactory.net');
INSERT INTO `PREFIX_spamfilter` VALUES (177, 'planyourhome.net');
INSERT INTO `PREFIX_spamfilter` VALUES (178, 'toylane.net');
INSERT INTO `PREFIX_spamfilter` VALUES (179, 'unique-pills.com');
INSERT INTO `PREFIX_spamfilter` VALUES (180, 'my-health.us');
INSERT INTO `PREFIX_spamfilter` VALUES (181, 'useful-pills.com');
INSERT INTO `PREFIX_spamfilter` VALUES (182, '4all-prescription.com');
INSERT INTO `PREFIX_spamfilter` VALUES (183, 'health-livening.com');
INSERT INTO `PREFIX_spamfilter` VALUES (184, 'great-doctor.com');
INSERT INTO `PREFIX_spamfilter` VALUES (185, '6q.org');
INSERT INTO `PREFIX_spamfilter` VALUES (186, 'xmlguy.com');
INSERT INTO `PREFIX_spamfilter` VALUES (187, 'sportsparent.com');
INSERT INTO `PREFIX_spamfilter` VALUES (188, 'buy-2005.com');
INSERT INTO `PREFIX_spamfilter` VALUES (189, 'reservedining.net');
INSERT INTO `PREFIX_spamfilter` VALUES (190, 'just-doctor.com');
INSERT INTO `PREFIX_spamfilter` VALUES (191, 'isacommie.com');
INSERT INTO `PREFIX_spamfilter` VALUES (192, 'ro7kalbe.com');
INSERT INTO `PREFIX_spamfilter` VALUES (193, 'drugs-order.com');
INSERT INTO `PREFIX_spamfilter` VALUES (194, 'excellent-health.com');
INSERT INTO `PREFIX_spamfilter` VALUES (195, 'society-health.com');
INSERT INTO `PREFIX_spamfilter` VALUES (196, 'vnsoul.org');
INSERT INTO `PREFIX_spamfilter` VALUES (197, 'medical-4you.com');
INSERT INTO `PREFIX_spamfilter` VALUES (198, 'pills-home.com');
INSERT INTO `PREFIX_spamfilter` VALUES (199, 'doctor-pills.com');
INSERT INTO `PREFIX_spamfilter` VALUES (200, 'ottawavalleyag.org');
INSERT INTO `PREFIX_spamfilter` VALUES (201, 'd-daystore.com');
INSERT INTO `PREFIX_spamfilter` VALUES (202, 'seat208.com');
INSERT INTO `PREFIX_spamfilter` VALUES (203, 'casino-denotation.com');
INSERT INTO `PREFIX_spamfilter` VALUES (204, 'casino-copy.com');
INSERT INTO `PREFIX_spamfilter` VALUES (205, 'casino-profits.com');
INSERT INTO `PREFIX_spamfilter` VALUES (206, 'casino-run.com');
INSERT INTO `PREFIX_spamfilter` VALUES (207, 'studyinslovakia.com');
INSERT INTO `PREFIX_spamfilter` VALUES (208, 'openlistings.net');
INSERT INTO `PREFIX_spamfilter` VALUES (209, 'naturaldelights.net');
INSERT INTO `PREFIX_spamfilter` VALUES (210, 'poker-protection.com');
INSERT INTO `PREFIX_spamfilter` VALUES (211, 'affordableantiques.net');
INSERT INTO `PREFIX_spamfilter` VALUES (212, 'dedicated-poker.com');
INSERT INTO `PREFIX_spamfilter` VALUES (213, 'poker-scan.com');
INSERT INTO `PREFIX_spamfilter` VALUES (214, 'birchfieldharriers.org');
INSERT INTO `PREFIX_spamfilter` VALUES (215, 'namedealers.net');
INSERT INTO `PREFIX_spamfilter` VALUES (216, 'arthouse-films.com');
INSERT INTO `PREFIX_spamfilter` VALUES (217, 'tdsa.piranho.ch');
INSERT INTO `PREFIX_spamfilter` VALUES (218, 'lawn-and-landscaping.info');
INSERT INTO `PREFIX_spamfilter` VALUES (219, 'fishing-premier.com');
INSERT INTO `PREFIX_spamfilter` VALUES (220, 'outdoorliving-store.info');
INSERT INTO `PREFIX_spamfilter` VALUES (221, 'online-casinoratings.info');
INSERT INTO `PREFIX_spamfilter` VALUES (222, 'onlinecasino-bonuce.info');
INSERT INTO `PREFIX_spamfilter` VALUES (223, 'onlinepoker-reviews.info');
INSERT INTO `PREFIX_spamfilter` VALUES (224, 'nfsautoloan.com');
INSERT INTO `PREFIX_spamfilter` VALUES (225, 'narod.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (226, 'hentai-tetsugaku.de');
INSERT INTO `PREFIX_spamfilter` VALUES (227, 'klick-game.de');
INSERT INTO `PREFIX_spamfilter` VALUES (228, 'dorank.com');
INSERT INTO `PREFIX_spamfilter` VALUES (229, 'dirfor.com');
INSERT INTO `PREFIX_spamfilter` VALUES (230, 'odn.ne.jp/~cbw66520');
INSERT INTO `PREFIX_spamfilter` VALUES (231, 'dynu.ca');
INSERT INTO `PREFIX_spamfilter` VALUES (232, 'oo.lv');
INSERT INTO `PREFIX_spamfilter` VALUES (233, 'ns01.us');
INSERT INTO `PREFIX_spamfilter` VALUES (234, 'guestbook.cgiworld.net');
INSERT INTO `PREFIX_spamfilter` VALUES (235, 'best-poker-tournaments.be');
INSERT INTO `PREFIX_spamfilter` VALUES (236, 'texazholdemz.be');
INSERT INTO `PREFIX_spamfilter` VALUES (237, 'phentermine');
INSERT INTO `PREFIX_spamfilter` VALUES (238, 'cialis');
INSERT INTO `PREFIX_spamfilter` VALUES (239, 'funpic.de');
INSERT INTO `PREFIX_spamfilter` VALUES (240, 'mecha-dvd.net');
INSERT INTO `PREFIX_spamfilter` VALUES (241, 'casino-focus.com');
INSERT INTO `PREFIX_spamfilter` VALUES (242, 'tigersushi.com');
INSERT INTO `PREFIX_spamfilter` VALUES (243, 'geocities.com/drug_pills');
INSERT INTO `PREFIX_spamfilter` VALUES (244, 'cej.pl');
INSERT INTO `PREFIX_spamfilter` VALUES (245, 'eroerogu.blog11.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (246, 'lalicservices.com');
INSERT INTO `PREFIX_spamfilter` VALUES (247, 'ricesystems.com');
INSERT INTO `PREFIX_spamfilter` VALUES (248, 'edspot.com');
INSERT INTO `PREFIX_spamfilter` VALUES (249, 'greenwoodenvironmental.com');
INSERT INTO `PREFIX_spamfilter` VALUES (250, 'posters.5gigs.com');
INSERT INTO `PREFIX_spamfilter` VALUES (251, 'tree-card-poker.be');
INSERT INTO `PREFIX_spamfilter` VALUES (252, 'tiscali.cz');
INSERT INTO `PREFIX_spamfilter` VALUES (253, '1asphost.com');
INSERT INTO `PREFIX_spamfilter` VALUES (254, 'holdem');
INSERT INTO `PREFIX_spamfilter` VALUES (255, 'baccarat');
INSERT INTO `PREFIX_spamfilter` VALUES (256, 'arhusa.biz');
INSERT INTO `PREFIX_spamfilter` VALUES (257, 'arhusa.net');
INSERT INTO `PREFIX_spamfilter` VALUES (258, 'watsonalgas.com');
INSERT INTO `PREFIX_spamfilter` VALUES (259, 'paralyze.us');
INSERT INTO `PREFIX_spamfilter` VALUES (260, 'erotic-place.org');
INSERT INTO `PREFIX_spamfilter` VALUES (261, 'mediatomato.com');
INSERT INTO `PREFIX_spamfilter` VALUES (262, 's2.muryo-de.etowns.net');
INSERT INTO `PREFIX_spamfilter` VALUES (263, 'bingo-allstars.com');
INSERT INTO `PREFIX_spamfilter` VALUES (264, 'siliconsalamander.com');
INSERT INTO `PREFIX_spamfilter` VALUES (265, 'ificinfo.org');
INSERT INTO `PREFIX_spamfilter` VALUES (266, 'spb.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (267, 'itc-world.com');
INSERT INTO `PREFIX_spamfilter` VALUES (268, 'webnow.biz');
INSERT INTO `PREFIX_spamfilter` VALUES (269, 'homesexsearch.com');
INSERT INTO `PREFIX_spamfilter` VALUES (270, 'tonydosen.com');
INSERT INTO `PREFIX_spamfilter` VALUES (271, 'airdigm.com');
INSERT INTO `PREFIX_spamfilter` VALUES (272, 'wisconsinwomenequalsprosperity.org');
INSERT INTO `PREFIX_spamfilter` VALUES (273, 'alfredospizzavilla.com');
INSERT INTO `PREFIX_spamfilter` VALUES (274, 'rodneyyoder.net');
INSERT INTO `PREFIX_spamfilter` VALUES (275, 'lovematch.h.fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (276, 'cam-sluts.thumblogger.com');
INSERT INTO `PREFIX_spamfilter` VALUES (277, 'sapo.pt');
INSERT INTO `PREFIX_spamfilter` VALUES (278, 'pushline.com');
INSERT INTO `PREFIX_spamfilter` VALUES (279, 'dynamip.com');
INSERT INTO `PREFIX_spamfilter` VALUES (280, 'blogspirit.com');
INSERT INTO `PREFIX_spamfilter` VALUES (281, 'white.prohosting.com');
INSERT INTO `PREFIX_spamfilter` VALUES (282, 'oh-oh.tk');
INSERT INTO `PREFIX_spamfilter` VALUES (283, 'phlog.net');
INSERT INTO `PREFIX_spamfilter` VALUES (284, 'nogamed.com');
INSERT INTO `PREFIX_spamfilter` VALUES (285, 'islandkeeperclinic.com');
INSERT INTO `PREFIX_spamfilter` VALUES (286, 'board9.cgiworld.dreamwiz.com');
INSERT INTO `PREFIX_spamfilter` VALUES (287, 'uv.to');
INSERT INTO `PREFIX_spamfilter` VALUES (288, 'up.to');
INSERT INTO `PREFIX_spamfilter` VALUES (289, 'mega.cl');
INSERT INTO `PREFIX_spamfilter` VALUES (290, 'saumag.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (291, 'your-ringtones.org');
INSERT INTO `PREFIX_spamfilter` VALUES (292, 'vchan.fx.to');
INSERT INTO `PREFIX_spamfilter` VALUES (293, 'fc2.com');
INSERT INTO `PREFIX_spamfilter` VALUES (294, 'hentai-tentacle.com');
INSERT INTO `PREFIX_spamfilter` VALUES (295, '499angels.net');
INSERT INTO `PREFIX_spamfilter` VALUES (296, 'ce.ro');
INSERT INTO `PREFIX_spamfilter` VALUES (297, 'pindosam.com');
INSERT INTO `PREFIX_spamfilter` VALUES (298, 'gabrielspest.com');
INSERT INTO `PREFIX_spamfilter` VALUES (299, 'pornomania.ch.vu');
INSERT INTO `PREFIX_spamfilter` VALUES (300, 'fickende-teens.de.');
INSERT INTO `PREFIX_spamfilter` VALUES (301, 'maidx.net');
INSERT INTO `PREFIX_spamfilter` VALUES (302, 'faluninfo.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (303, 'glocalrescue.org');
INSERT INTO `PREFIX_spamfilter` VALUES (304, 'epochtimes.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (305, 'minghui.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (306, 'zakzak.co.jp');
INSERT INTO `PREFIX_spamfilter` VALUES (307, 'ringtones');
INSERT INTO `PREFIX_spamfilter` VALUES (308, 'blog.newsjungle.com');
INSERT INTO `PREFIX_spamfilter` VALUES (309, 'my.experienceflagstaff.com');
INSERT INTO `PREFIX_spamfilter` VALUES (310, 'www.blogcharm.com');
INSERT INTO `PREFIX_spamfilter` VALUES (311, 'kaosblog.com');
INSERT INTO `PREFIX_spamfilter` VALUES (312, 'zrolckj.com');
INSERT INTO `PREFIX_spamfilter` VALUES (313, 'fqhobsnk.com');
INSERT INTO `PREFIX_spamfilter` VALUES (314, 'yn666.com');
INSERT INTO `PREFIX_spamfilter` VALUES (315, 'americaonline.com.mx');
INSERT INTO `PREFIX_spamfilter` VALUES (316, 'snow.prohosting.com');
INSERT INTO `PREFIX_spamfilter` VALUES (317, 'pzkyy.info');
INSERT INTO `PREFIX_spamfilter` VALUES (318, 'tires-online-new.info');
INSERT INTO `PREFIX_spamfilter` VALUES (319, 'vegas-webspace.com');
INSERT INTO `PREFIX_spamfilter` VALUES (320, 'wxboall.com.cn');
INSERT INTO `PREFIX_spamfilter` VALUES (321, 'e-hentai.org');
INSERT INTO `PREFIX_spamfilter` VALUES (322, 'kodomo.mixa.cc');
INSERT INTO `PREFIX_spamfilter` VALUES (323, 'kodomonokuni.122mb.com');
INSERT INTO `PREFIX_spamfilter` VALUES (324, 'kodomo.ifastnet.com');
INSERT INTO `PREFIX_spamfilter` VALUES (325, 'italiapuntonet.net');
INSERT INTO `PREFIX_spamfilter` VALUES (326, 'infogami.com');
INSERT INTO `PREFIX_spamfilter` VALUES (327, 'chatarea.com');
INSERT INTO `PREFIX_spamfilter` VALUES (328, 'home.no/carreragt3');
INSERT INTO `PREFIX_spamfilter` VALUES (329, 'fromborg.com');
INSERT INTO `PREFIX_spamfilter` VALUES (330, 'voinu.com');
INSERT INTO `PREFIX_spamfilter` VALUES (331, 'idemna.com');
INSERT INTO `PREFIX_spamfilter` VALUES (332, 'forumprofi.de');
INSERT INTO `PREFIX_spamfilter` VALUES (333, 'publicdir.net');
INSERT INTO `PREFIX_spamfilter` VALUES (334, 'afghanwebs.com');
INSERT INTO `PREFIX_spamfilter` VALUES (335, 'link.toolbot.com');
INSERT INTO `PREFIX_spamfilter` VALUES (336, 'webwork88.info');
INSERT INTO `PREFIX_spamfilter` VALUES (337, 'ododf.info');
INSERT INTO `PREFIX_spamfilter` VALUES (338, 'big-teen-tit-iebj.blogspot.com');
INSERT INTO `PREFIX_spamfilter` VALUES (339, 'benimblog.com');
INSERT INTO `PREFIX_spamfilter` VALUES (340, 'onlineinf.com');
INSERT INTO `PREFIX_spamfilter` VALUES (341, 'siteboard.de');
INSERT INTO `PREFIX_spamfilter` VALUES (342, 'blog2b.net');
INSERT INTO `PREFIX_spamfilter` VALUES (343, 'of4uq.com');
INSERT INTO `PREFIX_spamfilter` VALUES (344, 'bloghotel.org');
INSERT INTO `PREFIX_spamfilter` VALUES (345, 'suddenlaunch3.com');
INSERT INTO `PREFIX_spamfilter` VALUES (346, 'yourfreebb.de');
INSERT INTO `PREFIX_spamfilter` VALUES (347, 'voy.com');
INSERT INTO `PREFIX_spamfilter` VALUES (348, 'kfki.hu');
INSERT INTO `PREFIX_spamfilter` VALUES (349, 'of4uq.info');
INSERT INTO `PREFIX_spamfilter` VALUES (350, 'myforum.ro');
INSERT INTO `PREFIX_spamfilter` VALUES (351, 'aroundweb.net');
INSERT INTO `PREFIX_spamfilter` VALUES (352, 'maxpages.com');
INSERT INTO `PREFIX_spamfilter` VALUES (353, 'merlintec.com');
INSERT INTO `PREFIX_spamfilter` VALUES (354, 'freemy.homeip.net');
INSERT INTO `PREFIX_spamfilter` VALUES (355, 'onlinewebservice6.de');
INSERT INTO `PREFIX_spamfilter` VALUES (356, 'shrunk.net');
INSERT INTO `PREFIX_spamfilter` VALUES (357, 'allglobalsite.com');
INSERT INTO `PREFIX_spamfilter` VALUES (358, 'cnaf.infn.it');
INSERT INTO `PREFIX_spamfilter` VALUES (359, 'bloguez.com');
INSERT INTO `PREFIX_spamfilter` VALUES (360, 'aezx.com');
INSERT INTO `PREFIX_spamfilter` VALUES (361, '7by.eu');
INSERT INTO `PREFIX_spamfilter` VALUES (362, 'drugsstore.org');
INSERT INTO `PREFIX_spamfilter` VALUES (363, 'online911s.info');
INSERT INTO `PREFIX_spamfilter` VALUES (364, 'ro3tr8oft.com');
INSERT INTO `PREFIX_spamfilter` VALUES (365, 'qxwh.com');
INSERT INTO `PREFIX_spamfilter` VALUES (366, 'pochta.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (367, 'phpbbplanet.com');
INSERT INTO `PREFIX_spamfilter` VALUES (368, 'soma-80.nm.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (369, 'blogsyte.com');
INSERT INTO `PREFIX_spamfilter` VALUES (370, 'infogami.com');
INSERT INTO `PREFIX_spamfilter` VALUES (371, 'my-journal.com');
INSERT INTO `PREFIX_spamfilter` VALUES (372, 'uniroma1.it');
INSERT INTO `PREFIX_spamfilter` VALUES (373, 'ucp.pt');
INSERT INTO `PREFIX_spamfilter` VALUES (374, 'dafreotn.com');
INSERT INTO `PREFIX_spamfilter` VALUES (375, 'adrenalinbet.com');
INSERT INTO `PREFIX_spamfilter` VALUES (376, 'moank.info');
INSERT INTO `PREFIX_spamfilter` VALUES (377, 'digbig.com');
INSERT INTO `PREFIX_spamfilter` VALUES (378, '1url.org');
INSERT INTO `PREFIX_spamfilter` VALUES (379, 'fm-megacash.com');
INSERT INTO `PREFIX_spamfilter` VALUES (380, 'land.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (381, 'fromru.com');
INSERT INTO `PREFIX_spamfilter` VALUES (382, 'mail15.com');
INSERT INTO `PREFIX_spamfilter` VALUES (383, 'pisem.net');
INSERT INTO `PREFIX_spamfilter` VALUES (384, 'smtp.ru');
INSERT INTO `PREFIX_spamfilter` VALUES (385, 'mediamedia.s240.xrea.com');
INSERT INTO `PREFIX_spamfilter` VALUES (386, 'ragnaroklink.com');
INSERT INTO `PREFIX_spamfilter` VALUES (387, 'animestep.no-ip.org');
INSERT INTO `PREFIX_spamfilter` VALUES (388, 'imagefap.com');
INSERT INTO `PREFIX_spamfilter` VALUES (389, 'crank-it-loud.com');
INSERT INTO `PREFIX_spamfilter` VALUES (390, 'c-games.net');
INSERT INTO `PREFIX_spamfilter` VALUES (391, 'twsunkom.com');
INSERT INTO `PREFIX_spamfilter` VALUES (392, 'lost.eu');
INSERT INTO `PREFIX_spamfilter` VALUES (393, 'game-oekakibbs.com');
INSERT INTO `PREFIX_spamfilter` VALUES (394, 'adjuvancy.com');
INSERT INTO `PREFIX_spamfilter` VALUES (395, 'conecojp.net');
INSERT INTO `PREFIX_spamfilter` VALUES (396, '.aqq');
INSERT INTO `PREFIX_spamfilter` VALUES (397, '.zox');
INSERT INTO `PREFIX_spamfilter` VALUES (398, '.azx');
INSERT INTO `PREFIX_spamfilter` VALUES (399, '.onx');
INSERT INTO `PREFIX_spamfilter` VALUES (400, 'sexlog.com.br');
INSERT INTO `PREFIX_spamfilter` VALUES (401, 'rpgtopsites.com');
INSERT INTO `PREFIX_spamfilter` VALUES (402, 'maximo.ucla.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (403, 's-url.net');
INSERT INTO `PREFIX_spamfilter` VALUES (404, 'hydrocodone.host-page.com');
INSERT INTO `PREFIX_spamfilter` VALUES (405, 'host-page.com');
INSERT INTO `PREFIX_spamfilter` VALUES (406, 'starfsfolk.khi.is');
INSERT INTO `PREFIX_spamfilter` VALUES (407, 'tbns.net');
INSERT INTO `PREFIX_spamfilter` VALUES (408, 'jeeee.net');
INSERT INTO `PREFIX_spamfilter` VALUES (409, 'ttu.cc');
INSERT INTO `PREFIX_spamfilter` VALUES (410, 'mcturl.com');
INSERT INTO `PREFIX_spamfilter` VALUES (411, 'clipurl.com');
INSERT INTO `PREFIX_spamfilter` VALUES (412, 'cerritos.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (413, 'cfbisd.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (414, 'leeu.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (415, 'chikungunya.net');
INSERT INTO `PREFIX_spamfilter` VALUES (416, 'ragazzinet.it');
INSERT INTO `PREFIX_spamfilter` VALUES (417, 'spiceisle.com');
INSERT INTO `PREFIX_spamfilter` VALUES (418, 'professionalchef.com');
INSERT INTO `PREFIX_spamfilter` VALUES (419, 'mncounties3.org');
INSERT INTO `PREFIX_spamfilter` VALUES (420, 'indeffe.info');
INSERT INTO `PREFIX_spamfilter` VALUES (421, 'knowerro.info');
INSERT INTO `PREFIX_spamfilter` VALUES (422, 'dersanel.info');
INSERT INTO `PREFIX_spamfilter` VALUES (423, 'fatantra.info');
INSERT INTO `PREFIX_spamfilter` VALUES (424, 'quad-a.org');
INSERT INTO `PREFIX_spamfilter` VALUES (425, 'uwyo.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (426, 'shu.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (427, 'rubyurl.com');
INSERT INTO `PREFIX_spamfilter` VALUES (428, 'gmu.edu');
INSERT INTO `PREFIX_spamfilter` VALUES (429, 'johnsrevenge.com');
INSERT INTO `PREFIX_filetypes` (`filetype`, `force_thumb`) VALUES ('jpg', 0), ('gif', 0), ('png', 0) ;
INSERT INTO `PREFIX_events` (`name`, `at`) VALUES ('pingback', 0), ('sitemap', 0);