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
 * Faptcha system
 *
 * User must identify a dick, vagoo, ass or tits
 * 
 * @package kusaba  
 */
 
session_start();
$dir = 'faptcha_default' . '/';
$dh  = opendir($dir);
while (false !== ($filename = readdir($dh))) {
	if($filename == "Thumbs.db" || is_dir($filename)){
		//ignore
	}
	else{
	   $files[] = $filename;
	}
}	
closedir($dh);
$brightness = rand(0,50);
$nooffildi = count($files);
$nooffiles = ($nooffildi-1);
srand((double)microtime()*1000000);
$randnum = rand(0,$nooffiles);
$file = $dir . $files[$randnum];	
$filename = $files[$randnum];
if(strstr($filename, 'tits')) {
	$_SESSION['faptcha_type'] = 'tits';
}
if(strstr($filename, 'ass')) {
	$_SESSION['faptcha_type'] = 'ass';
}
if(strstr($filename, 'vagina')) {
	$_SESSION['faptcha_type'] = 'vagoo';
}
if(strstr($filename, 'dick')) {
	$_SESSION['faptcha_type'] = 'dick';
}	
$image = imagecreatefrompng($file);
$width = 90;
$height = 30;
imageline($image, mt_rand(0,$width), mt_rand(0,$height), mt_rand(0,$width), mt_rand(0,$height), $noise_color);
header('Content-Type: image/png');	
imagepng($image);
?>