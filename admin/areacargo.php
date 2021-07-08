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
        <li class="active">Administrador</li>
      </ol>
    </section>
    <div class="row">
      <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-7">
          <div class="box box-primary">
              <div class="box-body">
              <div class="row">
                <div class="col-md-9">
                  <label>Area</label> <label class="text-red">(*)</label> 
                  <input class="form-control" type="text" name="txtarea" value="" placeholder="Ingrese...">
                </div>
                <div class="col-md-3">
                  <label>Siglas</label> <label class="text-red">(*)</label> 
                  <input class="form-control" type="text" name="txtsiglas" value="" required placeholder="Ingrese...">
                </div>
              </div>
                <div class="row">
                  <div class="col-md-5">
                    <label>Local</label> <label class="text-red">(*)</label> 
                    <?php generaLocal(); ?>
                  </div>
                  <div class="col-md-7">
                    <label>Area Inmediata Superior</label>
                    <?php cargaSelect('area','2'); ?>
                  </div>
                </div>
              <p class="margin">
                <div class="row">
                  <div class="col-md-3">
                    <label>Telefono</label> 
                    <input class="form-control" type="text" name="txttelefono" value="" data-inputmask="'mask': '999-999-999'" data-mask>
                  </div>
                  <div class="col-md-3">
                    <label>Anexo</label>
                    <input class="form-control" type="text" name="txtanexo" value="" maxlength="3" onkeypress="return soloNumeros(event)" placeholder="Ingrese...">
                  </div>
                  <div class="col-md-6">
                    <label>E-mail</label>
                    <input class="form-control" type="text" name="txtcorreo" value="" placeholder="@ejemplo.com">
                  </div>
                </div>
              </p>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="regarea" type="submit">Guardar</button>
                </div>
              </div>
          </div>
        </div>
    </form>
    <form action="../enlace/regadm.php" class="" method="post">
        <div class="col-md-5">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <label for="">Cargo</label> <label class="text-red">(*)</label>
                  <input class="form-control" type="text" name="txtcargo" value="" placeholder="Ingrese...">
                </div>
                <div class="box-footer">
                  <button class="btn btn-primary pull-right" name="regcargo" type="submit">Guardar</button>
                </div>
              </div>
          </div>
        </div>
    </form>
  </div>
    <div class="row">
      <div class="col-md-7">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Areas</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>AREA</th>
                  <th>SIGLAS</th>
                  <th>TELEFONO</th>
                  <th>CORREO</th>
                  <th>EDIT./BORRAR</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT  * FROM area;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['area'];?></p></td>
                  <td><p><?php echo $fila['siglas'];?></p></td>
                  <td><p><?php echo $fila['telefono'];?></p></td>
                  <td><p><?php echo $fila['correo'];?></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-warning" href="actarea.php?idar=<?php echo $fila['idarea'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-danger" href="../enlace/regelmadm.php?idar=<?php echo $fila['idarea'];?>"><i class="fa fa-trash"></i></a>
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
      <div class="col-md-5">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title"><strong>Cargos</strong></h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla1" class="table table-hover">
              <thead>
                <tr>
                  <th>CARGO</th>
                  <th>EDIT./BORRAR</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM cargo;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><p><?php echo $fila['cargo'];?></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-warning" href="actcargo.php?idcr=<?php echo $fila['idcargo'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-danger" href="../enlace/regelmadm.php?idcr=<?php echo $fila['idcargo'];?>"><i class="fa fa-trash"></i></a>
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
  </div>
  <?php include('../enlace/piecopy.inc'); ?>
  
</div>
<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
