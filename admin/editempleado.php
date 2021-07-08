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

    </div>
    </form>
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
                  <th>Nombres</th>
                  <th>Telefono</th>
                  <th>Correo</th>
                  <th>Cargo</th>
                  <th>Area</th>
                  <th>Local</th>
                  <th>Direccion</th>
                  <th>Acceso</th>
                  <th>Rotar/Despedir</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="select * from vta_usuario;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['apellidos'].' '.$fila['nombres'];?></td>
                  <td><?php echo $fila['telefono1'];?></td>
                  <td><?php echo $fila['correo1'];?></td>
                  <td><?php echo $fila['cargo'];?></td>
                  <td><?php echo $fila['area'];?></td>
                  <td><?php echo $fila['local'];?></td>
                  <td><?php echo $fila['idireccion'];?></td>
                  <?php estado($fila['estado'],'') ?>
                  <td>
                      <?php btnrotdes($fila['idmodalidad'],$fila['idtrabajador'],$fila['estado'],$fila['intext']); ?>
                  </td>
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
