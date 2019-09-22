{include file="sections/header.tpl"}

<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Edit_Payment_Methods']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" name="accadd" method="post" action="{$_url}settings/pmethods-edit-post">
                    <div class="form-group">
                        <label for="name">{$_L['Name']}</label>

                        <input type="text" class="form-control" id="name" name="name" value="{$c['name']}">
                    </div>



                    <input type="hidden" name="id" value="{$c['id']}">
                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                </form>
            </div>
        </div>
    </div> <!-- Widget-1 end-->
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Delete']}</h3>
            </div>
            <div class="panel-body">

                <a href="{$_url}settings/pmethods-delete/{$c['id']}" class="btn btn-danger">{$_L['Delete']}</a>

            </div>
        </div>
    </div>
    <!-- Widget-2 end-->
</div> <!-- Row end-->


<!-- Row end-->


<!-- Row end-->

{include file="sections/footer.tpl"}
