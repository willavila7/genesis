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
 ?>
  <!-- Main Header -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ARCHIVAR DOCUMENTO
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
      <form class="" action="../enlace/regarchivo.php" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <label>Motivo</label>
                  <input class="form-control" type="text" name="txtarchivar" required placeholder="Ingrese..." value="">
                </div>
              </div>
              <span id="resultado"></span>
          </div>

          <div class="box-footer">
            <button class="btn btn-primary pull-right" type="submit">Archivar</button>
          </div>
        </div>

    </div>
  <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>Exp.</th>
                  <th>Documento</th>
                  <th>Asunto</th>
                  <th>Folios</th>
                  <th>Observacion</th>
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_docarea where idarea='$ar' and (idestadoexp='1' or idestadoexp='2')  and idestadodoc='1' order by idexpediente desc;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td>
                    <div class="form-group">
                      <input type="checkbox" name="expediente[]" value="<?php echo $fila['idexpediente']; ?>">                      
                    </div>
                  </td>
                  <td><?php echo $fila['expediente']; ?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['estado'];?></td>
                </tr>
                <?php
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </form>
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
