<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>{$_title} - Login</title>
    <link rel="shortcut icon" type="image/x-icon" href="{$_theme}/img/favicon.ico">

    <link href="{$_theme}/css/logincss.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div class="container">

    <div class="wrapper">

        <div>
            <div class="logo"><img src="{$_theme}/img/logo.png" width="150" height="44" alt="logo" /></div>





            <div>

                <form class="login" method="post" action="{$_url}login/post">
                    <fieldset>

                        <div class="row">
                            <input type="text" class="login" id="username" name="username" placeholder="Username" />

                        </div>
                        <div class="row">
                            <input type="password" class="password" id="password" name="password" placeholder="Password"/>

                        </div>
                        <div class="row">
                            <button class="btn btn-primary" name="login" type="submit">Admin Login</button>

                        </div>

                    </fieldset>
                </form>
                <div style="clear: both; color:#F00"></div>
                {if isset($notify)}
                    {$notify}
                {/if}
            </div>

        </div>

    </div>
</div>
</body>
</html>
