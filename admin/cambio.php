<!DOCTYPE html>

<html>
<head>
  <?php
      include('../enlace/pgcbadm.inc');
    session_start();
    require_once('../enlace/conexion.inc');
    include('../enlace/funcion.php');
?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<?php
if(isset($_SESSION['usuario'])){
    $dato=$_SESSION['usuario'];
  }else{  SinConexion(); }
  include('../enlace/hedrcabadm.inc');
  include('../enlace/ltadm.inc');
 ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        TRAMITE DOCUMENTARIO
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Administrador</li>
      </ol>
    </section>

    <!-- Contenido -->
    <div class="row">
      <form action="../enlace/regcambio.php" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
              <h4>CAMBIO DE CLAVE</h4>
                <div class="form-group">
                  <label for="">Clave Antigua</label> <label class="text-red">(*)</label>
                  <input class="form-control" type="password" name="txtantigua" id="txtantigua" required value="">
                </div>
                <div class="form-group">
                  <label for="">Clave Nueva</label> <label class="text-red">(*)</label>
                  <input class="form-control" type="password" name="txtnueva" id="txtnueva" required value="">
                </div>
                <div class="form-group">
                  <label for="">Repita la nueva clave</label> <label class="text-red">(*)</label>
                  <input class="form-control" type="password" name="txtrepita" id="txtrepita" required value="">
                </div>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" href="javascript:;" onclick="cambiocladm($('#txtantigua').val(),$('#txtnueva').val(),$('#txtrepita').val());return false;"
                  value="Cambiar">Cambiar</button>
                </div>
                <span id="resultado"></span>
              </div>
          </div>
        </div>
    </form>

  </div>

    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>
  
</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>

</body>
</html>
