<?php
_auth();
$ui->assign('_title', $_L['Transactions']. '- '. $config['CompanyName']);
$ui->assign('_sysfrm_menu', 'transactions');
$ui->assign('_pagehead', '<i class="fa fa-file-text-o lblue"></i> '.$_L['Transactions']);
$action = $routes['1'];
$user = User::_info();
$ui->assign('_user', $user);
$mdate = date('Y-m-d');
switch ($action) {
    case 'deposit':
        $d = ORM::for_table('sys_accounts')->find_many();
        $ui->assign('d', $d);
        $cats = ORM::for_table('sys_cats')->where('type','Income')->order_by_asc('sorder')->find_many();
        $ui->assign('cats', $cats);
        $pms = ORM::for_table('sys_pmethods')->find_many();
        $ui->assign('pms', $pms);
        $prs = ORM::for_table('sys_payers')->find_many();
        $ui->assign('prs', $prs);
        $ui->assign('mdate', $mdate);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/datepicker/css/datepicker.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/select2/select2.min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/datepicker/js/bootstrap-datepicker.js"></script>
');
        $ui->assign('xjq', '
 $("#account").select2();
 $("#cats").select2();
  $("#pmethod").select2();
  $("#payer").select2();
$(\'#dp1\').datepicker({

			});

 ');
        $d = ORM::for_table('sys_transactions')->where('type','Income')->limit(20)->order_by_desc('id')->find_many();
        $ui->assign('inc',$d);
        $ui->display('deposit.tpl');

        break;



    case 'deposit-post':
        $account = _post('account');
        $date = _post('date');
        $amount = _post('amount');
        $payer = _post('payer');
        $cat = _post('cats');
        $pmethod = _post('pmethod');
        $ref = _post('ref');

        $description = _post('description');
        $msg = '';
        if ($description == '') {
            $msg .= $_L['description_error'] . '<br>';
        }

        if (Validator::Length($account, 100, 2) == false) {
            $msg .= $_L['account_title_length_error'] . '<br>';
        }


        if (is_numeric($amount) == false) {
            $msg .= $_L['amount_error'] . '<br>';
        }

        if ($msg == '') {
            if($_app_stage == 'Demo'){
                r2(U . 'transactions/deposit', 'e', 'Sorry! Adding Transaction is disabled in the demo mode.');
            }
            //find the current balance for this account
            $a = ORM::for_table('sys_accounts')->where('account',$account)->find_one();
            $cbal = $a['balance'];
            $nbal = $cbal+$amount;
            $a->balance=$nbal;
            $a->save();
            $d = ORM::for_table('sys_transactions')->create();
            $d->account = $account;
            $d->type = 'Income';
            $d->payer =  $payer;
            $d->amount = $amount;
            $d->category = $cat;
            $d->method = $pmethod;
            $d->ref = $ref;

            $d->description = $description;
            $d->date = $date;
            $d->dr = '0.00';
            $d->cr = $amount;
            $d->bal = $nbal;
            $d->save();
            r2(U . 'transactions/list', 's', $_L['transaction_added_successfully']);
        } else {
            r2(U . 'transactions/deposit', 'e', $msg);
        }
        break;

    case 'expense':
        $d = ORM::for_table('sys_accounts')->find_many();
        $ui->assign('d', $d);
        $cats = ORM::for_table('sys_cats')->where('type','Expense')->order_by_asc('sorder')->find_many();
        $ui->assign('cats', $cats);
        $pms = ORM::for_table('sys_pmethods')->find_many();
        $ui->assign('pms', $pms);
        $prs = ORM::for_table('sys_payee')->find_many();
        $ui->assign('prs', $prs);
        $ui->assign('mdate', $mdate);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/datepicker/css/datepicker.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/select2/select2.min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/datepicker/js/bootstrap-datepicker.js"></script>
');
        $ui->assign('xjq', '
 $("#account").select2();
 $("#cats").select2();
  $("#pmethod").select2();
  $("#payee").select2();
$(\'#dp1\').datepicker({
				format: \'yyyy-mm-dd\'
			});

 ');
        $d = ORM::for_table('sys_transactions')->where('type','Expense')->limit(20)->order_by_desc('id')->find_many();
        $ui->assign('exp',$d);
        $ui->display('expense.tpl');

        break;



    case 'expense-post':
        $account = _post('account');
        $date = _post('date');
        $amount = _post('amount');
        $payee = _post('payee');
        $cat = _post('cats');
        $pmethod = _post('pmethod');
        $ref = _post('ref');

        $description = _post('description');
        $msg = '';
        if (Validator::Length($account, 100, 2) == false) {
            $msg .= $_L['account_title_length_error'] . '<br>';
        }

        if ($description == '') {
            $msg .= $_L['description_error'] . '<br>';
        }

        if (is_numeric($amount) == false) {
            $msg .= $_L['amount_error'] . '<br>';
        }

        if ($msg == '') {
            if($_app_stage == 'Demo'){
                r2(U . 'transactions/expense', 'e', 'Sorry! Adding Transaction is disabled in the demo mode.');
            }
            $a = ORM::for_table('sys_accounts')->where('account',$account)->find_one();
            $cbal = $a['balance'];
            $nbal = $cbal-$amount;
            $a->balance=$nbal;
            $a->save();
            $d = ORM::for_table('sys_transactions')->create();
            $d->account = $account;
            $d->type = 'Expense';
            $d->payee =  $payee;
            $d->amount = $amount;
            $d->category = $cat;
            $d->method = $pmethod;
            $d->ref = $ref;

            $d->description = $description;
            $d->date = $date;
            $d->dr = $amount;
            $d->cr = '0.00';
            $d->bal = $nbal;
            $d->save();
            r2(U . 'transactions/list', 's', $_L['transaction_added_successfully']);
        } else {
            r2(U . 'transactions/deposit', 'e', $msg);
        }
        break;

    case 'transfer':
        $d = ORM::for_table('sys_accounts')->find_many();
        $ui->assign('d', $d);

        $pms = ORM::for_table('sys_pmethods')->find_many();
        $ui->assign('pms', $pms);

        $ui->assign('mdate', $mdate);
        $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/datepicker/css/datepicker.css"/>
');
        $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/select2/select2.min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/datepicker/js/bootstrap-datepicker.js"></script>
');
        $ui->assign('xjq', '
 $("#account").select2();
 $("#taccount").select2();
 $("#cats").select2();
  $("#pmethod").select2();
  $("#payee").select2();
$(\'#dp1\').datepicker({
				format: \'yyyy-mm-dd\'
			});

 ');
        $ui->display('transfer.tpl');

        break;



    case 'transfer-post':
        $account = _post('account');
        $taccount = _post('taccount');
        $date = _post('date');
        $amount = _post('amount');

        $pmethod = _post('pmethod');
        $ref = _post('ref');

        $description = _post('description');
        $msg = '';
        if (Validator::Length($account, 100, 2) == false) {
            $msg .= $_L['account_title_length_error'] . '<br>';
        }

        if (Validator::Length($taccount, 100, 2) == false) {
            $msg .= 'Please choose the Traget Account' . '<br>';
        }

        if ($description == '') {
            $msg .= $_L['description_error'] . '<br>';
        }

        if (is_numeric($amount) == false) {
            $msg .= $_L['amount_error'] . '<br>';
        }

        //check if from account & target account is same

        if($account == $taccount){
            $msg .= $_L['same_account_error'] . '<br>';
        }



        if ($msg == '') {
            if($_app_stage == 'Demo'){
                r2(U . 'transactions/transfer', 'e', 'Sorry! Adding Transaction is disabled in the demo mode.');
            }
            $a = ORM::for_table('sys_accounts')->where('account',$account)->find_one();
            $cbal = $a['balance'];
            $nbal = $cbal-$amount;
            $a->balance=$nbal;
            $a->save();
            $a = ORM::for_table('sys_accounts')->where('account',$taccount)->find_one();
            $cbal = $a['balance'];
            $tnbal = $cbal+$amount;
            $a->balance=$tnbal;
            $a->save();
            $d = ORM::for_table('sys_transactions')->create();
            $d->account = $account;
            $d->type = 'Transfer';

            $d->amount = $amount;

            $d->method = $pmethod;
            $d->ref = $ref;

            $d->description = $description;
            $d->date = $date;
            $d->dr = $amount;
            $d->cr = '0.00';
            $d->bal = $nbal;
            $d->save();
            //transaction for target account
            $d = ORM::for_table('sys_transactions')->create();
            $d->account = $taccount;
            $d->type = 'Transfer';

            $d->amount = $amount;

            $d->method = $pmethod;
            $d->ref = $ref;

            $d->description = $description;
            $d->date = $date;
            $d->dr = '0.00';
            $d->cr = $amount;
            $d->bal = $tnbal;
            $d->save();
            r2(U . 'transactions/list', 's', $_L['transaction_added_successfully']);
        } else {
            r2(U . 'transactions/transfer', 'e', $msg);
        }
        break;


    case 'list':

        $paginator = Paginator::bootstrap('sys_transactions');
        $d = ORM::for_table('sys_transactions')->offset($paginator['startpoint'])->limit($paginator['limit'])->order_by_desc('id')->find_many();
        $ui->assign('d',$d);
        $ui->assign('xheader','
<style type="text/css">
 @media print {
       table td:last-child {display:none}
       table th:last-child {display:none}
   }
</style>

');
        $ui->assign('paginator',$paginator);
        $ui->display('transactions.tpl');
        break;

    case 'manage':
        $id = $routes['2'];
        $t = ORM::for_table('sys_transactions')->find_one($id);
        if ($t) {
            $ui->assign('t', $t);
            $d = ORM::for_table('sys_accounts')->find_many();
            $ui->assign('d', $d);
            $icat = '1';
            if(($t['type']) == 'Income'){
                $cats = ORM::for_table('sys_cats')->where('type','Income')->find_many();
            }
            elseif(($t['type']) == 'Expense'){
                $cats = ORM::for_table('sys_cats')->where('type','Expense')->find_many();
            }
            else{
                $cats = '0';
                $icat = '0';
            }
            $ui->assign('icat', $icat);
            $ui->assign('cats', $cats);
            $pms = ORM::for_table('sys_pmethods')->find_many();
            $ui->assign('pms', $pms);

            $ui->assign('mdate', $mdate);
            $ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/datepicker/css/datepicker.css"/>
');
            $ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/select2/select2.min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/datepicker/js/bootstrap-datepicker.js"></script>
');
            $ui->assign('xjq', '
 $("#account").select2();
 $("#cats").select2();
  $("#pmethod").select2();
$(\'#dp1\').datepicker({
				format: \'yyyy-mm-dd\'
			});

 ');
            $ui->display('manage-transaction.tpl');
        } else {
            r2(U . 'transactions/list', 'e', $_L['Transaction_Not_Found']);
        }

        break;
    case 'edit-post':
        $id = _post('id');
        if($_app_stage == 'Demo'){
            r2(U . 'transactions/list', 'e', 'Sorry! Editing Transaction is disabled in the demo mode.');
        }
        $d = ORM::for_table('sys_transactions')->find_one($id);
        if($d){
            $cat = _post('cats');
            $pmethod = _post('pmethod');
            $ref = _post('ref');
            $date = _post('date');
            $description = _post('description');
            $msg = '';
            if ($description == '') {
                $msg .= $_L['description_error'] . '<br>';
            }
            if ($msg == '') {
                //find the current balance for this account



                $d->category = $cat;
                $d->method = $pmethod;
                $d->ref = $ref;

                $d->description = $description;
                $d->date = $date;

                $d->save();
                r2(U . 'transactions/list', 's', $_L['transaction_update_successful']);
            } else {
                r2(U . 'transactions/manage/'.$id, 'e', $msg);
            }
        }
        else{
            r2(U . 'transactions/list', 'e', $_L['Transaction_Not_Found']);
        }



        if ($msg == '') {
            $d = ORM::for_table('sys_accounts')->find_one($id);
            if ($d) {

                $d->account = $account;
                $d->description = $description;

                $d->save();

                // now update all transactions with the new name

                r2(U . 'accounts/list', 's', $_L['account_updated_successfully']);
            } else {
                r2(U . 'accounts/list', 'e', $_L['Account_Not_Found']);
            }
        } else {
            r2(U . 'accounts/add', 'e', $msg);
        }

        break;
    case 'delete-post':
        if($_app_stage == 'Demo'){
            r2(U . 'transactions/list', 'e', 'Sorry! Deleting Transaction is disabled in the demo mode');
        }
        $id = _post('id');
        if(Transaction::delete($id)){
            r2(U . 'transactions/list', 's', $_L['transaction_delete_successful']);
        }
        else{
            r2(U . 'transactions/list', 'e', $_L['an_error_occured']);
        }
        break;
    case 'post':

        break;

    default:
        echo 'action not defined';
}