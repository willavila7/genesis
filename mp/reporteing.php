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
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        REPORTE DE DOCUMENTOS INGRESADOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <form action="reportepdfing.php" method="post">
    <section class="content-header">
      <p class="margin">
        <div class="row ">
          <div class="col-md-6">
            <label>Fecha de Inicio del Reporte (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
            <input class="form-control" type="date" name="txtfecini" required value="<?php fecha(); ?>">
          </div>
          <div class="col-md-6">
            <label>Fecha Fin del Reporte (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
            <input class="form-control" type="date" name="txtfecfin" required value="<?php fecha(); ?>">
          </div>
        </div>
      </p>
      <p class="margin"></p>
    </section>
    <section class="content-header">
      <p class="margin"></p>
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
      </div>
    </section>
    </form>
    <section class="content">
      <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>EXP.</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <th>FOLIOS</th>
                  <th>SE ADJUNTA</th>
                  <th>FECHA</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="select * from vta_rptdocdis where idarea='$ar' and idderiva is null;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['expediente'];?></p></td>
                  <td><p><?php echo $fila['documento'];?></p></td>
                  <td><p><?php echo $fila['asunto'];?></p></td>
                  <td><p><?php echo $fila['folios'];?></p></td>
                  <td><p><?php echo $fila['observacion'];?></p></td>
                  <td><p><?php echo $fila['fechingsist'];?></p></td>
                </tr>
                <?php
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    </section>
    </div>
  <?php include('../enlace/piecopy.inc'); ?>
 
    </div>
    <?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
