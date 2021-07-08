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
<div class="wrapper"><?php
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
    <p class="margin"></p>
    <!-- Contenido -->
    <div class="row">
      <div class="col-md-4">
        <form class="" action="../enlace/regadm.php" method="post" enctype="multipart/form-data">
          <div class="box box-primary">
              <div class="box-body box-profile">
                <img class="profile-user-img img-responsive img-circle" src="image/<?php foto($dato); ?>" alt="" />
                <h3 class="profile-username text-center"><?php UsuarioNombre($dato); ?></h3>
                <p class="text-muted text-center"><?php CargoUsuario($dato); ?></p>
                <ul class="list-group list-group-unbordered">
                  <li class="list-group-item">
                    <b><input type="file" name="archivo" accept="image/jpeg"></b>
                  </li>
                  <li class="list-group-item">
                    <strong>
                      <i class="fa fa-file-text-o margin-r-5"></i>
                      Nota
                    </strong>
                    <p class="text-muted">Preferentemente poner fotos de frente, que se distingan y de fondo blanco</p>
                  </li>
                  <li class="list-group-item">
                    <strong>
                      <i class="fa fa-map-marker margin-r-5"></i>
                      Ubicacion
                    </strong>
                    <p class="text-muted"><?php UsuarioUbicacion($dato); ?></p>
                  </li>
                </ul>
                <button class="btn btn-primary btn-block" type="submit" name="regfoto"><b>Subir Foto</b></button>
              </div>
          </div>
        </form>
    </div>
    <div class="col-md-8">
      <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="">
            <a>Informacion</a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="informacion">
            <form class="form-horizontal" action="../enlace/regadm.php" method="post">
              <div class="form-group">
                <label class="col-sm-2 control-label">Nombres</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" value="<?php UsuarioDatos($dato,'0'); ?>" disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">DNI</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" value="<?php UsuarioDatos($dato,'1'); ?>" disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Ruc</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" value="<?php UsuarioDatos($dato,'2'); ?>" disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Fech. Nac.</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" value="<?php UsuarioDatos($dato,'3'); ?>" disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Direccion</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="txtdireccion" value="<?php UsuarioDatos($dato,'4'); ?>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Celular</label>
                <div class="col-md-10">
                  <input class="form-control" type="text" name="txtcelular" data-inputmask="'mask': '999-999-999'" data-mask value="<?php UsuarioDatos($dato,'5'); ?>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Telefono</label>
                <div class="col-md-10">
                  <input class="form-control" type="text" name="txttelefono" value="<?php UsuarioDatos($dato,'6'); ?>" data-inputmask="'mask': '999-999-999'" data-mask>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">E-mail</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="txtcorreo1" value="<?php UsuarioDatos($dato,'7'); ?>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">E-mail Alt</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="txtcorreo2" value="<?php UsuarioDatos($dato,'8'); ?>">
                </div>
              </div>
              <div class="box-footer">
                <button class="btn btn-primary pull-right" type="submit" name="regperfil">Actualizar</button>
              </div>
            </form>
          </div>
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
