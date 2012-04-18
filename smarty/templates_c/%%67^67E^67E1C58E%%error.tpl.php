<?php /* Smarty version 2.6.18, created on 2008-09-07 04:58:09
         compiled from error.tpl */ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><?php echo $this->_tpl_vars['ku_name']; ?>
</title>
<link rel="shortcut icon" href="<?php echo $this->_tpl_vars['ku_webpath']; ?>
/favicon.ico">
<?php echo $this->_tpl_vars['head']; ?>
<style type="text/css"><?php echo '
body {
	width: 100% !important;
}
'; ?>
</style>
</head>
<body>
<h1 style="font-size: 3em;">Error</h1>
<br>
<h2 style="font-size: 2em;font-weight: bold;text-align: center;">
<?php echo $this->_tpl_vars['errormsg']; ?>

</h2>
<?php echo $this->_tpl_vars['errormsgext']; ?>

<div style="text-align: center;width: 100%;position: absolute;bottom: 10px;">
<?php echo $this->_tpl_vars['footer']; ?>

</div>
</body>
</html>