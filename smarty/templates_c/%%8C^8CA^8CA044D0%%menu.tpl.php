<?php /* Smarty version 2.6.18, created on 2009-04-29 13:26:18
         compiled from menu.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?php echo $this->_tpl_vars['ku_name']; ?>
 Navigation</title>
<?php echo $this->_tpl_vars['styles']; ?>
<link rel="shortcut icon" href="<?php echo $this->_tpl_vars['ku_webpath']; ?>
/favicon.ico">
<?php echo '<script type="text/javascript"><!--
function toggle(button, area) {
	var tog=document.getElementById(area);
	if(tog.style.display)    {
		tog.style.display="";
	}    else {
		tog.style.display="none";
	}
	button.innerHTML=(tog.style.display)?\'+\':\'&minus;\';
	set_cookie(\'nav_show_\'+area, tog.style.display?\'0\':\'1\', 30);
}
function showstyleswitcher() {
	var switcher = document.getElementById(\'sitestyles\');
	switcher.innerHTML = \''; ?>
<?php echo $this->_tpl_vars['styleswitcher']; ?>
<?php echo '\';
}
function removeframes() {
	var boardlinks = document.getElementsByTagName("a");
	for(var i=0;i<boardlinks.length;i++) if(boardlinks[i].className == "boardlink") boardlinks[i].target = "_top";
	
	document.getElementById("removeframes").innerHTML = \'Frames removed.\';
	
	return false;
}
function reloadmain() {
	if (parent.main) {
		parent.main.location.reload();
	}
}
function hidedirs() {
	set_cookie(\'tcshowdirs\', \'\', 30);
	window.location = \''; ?>
<?php echo $this->_tpl_vars['ku_webpath']; ?>
/<?php echo $this->_tpl_vars['menu_file_nodirs']; ?>
';<?php echo '
}
function showdirs() {
	set_cookie(\'tcshowdirs\', \'yes\', 30);
	window.location = \''; ?>
<?php echo $this->_tpl_vars['ku_webpath']; ?>
/<?php echo $this->_tpl_vars['menu_file_dirs']; ?>
';<?php echo '
}'; ?>
<?php echo $this->_tpl_vars['redirscript']; ?>
<?php echo '
//--></script>'; ?>

<base target="main">
</head>
<body>
<?php echo $this->_tpl_vars['headimg']; ?>

<?php echo $this->_tpl_vars['logo']; ?>

<h1><?php echo $this->_tpl_vars['ku_name']; ?>
</h1>
<ul>
<li><a href="<?php echo $this->_tpl_vars['ku_webpath']; ?>
" target="_top"><?php echo $this->_tpl_vars['lang_frontpage']; ?>
</a></li>
<?php echo $this->_tpl_vars['showhidedirs']; ?>

<?php echo $this->_tpl_vars['removeframes']; ?>

</ul>
<?php echo $this->_tpl_vars['boards']; ?>

<?php echo $this->_tpl_vars['irc']; ?>

</body>
</html>