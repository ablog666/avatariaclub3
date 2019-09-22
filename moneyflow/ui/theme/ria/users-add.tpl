{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Add_New_User']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" name="accadd" method="post" action="{$_url}settings/users-post">
                    <div class="form-group">
                        <label for="username">{$_L['Username']}</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="fullname">{$_L['Full_Name']}</label>
                        <input type="text" class="form-control" id="fullname" name="fullname">
                    </div>
                    <div class="form-group">
                        <label for="user_type">{$_L['User_Type']}</label>
                        <select name="user_type" id="user_type" class="form-control">
                            <option value="Admin">{$_L['Full_Administrator']}</option>
                            <option value="Employee">{$_L['Employee']}</option>

                        </select>
                        <span class="help-block">{$_L['user_type_help']}</span>
                    </div>
                    <div class="form-group">
                        <label for="password">{$_L['Password']}</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>

                    <div class="form-group">
                        <label for="cpassword">{$_L['Confirm_Password']}</label>
                        <input type="password" class="form-control" id="cpassword" name="cpassword">
                    </div>


                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                    Or <a href="{$_url}settings/users">{$_L['Cancel']}</a>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
