<?php
/*
 * This file is part of kusaba (UPDATED).
 *
 * kusaba is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * kusaba is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * kusaba; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
/** 
 * News display, which is the first page shown when a user visits a chan's index
 *
 * Any news added by an administrator in the manage panel will show here, with
 * the newest entry on the top.
 * 
 * @package kusaba  
 */   

/** 
 * Require the configuration file
 */ 
require 'config.php';
require KU_ROOTDIR . 'inc/functions.php';
require_once KU_ROOTDIR . 'lib/smarty.php';

if (!isset($_GET['p'])) {
	$_GET['p'] = '';
}

$smarty->assign('name', KU_NAME);
$smarty->assign('css', printStylesheetsSite(KU_DEFAULTMENUSTYLE, false));
if (KU_SLOGAN != '') {
	$smarty->assign('slogan', '<h3>' . KU_SLOGAN . '</h3>' . "\n");
} else {
	$smarty->assign('slogan', '');
}
$smarty->assign('favicon', getCWebPath() . 'favicon.ico');

// {{{ Link bar (news, faq, rules)
$linkbar = '<div id="topmenu">';
$linkbar .= '<ul>';
$linkbar .= ($_GET['p']=='') ? '<li class="current first">' . _gettext('News') . '</li>' : '<li class="tab first"><a href="news.php">' . _gettext('News') . '</a></li>';
$linkbar .= ($_GET['p']=='faq') ? '<li class="current">' . _gettext('FAQ') . '</li>' : '<li class="tab"><a href="news.php?p=faq">' . _gettext('FAQ') . '</a></li>';
$linkbar .= ($_GET['p']=='rules') ? '<li class="current">' . _gettext('Rules') . '</li>' : '<li class="tab"><a href="news.php?p=rules">' . _gettext('Rules') . '</a></li>';
if (KU_DOMAIN == '.vkowebs.com') {
	$linkbar .= ($_GET['p']=='chat') ? '<li class="current">' . _gettext('Chat') . '</li>' : '<li class="tab"><a href="/mediachan/serissa1/meebo.html">' . _gettext('Chat') . '</a></li>';
	$linkbar .= ($_GET['p']=='chromium') ? '<li class="current">' . _gettext('Chromium') . '</li>' : '<li class="tab"><a href="/mediachan/chromium/">' . _gettext('Chromium') . '</a></li>';
	$linkbar .= ($_GET['p']=='download') ? '<li class="current">' . _gettext('Download') . '</li>' : '<li class="tab"><a href="http://code.google.com/p/hydrogenboard">' . _gettext('Download') . '</a></li>';
	$linkbar .= ($_GET['p']=='blog') ? '<li class="current">' . _gettext('Dev Blog') . '</li>' : '<li class="tab"><a href="/mediachan/wp/">' . _gettext('Dev Blog') . '</a></li>';
}
$linkbar .= '</ul>';
$linkbar .= '</div><br />';

$smarty->assign('linkbar', $linkbar);
// }}}

// {{{ Main content
if ($_GET['p']=='faq') {
	$content = file_get_contents(KU_ROOTDIR . 'inc/pages/faq.html');
} else if ($_GET['p']=='rules') {
	$content = file_get_contents(KU_ROOTDIR . 'inc/pages/rules.html');
} else {
	$content = '';
	$entries = 0;
	/* Get all of the news entries, ordered with the newest one placed on top */
	$results = $tc_db->GetAll("SELECT * FROM `".KU_DBPREFIX."news` ORDER BY `postedat` DESC");
	foreach($results AS $line) {
		$entries++;
		$content .= '<div class="content">' . "\n" .
		'<h2><span class="newssub">'.stripslashes($line['subject']).' by ';
		/* If the message had an email attached to it, add the proper html to link to it */
		if ($line['postedemail']!="") {
			$content .= '<a href="mailto:'.stripslashes($line['postedemail']).'">';
		}
		$content .= stripslashes($line['postedby']);
		if ($line['postedemail']!="") {
			$content .= '</a>';
		}
		$content .= ' - '.date("n/j/y @ g:iA T", $line['postedat']);
		$content .= '</span><span class="permalink"><a href="#' . $line['id'] . '" name="' . $line['id'] . '" title="permalink">#</a></span></h2>
		'.stripslashes($line['message']).'</div><br>';
	}
}
$smarty->assign('content', $content);
// }}}

$smarty->display('news.tpl');
?>