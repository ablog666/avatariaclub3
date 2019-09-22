{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Transfer']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" action="{$_url}transactions/transfer-post">
                    <div class="form-group">
                        <label for="account">{$_L['From']} {$_L['Account']}</label>
                        <select id="account" name="account">
                            {foreach $d as $ds}
                                <option value="{$ds['account']}">{$ds['account']}</option>
                            {/foreach}


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="taccount">{$_L['To']} {$_L['Account']}</label>
                        <select id="taccount" name="taccount">
                            <option value="">{$_L['Select An Account']}</option>
                            {foreach $d as $ds}
                                <option value="{$ds['account']}">{$ds['account']}</option>
                            {/foreach}


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dp1">{$_L['Date']}</label>
                        <div class="input-append date" id="date" data-date-format="dd-mm-yyyy">

                            <div class="input-group">
													<span class="input-group-addon">
													<i class="glyphicon glyphicon-calendar"></i>
													</span>
                                <input type="text" class="form-control"  value="{$mdate}" name="date" id="dp1">
                            </div>


                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount">{$_L['Amount']}</label>
                        <input type="text" class="form-control" id="amount" name="amount">
                    </div>





                    <div class="form-group">
                        <label for="pmethod">{$_L['Payment Method']}</label>

                        <select id="pmethod" name="pmethod">

                            {foreach $pms as $pm}
                                <option value="{$pm['name']}">{$pm['name']}</option>
                            {/foreach}


                        </select>
                    </div>

                    <div class="form-group">
                        <label for="ref">{$_L['Ref']}#</label>
                        <input type="text" class="form-control" id="ref" name="ref">
                        <span class="help-block">{$_L['ref_help']}</span>
                    </div>

                    <div class="form-group">
                        <label for="description">{$_L['Description']}</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>



                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}