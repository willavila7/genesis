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
  if (isset($_SESSION['dniruc'])) {    $dr=$_SESSION['dniruc'];  } else {    $dr="";  }  
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        REGISTRO DE PERSONAS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <br><br><br><br><br>
    <div class="row">
      <form action="../enlace/regpersonamp.php" class="" method="post">
        <div class="col-md-3"></div>
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">     
                <div class="form-group">
                    <label>DNI</label> <label class="text-red">(*)</label>
                    <input class="form-control" type="text" name="txtdni" maxlength="8" value="<?php echo $dr; ?>" onkeypress="return soloNumeros(event)" required placeholder="Ingrese...">
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Apellidos</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtapellidos" onkeypress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese...">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Nombres</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtnombres" onkeypress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese...">
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
              <div class="box-footer">
                <button class="btn btn-primary pull-right" type="submit">Guardar</button>
              </div>
          </div>
        </div>        
    </div>        
    </form>
    <!--
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>DNI</th>
                  <th>Nombres</th>
                  <th>Genero</th>
                  <th>Direccion</th>
                  <th>Telefono</th>
                  <th>Correo</th>
                  <th>Procedencia</th>
                  <th>Edicion</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $query="SELECT * FROM vta_persona where intext='0';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['dni'];?></td>
                  <td><?php echo $fila['apellidos'].' '.$fila['nombres'];?></td>
                  <td><?php echo $fila['genero'];?></td>
                  <td><?php echo $fila['direccion'];?></td>
                  <td><?php echo $fila['telefono1'];?></td>
                  <td><?php echo $fila['correo1'];?></td>
                  <td><?php echo $fila['procedencia'];?></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actpersona.php?id=<?php echo $fila['idpersona'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-sm btn-danger" href="../enlace/elmpersona.php?id=<?php echo $fila['idpersona'];?>"><i class="fa fa-trash"></i></a>
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
    -->
  </div>

  <?php include('../enlace/piecopy.inc'); ?>
 
</div>

<?php include('../enlace/pgpieradm.inc'); ?>
</body>
</html>
