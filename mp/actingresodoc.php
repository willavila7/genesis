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
  $idexped=$_REQUEST['id'];
  $_SESSION['idex']=$idexped;
  if(isset($_SESSION['usuario'])){
      $dato=$_SESSION['usuario'];
  }else{  SinConexion();}
  include('../enlace/hedrcabadm.inc');
  MenuPermiso($dato,'1');
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        EDITAR DOCUMENTO
        <small><?php AreaxUsuario($dato); ?> 
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <!-- Contenido -->
    <div class="row">
      <form class="" name="ingresodoc" action="../enlace/regactingresodoc.php" method="post" enctype="multipart/form-data">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-6">
                    <label>Expediente</label>
                    <input class="form-control" type="text" name="txtexpediente" value="<?php ActDatosDoc($dato,$idexped,'1'); ?>">
                  </div>
                  <div class="col-md-6">
                    <label>Documento</label>
                    <input class="form-control" type="text" name="txtdocumento" onKeyUp="this.value = this.value.toUpperCase();" value="<?php ActDatosDoc($dato,$idexped,'3'); ?>">
                  </div>
                </div>
                <!--
                <div class="form-group">
                  <label>Subir Archivo</label>
                  <input type="file" name="archivos" accept="application/pdf">
                  <p class="help-block"><em>(Ejemplo: OFICINA_TITULODOCUMENTO.pdf)</em></p>
                </div>
                -->
                <div class="form-group">
                  <label>Asunto</label>
                  <textarea class="form-control" rows="2" name="txtasunto" required onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese..."><?php ActDatosDoc($dato,$idexped,'4'); ?></textarea>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <label>Folios</label>
                    <input class="form-control" type="text" name="txtfolios" maxlength="5" onkeypress="return soloNumeros(event)" value="<?php ActDatosDoc($dato,$idexped,'5'); ?>" required placeholder="Ingrese...">
                  </div>
                  <div class="col-md-6">
                    <label>Observacion</label>
                    <input class="form-control" type="text" name="txtobservacion" onKeyUp="this.value = this.value.toUpperCase();" value="<?php ActDatosDoc($dato,$idexped,'8'); ?>" placeholder="Ingrese...">
                  </div>
                </div>
              </div>
          </div>
        </div>
        <div class="box-footer">
          <button class="btn btn-primary pull-right" type="submit" data-toggle="modal" data-target="#modusuario">GUARDAR</button>
        </div>
      </div>
      <span id="resultado"></span>
    </form>

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
