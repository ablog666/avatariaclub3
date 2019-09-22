<?php
_auth();
$ui->assign('_title', 'Dashboard- '. $config['CompanyName']);
$ui->assign('_pagehead', '<i class="fa fa-desktop lblue"></i> Dashboard');
$user = User::_info();
$ui->assign('_user', $user);
$d = ORM::for_table('sys_accounts')->order_by_desc('balance')->limit(10)->find_many();
$tbal = ORM::for_table('sys_accounts')->sum('balance');
$tbal = number_format($tbal,'2','.','');
$ui->assign('d',$d);
$ui->assign('tbal',$tbal);
$fdate = date('Y-m-01');
$tdate = date('Y-m-t');
//first day of month
$first_day_month = date('Y-m-01');
$mdate = date('Y-m-d');
$month_n = date('n');
$out = array();
$d = ORM::for_table('sys_repeating');
$d->where_gte('date', $fdate);
$d->where_lte('date', $tdate);
$d->where('type','Expense');
$d->where('status','Uncleared');
$d->order_by_asc('date');
$d->limit(5);
$rx =  $d->find_many();
$ui->assign('rx',$rx);
$d = ORM::for_table('sys_transactions')->where('type','Expense')->limit(5)->order_by_desc('id')->find_many();
$ui->assign('exp',$d);
$d = ORM::for_table('sys_transactions')->where('type','Income')->limit(5)->order_by_desc('id')->find_many();
$ui->assign('inc',$d);
$ui->assign('mnth',date('F Y'));

$month_n = date('n');
$mi = ORM::for_table('sys_transactions')->where_gte('date',$first_day_month)->where_lte('date',$mdate)->sum('cr');
if($mi == ''){
    $mi = '0.00';
}
$ui->assign('mi',$mi);
$me = ORM::for_table('sys_transactions')->where_gte('date',$first_day_month)->where_lte('date',$mdate)->sum('dr');
if($me == ''){
    $me = '0.00';
}
$ui->assign('me',$me);
$m = ORM::for_table('sys_transactions')->where('date',$mdate)->sum('cr');
if($m == ''){
    $m = '0.00';
}
$ui->assign('ti',$m);
$m = ORM::for_table('sys_transactions')->where('date',$mdate)->sum('dr');
if($m == ''){
    $m = '0.00';
}
$ui->assign('te',$m);
$array = array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
$till = $month_n - 1;
$gstring = '';
$egstring = '';
for ($m=0; $m<=$till; $m++) {
    $mnth = $array[$m];
    $incg = ORM::for_table('sys_transactions')->where_gte('date',date('Y-m-d',strtotime("first day of $mnth")))
        ->where_lte('date',date('Y-m-d',strtotime("last day of $mnth")))->sum('cr');
    if($incg == ''){
        $incg = '0';
    }

    $expg = ORM::for_table('sys_transactions')->where_gte('date',date('Y-m-d',strtotime("first day of $mnth")))
        ->where_lte('date',date('Y-m-d',strtotime("last day of $mnth")))->sum('dr');

    if($expg == ''){
        $expg = '0';
    }

    $gstring .= '{
           month: \''.$mnth.'\', income: '.$incg.'
        }, ';

    $egstring .= '{
           month: \''.$mnth.'\', expense: '.$expg.'
        }, ';

}
//set the color

$gstring = rtrim($gstring,',');
$ui->assign('xheader', '
<link rel="stylesheet" type="text/css" href="' . $_theme . '/lib/calendar/css/calendar.min.css"/>
');
$ui->assign('xfooter', '
<script type="text/javascript" src="' . $_theme . '/lib/morris/raphael-2.1.0.min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/morris/morris.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/calendar/components/underscore/underscore-min.js"></script>
<script type="text/javascript" src="' . $_theme . '/lib/calendar/js/calendar.js"></script>

');

$ui->assign('xjq', '



		Morris.Bar({
        element: \'income-graph\',
        data: [
        '.$gstring.'
       ],
       xkey: \'month\',
    ykeys: [\'income\'],
    labels: [\'Income\'],
     resize: true,
    barColors: [\'#23c6c8\', \'#cacaca\'],
    barRatio: 0.4,
    xLabelAngle: 35,
    hideHover: \'auto\'
    });

    Morris.Bar({
        element: \'expense-graph\',
        data: [
        '.$egstring.'
       ],
       xkey: \'month\',
    ykeys: [\'expense\'],
    labels: [\'Expense\'],
    barRatio: 0.4,
    resize: true,
    barColors: [\'#ed5565\', \'#cacaca\'],
    xLabelAngle: 35,
    hideHover: \'auto\'
    });

     Morris.Donut({
        element: \'income-vs-expense\',
        data: [{
            label: "Income",
            value: '.$mi.'
        }, {
            label: "Expense",
            value: '.$me.'
        }],
        resize: true,
        colors: [\'#23c6c8\', \'#ed5565\']
    });

 '."var calendar = $('#calendar').calendar({
tmpl_path: 'ui/theme/sysfrm/lib/calendar/tmpls/',
events_source: '".U."ajax.expense-calendar',
onAfterViewLoad: function(view) {
    ".'$'."('#month').text(this.getTitle());
".'$'."('.btn-group button').removeClass('active');
}
});".'

$(\'.btn-group button[data-calendar-nav]\').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.navigate($this.data(\'calendar-nav\'));
		});
	});
'.
    "
var calendar = $('#icalendar').calendar({
tmpl_path: 'ui/theme/sysfrm/lib/calendar/tmpls/',
events_source: '".U."ajax.income-calendar',
onAfterViewLoad: function(view) {
".'$'."('#month').text(this.getTitle());
".'$'."('.btn-group button').removeClass('active');
}
});".'

$(\'.btn-group button[data-calendar-nav]\').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.navigate($this.data(\'calendar-nav\'));
		});
	});');
$ui->display('dashboard.tpl');