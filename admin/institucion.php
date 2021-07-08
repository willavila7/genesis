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
    <form class="" action="../enlace/reginstitucion.php" method="post">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <label>Razon Social</label>
                  <input class="form-control" type="text" name="txtrazonsocial" value="" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Ruc</label>
                  <input class="form-control" type="text" name="txtruc" maxlength="11" onkeypress="return controltag(event)"value="" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Direccion</label>
                  <input class="form-control" type="text" name="txtdireccion" value="" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Telefono</label>
                  <input class="form-control" type="text" name="txttelefono" value="" data-inputmask="'mask': '999-999-999'" data-mask>
                </div>
                <div class="form-group">
                  <label>E-mail</label>
                  <input class="form-control" type="email" name="txtcorreo" value="" placeholder="@ejemplo.com">
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
                <div class="form-group">
                  <label>Provincia</label>
                  <select class="form-control" disabled="disabled" id="provincias" name="provincias">
                  </select>
                </div>
                <div class="form-group">
                  <label>Distrito</label>
                  <select class="form-control" disabled="disabled" id="distritos" name="distritos">
                  </select>
                </div>
                <div class="form-group">
                  <label>Tipo Institucion</label>
                  <?php cargaSelect('tipoinstitucion','1'); ?>
                </div>
                <p class="margin">
                  <label>DNI del tramitante</label>
                    <div class="input-group">
                      <input class="form-control" type="text" id="txttramite" name="txttramite" maxlength="8" onkeypress="return controltag(event)" value="" placeholder="DNI del Tramitante">
                      <span  class="input-group-btn">
                        <input class="btn btn-info btn-flat" type="button" href="javascript:;" onclick="instituciondni($('#txttramite').val());return false;" value="Consulta"/>
                      </span>
                    </div>
                </p>
                <span id="resultado"></span>
              </div>
          </div>
        </div>
    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" name="reginstitucion" type="submit">Guardar</button>
    </div>
    </form>
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Instituciones Registradas</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>RUC</th>
                  <th>Razon Social</th>
                  <th>Direccion</th>
                  <th>Telefono</th>
                  <th>Procedencia</th>
                  <th>Edit./Borrar</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM vta_institucion;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr id="contenido">
                  <td><p><?php echo $fila['ruc'];?></p></td>
                  <td><p><?php echo $fila['razonsocial'];?></p></td>
                  <td><p><?php echo $fila['direccion'];?></p></td>
                  <td><p><?php echo $fila['telefono'];?></p></td>
                  <td><p><?php echo $fila['procedencia'];?></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-warning" href="actinstitucion.php?idit=<?php echo $fila['idinstitucion'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-danger" href="../enlace/regelmadm.php?idit=<?php echo $fila['idinstitucion'];?>"><i class="fa fa-trash"></i></a></td>
                    </div>
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
  </div>
  <?php include('../enlace/piecopy.inc'); ?>
  
</div>
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
