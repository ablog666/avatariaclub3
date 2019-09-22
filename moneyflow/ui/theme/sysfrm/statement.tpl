{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">View Account Statement</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" action="{$_url}reports/statement-view">
                    <div class="form-group">
                        <label for="account">{$_L['Account']}</label>
                        <select id="account" name="account">
                            {foreach $d as $ds}
                                <option value="{$ds['account']}">{$ds['account']}</option>
                            {/foreach}


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dp1">From Date</label>
                        <div class="input-append date" id="date" data-date-format="dd-mm-yyyy">

                            <div class="input-group">
													<span class="input-group-addon">
													<i class="glyphicon glyphicon-calendar"></i>
													</span>
                                <input type="text" class="form-control"  value="{$tdate}" name="fdate" id="dp1">
                            </div>


                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dp2">To Date</label>
                        <div class="input-append date" id="tdate" data-date-format="dd-mm-yyyy">

                            <div class="input-group">
													<span class="input-group-addon">
													<i class="glyphicon glyphicon-calendar"></i>
													</span>
                                <input type="text" class="form-control"  value="{$mdate}" name="tdate" id="dp2">
                            </div>


                        </div>
                    </div>



                    <div class="form-group">
                        <label for="stype">Type</label>
                        <select id="stype" name="stype" class="form-control">
                            <option value="all" selected="selected">All Transactions</option>
                            <option value="credit">Credit</option>
                            <option value="debit">Debit</option>

                        </select>
                    </div>


                    <button type="submit" class="btn btn-primary">View Statement</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
