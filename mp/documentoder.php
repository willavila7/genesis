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
        DOCUMENTOS DERIVADOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>

    <!-- Contenido -->
    <form action="reportepdfdis.php" method="post">
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
                  <th>FECHA</th>
                  <th>DESTINO</th>
                  <th>PROVEIDO</th>
                  <th>OBSERVACION</th>
                  <th>ESTADO</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_rptdocdis where idarea='$ar' and idestadoexp<3 and idderiva is not null;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['fechderiva'];?></td>
                  <td><?php echo $fila['destino'];?></td>
                  <td><?php proveido($fila['idproveido']);?></td>
                  <td><?php echo $fila['deriva'];?></td>
                  <td><?php estadodoc($fila['idestadoexp'],$fila['idestadodoc']);?></td>
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
