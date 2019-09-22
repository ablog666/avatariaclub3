<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/x-icon" href="{$_theme}/img/favicon.ico">

    <title>{$_title}</title>

    <!-- Bootstrap core CSS -->
    <link href="{$_theme}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="{$_theme}/lib/fa/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="{$_theme}/css/yeti-theme.css" rel="stylesheet">
    <link href="{$_theme}/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    {if $_c['rtl'] eq '1'}
        <link rel="stylesheet" href="ui/lib/css/bootstrap-rtl.min.css">
    {/if}
    {if isset($xheader)}
        {$xheader}
    {/if}
</head>

<body>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top {if $_c['nstyle'] eq 'blue'}navbar-inverse{/if}" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">{$_L['Toggle_navigation']}</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            {if $_c['show-logo'] eq '1'}
                <a class="navbar-brand" href="{$_url}dashboard"><img src="{$_theme}/img/logo-white.png"></a>
            {/if}
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li {if $_sysfrm_menu eq 'dashboard'}class="active"{/if}><a href="{$_url}dashboard">{$_L['Dashboard']}</a></li>

                <li class="dropdown {if $_sysfrm_menu eq 'accounts'}active{/if}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['Accounts']} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="{$_url}accounts/balances">{$_L['Account_Balances']}</a></li>
                        <li><a href="{$_url}accounts/add">{$_L['Ad_An_Account']}</a></li>
                        <li><a href="{$_url}accounts/list"> {$_L['Manage_Accounts']} </a></li>
                    </ul>
                </li>
                <li class="dropdown {if $_sysfrm_menu eq 'transactions'}active{/if}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['Transactions']} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="{$_url}transactions/deposit">{$_L['Add_Deposit']}</a></li>
                        <li><a href="{$_url}transactions/expense">{$_L['Add_Expense']}</a></li>
                        <li><a href="{$_url}transactions/transfer">{$_L['Transfer']}</a></li>
                        <li><a href="{$_url}transactions/list">{$_L['View_Transactions']}</a></li>


                    </ul>
                </li>
                <li class="dropdown {if $_sysfrm_menu eq 'repeating'}active{/if}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['Recurring']} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="{$_url}repeating/income">{$_L['Repeating_Income']}</a></li>
                        <li><a href="{$_url}repeating/expense">{$_L['Repeating_Expense']}</a></li>
                        <li><a href="{$_url}repeating/income-calendar">{$_L['Income_Calendar']}</a></li>
                        <li><a href="{$_url}repeating/expense-calendar">{$_L['Expense_Calendar']}</a></li>
                    </ul>
                </li>

                <li class="dropdown {if $_sysfrm_menu eq 'reports'}active{/if}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['Reports'] } <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="{$_url}reports/statement">{$_L['Account_Statement']}</a></li>
                        <li><a href="{$_url}reports/by-date">{$_L['Reports_by_Date']}</a></li>
                        <li><a href="{$_url}reports/income">{$_L['Income_Reports']}</a></li>
                        <li><a href="{$_url}reports/expense">{$_L['Expense_Reports']}</a></li>
                        <li><a href="{$_url}reports/income-vs-expense">{$_L['Income_Vs_Expense']}</a></li>

                    </ul>
                </li>
               {if ($_user['user_type']) eq 'Admin'}
                   <li class="dropdown {if $_sysfrm_menu eq 'settings'}active{/if}">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['Settings']} <span class="caret"></span></a>
                       <ul class="dropdown-menu" role="menu">
                           <li><a href="{$_url}settings/expense-categories">{$_L['Expense_Categories']}</a></li>
                           <li><a href="{$_url}settings/income-categories">{$_L['Income_Categories']}</a></li>
                           <li><a href="{$_url}settings/payee">{$_L['Payees']}</a></li>
                           <li><a href="{$_url}settings/payer">{$_L['Payers']}</a></li>
                           {*<li><a href="{$_url}tags">Tags</a></li>*}
                           {*<li><a href="{$_url}users">Users</a></li>*}
                           <li><a href="{$_url}settings/pmethods">{$_L['Payment_Methods']}</a></li>
                           <li><a href="{$_url}settings/users">{$_L['Users']}</a></li>
                           <li><a href="{$_url}settings/app">{$_L['Application_Settings']}</a></li>

                       </ul>
                   </li>
               {/if}
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="visible-lg">
                    <a class="navbar-brand" rel="home" href="#calculator" data-toggle="modal" data-target="#calculator">
                        <img style="max-width:100px; margin-top: -7px;"
                             src="{$_theme}/img/calculator-icon.png">
                    </a>
                </li>
                <li class="dropdown {if $_sysfrm_menu eq 'profile'}active{/if}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$_L['My_Account']} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">


                        <li><a href="{$_url}settings/users-edit/{$_user['id']}">{$_L['Edit_Profile']}</a></li>
                        <li><a href="{$_url}settings/change-password">{$_L['Change_Password']}</a></li>
                        <li><a href="{$_url}logout">{$_L['Logout']}</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<div class="container">

    {if isset($notify)}
        {$notify}
    {/if}
