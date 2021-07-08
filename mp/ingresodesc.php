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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        EMITIR DOCUMENTOS
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
      <form class="" name="ingresodocuser" action="../enlace/regingresodesc.php" method="post" enctype="multipart/form-data">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                    <div class="form-group">
                      <label>Tipo de Documento</label>
                      <?php cargaSelect('tipodocumento','2'); ?>
                    </div>
                <!--<div class="form-group">
                  <label>Subir Archivo (.pdf)</label>
                  <input type="file" name="archivo" accept="application/pdf">
                  <p class="help-block"><em>(Ejemplo: OFICINA_TITULODOCUMENTO.pdf)</em></p>
                </div>-->
                <div class="form-group">
                  <label>Titulo de Documento</label>
                  <input class="form-control" type="text" name="txttitulo" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Asunto</label>
                  <textarea class="form-control" name="txtasunto" rows="2" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese..."></textarea>
                </div>
                <div class="form-group">
                  <label>Folios</label>
                  <input class="form-control" type="text" name="txtfolios" value="" maxlength="5" onkeypress="return soloNumeros(event)" required placeholder="Ingrese...">
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-info">
              <div class="box-body">
                <div class="form-group">
                  <label>Observación</label>
                  <input class="form-control" type="text" name="txtobservacion" onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                </div>
                <div class="form-group">
                  <label>Prioridad</label>
                <?php cargaSelect('prioridad','1'); ?>
                </div>
                <div class="form-group">
                  <label>Referencia</label>
                  <?php Referencia($dato); ?>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <label>Fecha de ingreso (dd/mm/aaaa)</label>
                    <input class="form-control" type="date" name="txtfecing" required value="<?php fecha(); ?>">
                  </div>
                  <div class="col-md-6">
                    <label>Hora de ingreso (hh:mm)</label>
                    <input class="form-control" type="time" name="txthoring" required value="">
                  </div>
                </div>
                <!--
                <p>
                  <label>Accesibilidad</label>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <input type="radio" name="rbtconfidencialidad" value="0" checked>
                        </span>
                        <input type="text" class="form-control" placeholder="PUBLICO" disabled>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <input type="radio" name="rbtconfidencialidad" value="1">
                        </span>
                        <input type="text" class="form-control" placeholder="CONFIDENCIAL" disabled>
                      </div>
                    </div>
                  </div>
                </p>-->
              </div>
          </div>
        </div>
      </div>
      <span id="resultado"></span>
        <div class="box-footer">
          <button class="btn btn-primary pull-right" type="submit" name="guardar" data-toggle="modal" data-target="#modusuario">Guardar</button>
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
                  <th>Exp.</th>
                  <th>Documento</th>
                  <th>Asunto</th>
                  <th>Folios</th>
                  <th>Observacion</th>
                  <th>Fecha</th>
                  <th>Prioridad</th>
                  <th>Plazo</th>
                  <th>Estado</th>
                  <!--<th>VER</th>-->
                  <th>EDITAR</th>
                  <th>ANULAR</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_docarea where idarea='$ar' and idestadoexp='1' and idestadodoc='1'order by idexpediente desc;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fecha'];?></td>
                  <td><?php echo $fila['prioridad'];?></td>
                  <td><?php DiasFaltantes($fila['idexpediente']);?></td>
                  <td><?php echo $fila['estado'];?></td>
                  <!--<td><p><a class="btn btn-block btn-success" target="_blank" href="file/<?php echo $fila['ruta']; ?>"><i class="fa fa-file-pdf-o"></i></a></p></td>-->
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-pencil-square-o"></i></a></td>
                      <a class="btn btn-sm btn-danger" href="elmingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-trash"></i></a>
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
