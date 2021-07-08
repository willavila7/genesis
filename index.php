<?php
include('enlace/cabecera.inc');
require_once("enlace/login.inc");
 ?>
  <section class="content-header">
    <div class="row">
      <!--img src="imagen/logo.png" alt=""-->
    </div>
  </section>
<div class="login-box">
  <div class="login-box-body">
    <p class="login-box-msg"><h4 class="text-center">ACCESO AL SISTEMA</h4></p>
    <hr><br>
    <form action="index.php" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="txtusuario" placeholder="Usuario">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="txtclave" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <input id="acceso" class="btn btn-primary btn-block btn-flat" type="submit" name="login" value="Acceder" />
        </div>
      </div>
    </form>
    <p class="margin"></p><br>
    <a href="consulta" class="text-center">No tengo cuenta, solo consulta externa.</a>
  </div>
</div>
<?php include("enlace/pie.inc");  ?>
