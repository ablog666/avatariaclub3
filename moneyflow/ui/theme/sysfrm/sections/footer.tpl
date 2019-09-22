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
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="{$_theme}/js/jquery.min.js"></script>
<script src="{$_theme}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="{$_theme}/lib/calculator/jquery.blackcalculator-1.0.1.min.js"></script>
<script src="{$_theme}/lib/sysfrm/test.js"></script>
<script src="ui/lib/js/bootbox.min.js"></script>
<!-- Custom js-->
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
