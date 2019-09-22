<?php
//it will handle all settings
_auth();
$ui->assign('_title', $_L['Settings'].'- '. $config['CompanyName']);
$ui->assign('_pagehead', '<i class="fa fa-cogs lblue"></i> '.$_L['Settings']);

$ui->assign('_sysfrm_menu', 'settings');
$action = $routes['1'];
$user = User::_info();
$ui->assign('_user', $user);

switch ($action) {
    case 'expense-categories':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $d = ORM::for_table('sys_cats')->where('type','Expense')->order_by_asc('sorder')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/css/liststyle.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/js/jquery-ui-1.10.2.custom.min.js"></script>
');
        $ui->assign('xjq', Reorder::js('sys_cats'));
        $ui->display('expense-categories.tpl');


        break;

    case 'expense-categories-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $name = _post('name');
        if($name == ''){
            r2(U."settings/expense-categories",'e',$_L['name_error']);
        }
        //check categories already exist
        $c = ORM::for_table('sys_cats')->where('name',$name)->where('type','Expense')->find_one();
        if($c){
            r2(U."settings/expense-categories",'e',$_L['name_exist_error']);
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/expense-categories', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $d = ORM::for_table('sys_cats')->create();

        $d->name = $name;
        $d->type = 'Expense';
        $d->save();
        r2(U."settings/expense-categories",'s',$_L['added_successful']);
        break;

    case 'income-categories':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $d = ORM::for_table('sys_cats')->where('type','Income')->order_by_asc('sorder')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/css/liststyle.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/js/jquery-ui-1.10.2.custom.min.js"></script>
');
        $ui->assign('xjq', Reorder::js('sys_cats'));
        $ui->display('income-categories.tpl');


        break;

    case 'income-categories-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $name = _post('name');
        if($name == ''){
            r2(U."settings/income-categories",'e',$_L['name_error']);
        }
        $c = ORM::for_table('sys_cats')->where('name',$name)->where('type','Income')->find_one();
        if($c){
            r2(U."settings/income-categories",'e',$_L['name_exist_error']);
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/income-categories', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $d = ORM::for_table('sys_cats')->create();

        $d->name = $name;
        $d->type = 'Income';
        $d->save();
        r2(U."settings/income-categories",'s',$_L['added_successful']);
        break;

    case 'categories-manage':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $id = $routes[2];
        $d = ORM::for_table('sys_cats')->find_one($id);
        if($d){
            $ui->assign('c',$d);
            $ui->display('categories-edit.tpl');
        }






        break;

    case 'categories-edit-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $id = _post('id');
        $d = ORM::for_table('sys_cats')->find_one($id);
        if($_app_stage == 'Demo'){
            r2(U . 'settings/expense-categories', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        if($d){
            $otype = $d['type'];
            $rd = strtolower($otype);
            $name = _post('name');
            $c = ORM::for_table('sys_cats')->where('name',$name)->where('type',$otype)->find_one();
            if($c){
                r2(U."settings/$rd-categories",'e',$_L['name_exist_error']);
            }
            $oname = $d['name'];
            $type = $d['type'];
            if($name == ''){
                r2(U."settings/categories-manage/$id",'e',$_L['name_error']);
            }
            else{
                $d->name = $name;
                $d->save();
                //update payee in transactions
                ORM::for_table('sys_transactions')->raw_execute("update sys_transactions set category='$name' where (category='$oname' AND type='$type')");
                r2(U."settings/categories-manage/$id",'s',$_L['edit_successful']);
            }
        }
        break;


    case 'categories-delete':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $id = $routes[2];
        $d = ORM::for_table('sys_cats')->find_one($id);
        if($d){
            if($_app_stage == 'Demo'){
                r2(U . 'settings/expense-categories', 'e', 'Sorry! This option is disabled in the demo mode.');
            }
            //find all transaction in this category
            $name = $d['name'];
            $type = $d['type'];

            ORM::for_table('sys_transactions')->raw_query("update sys_transactions set category=:cat where category='$name' AND type='$type'", array('cat' => 'Uncategorized'));
            $d->delete();
            if($type == 'Income'){
                r2(U."settings/income-categories",'s',$_L['delete_successful']);
            }
            else{
                r2(U."settings/expense-categories",'s',$_L['delete_successful']);
            }


        }
        break;

    case 'payee':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $d = ORM::for_table('sys_payee')->order_by_asc('sorder')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/css/liststyle.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/js/jquery-ui-1.10.2.custom.min.js"></script>
');
        $ui->assign('xjq', Reorder::js('sys_payee'));
        $ui->display('payee.tpl');


        break;

    case 'payee-manage':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $id = $routes[2];
        $d = ORM::for_table('sys_payee')->find_one($id);
        if($d){
            $ui->assign('c',$d);
            $ui->display('payee-manage.tpl');
        }


        break;

    case 'payee-edit-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payee', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = _post('id');
        $d = ORM::for_table('sys_payee')->find_one($id);
        if($d){
            $name = _post('name');
            $c = ORM::for_table('sys_payee')->where('name',$name)->find_one();
            if($c){
                r2(U."settings/payee",'e',$_L['name_exist_error']);
            }

            $oname = $d['name'];

            if($name == ''){
                r2(U."settings/payee-manage/$id",'e',$_L['name_error']);
            }
            else{
                $d->name = $name;
                $d->save();
                //update payee in transactions
                ORM::for_table('sys_transactions')->raw_query("update sys_transactions set payee=:payee where payee='$oname'", array('payee' => $name));
                r2(U."settings/payee-manage/$id",'s',$_L['edit_successful']);
            }
        }

        break;

    case 'payee-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $name = _post('name');
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payee', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        if($name == ''){
            r2(U."settings/payee",'e',$_L['name_error']);
        }

        $c = ORM::for_table('sys_payee')->where('name',$name)->find_one();
        if($c){
            r2(U."settings/payee",'e',$_L['name_exist_error']);
        }

        $d = ORM::for_table('sys_payee')->create();

        $d->name = $name;

        $d->save();
        r2(U."settings/payee",'s',$_L['added_successful']);
        break;


    case 'payee-delete':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payee', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = $routes[2];
        $d = ORM::for_table('sys_payee')->find_one($id);
        if($d){


            $d->delete();


            r2(U."settings/payee",'s',$_L['delete_successful']);
        }
        break;


    case 'payer':

        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $d = ORM::for_table('sys_payers')->order_by_asc('sorder')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/css/liststyle.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/js/jquery-ui-1.10.2.custom.min.js"></script>
');
        $ui->assign('xjq', Reorder::js('sys_payers'));
        $ui->display('payer.tpl');


        break;

    case 'payer-manage':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $id = $routes[2];
        $d = ORM::for_table('sys_payers')->find_one($id);
        if($d){
            $ui->assign('c',$d);
            $ui->display('payer-manage.tpl');
        }


        break;

    case 'payer-edit-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payer', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = _post('id');
        $d = ORM::for_table('sys_payers')->find_one($id);
        if($d){
            $name = _post('name');
            $c = ORM::for_table('sys_payers')->where('name',$name)->find_one();
            if($c){
                r2(U."settings/payer",'e',$_L['name_exist_error']);
            }

            $oname = $d['name'];

            if($name == ''){
                r2(U."settings/payer-manage/$id",'e',$_L['name_error']);
            }
            else{
                $d->name = $name;
                $d->save();

                ORM::for_table('sys_transactions')->raw_query("update sys_transactions set payer=:payer where payer='$oname'", array('payer' => $name));
                r2(U."settings/payer-manage/$id",'s',$_L['edit_successful']);
            }
        }

        break;

    case 'payer-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payer', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $name = _post('name');
        if($name == ''){
            r2(U."settings/payer",'e',$_L['name_error']);
        }

        $c = ORM::for_table('sys_payers')->where('name',$name)->find_one();
        if($c){
            r2(U."settings/payer",'e',$_L['name_exist_error']);
        }

        $d = ORM::for_table('sys_payers')->create();

        $d->name = $name;

        $d->save();
        r2(U."settings/payer",'s',$_L['added_successful']);
        break;

    case 'payer-delete':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/payer', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = $routes[2];
        $d = ORM::for_table('sys_payers')->find_one($id);
        if($d){


            $d->delete();


            r2(U."settings/payer",'s',$_L['delete_successful']);
        }
        break;
    case 'pmethods':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $d = ORM::for_table('sys_pmethods')->order_by_asc('sorder')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/css/liststyle.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/js/jquery-ui-1.10.2.custom.min.js"></script>
');
        $ui->assign('xjq', Reorder::js('sys_pmethods'));
        $ui->display('pmethods.tpl');


        break;

    case 'pmethods-manage':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $id = $routes[2];
        $d = ORM::for_table('sys_pmethods')->find_one($id);
        if($d){
            $ui->assign('c',$d);
            $ui->display('pmethods-manage.tpl');
        }


        break;

    case 'pmethods-edit-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/pmethods', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = _post('id');
        $d = ORM::for_table('sys_pmethods')->find_one($id);
        if($d){
            $name = _post('name');
            $c = ORM::for_table('sys_pmethods')->where('name',$name)->find_one();
            if($c){
                r2(U."settings/pmethods",'e',$_L['name_exist_error']);
            }

            $oname = $d['name'];

            if($name == ''){
                r2(U."settings/pmethods-manage/$id",'e',$_L['name_error']);
            }
            else{
                $d->name = $name;
                $d->save();

                ORM::for_table('sys_transactions')->raw_query("update sys_transactions set pmethod=:pmethod where pmethod='$oname'", array('pmethod' => $name));
                r2(U."settings/pmethods-manage/$id",'s',$_L['edit_successful']);
            }
        }

        break;

    case 'pmethods-post':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/pmethods', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $name = _post('name');
        if($name == ''){
            r2(U."settings/pmethods",'e',$_L['name_error']);
        }

        $c = ORM::for_table('sys_pmethods')->where('name',$name)->find_one();
        if($c){
            r2(U."settings/pmethods",'e',$_L['name_exist_error']);
        }

        $d = ORM::for_table('sys_pmethods')->create();

        $d->name = $name;

        $d->save();
        r2(U."settings/pmethods",'s',$_L['added_successful']);
        break;


    case 'pmethods-delete':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        if($_app_stage == 'Demo'){
            r2(U . 'settings/pmethods', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $id = $routes[2];
        $d = ORM::for_table('sys_pmethods')->find_one($id);
        if($d){


            $d->delete();


            r2(U."settings/pmethods",'s',$_L['delete_successful']);
        }
        break;


    case 'app':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $timezonelist = Timezone::timezoneList();
        $ui->assign('tlist',$timezonelist);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/select2/select2.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/select2/select2.min.js"></script>
');
        $ui->assign('xjq', '

 $("#tzone").select2();


 ');
        $ui->display('app-settings.tpl');

        break;

    case 'users':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }
        $ui->assign('xfooter', '
<script type="text/javascript" src="ui/lib/c/users.js"></script>
');
        $d = ORM::for_table('sys_users')->find_many();
        $ui->assign('d',$d);
        $ui->display('users.tpl');

        break;

    case 'users-add':
        if($user['user_type'] != 'Admin'){
            r2(U."dashboard",'e','You do not have permission to access this page');
        }

        $ui->display('users-add.tpl');

        break;

    case 'users-edit':


        $id  = $routes['2'];
        $d = ORM::for_table('sys_users')->find_one($id);
        if($d){

            $ui->assign('d',$d);
            $ui->display('users-edit.tpl');

        }
        else{
            r2(U . 'settings/users', 'e', $_L['Account_Not_Found']);
        }

        break;

    case 'users-delete':


        $id  = $routes['2'];
        //prevent self delete
        if(($user['id']) == $id){
            r2(U . 'settings/users', 'e', 'Sorry You can\'t delete yourself');
        }
        $d = ORM::for_table('sys_users')->find_one($id);
        if($d){

            $d->delete();
            r2(U . 'settings/users', 's', 'User deleted Successfully');
        }
        else{
            r2(U . 'settings/users', 'e', $_L['Account_Not_Found']);
        }

        break;

    case 'users-post':


        $username = _post('username');
        $fullname = _post('fullname');
        $password = _post('password');
        $cpassword = _post('cpassword');
        $user_type = _post('user_type');
        $msg = '';
        if(Validator::Length($username,16,2) == false){
            $msg .= 'Username should be between 3 to 15 characters'. '<br>';
        }
        if(Validator::Length($fullname,26,2) == false){
            $msg .= 'Full Name should be between 3 to 25 characters'. '<br>';
        }
        if(!Validator::Length($password,15,5)){
            $msg .= 'Password should be between 6 to 15 characters'. '<br>';

        }
        if($password != $cpassword){
            $msg .= 'Passwords does not match'. '<br>';
        }
//check with same name account is exist
        $d = ORM::for_table('sys_users')->where('username',$username)->find_one();
        if($d){
            $msg .= $_L['account_already_exist']. '<br>';
        }




        if($msg == ''){

            $password = Password::_crypt($password);
            // Add Account
            $d = ORM::for_table('sys_users')->create();
            $d->username = $username;
            $d->password = $password;
            $d->fullname = $fullname;
            $d->user_type = $user_type;
            $d->save();
            r2(U . 'settings/users', 's', $_L['account_created_successfully']);
        }
        else{
            r2(U . 'settings/users-add', 'e', $msg);
        }

        break;


    case 'users-edit-post':


        $username = _post('username');
        $fullname = _post('fullname');
        $password = _post('password');
        $cpassword = _post('cpassword');



        $msg = '';
        if(Validator::Length($username,16,2) == false){
            $msg .= 'Username should be between 3 to 15 characters'. '<br>';
        }
        if(Validator::Length($fullname,26,2) == false){
            $msg .= 'Full Name should be between 3 to 25 characters'. '<br>';
        }
        if($password != ''){
            if(!Validator::Length($password,15,5)){
                $msg .= 'Password should be between 6 to 15 characters'. '<br>';

            }
            if($password != $cpassword){
                $msg .= 'Passwords does not match'. '<br>';
            }
        }
        //find this user
        $id = _post('id');
        $d = ORM::for_table('sys_users')->find_one($id);
        if($d){

        }
        else{
            $msg .= 'Username Not Found'. '<br>';
        }
//check with same name account is exist
        if($d['username'] != $username){
            $c = ORM::for_table('sys_users')->where('username',$username)->find_one();
            if($c){
                $msg .= $_L['account_already_exist']. '<br>';
            }
        }






        if($msg == ''){


            // Add Account

            $d->username = $username;
            if($password != ''){
                $password = Password::_crypt($password);
                $d->password = $password;
            }

            $d->fullname = $fullname;
            if(($user['id']) != $id){
                $user_type = _post('user_type');
                $d->user_type = $user_type;
            }

            $d->save();
            r2(U . 'settings/users', 's', 'User Updated Successfully');
        }
        else{
            r2(U . 'settings/users-edit/'.$id, 'e', $msg);
        }

        break;

    case 'app-post':
        if($_app_stage == 'xDemo'){
            r2(U . 'settings/app', 'e', 'Sorry! This option is disabled in the demo mode.');
        }
        $company = _post('company');
        $theme = _post('theme');
        $rtl = _post('rtl');
        if($rtl != '1'){
            $rtl = '0';
        }
        $nstyle = _post('nstyle');
        if($company == '' OR $theme == '' OR $nstyle == ''){
            r2(U.'settings/app','e','All Fields are Required');
        }
        else{
            $d = ORM::for_table('sys_appconfig')->where('setting','CompanyName')->find_one();
            $d->value = $company;
            $d->save();

            $d = ORM::for_table('sys_appconfig')->where('setting','theme')->find_one();
            $d->value = $theme;
            $d->save();

            $d = ORM::for_table('sys_appconfig')->where('setting','nstyle')->find_one();
            $d->value = $nstyle;
            $d->save();

            $tzone = _post('tzone');
            $d = ORM::for_table('sys_appconfig')->where('setting','timezone')->find_one();
            $d->value = $tzone;
            $d->save();


            $dec_point = $_POST['dec_point'];
            if(strlen($dec_point) == '1'){
                $d = ORM::for_table('sys_appconfig')->where('setting','dec_point')->find_one();
                $d->value = $dec_point;
                $d->save();
            }

            $thousands_sep = $_POST['thousands_sep'];
            if(strlen($thousands_sep) == '1'){
                $d = ORM::for_table('sys_appconfig')->where('setting','thousands_sep')->find_one();
                $d->value = $thousands_sep;
                $d->save();
            }

            $currency_code = $_POST['currency_code'];

            $d = ORM::for_table('sys_appconfig')->where('setting','currency_code')->find_one();
            $d->value = $currency_code;
            $d->save();

            $d = ORM::for_table('sys_appconfig')->where('setting','rtl')->find_one();
            $d->value = $rtl;
            $d->save();
$lan = _post('lan');
            $d = ORM::for_table('sys_appconfig')->where('setting','language')->find_one();
            $d->value = $lan;
            $d->save();

            r2(U.'settings/app','s','Settings Saved Successfully');
        }


        break;


    case 'change-password':

        $ui->display('change-password.tpl');

        break;

    case 'change-password-post':

        $password = _post('password');
        if($password != ''){
            $d = ORM::for_table('sys_users')->where('username',$user['username'])->find_one();
            if($d){
                $d_pass = $d['password'];
                if(Password::_verify($password,$d_pass) == true){

                    $npass = _post('npass');
                    $cnpass = _post('cnpass');
                    if(!Validator::Length($npass,15,5)){
                        r2(U.'settings/change-password','e','New Password must be 6 to 14 character');

                    }
                    if($npass != $cnpass){
                        r2(U.'settings/change-password','e','Both Password should be same');
                    }

                    if($_app_stage == 'xDemo'){
                        r2(U.'settings/change-password','e','Sorry! Changing Password is disabled in the demo mode.');
                    }

                    $npass = Password::_crypt($npass);
                    $d->password = $npass;
                    $d->save();
                    _msglog('s','Password changed successfully, Please login again');

                    r2(U.'login');

                }
                else{
                    r2(U.'settings/change-password','e','Incorrect Current Password');
                }
            }
            else{

                r2(U.'settings/change-password','e','Incorrect Current Password');
            }
        }
        else{
            r2(U.'settings/change-password','e','Incorrect Current Password');
        }


        break;

    default:
        echo 'action not defined';
}