<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>CONSULTA EXPEDIENTE</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <script src="js/jquery.js"></script>
  <script src="js/function.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="../imagen/logo.ico" />
  <?php
  include ('../enlace/funcion.php');
  require_once ('../enlace/conexion.inc');
  include ('../enlace/conexpseg.inc');?>
</head>
<body class="skin-blue layout-boxed sidebar-mini">
<div class="wrapper bg-gray disabled color-palette">
    <div class="login-box ">
      <div class="login-box-body">
        <p class="login-box-msg">CONSULTA DE EXPEDIENTES</p>
        <form action="index.php" method="post">
          <div class="form-group has-feedback">
            <label>DNI</label>
            <input type="text" class="form-control" name="txtdni" onkeypress="return soloNumeros(event)" maxlength="8" placeholder="Ingrese...">
          </div>
          <div class="form-group has-feedback">
            <label>Numero de Expediente</label>
            <input type="text" class="form-control" name="txtexpediente" onkeypress="return soloNumeros(event)" maxlength="5" placeholder="Ingrese...">
          </div>
          <div class="row">
            <div class="col-xs-6 col-md-6">
              <input class="btn btn-primary btn-block btn-flat" type="submit" name="consulta" value="Seguimiento" />
            </div>
            <div class="col-xs-6 col-md-6">
              <a class="btn btn-danger btn-block btn-flat" href="../enlace/logout.php">Salir</a>
            </div>
          </div>
        </form>
      </div>
    </div>
</div>
<br>
<div class='wrapper bg-gray disabled color-palette'>

    <?php if (isset($_SESSION['documento'])) {$documento=$_SESSION['documento'];}
    else { $documento="";}
    seguimiento($documento); ?>

</div>
</body>
</html>
