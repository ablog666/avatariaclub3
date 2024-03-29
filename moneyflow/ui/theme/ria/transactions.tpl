{include file="sections/header.tpl"}

<div class="row">

    <div class="table-responsive">
        <table class="table table-bordered" style="background: #ffffff">
            <th>{$_L['Date']}</th>
            <th>{$_L['Account']}</th>
            <th>{$_L['Type']}</th>
            <th>{$_L['Category']}</th>
            <th class="text-right">{$_L['Amount']}</th>
            <th>{$_L['Payer']}</th>
            <th>{$_L['Payee']}</th>
            <th>{$_L['Method']}</th>
            <th>{$_L['Ref']}</th>
            <th>{$_L['Description']}</th>
            <th class="text-right">{$_L['Dr']}.</th>
            <th class="text-right">{$_L['Cr']}.</th>
            <th class="text-right">{$_L['Balance']}</th>
            <th>{$_L['Manage']}</th>
            {foreach $d as $ds}
                <tr>
                    <td>{$ds['date']}</td>
                    <td>{$ds['account']}</td>
                    <td>{$ds['type']}</td>
                    <td>{$ds['category']}</td>
                    <td class="text-right">{number_format($ds['amount'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                    <td>{$ds['payer']}</td>
                    <td>{$ds['payee']}</td>
                    <td>{$ds['method']}</td>
                    <td>{$ds['ref']}</td>
                    <td>{$ds['description']}</td>
                    <td class="text-right">{$_c['currency_code']} {number_format($ds['dr'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                    <td class="text-right">{$_c['currency_code']} {number_format($ds['cr'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                    <td class="text-right"><span {if $ds['bal'] < 0}class="text-red"{/if}>{$_c['currency_code']} {number_format($ds['bal'],2,$_c['dec_point'],$_c['thousands_sep'])}</span></td>
                    <td><a href="{$_url}transactions/manage/{$ds['id']}" class="btn btn-primary btn-xs">Manage</a></td>
                </tr>
            {/foreach}



        </table>
    </div>
    {$paginator['contents']} <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
