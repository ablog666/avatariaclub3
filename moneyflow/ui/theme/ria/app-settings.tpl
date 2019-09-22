{include file="sections/header.tpl"}
<div class="row">
    <div class="widget-1 col-md-6 col-sm-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">{$_L['Application_Settings']}</h3>
            </div>
            <div class="panel-body">
                <form role="form" name="accadd" method="post" action="{$_url}settings/app-post">
                    <div class="form-group">
                        <label for="company">{$_L['App_Name']}</label>
                        <input type="text" class="form-control" id="company" name="company"
                               value="{$_c['CompanyName']}">
                        <span class="help-block">{$_L['App_Name_Help_Text']}</span>
                    </div>
                    {*<div class="form-group">*}
                    {*<label for="currency_code">Currency Code</label>*}
                    {*<input type="text" class="form-control" id="currency_code" name="currency_code" value="{$_c['currency_code']}">*}
                    {*</div>*}

                    {*<div class="form-group">*}
                        {*<label for="theme">Theme</label>*}
                        {*<select name="theme" id="theme" class="form-control">*}
                            {*<option value="sysfrm" {if $_c['theme'] eq 'sysfrm'}selected="selected" {/if}>Sysfrm*}
                            {*</option>*}
                            {*<option value="ria" {if $_c['theme'] eq 'ria'}selected="selected" {/if}>Ria</option>*}

                        {*</select>*}
                    {*</div>*}
                    {*Removed theme support from this version, if you need theme support uncomment above line and remove the line below*}
                    <input type="hidden" name="theme" value="ria">

                    <div class="form-group">
                        <label for="nstyle">{$_L['Theme_Color']}</label>
                        <select name="nstyle" id="nstyle" class="form-control">
                            <option value="dark" {if $_c['nstyle'] eq 'dark'}selected="selected" {/if}>{$_L['Dark']}</option>
                            <option value="blue" {if $_c['nstyle'] eq 'blue'}selected="selected" {/if}>{$_L['Blue']}</option>


                        </select>
                    </div>

                    <div class="form-group">
                        <label for="tzone">{$_L['Timezone']}</label>
                        <select name="tzone" id="tzone">
                            {foreach $tlist as $value => $label}
                                <option value="{$value}"
                                        {if $_c['timezone'] eq $value}selected="selected" {/if}>{$label}</option>
                            {/foreach}


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="lan">{$_L['Default_Language']}</label>
                        <select class="form-control" name="lan" id="lan">
                            <option value="arabic" {if $_c['language'] eq 'arabic'} selected="selected" {/if}>Arabic</option>
                            <option value="bengali" {if $_c['language'] eq 'bengali'} selected="selected" {/if}>Bengali</option>
                            <option value="azerbaijani" {if $_c['language'] eq 'azerbaijani'} selected="selected" {/if}>Azerbaijani</option>
                            <option value="catalan" {if $_c['language'] eq 'catalan'} selected="selected" {/if}>Catalan</option>
                            <option value="croatian" {if $_c['language'] eq 'croatian'} selected="selected" {/if}>Croatian</option>
                            <option value="czech" {if $_c['language'] eq 'czech'} selected="selected" {/if}>Czech</option>
                            <option value="danish" {if $_c['language'] eq 'danish'} selected="selected" {/if}>Danish</option>
                            <option value="dutch" {if $_c['language'] eq 'dutch'} selected="selected" {/if}>Dutch</option>
                            <option value="en-us" {if $_c['language'] eq 'en-us'} selected="selected" {/if}>English</option>
                            <option value="farsi" {if $_c['language'] eq 'farsi'} selected="selected" {/if}>Farsi</option>
                            <option value="french" {if $_c['language'] eq 'french'} selected="selected" {/if}>French</option>
                            <option value="german" {if $_c['language'] eq 'german'} selected="selected" {/if}>German</option>
                            <option value="hungarian" {if $_c['language'] eq 'hungarian'} selected="selected" {/if}>Hungarian</option>
                            <option value="italian" {if $_c['language'] eq 'italian'} selected="selected" {/if}>Italian</option>
                            <option value="norwegian" {if $_c['language'] eq 'norwegian'} selected="selected" {/if}>Norwegian</option>
                            <option value="portuguese-br" {if $_c['language'] eq 'portuguese-br'} selected="selected" {/if}>Portuguese-br</option>
                            <option value="portuguese-pt" {if $_c['language'] eq 'portuguese-pt'} selected="selected" {/if}>Portuguese-pt</option>
                            <option value="russian" {if $_c['language'] eq 'russian'} selected="selected" {/if}>Russian</option>
                            <option value="spanish" {if $_c['language'] eq 'spanish'} selected="selected" {/if}>Spanish</option>
                            <option value="swedish" {if $_c['language'] eq 'swedish'} selected="selected" {/if}>Swedish</option>
                            <option value="turkish" {if $_c['language'] eq 'turkish'} selected="selected" {/if}>Turkish</option>
                            <option value="ukranian" {if $_c['language'] eq 'ukranian'} selected="selected" {/if}>Ukranian</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="rtl">{$_L['Theme_Style']}</label>
                        <select class="form-control" name="rtl" id="rtl">
                            <option value="0" {if $_c['rtl'] eq '0'} selected="selected" {/if}>LTR</option>
                            <option value="1" {if $_c['rtl'] eq '1'} selected="selected" {/if}>RTL</option>


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dec_point">{$_L['Decimal_Point']}</label>
                        <input type="text" class="form-control" id="dec_point" name="dec_point"
                               value="{$_c['dec_point']}">

                    </div>
                    <div class="form-group">
                        <label for="thousands_sep">{$_L['Thousands_Separator']}</label>
                        <input type="text" class="form-control" id="thousands_sep" name="thousands_sep"
                               value="{$_c['thousands_sep']}">

                    </div>

                    <div class="form-group">
                        <label for="currency_code">{$_L['Currency_Code']}</label>
                        <input type="text" class="form-control" id="currency_code" name="currency_code"
                               value="{$_c['currency_code']}">
                        <span class="help-block">{$_L['currency_help']}</span>
                    </div>
                    <button type="submit" class="btn btn-primary">{$_L['Submit']}</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Widget-1 end-->

    <!-- Widget-2 end-->
</div>


{include file="sections/footer.tpl"}
