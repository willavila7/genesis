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
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Empleados Registrados</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>DNI</th>
                  <th>NOMBRES</th>
                  <th>CARGO</th>
                  <th>AREA</th>
                  <th>CARGO</th>
                  <th>EDITAR</th>
                  <th>BORRAR</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="select * from vta_usuario where intext='1';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['dni'];?></p></td>
                  <td><p><?php echo $fila['apellidos'].' '.$fila['nombres'];?></p></td>
                  <td><p><?php echo $fila['correo1'];?></p></td>
                  <td><p><?php echo $fila['area'];?></p></td>
                  <td><p><?php echo $fila['cargo'];?></p></td>
                  <td><p><a class="btn btn-block btn-warning" href="actempleado.php?id=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-pencil-square-o"></i></a></p></td>
                  <td><p><a class="btn btn-block btn-danger" href="../enlace/elmempleado.php?id=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-trash"></i></a></p></td>
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
