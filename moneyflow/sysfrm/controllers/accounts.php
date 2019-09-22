<?php
_auth();
$ui->assign('_sysfrm_menu', 'accounts');
$ui->assign('_pagehead', '<i class="fa fa-building-o lblue"></i> '.$_L['Accounts']);
$ui->assign('_title', $_L['Accounts']. '- '. $config['CompanyName']);
$action = $routes['1'];
$user = User::_info();
$ui->assign('_user', $user);
switch ($action) {
    case 'balances':

//Find all accounts
$d = ORM::for_table('sys_accounts')->find_many();
$tbal = ORM::for_table('sys_accounts')->sum('balance');
$tbal = number_format($tbal,'2','.','');
$ui->assign('d',$d);
$ui->assign('tbal',$tbal);
$ui->display('account-balances.tpl');






        break;

    case 'add':

        $ui->display('account-add.tpl');
        break;

    case 'add-post':
        $account = _post('account');
        $description = _post('description');
        $balance = _post('balance');
        $msg = '';
        if(Validator::Length($account,100,2) == false){
           $msg .= $_L['account_title_length_error']. '<br>';
        }
//check with same name account is exist
        $d = ORM::for_table('sys_accounts')->where('account',$account)->find_one();
        if($d){
            $msg .= $_L['account_already_exist']. '<br>';
        }


        if (is_numeric($balance) == false) {
            $balance = '0.00';
        }

        if($msg == ''){
            if($_app_stage == 'Demo'){
                r2(U . 'accounts/add', 'e', 'Sorry! Adding New Account is disabled in the demo mode.');
            }
            if($balance != '0.00'){
                //Add a Transaction
                $d = ORM::for_table('sys_transactions')->create();
                $d->account = $account;
                $d->type = 'Transfer';
                $d->payer = $_L['system'];
                $d->amount = $balance;
                $d->date = date('Y-m-d');
                $d->dr = '0.00';
                $d->cr = $balance;
                $d->bal = $balance;
                $d->description = $_L['initial_balance'];
                $d->save();
            }
            // Add Account
            $d = ORM::for_table('sys_accounts')->create();
            $d->account = $account;
            $d->description = $description;
            $d->balance = $balance;
            $d->save();
            r2(U . 'accounts/balances', 's', $_L['account_created_successfully']);
        }
        else{
            r2(U . 'accounts/add', 'e', $msg);
        }
        break;

    case 'list':

        $d = ORM::for_table('sys_accounts')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xfooter', '
<script type="text/javascript" src="ui/lib/c/accounts.js"></script>
');
        $ui->display('accounts-manage.tpl');
        break;

    case 'edit':
$id  = $routes['2'];
$d = ORM::for_table('sys_accounts')->find_one($id);
if($d){

$ui->assign('d',$d);
    $ui->display('account-edit.tpl');

}
else{
    r2(U . 'accounts/list', 'e', $_L['Account_Not_Found']);
}

        break;
    case 'edit-post':
        $account = _post('account');
        $description = _post('description');
        $id = _post('id');
        $msg = '';
        if(Validator::Length($account,100,2) == false){
            $msg .= $_L['account_title_length_error']. '<br>';
        }




        if($msg == ''){

            $d = ORM::for_table('sys_accounts')->find_one($id);
            if($d){
$oaccount = $d['account'];
                $d->account = $account;
                $d->description = $description;

                $d->save();

                //now update all transactions with the new name

                $b = ORM::for_table('sys_transactions')->where('account',$oaccount)->find_result_set()
                    ->set('account', $account)
                    ->save();

                r2(U . 'accounts/list', 's', $_L['account_updated_successfully']);

            }
            else{
                r2(U . 'accounts/list', 'e', $_L['Account_Not_Found']);
            }



        }
        else{
            r2(U . 'accounts/add', 'e', $msg);
        }

        break;
    case 'delete':
$id = $routes['2'];
        if($_app_stage == 'Demo'){
            r2(U . 'accounts/list', 'e', 'Sorry! Deleting Account is disabled in the demo mode.');
        }
        $d = ORM::for_table('sys_accounts')->find_one($id);
if($d){
    $d->delete();
    r2(U . 'accounts/list', 's', $_L['account_delete_successful']);
}

        break;
    case 'post':

        break;

    default:
        echo 'action not defined';
}