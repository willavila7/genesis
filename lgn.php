<?php require_once("enlace/login.inc"); ?>
<?php include("enlace/funcion.php"); ?>
<?php include("enlace/pgcbadm.inc"); ?>
<?php include("enlace/cabecera.inc"); ?>
  <form class="acceso" action="index.php" method="POST">
  <h1>ACCESO AL SISTEMA</h1>
  <hr>
    <div>
    	<p><input type="text" name="txtusuario" placeholder="Usuario" /></p>
    	<p><input type="password" name="txtclave" placeholder="Password" /></p>
    </div>
    <p class="boton"><input id="acceso" type="submit" name="login" value="Acceder" /></p>
    <a href="">¿Olvidó su contraseña?</a>
  </form>
<?php include("enlace/pie.inc")
/*
<div class="form-group has-feedback">
  <input class="form-control" type="text" name="" value="">
  <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
</div>
*/
?>
