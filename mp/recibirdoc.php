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
              <label>Fecha de recepcion (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
              <input type="date" class="form-control" name="txtfechrecepcion" required value="<?php fecha(); ?>">
            </div>
            <div class="col-md-6">
              <label>Hora de recepcion (hh:mm)</label> <label class="text-red">(*)</label>
              <input type="time" class="form-control" name="txthorarecepcion" required value="">
            </div>
          </div>
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
                  <th></th>
                  <th>EXP/ORIGEN</th>
                  <th>OFIC/ORIGEN</th>
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
                $query="SELECT * FROM vta_recepciondoc where idarea='$ar' and idestadoexp='2' and idestadodoc='2';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td>
                    <div class="form-group">
                      <input type="checkbox" name="expediente[]" value="<?php echo $fila['idexpediente']; ?>">
                    </div>
                  </td>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['origen'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fecha'];?></td>
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
