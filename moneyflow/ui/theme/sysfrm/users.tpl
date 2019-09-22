{include file="sections/header.tpl"}

<div class="row">
    <div class="widget-1 col-md-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">Manage Users</h3>
            </div>
            <div class="panel-body">
                <a href="{$_url}settings/users-add" class="btn btn-primary">Add New User</a>
                <br>
                <br>
                <table class="table table-striped table-bordered">
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>{$_L['Type']}</th>
                    <th>{$_L['Manage']}</th>
                    {foreach $d as $ds}
                        <tr>
                            <td>{$ds['username']}</td>
                            <td>{$ds['fullname']}</td>
                            <td>{$ds['user_type']}</td>
                            <td>
                                <a href="{$_url}settings/users-edit/{$ds['id']}" class="btn btn-warning">{$_L['Edit']}</a>
                                {if ($_user['username']) neq ($ds['username'])}
                                    <a href="{$_url}settings/users-delete/{$ds['id']}"  id="{$ds['id']}" class="btn btn-danger cdelete">{$_L['Delete']}</a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}


                </table>
            </div>
        </div>
    </div> <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
