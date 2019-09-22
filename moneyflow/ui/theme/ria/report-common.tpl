{include file="sections/header.tpl"}

<div class="row">
    <div class="col-md-12">


        <div id="printable">
            <h4>{$_L['Statement']} [{$fdate} - {$tdate}]</h4>
            <table class="table table-bordered" style="background: #ffffff">
                <th>{$_L['Date']}</th>




                <th>{$_L['Description']}</th>
                <th class="text-right">{$_L['Dr']}.</th>
                <th class="text-right">{$_L['Cr']}.</th>


                {foreach $d as $ds}
                    <tr>
                        <td>{$ds['date']}</td>
                        <td>{$ds['description']}</td>


                        <td class="text-right">{$_c['currency_code']} {number_format($ds['dr'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                        <td class="text-right">{$_c['currency_code']} {number_format($ds['cr'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>


                    </tr>
                {/foreach}



            </table>
        </div>


    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
