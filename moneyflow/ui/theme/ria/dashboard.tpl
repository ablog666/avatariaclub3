{include file="sections/header.tpl"}
<div class="row">
    <div class="col-lg-3">
        <div class="widget style1 lazur-bg">
            <div class="row">
                <div class="col-xs-4">
                    <i class="fa fa-plus fa-5x"></i>
                </div>
                <div class="col-xs-8 text-right">
                    <span> {$_L['Income_Today']} </span>
                    <h4 class="font-bold text-white">{$_c['currency_code']} {number_format($ti,2,$_c['dec_point'],$_c['thousands_sep'])}</h4>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3">
        <div class="widget style1 red-bg">
            <div class="row">
                <div class="col-xs-4">
                    <i class="fa fa-minus fa-5x"></i>
                </div>
                <div class="col-xs-8 text-right">
                    <span> {$_L['Expense_Today']} </span>
                    <h4 class="font-bold text-white">{$_c['currency_code']} {number_format($te,2,$_c['dec_point'],$_c['thousands_sep'])}</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="widget style1 lazur-bg">
            <div class="row">
                <div class="col-xs-4">
                    <i class="fa fa-plus fa-5x"></i>
                </div>
                <div class="col-xs-8 text-right">
                    <span> {$_L['Income_This_Month']} </span>
                    <h4 class="font-bold text-white">{$_c['currency_code']} {number_format($mi,2,$_c['dec_point'],$_c['thousands_sep'])}</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="widget style1 red-bg">
            <div class="row">
                <div class="col-xs-4">
                    <i class="fa fa-minus fa-5x"></i>
                </div>
                <div class="col-xs-8 text-right">
                    <span> {$_L['Expense_This_Month']} </span>
                    <h4 class="font-bold text-white">{$_c['currency_code']} {number_format($me,2,$_c['dec_point'],$_c['thousands_sep'])}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
<hr>
    <div class="row">

        <div class="widget-1 col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">{$_L['Financial_Balances']}</h3>

                </div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <th>{$_L['Account']}</th>
                        <th class="text-right">{$_L['Balance']}</th>
                        {foreach $d as $ds}
                            <tr>
                                <td>{$ds['account']}</td>
                                <td class="text-right"><span {if $ds['balance'] < 0}class="text-red"{/if}>{$_c['currency_code']} {number_format($ds['balance'],2,$_c['dec_point'],$_c['thousands_sep'])}</span></td>
                            </tr>
                        {/foreach}



                    </table>
                </div>
            </div>
        </div> <!-- Widget-1 end-->

        <div class="widget-4 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">{$_L['Income_Vs_Expense']} ({$mnth})</h3>
                </div>
                <div class="panel-body">
                    <div id="income-vs-expense" ></div>
                </div>
            </div>
        </div> <!-- Widget-2 end-->
    </div> <!-- Row end-->


    <div class="row">
         <!-- Widget-3 end-->
        <div class="widget-2 col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">{$_L['Latest_5_Income']}</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <th>{$_L['Date']}</th>
                        <th>{$_L['Description']}</th>
                        <th class="text-right">{$_L['Amount']}</th>
                        {foreach $inc as $incs}
                            <tr>
                                <td>{$incs['date']}</td>
                                <td><a href="{$_url}transactions/manage/{$incs['id']}">{$incs['description']}</a> </td>
                                <td class="text-right">{$_c['currency_code']} {number_format($incs['amount'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                            </tr>
                        {/foreach}



                    </table>
                </div>


            </div>
        </div>
        <div class="widget-4 col-md-6">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">{$_L['Latest_5_Expense']}</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <th>{$_L['Date']}</th>
                        <th>{$_L['Description']}</th>
                        <th class="text-right">{$_L['Amount']}</th>
                        {foreach $exp as $exps}
                            <tr>
                                <td>{$exps['date']}</td>
                                <td><a href="{$_url}transactions/manage/{$exps['id']}">{$exps['description']}</a> </td>
                                <td class="text-right">{$_c['currency_code']} {number_format($exps['amount'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                            </tr>
                        {/foreach}



                    </table>
                </div>
            </div>
        </div> <!-- Widget-4 end-->
    </div> <!-- Row end-->
<div class="row">
    <div class="widget-3 col-md-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Income_Graph_This_Year']}</h3>
            </div>
            <div class="panel-body">
                <div id="income-graph"></div>
            </div>
        </div>
    </div> <!-- Widget-3 end-->

    <div class="widget-4 col-md-6">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Expense_Graph_This_Year']}</h3>
            </div>
            <div class="panel-body">
                <div id="expense-graph" ></div>
            </div>
        </div>
    </div> <!-- Widget-4 end-->
</div>
<div class="row">
    <div class="widget-3 col-md-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Income_Calendar']}</h3>

            </div>
            <div class="panel-body">



                <div id="icalendar"></div>
            </div>
        </div>
    </div> <!-- Widget-3 end-->

    <div class="widget-4 col-md-6">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Expense_Calendar']}</h3>
            </div>
            <div class="panel-body">



                <div id="calendar"></div>
            </div>
        </div>
    </div> <!-- Widget-4 end-->
</div>
     <!-- Row end-->

    {include file="sections/footer.tpl"}
