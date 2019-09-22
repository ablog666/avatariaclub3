<?php
session_start();
function r2($to,$ntype='e',$msg=''){
    if($msg==''){
        header("location: $to"); exit;
    }
    $_SESSION['ntype']=$ntype ; $_SESSION['notify']=$msg ; header("location: $to"); exit;
}
if (file_exists('sysfrm/config.php')) {
    require('sysfrm/config.php');
} else {

    r2('sysfrm/install');

}

define('U', APP_URL.'/index.php?_route=');
function safedata($value){
    $value = trim($value);
  //  $value=htmlentities($value, ENT_QUOTES, 'utf-8');

    return $value;
}
//Extend
function _post($param,$defvalue = '') {
    if(!isset($_POST[$param])) 	{
        return $defvalue;
    }
    else {
        return safedata($_POST[$param]);
    }
}

function _get($param,$defvalue = '')
{
    if(!isset($_GET[$param])) {
        return $defvalue;
    }
    else {
        return safedata($_GET[$param]);
    }
}
require('sysfrm/orm.php');
ORM::configure("mysql:host=$db_host;dbname=$db_name");
ORM::configure('username', $db_user);
ORM::configure('password', $db_password);
ORM::configure('return_result_sets', true); // returns result sets
ORM::configure('logging', true);
$result = ORM::for_table('sys_appconfig')->find_many();
foreach($result as $value)
{
    $config[$value['setting']]=$value['value'];
}
date_default_timezone_set($config['timezone']);
function _notify($msg,$type='e'){
    $_SESSION['ntype']=$type ; $_SESSION['notify']=$msg ;
}

require_once('sysfrm/vendors/smarty/libs/Smarty.class.php');
$_theme = APP_URL.'/ui/theme/'.$config['theme'];
//language
$lan_file = 'sysfrm/lan/' . $config['language'] . '/common.lan.php';
require($lan_file);
$ui = new Smarty();
//$ui->setTemplateDir('ui/theme/' . $config['theme'] . '/'); # Removed Theme Support from V3
$ui->setTemplateDir('ui/theme/ria/');
$ui->setCompileDir('ui/compiled/');
$ui->setConfigDir('ui/conf/');
$ui->setCacheDir('ui/cache/');
$ui->assign('app_url', APP_URL);
$ui->assign('_url', APP_URL.'/index.php?_route=');
$ui->assign('_theme', $_theme);
$ui->assign('_c', $config);
$ui->assign('_L', $_L);
$ui->assign('_sysfrm_menu', 'dashboard');
$ui->assign('_title', $config['CompanyName']);

function _msglog($type,$msg){
    $_SESSION['ntype'] = $type;
    $_SESSION['notify'] = $msg;
}


if (isset($_SESSION['notify'])) {
    $notify = $_SESSION['notify'];
    $ntype = $_SESSION['ntype'];
    if ($ntype == 's') {
        $ui->assign('notify', '<div class="alert alert-success fade in">
								<button class="close" data-dismiss="alert">
									×
								</button>
								<i class="fa-fw fa fa-check"></i>
								'.$notify.'
							</div>');

    } else {

        $ui->assign('notify', '<div class="alert alert-danger fade in">
								<button class="close" data-dismiss="alert">
									×
								</button>
								<i class="fa-fw fa fa-times"></i>
								'.$notify.'
							</div>');
    }
    unset($_SESSION['notify']);
    unset($_SESSION['ntype']);
}


function _autoloader($class) {

    if (strpos($class, '_') !== false) {
        // $c_dir = explode($class,'_');
        $class = str_replace('_','/',$class);
        include 'autoload/' . $class . '.php';

    }
    else{
        include 'autoload/' . $class . '.php';
    }


}

spl_autoload_register('_autoloader');

function _auth(){
    if(isset($_SESSION['uid'])){
        return true;
    }
    else{

        r2(U.'login');

    }

}

function _raid($l){
    $r=  substr(str_shuffle(str_repeat('0123456789',$l)),0,$l);
    return $r;

}


// additional function

function _admin(){
    if(isset($_SESSION['uid'])){
        $d = ORM::for_table('user')->find_one($_SESSION['uid']);
        if($d['user_type'] == 'Admin'){
            return true;
        }
        else{
            r2(U.'login');
        }
    }
    else{

        r2(U.'login');

    }

}


// Routing Engine

//$routes = _get('_r');

$req = _get('_route');
$routes = explode('/', $req);
$handler = $routes['0'];
if ($handler == '') {
    $handler = 'default';
}
$sys_render = 'sysfrm/controllers/' . $handler . '.php';
if (file_exists($sys_render)) {
    include($sys_render);
} else {
    // for debugging only
    exit ("$sys_render");
}


// date('Y-m-d H:i:s')