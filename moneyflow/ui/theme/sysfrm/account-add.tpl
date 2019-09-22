{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Add_New_Account']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" name="accadd" method="post" action="{$_url}accounts/add-post">
                    <div class="form-group">
                        <label for="account">{$_L['Account_Title']}</label>
                        <input type="text" class="form-control" id="account" name="account">
                    </div>
                    <div class="form-group">
                        <label for="description">{$_L['Description']}</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                    <div class="form-group">
                        <label for="balance">{$_L['initial_balance']}</label>
                        <input type="text" class="form-control" id="balance" name="balance">
                    </div>


                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
