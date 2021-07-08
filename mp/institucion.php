<!DOCTYPE html>

<html>
<head>
  <?php
    include('../enlace/pgcbadm.inc');
    session_start();
    require_once('../enlace/conexion.inc');
    include('../enlace/funcion.php');
   ?>
<script type="text/javascript">
   function realizaProceso(valor){
           var parametros = {
                   "valor" : valor
           };
           $.ajax({
                   data:  parametros,
                   url:   'msgdni.php',
                   type:  'post',
                   beforeSend: function () {
                           $("#resultado").html("Procesando, espere por favor...");
                   },
                   success:  function (response) {
                           $("#resultado").html(response);
                   }
           });
   }
</script>
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
        REGISTRO DE INSTITUCIONES
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>

    <!-- Contenido -->
    <form class="" action="../enlace/reginstitucionmp.php" method="post">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <label>Razon Social</label>
                  <input class="form-control" type="text" name="txtrazonsocial" required onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Ruc</label>
                  <input class="form-control" type="text" name="txtruc" maxlength="11" required onkeypress="return soloNumeros(event)"value="" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Direccion</label>
                  <input class="form-control" type="text" name="txtdireccion" onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Telefono</label>
                  <input class="form-control" type="text" name="txttelefono" value="" data-inputmask="'mask': '999-999-999'" data-mask>
                </div>
                <div class="form-group">
                  <label>E-mail</label>
                  <input class="form-control" type="email" name="txtcorreo" onKeyUp="this.value = this.value.toUpperCase();" placeholder="@ejemplo.pe">
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
                      <input class="form-control" type="text" id="txttramite" name="txttramite" required maxlength="8" onkeypress="return soloNumeros(event)" placeholder="Ingrese...">
                      <span  class="input-group-btn" id=resultado>
                        <input class="btn btn-info btn-flat" type="button" href="javascript:;" onclick="realizaProceso($('#txttramite').val());return false;" value="Consulta"/>
                      </span>
                    </div>
                </p>
              </div>
          </div>
        </div>
    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" type="submit">Guardar</button>
    </div>
    </form>
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
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
                  <th>Edicion</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM vta_institucion;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr id="contenido">
                  <td><?php echo $fila['ruc'];?></td>
                  <td><?php echo $fila['razonsocial'];?></td>
                  <td><?php echo $fila['direccion'];?></td>
                  <td><?php echo $fila['telefono'];?></td>
                  <td><?php echo $fila['procedencia'];?></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actinstitucion.php?id=<?php echo $fila['idinstitucion'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-sm btn-danger" href="../enlace/elminstitucion.php?id=<?php echo $fila['idinstitucion'];?>"><i class="fa fa-trash"></i></a>
                    </div>
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
  <!-- Control Sidebar -->
  <?php include('../enlace/piecopy.inc'); ?>
 

</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
