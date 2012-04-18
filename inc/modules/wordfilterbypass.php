<?php
/* Module initialization */
function wordfilterbypass_init() {
        global $hooks;        
        $hooks['posting'][] = 'wordfilterbypass';
}

function wordfilterbypass_process_posting($post) {
        $post['message'] = preg_replace(':' . HY_WFBYPASS . ':','',$post['message']);        
        return $post;
}
?>