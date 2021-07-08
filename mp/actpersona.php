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
      $idpersona=$_REQUEST['id'];
      $_SESSION['idpersona']=$idpersona;
      if(isset($_SESSION['usuario'])){
      $dato=$_SESSION['usuario'];
  }else{  SinConexion();}

  include('../enlace/hedrcabadm.inc');
    MenuPermiso($dato,'1');
   ?>
  <!-- Main Header -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        EDITAR PERSONA
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
      <form action="../enlace/regactpersona.php" class="" method="post">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>DNI</label>
                      <input class="form-control" type="text" name="txtdni" value="<?php ActDatosPer($idpersona,'1'); ?>" required maxlength="8" onkeypress="return controltag(event)">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>RUC</label>
                      <input class="form-control" type="text" name="txtruc" value="<?php ActDatosPer($idpersona,'2'); ?>" maxlength="11" onkeypress="return controltag(event)">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Apellidos</label>
                      <input class="form-control" type="text" name="txtapellidos" value="<?php ActDatosPer($idpersona,'3'); ?>" required placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Nombres</label>
                      <input class="form-control" type="text" name="txtnombres" value="<?php ActDatosPer($idpersona,'4'); ?>" required placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Fecha de Nacimiento</label>
                  <input class="form-control" type="date" name="txtfechnac" value="<?php ActDatosPer($idpersona,'5'); ?>" required>
                </div>
                <label>Genero</label>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtgenero" value="M">
                      </span>
                      <input class="form-control" type="text" placeholder="Masculino" disabled>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtgenero" value="F">
                      </span>
                      <input class="form-control" type="text" placeholder="Femenino" disabled>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-info">
              <div class="box-body">
                <div class="form-group">
                  <label>Direccion</label>
                  <input class="form-control" type="text" name="txtdireccion" value="<?php ActDatosPer($idpersona,'7'); ?>">
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Celular</label>
                      <input class="form-control" type="text" name="txtcelular" value="<?php ActDatosPer($idpersona,'8'); ?>" required data-inputmask="'mask': '999-999-999'" data-mask>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Telefono</label>
                      <input class="form-control" type="text" name="txttelefono" value="<?php ActDatosPer($idpersona,'9'); ?>" data-inputmask="'mask': '999-999-999'" data-mask>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>E-mail</label>
                      <input class="form-control" type="text" name="txtcorreo1" value="<?php ActDatosPer($idpersona,'10'); ?>" placeholder="@ejemplo.com">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>E-mail alterno</label>
                      <input class="form-control" type="text" name="txtcorreo2" value="<?php ActDatosPer($idpersona,'11'); ?>" placeholder="@ejemplo.com">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-4">
                    <label>Departamento</label>
                    <div class="form-group"><?php generaSelect(); ?>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <label>Provincias</label>
                    <div class="form-group">
                      <select class="form-control" disabled="disabled" id="provincias" name="provincias">
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <label>Distritos</label>
                    <div class="form-group">
                      <select class="form-control" disabled="disabled" id="distritos" name="distritos">
                      </select>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" type="submit">Actualizar</button>
    </div>
    </form>

  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>
 
</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
