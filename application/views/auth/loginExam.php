<!DOCTYPE html>
<html lang="en" class="body-full-height">
    <head>        
        <title>Login </title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="<?= base_url('exam-assets/css/theme-default.css') ?>">
        <script src="<?= base_url('assets/downloaded/jquery.min.js') ?>"></script>
        <!-- EOF CSS INCLUDE -->                                      
    </head>
    <body>
        <script type="text/javascript">
            $(function(){
                setTimeout(function(){
                    $("#messageTimeout").hide(200);
                },4000);
            });
        </script>
        <?php if ($this->session->flashdata('text')): ?>
            <div class="alert alert-<?= $this->session->flashdata('type'); ?>" style="border-radius:0px" id="messageTimeout">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <center><strong><?= $this->session->flashdata('title'); ?></strong> <?= $this->session->flashdata('text'); ?></center>
            </div>
        <?php endif ?>
        <div class="login-container login-v2">
            
            <div class="login-box animated fadeInDown">
                <div class="login-body">
                    <div class="login-title"><strong>Login Siswa</strong>, Try Out Online Indonesia College Suarabaya.</div>
                    <form action="<?= site_url('Auth/exam') ?>" class="form-horizontal" method="post">
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-user"></span>
                                </div>
                                <input type="number" class="form-control" placeholder="No.Pendaftaran" name="student_nis" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-lock"></span>
                                </div>                                
                                <input type="password" class="form-control" placeholder="Password" required name="student_password">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <button class="btn btn-primary btn-lg btn-block">Login</button>
                        </div>
                    </div>
                    </form>
                    
                </div>
                 <p>
                        Belum punya akun? Silahkan Daftar <a href="<?php echo base_url('Auth/registrasi') ?>">di sini</a>.
                </p>
                <div class="login-footer">
                    <div class="pull-left">
                        &copy; 2019 - All Right Reserved
                    </div>
                </div>
            </div>
            
        </div>
        
    </body>
</html>