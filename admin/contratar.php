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
  $_SESSION['idtb']=$_REQUEST['id'];
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
        ROTAR PERSONAL
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
      <form action="../enlace/contratarper.php" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
              <h4><?php UsuarioNombre1($_SESSION['idtb']); ?></h4>
                <div class="form-group">
                    <label>Area</label>
                    <?php CargaSelect('area','2'); ?>
                  </div>
                  <div class="form-group">
                    <label for="">Cargo</label>
                    <?php CargaSelect('cargo','2'); ?>
                  </div>
                  <div class="form-group">
                    <label>Condicion</label>
                      <?php cargaSelect('modalidad','1'); ?>
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
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Fecha de Ingreso (dd/mm/aaaa)</label>
                        <input class="form-control" type="date" name="txtfecha" value="" required placeholder="Ingrese...">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Resolucion</label>
                        <input class="form-control" type="text" name="txtresing" value="" placeholder="Ingrese...">
                      </div>
                    </div>
                  </div>

                <div class="box-footer">
                  <button class="btn btn-primary pull-right" value="">Contratar</button>
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
