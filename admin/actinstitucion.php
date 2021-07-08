<!DOCTYPE html>

<html>
<head>
  <?php
    include_once('../enlace/pgcbadm.inc');
    session_start();
    require_once('../enlace/conexion.inc');
    include('../enlace/funcion.php');
   ?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <?php
      $idinstitucion=$_REQUEST['idit'];
      $_SESSION['idinstitucion']=$idinstitucion;
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
      <form class="" action="../enlace/regactadm.php" method="post">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <label>Razon Social</label>
                  <input class="form-control" type="text" name="txtrazonsocial" value="<?php ActDatosIns($idinstitucion,'2'); ?>">
                </div>
                <div class="form-group">
                  <label>Ruc</label>
                  <input class="form-control" type="text" name="txtruc" maxlength="11" onkeypress="return controltag(event)" value="<?php ActDatosIns($idinstitucion,'1'); ?>" >
                </div>
                <div class="form-group">
                  <label>Direccion</label>
                  <input class="form-control" type="text" name="txtdireccion" value="<?php ActDatosIns($idinstitucion,'4'); ?>" >
                </div>
                <div class="form-group">
                  <label>Telefono</label>
                  <input class="form-control" type="text" name="txttelefono" value="<?php ActDatosIns($idinstitucion,'5'); ?>" data-inputmask="'mask': '999-999-999'" data-mask>
                </div>
                <div class="form-group">
                  <label>E-mail</label>
                  <input class="form-control" type="email" name="txtcorreo" value="<?php ActDatosIns($idinstitucion,'3'); ?>" placeholder="@ejemplo.pe">
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-info">
              <div class="box-body">
                <label>Departamento</label>
                <div class="form-group"> <?php generaSelect(); ?>
                </div>
                <label>Provincia</label>
                <div class="form-group">
                  <select class="form-control" disabled="disabled" id="provincias" name="provincias">
                  </select>
                </div>
                <label>Distrito</label>
                <div class="form-group">
                  <select class="form-control" disabled="disabled" id="distritos" name="distritos">
                  </select>
                </div>
                <div class="form-group">
                  <label>Tipo Institucion</label>
                  <?php CargaSelect('tipoinstitucion','1'); ?>
                </div>
                <p class="margin">
                  <label>DNI del tramitante</label>
                    <div class="input-group">
                      <input class="form-control" type="text" id="txttramite" name="txttramite" maxlength="8" onkeypress="return soloNumeros(event)" value="<?php ActDatosIns($idinstitucion,'7'); ?>">
                      <span  class="input-group-btn" id=resultado>
                        <input class="btn btn-info btn-flat" type="button" href="javascript:;" onclick="instituciondni($('#txttramite').val());return false;" value="Consulta"/>
                      </span>
                    </div>
                </p>
              </div>
          </div>
        </div>

    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" name="actinstitucion" type="submit">Actualizar</button>
    </div>
    </form>
    <div id="modusuario" class="modal modal-primary">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
              <span aria-hidden="true">x</span>
            </button>
            <h4 class="modal-title">Ingrese el DNI</h4>
          </div>
        </div>
        <div class="modal-body">
              <div class="row">
                <form class="" action="index.php" method="post">
                  <div class="col-md-12">
                        <div class="box-body">
                          <div class="form-group">
                            <input class="form-control" type="text" name="txtconsulta" value="" placeholder="Usuario">
                          </div>
                        </div>
                  </div>
                </form>
              </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-outline" data-dismiss="modal" name="button">Guardar Cambios</button>
        </div>
      </div>
    </div>
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>

  </div>
  <!-- ./wrapper -->
  <?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
