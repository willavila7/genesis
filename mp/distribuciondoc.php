<!DOCTYPE html>

<html>
<head>
  <?php
    //RUTA: mp/distribuciondoc.php -- OK
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
        DERIVAR DOCUMENTOS
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
      <form action="../enlace/regdistribuciondoc.php" class="" method="post">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-body">
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-3 col-sx-12 com-sm-12">
                      <label>Destino(s)</label> <label class="text-red">(*)</label> 
                    </div>
                    <div class="col-md-offset-4 col-md-3 col-sx-12 com-sm-12">
                      <div class="checkbox">
                        <label class="form-checkbox form-icon form-text active text-blue">
                          <strong><input type="checkbox" id="checkFacultades" value=""> Todas las Facultades</strong>
                        </label>                    
                    </div>  
                    </div>
                    <div class="col-md-2 col-sx-12 com-sm-12">
                      <div class="checkbox">
                        <label class="form-checkbox form-icon form-text active text-blue">
                          <strong><input type="checkbox" id="checkOficinas" value=""> Todas las Oficinas</strong>
                        </label>                      
                    </div>
                    </div>
                  </div>
                  <?php generaAreaMultiple($dato);?>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <label>Hoja de envio / Proveido</label>
                    <?php CargaSelect('proveido','2') ?>
                  </div>
                  <div class="col-md-6">
                    <label>Observacion</label>
                    <textarea class="form-control" name="txtasunto" placeholder="Asunto"></textarea>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <button class="btn btn-primary pull-right" type="submit">Derivar</button>
              </div>
          </div>
        </div>

    </div>
    
    </section>    
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
          </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>EXP.</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <th>FOLIOS</th>
                  <th>SE ADJUNTA</th>
                  <th>FECHA</th>
                  <!--<th>Plazo</th>-->
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_rptdocdis where idarea='$ar' and (idestadoexp='1' or idestadoexp='2')
                and idestadodoc='1' order by expediente desc;";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td>
                    <div class="form-group">
                      <input type="checkbox" class="" name="documento[]" value="<?php echo $fila['idexpediente']; ?>">
                    </div>
                  </td>
                  <td><?php echo $fila['expediente'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fechingsist'];?></td>
                  <!--<td><?php DiasFaltantes($fila['idexpediente']);?></td>-->
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
  </form>
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

</script>
