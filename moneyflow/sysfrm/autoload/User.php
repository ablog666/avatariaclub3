<?php
Class User{
    public static function _info(){
        $id = $_SESSION['uid'];
        $d = ORM::for_table('sys_users')->find_one($id);
        return $d;
    }
}