<?php
/*
 * This file is part of kusaba.
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
 * Menu class
 * 
 * @package kusaba 
 */
class Menu {

	function GetMenu($savetofile = false, $option = false) {
		global $tc_db, $smarty, $kusabaorg;
		
		require_once KU_ROOTDIR.'lib/smarty.php';
		
		$smarty->assign('lang_frontpage', _gettext('Front Page'));
		
		if (KU_MENUTYPE == 'normal') {
			$smarty->assign('styles', printStylesheetsSite(KU_DEFAULTMENUSTYLE, true));
		} else {
			$smarty->assign('styles', '<style type="text/css">body { margin: 0px; } h1 { font-size: 1.25em; } h2 { font-size: 0.8em; font-weight: bold; color: #CC3300; } ul { list-style-type: none; padding: 0px; margin: 0px; } li { font-size: 0.8em; padding: 0px; margin: 0px; }</style>');
		}
		
		if (KU_MENUSTYLESWITCHER && KU_MENUTYPE == 'normal') {
			$styles = explode(':', KU_MENUSTYLES);
			$styleswitcher = _gettext('Styles') . ': ';
			foreach ($styles as $style) {
				$styleswitcher .= '[<a href="#" onclick="javascript:set_stylesheet(\\\'' . ucfirst($style) . '\\\', false, true);reloadmain();" style="display: inline;" target="_self">' . strtoupper(substr($style, 0, 1)) . '<\/a>] ';
			}
			$styleswitcher = substr($styleswitcher, 0, -1);
		} else {
			$styleswitcher = '';
		}
		
		$smarty->assign('styleswitcher', $styleswitcher);
		
		if (KU_MENUTYPE == 'normal') {
			$removeframes = '<li id="removeframes"><a href="#" onclick="javascript:return removeframes();" target="_self">[Remove Frames]</a></li>';
		} else {
			$removeframes = '';
		}
		
		$smarty->assign('removeframes', $removeframes);
		$results = $tc_db->GetAll("SELECT HIGH_PRIORITY * FROM `" . KU_DBPREFIX . "menu` WHERE `order` < 1 ORDER BY `order` ASC");
		if (count($results) > 0) {
			foreach ($results as $line) {
				if($line['header'] != '') {
					$tpl_logo .= htmlspecialchars($line['header']);
				}
				$tpl_logo .= $line['body'];
			}
		}
		if ($savetofile) {
			$files = array('menu.html', 'menu_dirs.html');
		} else {
			$files = array('menu.php', 'menu.php');
		}
		
		$smarty->assign('menu_file_nodirs', $files[0]);
		$smarty->assign('menu_file_dirs', $files[1]);
		
		$tpl_irc = '';
		if (KU_IRC!='') {
			if (KU_MENUTYPE == 'normal') {
				$tpl_irc .= '<h2>';
			} else {
				$tpl_irc .= '<h2 style="display: inline;"><br>';
			}
			$tpl_irc .= '&nbsp;IRC</h2>' . "\n" .
			'<ul>' . "\n" .
			'	<li>' . KU_IRC . '</li>' . "\n" .
			'</ul>' . "\n";
		}
		$results = $tc_db->GetAll("SELECT HIGH_PRIORITY * FROM `" . KU_DBPREFIX . "menu` WHERE `order` > 1 ORDER BY `order` ASC");
		if (count($results) > 0) {
			foreach ($results as $line) {
				if (KU_MENUTYPE == 'normal') {
					$tpl_irc .= '<h2>';
				} else {
					$tpl_irc .= '<h2 style="display: inline;"><br>';
				}
				$tpl_irc .= htmlspecialchars($line['header']) . '</h2>' . "\n";
				$tpl_irc .= $line['body'];
			}
		}
		$smarty->assign('irc', $tpl_irc);
		if(HY_MENUIMG != ''){
			$smarty->assign('logo', '<center><img src="' . HY_MENUIMG . '"></center>');
		}
		
		for ($i = 0; $i < 2; $i++) {
			$tpl_boards = '';
			$results_boardsexist = $tc_db->GetAll("SELECT `id` FROM `".KU_DBPREFIX."boards` LIMIT 1");
			if (count($results_boardsexist)==0) {
				$tpl_boards .= '<ul>' . "\n" .
				'	<li>'._gettext('No visible boards').'</li>' . "\n" .
				'</ul>' . "\n";
			} else {
				$results = $tc_db->GetAll("SELECT * FROM `".KU_DBPREFIX."sections` ORDER BY `order` ASC");
				foreach($results AS $line) {
					if (KU_MENUTYPE == 'normal') {
						$tpl_boards .= '<h2>';
					} else {
						$tpl_boards .= '<h2 style="display: inline;"><br>';
					}
					if (KU_MENUTYPE == 'normal') {
						$tpl_boards .= '<span class="plus" onclick="toggle(this, \''.$line['abbreviation'].'\');" title="'._gettext('Click to show/hide').'">';
						if ($line['hidden']==1) {
							$tpl_boards .= '+';
						} else {
							$tpl_boards .= '&minus;';
						}
						$tpl_boards .= '</span>&nbsp;';
					}
					$tpl_boards .= $line['name'].'</h2>' . "\n";
					if (KU_MENUTYPE == 'normal') {
						$tpl_boards .= '<div id="'.$line['abbreviation'].'" style="';
						if ($line['hidden']==1) {
							$tpl_boards .= 'display: none;';
						}
						$tpl_boards .= '">' . "\n";
					}
					$tpl_boards .= '<ul>' . "\n";
					$resultsboard = $tc_db->GetAll("SELECT `name`, `desc`, `locked`, `trial`, `popular` FROM `".KU_DBPREFIX."boards` WHERE `section` = ".$line['id']." ORDER BY `order` ASC");
					if (count($resultsboard)>0) {
						foreach($resultsboard AS $lineboard) {
							$tpl_boards .= '	<li><a href="'.KU_BOARDSPATH.'/'.$lineboard['name'].'/" class="boardlink">';
							if ($lineboard['trial']==1) { $tpl_boards .= '<i>'; }
							if ($lineboard['popular']==1) { $tpl_boards .= '<b>'; }
							if ($i == 1) {
								$tpl_boards .= '/'.$lineboard['name'].'/ - ';
							}
							$tpl_boards .= $lineboard['desc'];
							if ($lineboard['locked']=="1") {
								$tpl_boards .= ' <img src="' . KU_BOARDSPATH . '/css/locked.gif" border="0" alt="Locked">';
							}
							if ($lineboard['trial']==1) { $tpl_boards .= '</i>'; }
							if ($lineboard['popular']==1) { $tpl_boards .= '</b>'; }
							$tpl_boards .= '</a></li>' . "\n";
						}
					} else {
						$tpl_boards .= '	<li>' . "\n" .
						_gettext('No visible boards') . "\n" .
						'</li>' . "\n";
					}
					$tpl_boards .= '</ul>' . "\n";
					if (KU_MENUTYPE == 'normal') {
						$tpl_boards .= '</div>' . "\n";
					}
				}
			}
			$smarty->assign('boards', $tpl_boards);
			if (KU_MENUSTYLESWITCHER && KU_MENUTYPE == 'normal') {
				$showhidedirs = '<li id="sitestyles"><a onclick="javascript:showstyleswitcher();" href="#" target="_self">[' . _gettext('Site Styles') . ']</a></li>'. "\n";
			} else {
				$showhidedirs = '';
			}
			
			if ($savetofile) {
				if ($i == 0) {
					$smarty->assign('redirscript', "\n" . 'if (getCookie(\'tcshowdirs\') == \'yes\') {' . "\n" .
					'	window.location = \'' . KU_WEBPATH . '/' . $files[1] . '\';' . "\n" .
					'}' . "\n");
					$smarty->assign('showhidedirs', $showhidedirs . '<li><a onclick="javascript:showdirs();" href="' . $files[1] . '" target="_self">['._gettext('Show Directories').']</a></li>');
					file_put_contents(KU_ROOTDIR . $files[0], $smarty->fetch('menu.tpl'));
				} else {
					$smarty->assign('redirscript', '');
					$smarty->assign('showhidedirs', $showhidedirs . '<li><a onclick="javascript:hidedirs();" href="' . $files[0] . '" target="_self">['._gettext('Hide Directories').']</a></li>');
					file_put_contents(KU_ROOTDIR . $files[1], $smarty->fetch('menu.tpl'));
				}
			} else {
				if ($i == 0) {
					$smarty->assign('redirscript', "\n" . 'if (getCookie(\'tcshowdirs\') == \'yes\') {' . "\n" .
					'	window.location = \'' . KU_WEBPATH . '/' . $files[1] . '\';' . "\n" .
					'}' . "\n");
					$smarty->assign('showhidedirs', $showhidedirs . '<li><a onclick="javascript:showdirs();" href="' . $files[1] . '" target="_self">['._gettext('Show Directories').']</a></li>');
					$menu_nodirs = $smarty->fetch('menu.tpl');
					if ($option == 'nodirs') {
						return $menu_nodirs;
					}
				} else {
					$smarty->assign('redirscript', '');
					$smarty->assign('showhidedirs', $showhidedirs . '<li><a onclick="javascript:hidedirs();" href="' . $files[0] . '" target="_self">['._gettext('Hide Directories').']</a></li>');
					$menu_dirs = $smarty->fetch('menu.tpl');
					if ($option == 'dirs') {
						return $menu_dirs;
					}
				}
			}
		}
		
		if (isset($menu_nodirs) && isset($menu_dirs)) {
			return array($menu_nodirs, $menu_dirs);
		}
	}

	function Generate() {
		return $this->GetMenu(true);
	}
	
	function PrintMenu($option = false) {
		if ($option != false) {
			return $this->GetMenu(false, $option);
		} else {
			return $this->GetMenu(false);
		}
	}
}
?>