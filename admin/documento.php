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
      $_SESSION['emitir']="2";
  }else{  SinConexion();}
  include('../enlace/hedrcabadm.inc');
  MenuPermiso($dato,'1');
  if (isset($_SESSION['ddrr'])) {    $ddrr=$_SESSION['ddrr'];  } else {    $ddrr="";  }
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        INGRESAR DOCUMENTOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>
    <!-- Contenido -->
    <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>EXP.</th>
                  <th>AREA</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <!--<th>FOLIOS</th>
                  <th>OBSERVACION</th>-->
                  <th>PRIORIDAD</th>
                  <th>FECHA</th>
                  <th>ESTADO</th>
                  <!--<th>VER</th>-->
                  <th>EDIT/ELIM</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_documento where idexpediente order by idexpediente desc;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['idexpediente'];?></td>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['area'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <!--<td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>-->
                  <td><?php echo $fila['prioridad'];?></td>
                  <td><?php echo $fila['fechingsist'];?></td>
                  <td><?php echo $fila['estadoexp'].' '.$fila['estadodoc'];?></td>
                  <!--<td><p><a class="btn btn-block btn-success" target="_blank" href="file/<?php echo $fila['ruta'];?>"><i class="fa fa-file-pdf-o"></i></a></p></td>-->
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-sm btn-danger" href="../enlace/elmingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-trash"></i></a>
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
  </section>
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
