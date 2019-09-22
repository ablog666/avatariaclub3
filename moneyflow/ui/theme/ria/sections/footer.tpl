<div class="modal fade" id="calculator" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog calc-modal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Calculator</h4>
            </div>
            <div class="modal-body">
                <div class="calculator"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>


</div>
</div>
</div>


</div>
<div class="clearfix"></div>
</div>

<!-- Javascript files -->
<!-- jQuery -->
<script src="{$_theme}/js/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="{$_theme}/js/bootstrap.min.js"></script>
<!-- jQuery UI -->
<script src="{$_theme}/js/jquery-ui.min.js"></script>
<!-- Date Time Picker JS -->

<script src="{$_theme}/js/bootstrap-wysihtml5.min.js"></script>


<!-- jQuery slim scroll -->
<script src="{$_theme}/js/jquery.slimscroll.min.js"></script>
<!-- Data Tables JS -->
<script src="{$_theme}/js/jquery.dataTables.min.js"></script>

<script src="{$_theme}/js/respond.min.js"></script>
<!-- HTML5 Support for IE -->
<script src="{$_theme}/js/html5shiv.js"></script>
<!-- Custom JS -->
<script src="ui/lib/js/bootbox.min.js"></script>
<script src="{$_theme}/lib/calculator/jquery.blackcalculator-1.0.1.min.js"></script>
<script src="{$_theme}/js/custom.js"></script>

<!-- Javascript for this page -->
{if isset($xfooter)}
    {$xfooter}
{/if}
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        {literal}
        $('.calculator').blackCalculator({type:'advanced', allowKeyboard:true, css:'ui/theme/sysfrm/lib/calculator/'});
        {/literal}
        {if isset($xjq)}
        {$xjq}
        {/if}

    });

</script>

</body>
</html>
