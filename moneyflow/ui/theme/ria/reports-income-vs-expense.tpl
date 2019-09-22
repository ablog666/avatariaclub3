{include file="sections/header.tpl"}

<div class="row">
    <!-- Widget-1 end-->
    <div class="col-md-12" id="result">
        <h4>{$_L['Income_Vs_Expense']}</h4>
        <hr>
        <h5>{$_L['Total_Income']}: {$_c['currency_code']} {number_format($ai,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <h5>{$_L['Total Expense']}: {$_c['currency_code']} {number_format($ae,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <hr>
        {$_L['Income']} - {$_L['Expense']} = {$_c['currency_code']} {number_format($aime,2,$_c['dec_point'],$_c['thousands_sep'])}
        <hr>
        <h5>{$_L['Total_Expense_This_Month']}: {$_c['currency_code']} {number_format($mi,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <h5>{$_L['Total_Income_This_Month']}: {$_c['currency_code']} {number_format($me,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <hr>
        {$_L['Income']} - {$_L['Expense']} = {$_c['currency_code']} {number_format($mime,2,$_c['dec_point'],$_c['thousands_sep'])}
        <hr>



        <h4>{$_L['Income_Vs_Expense_This_Year']}</h4>
        <hr>
        <div id="placeholder" class="flot-placeholder"></div>
        <hr>
    </div>
    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
