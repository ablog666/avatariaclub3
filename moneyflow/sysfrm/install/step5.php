<!DOCTYPE html>
<html lang="en">
<head>
    <title>MoneyFlow Installer</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../ui/theme/sysfrm/img/favicon.ico">
    <style type="text/css">


    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link type='text/css' href='style.css' rel='stylesheet'/>
    <link href="../../ui/theme/sysfrm/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>
<body style='background-color: #FBFBFB;'>
<div id='main-container'>
    <div class='header'>
        <div class="header-box wrapper">
            <div class="hd-logo"><a href="#"><img src="../../ui/theme/sysfrm/img/logo.png" alt="Logo"/></a></div>
        </div>

    </div>
    <!--  contents area start  -->
    <div class="span12">
        <h4> MoneyFlow Installer </h4>

        <p>
            <strong>Congratulations!</strong><br>
            You have just install MoneyFlow!<br>
            To Login Admin Portal:<br>
            Use this link -
            <?php
            $cururl = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            $appurl = str_replace('/install/step5.php', '', $cururl);
            $appurl = str_replace('/sysfrm', '', $appurl);
            echo '<a href="' . $appurl . '">' . $appurl . '</a>';
            ?>
            <br>
            Username: admin<br>
            Password: 123456<br>
            After login, go to Setup -> System Settings to change other Configarations.
        </p>

    </div>
</div>
<!--  contents area end  -->
</div>
<div class="footer">Copyright &copy; 2014 All Rights Reserved<br/>
    <br/>
</div>
</body>
</html>