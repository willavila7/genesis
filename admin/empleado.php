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
      <form action="../enlace/regempleado.php" class="" method="post">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>DNI</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtdni" value="" maxlength="8" onkeypress="return soloNumeros(event)" required placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>RUC</label>
                      <input class="form-control" type="text" name="txtruc" value="" maxlength="11" onkeypress="return soloNumeros(event)" placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Apellidos</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtapellidos" onkeypress="return soloLetras(event)" required onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Nombres</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtnombres" onkeypress="return soloLetras(event)" required onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
                <label>Genero</label> <label class="text-red">(*)</label>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtgenero" value="M">
                      </span>
                      <input type="text" class="form-control" placeholder="MASCULINO" disabled>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtgenero" value="F">
                      </span>
                      <input type="text" class="form-control" placeholder="FEMENINO" disabled>
                    </div>
                  </div>
                </div>
                <p class="margin">
                  <div class="row">
                    <div class="col-md-6">
                      <label>Fecha de Nacimiento (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="date" name="txtfechnac" value="">
                    </div>
                    <div class="col-md-6">
                      <label>Direccion</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtdireccion" value="" onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                    </div>
                  </div>
                </p>
                <div class="row">
                  <div class="col-lg-4">
                    <label>Departamento</label> <label class="text-red">(*)</label>
                    <div class="form-group"><?php generaSelect(); ?>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <label>Provincias</label> <label class="text-red">(*)</label>
                    <div class="form-group">
                      <select class="form-control" disabled="disabled" id="provincias" name="provincias">
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <label>Distritos</label> <label class="text-red">(*)</label>
                    <div class="form-group">
                      <select class="form-control" disabled="disabled" id="distritos" name="distritos">
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Celular</label>
                      <input class="form-control" type="text" name="txtcelular" value="" required data-inputmask="'mask': '999-999-999'" data-mask>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Telefono</label>
                      <input class="form-control" type="text" name="txttelefono" value="" data-inputmask="'mask': '999-999-999'" data-mask>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-info">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Correo Institucional</label>
                      <input class="form-control" type="email" name="txtcorreo1" onKeyUp="this.value = this.value.toUpperCase();" value="" placeholder="@EMPRESA.COM">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Correo Alternativo</label>
                      <input class="form-control" type="email" name="txtcorreo2" onKeyUp="this.value = this.value.toUpperCase();" value="" placeholder="@EJEMPLO.COM">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Area</label> <label class="text-red">(*)</label>
                  <?php cargaSelect('area','2'); ?>
                </div>
                <div class="form-group">
                  <label>Cargo</label> <label class="text-red">(*)</label>
                  <?php cargaSelect('cargo','2'); ?>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label>Condicion</label> <label class="text-red">(*)</label>
                      <?php cargaSelect('modalidad','1'); ?>
                    </div>
                  </div>
                  <!--<div class="col-lg-6">
                    <div class="form-group">
                      <label>Modalidad</label>
                      <?php cargaSelect('categoria','1'); ?>
                    </div>
                  </div>-->
                </div>
                <label>Responsable</label> <label class="text-red">(*)</label>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtres" value="0" checked>
                      </span>
                      <input type="text" class="form-control" placeholder="NO" disabled>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <input type="radio" name="rbtres" value="1">
                      </span>
                      <input type="text" class="form-control" placeholder="SI" disabled>
                    </div>
                  </div>
                </div>
                <p class="margin"></p>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Fecha de Ingreso (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="date" name="txtfechingreso" required value="">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>Resolucion</label>
                      <input class="form-control" type="text" name="txtresing" value="" placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>

    </div>
    <div class="box-footer">
      <button class="btn btn-primary pull-right" name="regempleado" type="submit">Guardar</button>
    </div>
    </form>
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Empleados Registrados</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>DNI</th>
                  <th>NOMBRES</th>
                  <th>GENERO</th>
                  <th>TELEFONO</th>
                  <th>DIRECCION</th>
                  <th>PROCEDENCIA</th>
                  <th>CARGO</th>
                  <th>AREA</th>
                  <th>EDIT./BORR.</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="select * from vta_empleado where intext='1' and estado='1';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['dni'];?></p></td>
                  <td><p><?php echo $fila['apellidos'].' '.$fila['nombres'];?></p></td>
                  <td><p><?php echo $fila['genero'];?></p></td>
                  <td><p><?php echo $fila['telefono1'];?></p></td>
                  <td><p><?php echo $fila['direccion'];?></p></td>
                  <td><p><?php echo $fila['procedencia'];?></p></td>
                  <td><p><?php echo $fila['cargo'];?></p></td>
                  <td><p><?php echo $fila['area'];?></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-warning btn-sm" href="actempleado.php?idtb=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-danger btn-sm" href="../enlace/regelmadm.php?idtb=<?php echo $fila['idtrabajador'];?>"><i class="fa fa-trash"></i></a>
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

  <!-- Main Footer -->
  <?php include('../enlace/piecopy.inc'); ?>

</div>
<!-- ./wrapper -->
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
