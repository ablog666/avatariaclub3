{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Reports_Categories']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" method="post" action="{$_url}reports/category-view">
                    <div class="form-group">
                        <label for="cat">Select Category</label>
                        <select id="cat" name="cat">
                            <option value="Uncategorized">Uncategorized</option>
                            {foreach $d as $ds}
                                <option value="{$ds['name']}">{$ds['name']}</option>
                            {/foreach}


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dp1">From Date</label>
                        <div class="input-append date" id="date" data-date-format="dd-mm-yyyy">

                            <div class="input-group">
													<span class="input-group-addon">
													<i class="fa fa-calendar"></i>
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
													<i class="fa fa-calendar"></i>
													</span>
                                <input type="text" class="form-control"  value="{$mdate}" name="tdate" id="dp2">
                            </div>


                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">{$_L['View']}</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}