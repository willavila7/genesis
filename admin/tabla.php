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
        <li class="active">Administrador</li>
      </ol>
    </section>

    <!-- Contenido -->
    <div class="row">
      <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-4">
          <div class="box box-primary">
              <div class="box-body">
              <h4>PRIORIDAD</h4>
                <div class="form-group">
                  <label>Prioridad</label>
                  <input class="form-control" type="text" name="txtprioridad" value="">
                </div>
                <div class="form-group">
                  <label>Dias</label>
                  <input class="form-control" type="text" name="txtdias" value="" required maxlength="2" onkeypress="return controltag(event)">
                </div>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="regprioridad" type="submit">Guardar</button>
                </div>
              </div>
          </div>
        </div>
    </form>
    <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-4">
          <div class="box box-primary">
              <div class="box-body">
              <h4>AÑO</h4>
                <div class="form-group">
                  <label>Año</label>
                  <input class="form-control" type="text" name="txtanio" value="" maxlength="4" onkeypress="return controltag(event)">
                </div>
                <div class="form-group">
                  <label>Nombre</label>
                  <input class="form-control" type="text" name="txtnombre" value="">
                </div>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="reganio" type="submit">Guardar</button>
                </div>
              </div>
          </div>
        </div>
    </form>
    <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-4">
          <div class="box box-primary">
              <div class="box-body">
              <h4>PROVEIDO</h4>
                <div class="form-group">
                  <label for="">Proveido</label>
                  <input class="form-control" type="text" name="txtproveido" value="">
                </div>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="regproveido" type="submit">Guardar</button>
                </div>
              </div>
          </div>
        </div>
    </form>
  </div>
    <div class="row">
      <div class="col-md-4">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Prioridad</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>PRIORIDAD</th>
                  <th>DIAS</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT  * from prioridad;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['prioridad'];?></p></td>
                  <td><p><?php echo $fila['dias'];?></p></td>
                  <td>
                    <a class="btn btn-warning" href="actprioridad.php?idpd=<?php echo $fila['idprioridad'];?>"><i class="fa fa-pencil-square-o"></i></a>
                    <a class="btn btn-danger" href="../enlace/regelmadm.php?idpd=<?php echo $fila['idprioridad'];?>"><i class="fa fa-trash"></i></a>
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
      <div class="col-md-4">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Año</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla1" class="table table-hover">
              <thead>
                <tr>
                  <th>AÑO</th>
                  <th>NOMBRE</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM anio;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr id="contenido">
                  <td><p><?php echo $fila['anio'];?></p></td>
                  <td><p><?php echo $fila['nombre'];?></p></td>
                  <td>
                    <a class="btn btn-block btn-warning" href="actanio.php?idan=<?php echo $fila['idanio'];?>"><i class="fa fa-pencil-square-o"></i></a>
                    <a class="btn btn-block btn-danger" href="../enlace/regelmadm.php?idan=<?php echo $fila['idanio'];?>"><i class="fa fa-trash"></i></a>
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
      <div class="col-md-4">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Proveido</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla2" class="table table-hover">
              <thead>
                <tr>
                  <th>PROVEIDO</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM proveido;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr id="contenido">
                  <td><p><?php echo $fila['proveido'];?></p></td>
                  <td>
                    <a class="btn btn-block btn-warning" href="actproveido.php?idpv=<?php echo $fila['idproveido'];?>"><i class="fa fa-pencil-square-o"></i></a>
                    <a class="btn btn-block btn-danger" href="../enlace/regelmadm.php?idpv=<?php echo $fila['idproveido'];?>"><i class="fa fa-trash"></i></a>
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
