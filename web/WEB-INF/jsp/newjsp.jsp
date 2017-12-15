<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Popup Login & Signup with jQuery</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,700italic,400italic'>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>

        <link href="../resources/css/style1login.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <!--<a id="modal_trigger" href="#modal" class="btn">Click here to Login or register</a>-->

            <div id="modal" class="popupContainer" style="display:none;">
                <header class="popupHeader">
                    <span class="header_title">Login</span>
                    <span class="modal_close"><i class="fa fa-times"></i></span>
                </header>

                <section class="popupBody">
                    <!-- Social Login -->
                    <div class="social_login">
                        <div class="">
                            <a href="#" class="social_box fb">
                                <span class="icon"><i class="fa fa-facebook"></i></span>
                                <span class="icon_title">Connect with Facebook</span>

                            </a>

                            <a href="#" class="social_box google">
                                <span class="icon"><i class="fa fa-google-plus"></i></span>
                                <span class="icon_title">Connect with Google</span>
                            </a>
                        </div>

                        <div class="centeredText">
                            <span>Or use your Email address</span>
                        </div>

                        <div class="action_btns">
                            <div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
                            <div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
                        </div>
                    </div>

                    <!-- Username & Password Login form -->
                    <div class="user_login">
                        <form action ="AccountServlet" method="POST">
                            <label>Email / Username</label>
                            <input type="text" name="txtUser" value=""/>
                            <br />

                            <label>Password</label>
                            <input type="password" name="txtPass" value=""/>
                            <br />

                            <div class="action_btns">
                                <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
                                <div class="one_half last"><input type="submit" name="btnAction" value="Login" class="btn btn_red"/></div>
                            </div>
                        </form>

                    </div>

                    <!-- Register Form -->
                    <div class="user_register">
                        <form>
                            <label>Full Name</label>
                            <input type="text" name="txtName" value="" />
                            <br />

                            <label>Email Address</label>
                            <input type="email" name="txtUser" value="" />
                            <br />

                            <label>Password</label>
                            <input type="password" name="txtPass" value=""/>
                            <br />


                            <div class="action_btns">
                                <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
                                <div class="one_half last"><input type="submit" name="btnAction" value="Register" class="btn btn_red"/></div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://andwecode.com/wp-content/uploads/2015/10/jquery.leanModal.min_.js'></script>
        <script src="../resources/js/indexlogin.js" type="text/javascript"></script>

    </body>
</html>