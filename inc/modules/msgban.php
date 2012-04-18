<?php
/* Module initialization */
function msgban_init() {
        global $hooks;
        
        $hooks['posting'][] = 'msgban';
}

function msgban_process_posting($post) {
	if(HY_BANWORD != '')
	{
        $post['message'] = preg_replace_callback(':' . HY_BANWORD . ':', 'msgban__replace_callback', $post['message']);  
		return $post;
	}
}

function msgban__replace_callback($matches) {
	    global $bans_class;
        $bans_class->BanUser($_SERVER['REMOTE_ADDR'], 'SERVER', 1, HY_BANSECONDS, '*', '<font color="blue"><b>Keyword Autoban</b></font>', 0, 0, 'User said banned word', 0);
        return $post;
}

?>