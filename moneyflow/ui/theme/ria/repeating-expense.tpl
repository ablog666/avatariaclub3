{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Add_Repeating_Expense']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" action="{$_url}repeating/expense-post">
                    <div class="form-group">
                        <label for="description">{$_L['Description']}</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                    <div class="form-group">
                        <label for="amount">{$_L['Amount']}</label>
                        <input type="text" class="form-control" id="amount" name="amount">
                    </div>

                    <div class="form-group">
                        <label for="frequency">{$_L['Frequency']}</label>
                        <select class="form-control" id="frequency" name="frequency">
                            <option value="Monthly">{$_L['Monthly']}</option>
                            <option value="Weekly">{$_L['Weekly']}</option>
                            <option value="Bi Weekly">{$_L['Bi_Weekly']}</option>
                            <option value="Weekly">{$_L['Everyday']}</option>
                            <option value="Every 30 Days">{$_L['Every_30_Days']}</option>
                            <option value="Every 2 Month">{$_L['Every_2_Month']}</option>
                            <option value="Quarterly">{$_L['Quarterly']}</option>
                            <option value="Every 6 Month">{$_L['Every_6_Month']}</option>
                            <option value="Yearly">{$_L['Yearly']}</option>
                            <option value="Once Only">{$_L['Once_Only']}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="np">{$_L['Number_of_Payment']}</label>
                        <input type="text" class="form-control" id="np" name="np">
                        <span class="help-block">{$_L['frequency_help']}</span>
                    </div>
                    <div class="form-group">
                        <label for="account">{$_L['Account']}</label>
                        <select id="account" name="account">
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
													<i class="fa fa-calendar"></i>
													</span>
                                <input type="text" class="form-control"  value="{$mdate}" name="date" id="dp1">
                            </div>


                        </div>
                    </div>


                    <div class="form-group">
                        <label for="payer">{$_L['Payee']}</label>

                        <select id="payee" name="payee">

                            {foreach $prs as $pr}
                                <option value="{$pr['name']}">{$pr['name']}</option>
                            {/foreach}


                        </select>
                    </div>

                    <div class="form-group">
                        <label for="cats">{$_L['Category']}</label>
                        <select id="cats" name="cats">
                            <option value="Uncategorized">{$_L['Uncategorized']}</option>
                            {foreach $cats as $cat}
                                <option value="{$cat['name']}">{$cat['name']}</option>
                            {/foreach}


                        </select>
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





                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
