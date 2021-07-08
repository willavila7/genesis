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
      $idempleado=$_REQUEST['idtb'];
      $_SESSION['idempleado']=$idempleado;
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
        <small>Administrador
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
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>DNI</label> <label class="text-red">(*)</label> 
                      <input class="form-control" type="text" name="txtdni" maxlength="8" onkeypress="return controltag(event)" value="<?php ActDatosEmp($idempleado,'1') ?>" required>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>RUC</label>
                      <input class="form-control" type="text" name="txtruc" maxlength="11" onkeypress="return controltag(event)" value="<?php ActDatosEmp($idempleado,'2') ?>">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Apellidos</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtapellidos" required value="<?php ActDatosEmp($idempleado,'3'); ?>">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Nombres</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtnombres" required value="<?php ActDatosEmp($idempleado,'4'); ?>">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Fecha de Nacimiento</label> <label class="text-red">(*)</label>
                  <input class="form-control" type="date" name="txtfechnac" value="<?php ActDatosEmp($idempleado,'5') ?>" placeholder="Ingrese...">
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="box box-info">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-4">
                    <label>Modalidad</label> <label class="text-red">(*)</label>
                    <?php CargaSelect('modalidad','1'); ?>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <label>Fecha de Ingreso</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="date" name="txtfechingreso" required value="<?php ActDatosEmp($idempleado,'16'); ?>">
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <label>Resolucion</label>
                      <input class="form-control" type="text" name="txtresing" value="<?php ActDatosEmp($idempleado,'17'); ?>">
                    </div>
                  </div>
                </div>
                <label>Responsable</label> <label class="text-red">(*)</label>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtres" value="0">
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
              </div>
          </div>
        </div>
    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" name="actempleado" type="submit">Actualizar</button>
    </div>
    </form>

  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>
  
</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
