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
    <div class="row">
      <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>DNI</label>
                      <input class="form-control" type="text" name="txtdni" maxlength="8" onkeypress="return soloNumeros(event)" value="" required placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>RUC</label>
                      <input class="form-control" type="text" name="txtruc" maxlength="11" onkeypress="return soloNumeros(event)" value="" placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Apellidos</label>
                      <input class="form-control" type="text" name="txtapellidos" onKeyUp="this.value = this.value.toUpperCase();" onkeypress="return soloLetras(event)" value="" required placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Nombres</label>
                      <input class="form-control" type="text" name="txtnombres" onKeyUp="this.value = this.value.toUpperCase();" onkeypress="return soloLetras(event)" value="" required placeholder="Ingrese...">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Fecha de Nacimiento (dd/mm/aaaa)</label>
                  <input class="form-control" type="date" name="txtfechnac" value="" required>
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
                  <input class="form-control" type="text" name="txtdireccion" onKeyUp="this.value = this.value.toUpperCase();" value="" placeholder="Ingrese...">
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
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>E-mail</label>
                      <input class="form-control" type="email" onKeyUp="this.value = this.value.toUpperCase();" name="txtcorreo1" value="" placeholder="@ejemplo.com">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label>E-mail alterno</label>
                      <input class="form-control" type="email" onKeyUp="this.value = this.value.toUpperCase();" name="txtcorreo2" value="" placeholder="@ejemplo.com">
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
      <a class="btn btn-primary" href="institucion.php">Institucion</a>
      <button class="btn btn-primary pull-right" name="regpersona" type="submit">Guardar</button>
    </div>
    </form>
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Personas Registradas</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>DNI</th>
                  <th>NOMBRES</th>
                  <th>GENERO</th>
                  <th>DIRECCION</th>
                  <th>TELEFONO</th>
                  <th>PROCEDENCIA</th>
                  <th>EDIT/ELIM/TRAB.</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM vta_persona where intext='0';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['dni'];?></p></td>
                  <td><p><?php echo $fila['apellidos'].' '.$fila['nombres'];?></p></td>
                  <td><p><?php echo $fila['genero'];?></p></td>
                  <td><p><?php echo $fila['direccion'];?></p></td>
                  <td><p><?php echo $fila['telefono1'];?></p></td>
                  <td><p><?php echo $fila['procedencia'];?></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-warning" href="actpersona.php?idpr=<?php echo $fila['idpersona'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-danger" href="../enlace/regelmadm.php?idpr=<?php echo $fila['idpersona'];?>"><i class="fa fa-trash"></i></a>
                      <a class="btn btn-info" href="peremp.php?idpr=<?php echo $fila['idpersona'];?>"><i class="fa fa-suitcase"></i></a>
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
