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
      <form class="" name="ingresodoc" action="../enlace/regingresodoc.php" method="post" enctype="multipart/form-data">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-3">
                    <label>Expediente</label> <label class="text-red">(*)</label>
                    <div class="form-group has-error">
                      <input class="form-control" id="inputError" type="text" name="txtexpediente" maxlength="5" onkeypress="return soloNumeros(event)" id="txtexpediente" value="<?php NumeroExp($dato); ?>" required placeholder="Ingrese...">
                    </div>
                  </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label>Tramitante</label> <label class="text-red">(*)</label>
                        <select class="form-control" id="tipoingreso" name="tipoingreso" value="">
                          <option value="1">Externo</option>
                          <option value="2">Interno (trabajador)</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-5">
                      <label>Identificacion</label> <label class="text-red">(*)</label>
                      <div class="input-group">
                        <input class="form-control" type="text" value="<?php echo $ddrr; ?>" id="txtdniruc" name="txtdniruc" maxlength="8" required onkeypress="return soloNumeros(event)" placeholder="Ingrese dni...">
                        <span class="input-group-btn">
                        <input class="btn btn-info" type="button" href="javascript:;" onclick="consultadni($('#tipoingreso').val(), $('#txtdniruc').val());return false;"
                          value="Verifica"/>
                        </span>
                      </div>
                    </div>
                </div>
                <div class="row">
                  <div class="col-lg-5">
                    <div class="form-group">
                      <label>Tipo de Documento</label> <label class="text-red">(*)</label>
                      <?php cargaSelect('tipodocumento','2'); ?>
                    </div>
                  </div>
                  <div class="col-md-7">
                    <div class="form-group">
                      <label>Documento</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtdocumento" onKeyUp="this.value = this.value.toUpperCase();" value="" required placeholder="Ingrese...">
                      <p class="text-red">Ejemplo: <strong>Nº 00-AÑO-INSTITUCION/</strong></p>
                </div>
                  </div>
                </div>                
                <!--<div class="form-group">
                  <label>Subir Archivo (.pdf)</label>
                  <input type="file" name="archivos" accept="application/pdf">
                  <p class="help-block"><em>(Ejemplo: OFICINA_TITULODOCUMENTO.pdf)</em></p>
                </div>-->
                <div class="form-group">
                  <label>Asunto</label> <label class="text-red">(*)</label>
                  <textarea class="form-control" rows="2" name="txtasunto" onKeyUp="this.value = this.value.toUpperCase();" value="" required placeholder="Ingrese..."></textarea>
                </div>
              </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-info">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-4">
                    <label>Folios</label> <label class="text-red">(*)</label>
                    <input class="form-control" type="text" name="txtfolios" maxlength="5" onkeypress="return soloNumeros(event)" value="" required placeholder="Ingrese...">
                  </div>
                  <div class="col-md-8">
                    <label>Se adjunta</label> <small>(Ejemplo: CD, Anillado, Fotografías, Tomos, etc.)</small>
                    <input class="form-control" type="text" name="txtobservacion" onKeyUp="this.value = this.value.toUpperCase();" value="" placeholder="Ingrese...">
                  </div>
                </div>
                <p class="margin">
                  <div class="row ">
                    <div class="col-md-6">
                      <label>Fecha Ingreso (dd/mm/aaaa)</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="date" name="txtfecing" required value="<?php fecha(); ?>">
                    </div>
                    <div class="col-md-6">
                      <label>Hora Ingreso (hh:mm)</label> <label class="text-red">(*)</label>
                      <input class="form-control" type="time" name="txthoring" required>
                    </div>
                  </div>
                </p>
                <div class="form-group">
                  <label>Prioridad</label> <label class="text-red">(*)</label>
                  <div class="row">
                      <div class="col-lg-4">
                        <div class="input-group">
                          <span class="input-group-addon">
                            <input type="radio" name="rbtprioridad" value="3" checked>
                          </span>
                          <input class="form-control" type="text" placeholder="Normal" disabled>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="input-group">
                          <span class="input-group-addon">
                            <input type="radio" name="rbtprioridad" value="2">
                          </span>
                          <input class="form-control" type="text" placeholder="Urgente" disabled>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="input-group">
                          <span class="input-group-addon">
                            <input type="radio" name="rbtprioridad" value="1">
                          </span>
                          <input class="form-control" type="text" placeholder="Muy Urgente" disabled>
                        </div>
                      </div>
                  </div>
                </div>  
              </div>
          </div>
        </div>
      </div>
      <span id="resultado"></span>
        <div class="box-footer">
          <button class="btn btn-primary pull-right" type="submit">Ingresar</button>
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
                  <th>EXP.</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <th>FOLIOS</th>
                  <th>OBSERVACION</th>
                  <!--<th>PRIORIDAD</th>
                  <th>PLAZO</th>-->
                  <th>FECHA</th>
                  <!--<th>VER</th>-->
                  <th>EDIT/DEV/ANUL</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_rptdocdis where idarea='$ar' and idderiva is null;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <!--<td><?php echo $fila['prioridad'];?></td>
                  <td><?php DiasFaltantes($fila['idexpediente']);?></td>-->
                  <td><?php echo $fila['fechrecepcion'];?></td>
                  <!--<td><p><a class="btn btn-block btn-success" target="_blank" href="file/<?php echo $fila['ruta'];?>"><i class="fa fa-file-pdf-o"></i></a></p></td>-->
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-sm btn-info" href="../enlace/devingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-male"></i></a>
                      <a class="btn btn-sm btn-danger" href="../enlace/elmingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-ban"></i></a>
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
