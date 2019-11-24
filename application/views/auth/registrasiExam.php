<!DOCTYPE html>
<html lang="en" class="body-full-height">
    <head>        
        <title>Registrasi </title>            
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
                    <div class="login-title"><strong>Registrasi Siswa</strong>, Try Out Online Indonesia College Suarabaya.</div>
                    <form action="<?= site_url('Auth/regis_submit') ?>" class="form-horizontal" method="post">
                    <div class="form-group">
                    <div class="col-md-12">
                         <label for="nama">Nama Lengkap</label>
                            <div class="input-group"> 
                                <div class="input-group-addon">
                                    <span class="fa fa-user"></span>
                                </div>                               
                                 <input type="text" class="form-control" name="student_name" placeholder="Nama Lengkap" required>
                            </div>
                    </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="no_pendaftaran">No.Pendaftaran</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-newspaper-o  "></span>
                                </div>
                                <input type="text" class="form-control" name="student_nis" placeholder="No.Pendaftaran" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12">
                             <label for="password">Password</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-lock"></span>
                                </div>                                
                                <input type="password" class="form-control" name="student_password" placeholder="Password" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                    <div class="col-md-12">
                         <label for="email">Email</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-envelope"></span>
                                </div>                                
                                <input type="email" class="form-control" name="student_email" placeholder="info@youremail.com">
                            </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                         <label for="phone">Phone</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-phone"></span>
                                </div>                                
                                 <input type="number" class="form-control" name="student_phone" placeholder="Phone" required>
                            </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                         <label>Kelas</label>
                    <select class="form-control" name="id_class">
                           <?php foreach ($dataClasses as $row => $value): ?>
                             <option value="<?= $value->id_class ?>"><?= $value->class_name ?></option>
                           <?php endforeach ?>
                         </select>
                     </div>
                 </div>
                 
                 <div class="form-group">
                 <div class="col-md-12">
                     <label>Foto Siswa</label>
                          <input type="file" name="student_photo" id="student_photo" class="form-control">
                          <div class="imagePreview" id="imagePreview"></div>
                 </div>
             </div>
                 </div>
                 

                    <div class="form-group">
                        <div class="col-md-12">
                            <button class="btn btn-primary btn-lg btn-block">Submit</button>
                        </div>
                    </div>
                    </form>
                    
                </div>
            </div>
            
        </div>

  </body>
</html>