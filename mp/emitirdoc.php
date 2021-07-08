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
    $_SESSION['emitir']="3";
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
  <section class="content">
    <div class="row">
      <form class="" name="ingresodocuser" action="../enlace/regemitirdoc.php" method="post" enctype="multipart/form-data">
        <div class="col-md-6">
          <div class="box box-primary">
              <div class="box-body">
                <!--<div class="form-group">
                  <label>Subir Archivo (.pdf)</label>
                  <input type="file" name="archivo" accept="application/pdf">
                  <p class="help-block"><em>(Ejemplo: OFICINA_TITULODOCUMENTO.pdf)</em></p>
                </div>-->
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>Tipo de Documento</label> <label class="text-red">(*)</label>
                      <?php cargaSelect('tipodocumento','2'); ?>
                    </div>
                  </div>
                  <div class="col-md-8">
                    <div class="form-group">
                    <label>Titulo de Documento</label> <label class="text-red">(*)</label>
                    <input class="form-control" type="text" name="txttitulo" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese...">
                    <p class="text-red">Ejemplo: <strong>Nº 00-AÑO-EMPRESA-OFICINA/J</strong></p class="text-red">
                </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Asunto</label> <label class="text-red">(*)</label>
                  <textarea class="form-control" name="txtasunto" rows="2" onKeyUp="this.value = this.value.toUpperCase();" required placeholder="Ingrese..."></textarea>
                </div>
                <div class="form-group">
                  <label>Referencia</label>
                  <?php Referencia($dato); ?>
                </div>
                <div class="row">
                    <div class="col-md-4">
                      <div class="form-group">
                        <label>Folios</label><label class="text-red">(*)</label>
                      <input class="form-control" type="text" name="txtfolios" value="" maxlength="5" onkeypress="return soloNumeros(event)" required placeholder="Ingrese...">
                      </div>                      
                    </div>
                    <div class="col-md-8">
                      <div class="form-group">
                        <label>Se adjunta</label> <small>Ejemplo: CD, Anillado, Fotografías, Tomos, etc.</small>
                      <input class="form-control" type="text" name="txtobservacion" onKeyUp="this.value = this.value.toUpperCase();" placeholder="Ingrese...">
                      </div>                      
                    </div>
                </div>
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
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-12">
              <div class="box box-info">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-9">
                    <label>Jefe Responsable</label>
                    <input class="form-control" type="text" disabled value="<?php JefexUsuario($dato); ?>">
                    <p class="text-yellow"><strong>En caso de rotacion, despido o cese comunicarse con el administrador del sistema</strong></p>
                  </div>
                  <div class="col-md-3">
                    <label>Expediente</label> <label class="text-red">(*)</label>
                      <div class="form-group has-error">
                        <input class="form-control" id="inputError" type="text" name="txtexpediente" maxlength="5" onkeypress="return soloNumeros(event)" id="txtexpediente" value="<?php NumeroExp($dato); ?>" required placeholder="Ingrese...">
                      </div>
                  </div> 
                </div>       
              </div>
          </div>
            </div>
            <div class="col-md-12">
              <div class="box box-danger">
              <div class="box-body">                                
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4 col-sx-12 com-sm-12">
                      <label>Destino(s)</label> <label class="text-red">(*)</label> 
                    </div>
                    <div class="col-md-4 col-sx-12 com-sm-12">
                      <div class="checkbox">
                        <label class="form-checkbox form-icon form-text active text-blue">
                          <strong><input type="checkbox" id="checkFacultades" value=""> Todas las Facultades</strong>
                        </label>                    
                    </div>  
                    </div>
                    <div class="col-md-4 col-sx-12 com-sm-12">
                      <div class="checkbox">
                        <label class="form-checkbox form-icon form-text active text-blue">
                          <strong><input type="checkbox" id="checkOficinas" value=""> Todas las Oficinas</strong>
                        </label>                      
                    </div>
                    </div>
                  </div>
                  <?php generaAreaMultiple($dato);?>
                </div>            
              </div>
          </div>
            </div>
          </div>
          
        </div>
      </div>
      <span id="resultado"></span>
      <div class="box-footer">
        <button class="btn btn-primary pull-right" type="submit" name="guardar">Enviar</button>
      </div>
    </form>
  
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-body table-responsive no-padding">
            <table id="tabla" class="table table-hover">
              <thead>
                <tr>
                  <th>EXP.</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <th>FOLIOS</th>
                  <th>SE ADJUNTA</th>
                  <th>FECHA</th>
                  <!--<th>Prioridad</th>
                  <th>PLAZO</th>-->
                  <th>DESTINO</th>
                  <th>ESTADO</th>
                  <!--<th>VER</th>
                  <th>EDIT/ANUL</th>-->
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="select * from vta_rptdocdis where idarea='$ar' and idderiva is not null;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fechingsist'];?></td>
                  <!--<td><?php echo $fila['prioridad'];?></td>
                  <td><?php DiasFaltantes($fila['idexpediente']);?> </td>-->
                  <td><?php echo $fila['destino'];?> </td>
                  <td><?php estadodoc($fila['idestadoexp'],$fila['idestadodoc']);?></td>
                  <!--<td><p><a class="btn btn-block btn-success" target="_blank" href="file/<?php echo $fila['ruta']; ?>"><i class="fa fa-file-pdf-o"></i></a></p></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-sm btn-warning" href="actingresodoc.php?id=<?php echo $fila['idexpediente'];?>"><i class="fa fa-pencil-square-o"></i></a>
                      <a class="btn btn-sm btn-danger" href="../enlace/elmemitirdoc.php?id=<?php echo $fila['idexpediente'];?>" ><i class="fa fa-ban"></i></a>
                
                  </td>-->
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

<script>
  
  $(document).ready(function(){
    var $select_area = $(".select2_area").select2();
    $("#checkFacultades").on("click", function () {
      if(this.checked) {
        if(document.getElementById('checkOficinas').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286",
            "25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286"]).trigger("change");
        }
      }else{
        if(document.getElementById('checkOficinas').checked) {
          $select_area.val(["25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(null).trigger("change");
        }
      }
    });

    $("#checkOficinas").on("click", function () {
      if(this.checked) {
        if(document.getElementById('checkFacultades').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286",
            "25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(["25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }
      }else{
        if(document.getElementById('checkFacultades').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286"]).trigger("change");
        }else{
          $select_area.val(null).trigger("change");
        }
      }
    });


    
  });

  function tipodoc(){
    if($("#area").val()==null){ 
      alert('ingrese destino');
    }
  }
</script>