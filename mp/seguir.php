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
        SEGUIMIENTO
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>

    <!-- Contenido -->
<form class="" action="../enlace/regrecepcionuser.php" method="post">
  <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>EXP.</th>
                  <th>Origen</th>
                  <th>Documento</th>
                  <th>asunto</th>
                  <th>folios</th>
                  <th>observacion</th>
                  <th>dias</th>
                  <th>horas</th>
                  <th>plazo</th>
                  <th>Destino</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $idarea=idAreaxUsuario($dato);
                $expediente = mysqli_real_escape_string(conectar(),$_POST['txtseguimiento']);
                $dc=seguimientointerno($expediente,$idarea,'0');
                $idc=seguimientointerno($expediente,$idarea,'1');

                $query1 = "SELECT * from vta_seguimiento where idarea='$idarea' and documento='$dc' and idreferencia='$idc';";
                $resultado1 = mysqli_query(conectar(), $query1);
                while($fila1=mysqli_fetch_assoc($resultado1)){
                ?>
                <tr id="contenido">
                  <td><p><?php echo $fila['expediente'];?></p></td>
                  <td><p><?php echo $fila['origen'];?></p></td>
                  <td><p><?php echo $fila['documento'];?></p></td>
                  <td><p><?php echo $fila['asunto'];?></p></td>
                  <td><p><?php echo $fila['folios'];?></p></td>
                  <td><p><?php echo $fila['observacion'];?></p></td>
                  <td><p><?php echo $fila['dias'];?></p></td>
                  <td><p><?php echo $fila['horas'];?></p></td>
                  <td><p><?php echo $fila['plazo'];?></p></td>
                  <td><p><?php echo $fila['destino'];?></p></td>
                </tr>
                <?php
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
        <div class="box-footer">
          <a class="btn btn-primary pull-right" href="seguimientodoc.php">Volver</a>
        </div>
      </div>
    </div>
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
