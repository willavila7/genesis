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
  }else{  SinConexion();}
  include('../enlace/hedrcabadm.inc');
  MenuPermiso($dato,'1');
   ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        REPORTE DE DOCUMENTOS DISTRIBUIDOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <section class="content-header">
      <p class="margin"></p>
    </section>
    <form action="reportepdfdis.php" method="post">
    <section class="content-header">
      <div class="callout callout-warning">
        <h4>IMPORTANTE</h4>
        <p>La impresion de esta hoja, corresponde al cuaderno de cargo, por lo que una vez
          recepcionados los documentos por la oficina correspondiente no se mostraran de nuevo para su impresion,
          debido a esto se debe tomar con toda seriedad dicho documento.</p>
      </div>
      <p class="margin">
        <div class="row ">
          <div class="col-md-6">
            <label>Fecha de Inicio del Reporte (dd/mm/aaaa)</label>
            <input class="form-control" type="date" name="txtfecini" required value="<?php fecha(); ?>">
          </div>
          <div class="col-md-6">
            <label>Fecha Fin del Reporte (dd/mm/aaaa)</label>
            <input class="form-control" type="date" name="txtfecfin" required value="<?php fecha(); ?>">
          </div>
        </div>
      </p>
      <p class="margin"></p>
    </section>
    <section class="content">
      <br>
      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red">
              <i class="fa fa-file-pdf-o"></i>
            </span>
            <div class="info-box-content">
              <span class="info-box-text">Formato PDF</span>
              <span class="info-box-text">.</span>
              <button type="submit" class="btn btn-default" name="consultar"><i class="fa fa-print"></i> Descargar</button>
            </div>
          </div>
        </div>
        <!--<div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-blue">
              <i class="fa fa-file-word-o"></i>
            </span>
            <div class="info-box-content">
              <span class="info-box-text">Formato WORD</span>
              <span class="info-box-text">.</span>
            </div>
          </div>
        </div>-->
      </div>
    </section>
    </form>

  <!-- /.content-wrapper -->
</div>
  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>
 

    </div>
    <!-- ./wrapper -->
    <?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
