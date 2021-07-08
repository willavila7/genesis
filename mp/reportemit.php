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
  MenuPermiso($dato,'1');
   ?>
  <!-- Main Header -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        RECIBIR DOCUMENTOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>

    <!-- Contenido -->
<section class="content">
<form class="" action="../enlace/regrecepcion.php" method="post">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-primary">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <label>Fecha de Inicio del Reporte (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
              <input type="date" class="form-control" name="txtfecini" required value="<?php fecha(); ?>">
            </div>
            <div class="col-md-6">
              <label>Fecha Fin del Reporte (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
              <input type="date" class="form-control" name="txtfecfin" required value="<?php fecha(); ?>">
            </div>
          </div>
        </div>
      </div>
    </div>    
  </div>
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
                  <th>OBSERVACION</th>
                  <th>FECHA</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_reportemit where idarea='$ar';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fechingsist'];?></td>
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
    <div class="box-footer">
      <button  type="submit" name="devolver" class="btn btn-primary">Devolver</button>
      <button  type="submit" name="recepcionar" class="btn btn-primary pull-right">Recepcionar</button>
    </div>
</form>
</section>
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
