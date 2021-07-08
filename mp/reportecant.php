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
        CANTIDAD DE DOCUMENTOS
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
<form class="" action="../enlace/regrecepcionuser.php" method="post">
  <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
          </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>TIPO DE DOCUMENTO</th>
                  <th>PORCENTAJE</th>
                  <th>PROGRESO</th>
                  <th>CANTIDAD</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $cantidad=totaldoc($ar);
                $query="select count(*) as cantidad, concat(format(((count(*)*100)/$cantidad),2),'%') as porcentaje,
                  td.tipodocumento,ex.idarea from expediente ex, documento dc, tipodocumento td
                where dc.idexpediente=ex.idexpediente and dc.idtipodocumento=td.idtipodocumento
                and ex.idarea='$ar' group by td.tipodocumento;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['tipodocumento'];?></td>
                  <td><span class="badge bg-green"><?php echo $fila['porcentaje'];?></span></td>
                  <td><div class="progress progress-xs progress-striped active"><div class="progress-bar progress-bar-success" style="width: <?php echo $fila['porcentaje'];?>"></div></div></td>
                  <td><?php echo $fila['cantidad'];?></td>
                </tr>
                <?php
                }
                ?>
                <tr>
                  <th>TOTAL</th>
                  <td></td>
                  <td></td>
                  <th><?php echo $cantidad; ?></th>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
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
