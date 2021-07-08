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
  $idanio=$_REQUEST['idan'];
  $_SESSION['idanio']=$idanio;
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
      <form action="../enlace/regactadm.php" class="" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-body">
            <h4>AÑO</h4>
              <div class="form-group">
                <label>Año</label> <label class="text-red">(*)</label>
                <input class="form-control" type="text" name="txtanio" required value="<?php ActDatostabla('anio',$idanio,'1'); ?>" maxlength="4" onkeypress="return controltag(event)">
              </div>
              <div class="form-group">
                <label>Nombre</label> <label class="text-red">(*)</label>
                <input class="form-control" type="text" name="txtnombre" required value="<?php ActDatostabla('anio',$idanio,'2'); ?>">
              </div>
              <div class="box-footer">
                <button class="btn btn-primary pull-right" name="actanio" type="submit">Actualizar</button>
              </div>
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
