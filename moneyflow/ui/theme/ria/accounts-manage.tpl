{include file="sections/header.tpl"}

<div class="row">
    <div class="widget-1 col-md-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Manage_Accounts']}</h3>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <th>{$_L['Account']}</th>
                    <th>{$_L['Description']}</th>
                    <th>{$_L['Manage']}</th>
                    {foreach $d as $ds}
                        <tr>
                            <td>{$ds['account']}</td>
                            <td>{$ds['description']}</td>
                            <td>
                                <a href="{$_url}accounts/edit/{$ds['id']}" class="btn btn-warning">{$_L['Edit']}</a>
                                <a href="{$_url}accounts/delete/{$ds['id']}" id="{$ds['id']}" class="btn btn-danger cdelete">{$_L['Delete']}</a>
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
