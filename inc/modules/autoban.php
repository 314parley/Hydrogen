<?php
/* Module initialization */
function autoban_init() {
        global $hooks;
        
        $hooks['posting'][] = 'autoban';
}

/* Is this module authorized to be used right now? */
function autoban_authorized($board) {
        return true;
}

function autoban_info() {
        $info = array();
        $info['type']['board-specific'] = false;
        
        return $info;
}

function autoban_settings() {
        $settings = array();
        
}

function autoban_help() {
        $output = 'autoban:  No help available.';
        
        return $output;
}

function autoban_process_posting($post) {
        global $bans_class;
        $triggers = array('#imsurethisdoessomething');
        $banseconds = 120;
        $message2 = '<font color="red"><b>(USER WAS BANNED FOR THIS POST)</b></font>';
        $banmessage = '<font color="green">SELF-BAN</font>';       
		if (in_array(strtolower($post['email']), $triggers)) {
        $post['message'] =  $post['message'] . '<br>' . $message2;
        $bans_class->BanUser($_SERVER['REMOTE_ADDR'], 'SERVER', 1, $banseconds, '*', $banmessage, 0, 0, 'Self-Ban', 0);
                $post['email'] = '';
                $post['email_save'] = false;
		}
        

        return $post;
}

function autoban__get_autoban() {
        $autobans = explode('|', module_setting_get('autoban', 'autobans'));
        $autoban_index = rand(0, (count($autobans) - 1));
        $autoban = $autobans[$autoban_index];
        
        return $autoban;
}

?>