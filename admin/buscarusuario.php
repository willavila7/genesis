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
            <h3 class="box-title"><strong>Generar Usuarios</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>DNI</th>
                  <th>USUARIO</th>
                  <th>NOMBRES</th>
                  <th>AREA</th>
                  <th>CARGO</th>
                  <th>CORREO INSTITUCIONAL</th>
                  <th>REST.</th>
                  <th>ACCESO</th>
                  <th>INGRESAR</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_usuario where intext='1'";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['dni'];?></td>
                  <td><?php echo $fila['idusuario'];?></td>
                  <td><?php echo $fila['apellidos'].' '.$fila['nombres'];?></td>
                  <td><?php echo $fila['area'];?></td>
                  <td><?php echo $fila['cargo'];?></td>
                  <td><?php echo $fila['correo1'];?></td>
                  <td><a class="btn btn-sm btn-warning" href="restableceusu.php?id=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-refresh"></i></a></td>
                  <?php estado($fila['estado'],$fila['idtrabajador']); ?>
                  <td><a class="btn btn-sm btn-info" href="ingresausu.php?id=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-user"></i></a></td>
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
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      Gerencia de Operaciones
    </div>
    <strong>Copyright &copy; 2021 <a href="http://www.retait.com/" target="_blank">RETAIT</a>.</strong> Todos los derechos reservados.
  </footer>
</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
