<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Title here -->
    <title>{$_title} - {$_L['Login']}</title>
    <!-- Description, Keywords and Author -->

    <meta name="description" content="Your description">
    <meta name="keywords" content="Your,Keywords">
    <meta name="author" content="ResponsiveWebInc">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Styles -->
    <!-- Bootstrap CSS -->
    <link href="{$_theme}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font awesome CSS -->
    <link href="{$_theme}/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Color CSS -->
    <link href="{$_theme}/css/less-style.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{$_theme}/css/style.css" rel="stylesheet">
<style type="text/css">
    .outer-page {
        background: #FFFFFF;

    }
</style>
    <!-- Favicon -->
    <link rel="shortcut icon" href="#">
</head>

<body>

<div class="outer-page">

    <!-- Login page -->
    <div class="login-page">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified">
            <li><a href="#login" data-toggle="tab" class="br-lblue"><i class="fa fa-leaf"></i> MoneyFlow</a></li>

        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane fade active in" id="login">
                {if isset($notify)}
                    {$notify}
                {/if}
                <!-- Login form -->

                <form role="form"  method="post" action="{$_url}login/post">
                    <div class="form-group">
                        <label for="email">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember Me Next Time
                        </label>
                    </div>
                    <button type="submit" class="btn btn-info btn-sm" name="login">Admin Login</button>

                </form>

            </div>


        </div>

    </div>

</div>

<!-- Javascript files -->
<!-- jQuery -->
<script src="{$_theme}/js/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="{$_theme}/js/bootstrap.min.js"></script>
<!-- Respond JS for IE8 -->
<script src="{$_theme}/js/respond.min.js"></script>
<!-- HTML5 Support for IE -->
<script src="{$_theme}/js/html5shiv.js"></script>

<!-- Javascript for this page -->

<!-- Javascript for this page -->



</body>
</html>