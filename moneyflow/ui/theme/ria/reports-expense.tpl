{include file="sections/header.tpl"}

<div class="row">
    <!-- Widget-1 end-->
    <div class="col-md-12" id="result">
        <h4>{$_L['Expense_Summary']}</h4>
        <hr>
        <h5>{$_L['Total Expense']}: {$_c['currency_code']} {number_format($a,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <h5>{$_L['Total_Expense_This_Month']}: {$_c['currency_code']} {number_format($m,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <h5>{$_L['Total_Expense_This_Week']}: {$_c['currency_code']} {number_format($w,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>
        <h5>{$_L['Total_Expense_Last_30_days']}: {$_c['currency_code']} {number_format($m3,2,$_c['dec_point'],$_c['thousands_sep'])}</h5>


        <hr>
        <h4>{$_L['Last_20_Expense']}</h4>
        <hr>
        <table class="table table-striped table-bordered">
            <th>{$_L['Date']}</th>
            <th>{$_L['Account']}</th>
            <th>{$_L['Type']}</th>
            <th>{$_L['Category']}</th>
            <th class="text-right">{$_L['Amount']}</th>
            <th>{$_L['Payee']}</th>



            <th>{$_L['Description']}</th>
            <th class="text-right">{$_L['Dr']}.</th>

            <th class="text-right">{$_L['Balance']}</th>

            {foreach $d as $ds}
                <tr>
                    <td>{$ds['date']}</td>
                    <td>{$ds['account']}</td>
                    <td>{$ds['type']}</td>
                    <td>{$ds['category']}</td>
                    <td class="text-right">{$_c['currency_code']} {number_format($ds['amount'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                    <td>{$ds['payee']}</td>



                    <td>{$ds['description']}</td>
                    <td class="text-right">{$_c['currency_code']} {number_format($ds['dr'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>

                    <td class="text-right"><span {if $ds['bal'] < 0}class="text-red"{/if}>{$_c['currency_code']} {number_format($ds['bal'],2,$_c['dec_point'],$_c['thousands_sep'])}</span></td>


                </tr>
            {/foreach}



        </table>
        <hr>
        <h4>{$_L['Monthly_Expense_Graph']}</h4>
        <hr>
        <div id="placeholder" class="flot-placeholder"></div>
        <hr>
    </div>
    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
