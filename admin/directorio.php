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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        DIRECTORIO INSTITUCIONAL
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
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>AREA</th>
                  <th>SIGLAS</th>
                  <th>TELEFONO</th>
                  <th>ANEXO</th>
                  <th>CORREO</th>
                  <th>LOCAL</th>
                  <th>DIRECCION</th>
                  <th>RESPONSABLE</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="select * from vta_directorio where responsable='1' and estado='1';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['area'];?></p></td>
                  <td><p><?php echo $fila['siglas'];?></p></td>
                  <td><p><?php echo $fila['telefono'];?></p></td>
                  <td><p><?php echo $fila['anexo'];?></p></td>
                  <td><p><?php echo $fila['correo'];?></p></td>
                  <td><p><?php echo $fila['local'];?></p></td>
                  <td><p><?php echo $fila['direccion'];?></p></td>
                  <td><p><?php echo $fila['autoridad'];?></p></td>
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
