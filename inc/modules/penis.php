<?php
/* Module initialization */
function penis_init() {
        global $hooks;
        
        $hooks['posting'][] = 'penis';
}

function penis_info() {
        $info = array();
        $info['type']['board-specific'] = true;
        
        return $info;
}

function penis_settings() {
        $settings = array();
        
}

function penis_help() {
        $output = 'Penis Plugin:  A plugin which will convert the word "penis" into something more colorful, to brighten your day.';
        
        return $output;
}

function penis_process_posting($post) {
        $post['message'] = preg_replace_callback('/penis/i', 'penis__replace_callback', $post['message']);
        
        return $post;
}

function penis__replace_callback($matches) {
        $random_colors = penis__random_colors();
        $color_foreground = $random_colors[0];
        $color_background = $random_colors[1];
        
        return '<span style="color: ' . $color_foreground . '; background-color: ' . $color_background . '"><b>PENIS</b></span>';
}

function penis__random_colors() {
        $colors = array('red', 'black', 'yellow', 'green', 'blue');
        $color_foreground = '';
        $color_background = '';
        
        while ($color_foreground == $color_background) {
                $color_index = rand(0, (count($colors) - 1));
                $color_foreground = $colors[$color_index];
                
                $color_index = rand(0, (count($colors) - 1));
                $color_background = $colors[$color_index];
        }
        
        return array($color_foreground, $color_background);
}
?>