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
  $idarea=$_REQUEST['idar'];
  $_SESSION['idarea']=$idarea;
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
              <h4>NUEVA AREA</h4>
              <p class="margin">
                <div class="row">
                  <div class="col-md-4">
                    <label>Area</label> <label class="text-red">(*)</label>
                    <input class="form-control" type="text" name="txtarea" required value="<?php ActDatosAre($idarea,'1'); ?>" placeholder="Ingrese...">
                  </div>
                  <div class="col-md-4">
                    <label>Local</label> <label class="text-red">(*)</label>
                    <?php generaLocal(); ?>
                  </div>
                  <div class="col-md-4">
                    <label>Area Inmediata Superior</label>
                    <?php cargaSelect('area','2'); ?>
                  </div>
                </div>
              </p>
              <p class="margin">
                <div class="row">
                  <div class="col-md-6">
                    <label>Siglas</label> <label class="text-red">(*)</label>
                    <input class="form-control" type="text" name="txtsiglas" required value="<?php ActDatosAre($idarea,'2'); ?>" placeholder="Ingrese...">
                  </div>
                  <div class="col-md-6">
                    <label>E-mail</label>
                    <input class="form-control" type="text" name="txtcorreo" value="<?php ActDatosAre($idarea,'5'); ?>" placeholder="@ejemplo.com">
                  </div>
                </div>
              </p>
              <p class="margin">
                <div class="row">
                  <div class="col-md-6">
                    <label>Telefono</label>
                    <input class="form-control" type="text" name="txtelefono" value="<?php ActDatosAre($idarea,'3'); ?>" data-inputmask="'mask': '999-999-999'" data-mask>
                  </div>
                  <div class="col-md-6">
                    <label>Anexo</label>
                    <input class="form-control" type="text" name="txtanexo" value="<?php ActDatosAre($idarea,'4'); ?>" maxlength="3" onkeypress="return controltag(event)" placeholder="Ingrese...">
                  </div>
                </div>
              </p>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="actarea" type="submit">Actualizar</button>
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
