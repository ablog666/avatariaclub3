{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Add_Deposit']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" class="form-horizontal" action="{$_url}transactions/deposit-post">


                    <div class="form-group">
                        <label for="account" class="col-sm-3 control-label">{$_L['Account']}</label>
                        <div class="col-sm-9">
                            <select id="account" name="account">
                                {foreach $d as $ds}
                                    <option value="{$ds['account']}">{$ds['account']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="dp1" class="col-sm-3 control-label">{$_L['Date']}</label>
                        <div class="col-sm-9">
                            <div class="input-append date" id="date">

                                <div class="input-group">
													<span class="input-group-addon">
													<i class="fa fa-calendar"></i>
													</span>
                                    <input type="text" class="form-control"  value="{$mdate}" name="date" id="dp1">
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">{$_L['Amount']}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payer" class="col-sm-3 control-label">{$_L['Payer']}</label>
                        <div class="col-sm-9">
                            <select id="payer" name="payer">

                                {foreach $prs as $pr}
                                    <option value="{$pr['name']}">{$pr['name']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cats" class="col-sm-3 control-label">{$_L['Category']}</label>
                        <div class="col-sm-9">
                            <select id="cats" name="cats">
                                <option value="Uncategorized">{$_L['Uncategorized']}</option>
                                {foreach $cats as $cat}
                                    <option value="{$cat['name']}">{$cat['name']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pmethod" class="col-sm-3 control-label">{$_L['Payment Method']}</label>
                        <div class="col-sm-9">
                            <select id="pmethod" name="pmethod">

                                {foreach $pms as $pm}
                                    <option value="{$pm['name']}">{$pm['name']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ref" class="col-sm-3 control-label">{$_L['Ref']}#</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="ref" name="ref">
                            <span class="help-block">{$_L['ref_help']}</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">{$_L['Description']}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="description" name="description">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Add_Deposit']}</h3>
            </div>
            <div class="panel-body">
                <table class="table table-bordered sys_table">
                    <thead>
                    <tr>
                        <th width="80%">{$_L['Description']}</th>
                        <th class="text-right">{$_L['Amount']}</th>

                    </tr>
                    </thead>
                    <tbody>
                    {foreach $inc as $incs}
                        <tr>

                            <td><a href="{$_url}transactions/manage/{$incs['id']}">{$incs['description']}</a> </td>
                            <td class="text-right">{$_c['currency_code']} {number_format($incs['amount'],2,$_c['dec_point'],$_c['thousands_sep'])}</td>
                        </tr>
                    {/foreach}
                    </tbody>




                </table>

            </div>
        </div>
    </div>
    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
