<?php
/*
 * This file is part of Trevorchan.
 *
 * Trevorchan is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * Trevorchan is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Trevorchan; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 * +------------------------------------------------------------------------------+
 * Silly Names Module (created by tj9991)
 * +------------------------------------------------------------------------------+
 * Why be Anonymous when you could be John Tittylick?
 * +------------------------------------------------------------------------------+
 */

/* Module initialization */
function sillynames_init() {
        global $hooks;
        
        $hooks['posting'][] = 'sillynames';
}

/* Is this module authorized to be used right now? */
function sillynames_authorized($board) {
        $boards_authorized = array('b', 'test'); /* EDIT THIS */
        
        if (in_array($board, $boards_authorized)) {
                return true;
        } else {
                return false;
        }
}

function sillynames_info() {
        $info = array();
        $info['type']['board-specific'] = true;
        
        return $info;
}

function sillynames_settings() {
        $settings = array();
        
}

function sillynames_help() {
        $output = 'sillynames:  Replaces the normal \'Anonymous\' with a silly substitute.';
        
        return $output;
}

function sillynames_process_posting($post) {
        if (isset($post['board'])) {
                if (!sillynames_authorized($post['board'])) {
                        return $post;
                }
        }
        if ($post['name'] == 'random') {
                $post['name'] = sillynames__get_name();
        }
        
        return $post;
}

function sillynames__get_name() {
        /* Edit these, if you wish */
        $names_first = array('John', 'Jacob', 'Bert', 'Dick', 'Bobby', 'Bob', 'Brandon', 'Riley', 'Peter', 'Chris', 'Mack', 'Lucas', 'Jordan', 'Trevor');
        $names_last = array('Rubber', 'Burns', 'Pounder', 'Stroker', 'Witherspoon');
        
        $firstname_index = rand(0, (count($names_first) - 1));
        $firstname = $names_first[$firstname_index];
        
        $lastname_index = rand(0, (count($names_last) - 1));
        $lastname = $names_last[$lastname_index];
        
        return $firstname . ' ' . $lastname;
}

?>