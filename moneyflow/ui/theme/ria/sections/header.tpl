<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Title here -->
    <title>{$_title}</title>
    <!-- Description, Keywords and Author -->
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your,Keywords">
    <meta name="author" content="sysfrm">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Styles -->
    <!-- Bootstrap CSS -->
    <link href="{$_theme}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font awesome CSS -->
    <link href="{$_theme}/css/font-awesome.min.css" rel="stylesheet">
    <!-- jQuery gritter -->

    <!-- Custom Color CSS -->
    <link href="{$_theme}/css/less-style.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{$_theme}/css/style.css" rel="stylesheet">

        <link href="{$_theme}/css/{$_c['nstyle']}.css" rel="stylesheet">


   {if $_c['rtl'] eq '1'}
        <link rel="stylesheet" href="ui/lib/css/bootstrap-rtl.min.css">
       <style type="text/css">
           .mainbar {

               margin-right: 210px;
               margin-left: 0;

           }
       </style>
    {/if}
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{$_theme}/img/favicon.ico">
    {if isset($xheader)}
        {$xheader}
    {/if}
</head>

<body>

<div class="outer">

    <div class="sidebar">

        <div class="sidey">

            <!-- Logo -->
            <div class="logo">
                <h1><a href="{$_url}dashboard"><i class="fa fa-leaf br-red"></i> {$_L['MoneyFlow']} </a></h1>
            </div>

            <!-- Sidebar navigation starts -->

            <!-- Responsive dropdown -->
            <div class="sidebar-dropdown"><a href="#" class="br-red"><i class="fa fa-bars"></i></a></div>

            <div class="side-nav">

                <div class="side-nav-block">
                    <!-- Sidebar heading -->
                    <h4>Main</h4>
                    <!-- Sidebar links -->
                    <ul class="list-unstyled">

                        <li><a href="{$_url}dashboard" {if $_sysfrm_menu eq 'dashboard'}class="active"{/if}><i class="fa fa-desktop"></i> {$_L['Dashboard']}</a></li>


                        <!-- Mainmenu with submenu -->
                        <li class="has_submenu">
                            <a href="#" {if $_sysfrm_menu eq 'accounts'}class="active"{/if}><i class="fa fa-building-o"></i> {$_L['Accounts']} <span class="nav-caret fa fa-caret-down"></span></a>
                            <!-- Submenu -->
                            <ul class="list-unstyled">
                                <li><a href="{$_url}accounts/balances"><i class="fa fa-angle-double-right"></i> {$_L['Account_Balances']}</a></li>
                                <li><a href="{$_url}accounts/add"><i class="fa fa-angle-double-right"></i> {$_L['Ad_An_Account']}</a></li>
                                <li><a href="{$_url}accounts/list"><i class="fa fa-angle-double-right"></i> {$_L['Manage_Accounts']}</a></li>

                            </ul>
                        </li>
                        <li class="has_submenu">
                            <a href="#" {if $_sysfrm_menu eq 'transactions'}class="active"{/if}><i class="fa fa-file-text-o"></i> {$_L['Transactions']}<span class="nav-caret fa fa-caret-down"></span></a>
                            <!-- Submenu -->
                            <ul class="list-unstyled">
                                <li><a href="{$_url}transactions/deposit"><i class="fa fa-angle-double-right"></i> {$_L['Add_Deposit']}</a></li>
                                <li><a href="{$_url}transactions/expense"><i class="fa fa-angle-double-right"></i> {$_L['Add_Expense']}</a></li>
                                <li><a href="{$_url}transactions/transfer"><i class="fa fa-angle-double-right"></i> {$_L['Transfer']}</a></li>
                                <li><a href="{$_url}transactions/list"><i class="fa fa-angle-double-right"></i> {$_L['View_Transactions']}</a></li>

                            </ul>
                        </li>

                        {*<li class="has_submenu">*}
                            {*<a href="#" {if $_sysfrm_menu eq 'budgets'}class="active"{/if}><i class="fa fa-file-text-o"></i> {$_L['Budgets']}<span class="nav-caret fa fa-caret-down"></span></a>*}
                            {*<!-- Submenu -->*}
                            {*<ul class="list-unstyled">*}

                                {*<li><a href="{$_url}budgets/view"><i class="fa fa-angle-double-right"></i> {$_L['View_Budgets']}</a></li>*}
                                {*<li><a href="{$_url}budgets/set"><i class="fa fa-angle-double-right"></i> {$_L['Set_Budgets']}</a></li>*}

                            {*</ul>*}
                        {*</li>*}
                        <li class="has_submenu">
                            <a href="#" {if $_sysfrm_menu eq 'repeating'}class="active"{/if}><i class="fa fa-exchange"></i> {$_L['Recurring']}<span class="nav-caret fa fa-caret-down"></span></a>
                            <!-- Submenu -->
                            <ul class="list-unstyled">
                                <li><a href="{$_url}repeating/income"><i class="fa fa-angle-double-right"></i> {$_L['Repeating_Income']}</a></li>
                                <li><a href="{$_url}repeating/expense"><i class="fa fa-angle-double-right"></i> {$_L['Repeating_Expense']}</a></li>
                                <li><a href="{$_url}repeating/income-calendar"><i class="fa fa-angle-double-right"></i> {$_L['Income_Calendar']}</a></li>
                                <li><a href="{$_url}repeating/expense-calendar"><i class="fa fa-angle-double-right"></i> {$_L['Expense_Calendar']}</a></li>

                            </ul>
                        </li>

                        <li class="has_submenu">
                            <a href="#" {if $_sysfrm_menu eq 'reports'}class="active"{/if}><i class="fa fa-bar-chart-o"></i> {$_L['Reports']}<span class="nav-caret fa fa-caret-down"></span></a>
                            <!-- Submenu -->
                            <ul class="list-unstyled">
                                <li><a href="{$_url}reports/statement"><i class="fa fa-angle-double-right"></i> {$_L['Account_Statement']}</a></li>
                                <li><a href="{$_url}reports/by-date"><i class="fa fa-angle-double-right"></i> {$_L['Reports_by_Date']}</a></li>
                                <li><a href="{$_url}reports/income"><i class="fa fa-angle-double-right"></i> {$_L['Income_Reports']}</a></li>
                                <li><a href="{$_url}reports/expense"><i class="fa fa-angle-double-right"></i> {$_L['Expense_Reports']}</a></li>
                                <li><a href="{$_url}reports/income-vs-expense"><i class="fa fa-angle-double-right"></i> {$_L['Income_Vs_Expense']}</a></li>
                                <li><a href="{$_url}reports/categories"><i class="fa fa-angle-double-right"></i> {$_L['Reports_Categories']}</a></li>
                                <li><a href="{$_url}reports/payees"><i class="fa fa-angle-double-right"></i> {$_L['Reports_Payees']}</a></li>
                                <li><a href="{$_url}reports/payers"><i class="fa fa-angle-double-right"></i> {$_L['Reports_Payers']}</a></li>
                            </ul>
                        </li>
                        {if ($_user['user_type']) eq 'Admin'}
                            <li class="has_submenu">
                                <a href="#" {if $_sysfrm_menu eq 'settings'}class="active"{/if}><i class="fa fa-cogs"></i> {$_L['Settings']}<span class="nav-caret fa fa-caret-down"></span></a>
                                <!-- Submenu -->
                                <ul class="list-unstyled">
                                    <li><a href="{$_url}settings/expense-categories"><i class="fa fa-angle-double-right"></i> {$_L['Expense_Categories']}</a></li>
                                    <li><a href="{$_url}settings/income-categories"><i class="fa fa-angle-double-right"></i> {$_L['Income_Categories']}</a></li>
                                    <li><a href="{$_url}settings/payee"><i class="fa fa-angle-double-right"></i> {$_L['Payees']}</a></li>
                                    <li><a href="{$_url}settings/payer"><i class="fa fa-angle-double-right"></i> {$_L['Payers']}</a></li>
                                    {*<li><a href="{$_url}tags">Tags</a></li>*}
                                    {*<li><a href="{$_url}users">Users</a></li>*}
                                    <li><a href="{$_url}settings/pmethods"><i class="fa fa-angle-double-right"></i> {$_L['Payment_Methods']}</a></li>
                                    <li><a href="{$_url}settings/users"><i class="fa fa-angle-double-right"></i> {$_L['Users']}</a></li>
                                    <li><a href="{$_url}settings/app"><i class="fa fa-angle-double-right"></i> {$_L['Application_Settings']}</a></li>

                                </ul>
                            </li>
                            {/if}

                        <li><a href="{$_url}settings/users"><i class="fa fa-user"></i> {$_L['Users']}</a></li>


                    </ul>
                </div>

                <div class="side-nav-block">
                    <h4>Quick Access</h4>
                    <ul class="list-unstyled">
                        <li><a href="{$_url}accounts/balances"><i class="fa fa-list"></i> {$_L['Account_Balances']}</a></li>
                        <li><a href="{$_url}transactions/deposit"><i class="fa fa-plus-circle"></i> {$_L['Add_Deposit']}</a></li>
                        <li><a href="{$_url}transactions/expense"><i class="fa fa-minus-circle"></i> {$_L['Add_Expense']}</a></li>
                        <li><a href="{$_url}reports/by-date"><i class="fa fa-calendar"></i> {$_L['Reports_by_Date']}</a></li>
                        <li><a href="{$_url}transactions/list"><i class="fa fa-th-list"></i> {$_L['View_Transactions']}</a></li>
                        <li><a href="{$_url}settings/app"><i class="fa fa-cog"></i> {$_L['Application_Settings']}</a></li>
                        <li><a href="{$_url}logout"><i class="fa fa-sign-out"></i> {$_L['Logout']}</a></li>
                    </ul>
                </div>


            </div>

            <!-- Sidebar navigation ends -->

        </div>
    </div>

    <div class="mainbar">

        <div class="main-head">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-4 col-xs-6">
                        <!-- Page title -->
                        <h2>{$_pagehead}</h2>
                    </div>

                    <div class="col-md-3 col-sm-4 col-xs-6">
                        <!-- Search block -->

                    </div>

                    <div class="col-md-3 col-sm-4 hidden-xs">
                        <!-- Notifications -->
                        <div class="head-noty text-center">

                            <!-- Notifications -->


                            <!-- Messages -->

                            <a href="#calculator" data-toggle="modal" data-target="#calculator">
                                <img style="max-width:100px; margin-top: -7px;"
                                     src="{$_theme}/img/calculator-icon.png">
                            </a>



                            <!-- Users -->


                        </div>
                        <div class="clearfix"></div>
                    </div>


                    <div class="col-md-3 hidden-sm hidden-xs">
                        <!-- Head user -->
                        <div class="head-user dropdown pull-right">
                            <a href="#" class="btn btn-primary" data-toggle="dropdown" id="profile">
                                <!-- Icon
                                <i class="fa fa-user"></i>  -->



                                <!-- User name -->
{$_L['Welcome']} {$_user['fullname']} !
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <!-- Dropdown -->
                            <ul class="dropdown-menu" aria-labelledby="profile">
                                <li><a href="{$_url}settings/users-edit/{$_user['id']}">{$_L['Edit_Profile']}</a></li>
                                <li><a href="{$_url}settings/change-password">{$_L['Change_Password']}</a></li>
                                <li><a href="{$_url}logout">{$_L['Logout']}</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

        </div>

        <div class="main-content">

            <div class="container">

                {if isset($notify)}
                    {$notify}
                {/if}





