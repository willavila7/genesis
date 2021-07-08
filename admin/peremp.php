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
  $_SESSION['idpr']=$_REQUEST['idpr'];
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
        CREAR TRABAJADOR
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Administrador</li>
      </ol>
    </section>

    <!-- Contenido -->
    <form action="../enlace/regadm.php" method="post">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
              <h4><?php UsuarioNombre2($_SESSION['idpr']); ?></h4>
              <div class="row">
                <div class="col-md-6">
                  <label>Area</label>
                  <?php cargaSelect('area','2'); ?>
                </div>
                <div class="col-md-6">
                  <label>Cargo</label>
                  <?php cargaSelect('cargo','2'); ?>
                </div>
              </div>
              <p class="margin"></p>
              <div class="row">
                <div class="col-lg-4">
                  <div class="form-group">
                    <label>Condicion</label>
                    <?php cargaSelect('modalidad','1'); ?>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="form-group">
                    <label>Fecha de Ingreso (dd/mm/aaaa)</label>
                    <input class="form-control" type="date" name="txtfechingreso" required value="">
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="form-group">
                    <label>Resolucion</label>
                    <input class="form-control" type="text" name="txtresing" value="" placeholder="Ingrese...">
                  </div>
                </div>
              </div>
              <label>Responsable</label>
              <div class="row">
                <div class="col-lg-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <input type="radio" name="rbtres" value="0" checked>
                    </span>
                    <input type="text" class="form-control" placeholder="NO" disabled>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <input type="radio" name="rbtres" value="1">
                    </span>
                    <input type="text" class="form-control" placeholder="SI" disabled>
                  </div>
                </div>
                <span id="resultado"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="box-footer">
        <button class="btn btn-primary pull-right" name="regemper" type="submit">Guardar</button>
      </div>
  </form>

    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Foote -->
  <?php include('../enlace/piecopy.inc'); ?>
  
</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>

</body>
</html>
