<!DOCTYPE html>

<html>
<head>
  <?php
    include('../enlace/pgcbadm.inc');
    session_start();
    require_once('../enlace/conexion.inc');
    include('../enlace/funcion.php');
    include ('../enlace/conexpsegint.inc');
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
        SEGUIMIENTO DE DOCUMENTOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <!-- Contenido -->
    <div class="row">
      <form action="seguimientodoc.php" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
                <p class="margin">
                  <label>Expediente</label>
                  <div class="form-group">
                    <input class="form-control" type="text" maxlength="5" onkeypress="return soloNumeros(event)" name="txtseguimiento"
                    id="txtseguimiento" value="" required placeholder="Ingrese...">
                  <!--<span class="input-group-btn">
                    <button class="btn btn-info" href="javascript:;" onclick="seguimiento($('#txtseguimiento').val());return false;"
                    value="Cambiar">Consultar</button>
                  </span>-->
                  </div>
                </p>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name='consulta' type="submit">Seguimiento</button>
                </div>
              </div>
              <span id="resultado"></span>
          </div>
        </div>
    </form>
  </div>
    <div class="row">
      <div class="col-md-12">
        <?php
        if (isset($_SESSION['documento'])) {$documento=$_SESSION['documento'];}else { $documento="";}
        if (isset($_SESSION['iddocumento'])) {$iddocumento=$_SESSION['iddocumento'];}else { $iddocumento="";}
        seguimiento($documento,$iddocumento);
        ?>
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
