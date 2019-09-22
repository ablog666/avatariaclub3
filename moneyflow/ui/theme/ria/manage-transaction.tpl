{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Edit']} {$_L['Transaction']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" class="form-horizontal" action="{$_url}transactions/edit-post">


                    <div class="form-group">
                        <label for="account" class="col-sm-3 control-label">{$_L['Account']}</label>
                        <div class="col-sm-9">
                            <select id="account" name="account" disabled>
                                {foreach $d as $ds}
                                    <option value="{$ds['account']}" {if $ds['account'] eq $t['account']}selected="selected" {/if}>{$ds['account']}</option>
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
                                    <input type="text" class="form-control"  value="{$t['date']}" name="date" id="dp1">
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">{$_L['Amount']}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount" value="{$t['amount']}" disabled>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="cats" class="col-sm-3 control-label">{$_L['Category']}</label>
                        <div class="col-sm-9">
                            <select id="cats" name="cats">
                                <option value="Uncategorized">{$_L['Uncategorized']}</option>
                                {foreach $cats as $cat}
                                    <option value="{$cat['name']}" {if $cat['name'] eq $t['category']}selected="selected" {/if}>{$cat['name']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pmethod" class="col-sm-3 control-label">{$_L['Payment Method']}</label>
                        <div class="col-sm-9">
                            <select id="pmethod" name="pmethod">

                                {foreach $pms as $pm}
                                    <option value="{$pm['name']}" {if $pm['name'] eq $t['method']}selected="selected" {/if}>{$pm['name']}</option>
                                {/foreach}


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ref" class="col-sm-3 control-label">{$_L['Ref']}#</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="ref" name="ref" value="{$t['ref']}">
                            <span class="help-block">{$_L['ref_help']}</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">{$_L['Description']}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="description" name="description" value="{$t['description']}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <input type="hidden" name="id" value="{$t['id']}">
                            <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->
    <div class="widget-2 col-md-6 col-sm-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Delete']} {$_L['Transaction']}</h3>
            </div>
            <div class="panel-body">
                <p>{$_L['tr_delete_warning']}</p>
                <form role="form" method="post" action="{$_url}transactions/delete-post">





                    <input type="hidden" name="id" value="{$t['id']}">

                    <button type="submit" class="btn btn-danger">{$_L['Delete']}</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
