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
        DOCUMENTOS RECIBIDOS
        <small><?php AreaxUsuario($dato); ?>
        </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Nivel</a></li>
        <li class="active">Usuario</li>
      </ol>
    </section>

    <!-- Contenido -->
    <form action="reportepdfrec.php" method="post">
    <section class="content-header">
      <p class="margin">
        <div class="row ">
          <div class="col-md-6">
            <label>Fecha de Inicio del Reporte (dd/mm/aaaa)</label>
            <input class="form-control" type="date" name="txtfecini" required value="<?php fecha(); ?>">
          </div>
          <div class="col-md-6">
            <label>Fecha Fin del Reporte (dd/mm/aaaa)</label>
            <input class="form-control" type="date" name="txtfecfin" required value="<?php fecha(); ?>">
          </div>
        </div>
      </p>
      <p class="margin"></p>
    </section>
    <section class="content-header">
      <p class="margin"></p>
      <div class="row"> 
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red">
              <i class="fa fa-file-pdf-o"></i>
            </span>
            <div class="info-box-content">
              <span class="info-box-text">Formato PDF</span>
              <span class="info-box-text">.</span>
              <button type="submit" class="btn btn-default" name="consultar"><i class="fa fa-print"></i> Descargar</button>
            </div>
          </div>
        </div>
      </div>
    </section>
    </form>
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
                  <th>OFICINA</th>
                  <th>DOCUMENTO</th>
                  <th>ASUNTO</th>
                  <th>FOLIOS</th>                  
                  <th>OBSERVACION</th>
                  <th>FECHA</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $ar=idAreaxUsuario($dato);
                $query="SELECT * FROM vta_reporterec where idarea='$ar';";
                $resultado=mysqli_query(conectar(), $query);
                while($fila=mysqli_fetch_assoc($resultado)){
                ?>
                <tr>
                  <td><?php echo $fila['origen'];?></td>
                  <td><?php echo $fila['documento'];?></td>
                  <td><?php echo $fila['asunto'];?></td>
                  <td><?php echo $fila['folios'];?></td>
                  <td><?php echo $fila['observacion'];?></td>
                  <td><?php echo $fila['fechderiva'];?></td>
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
 

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Actividades Recientes</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript::;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cumpleaños de Usuario</h4>

                <p>Sera el 23 de Abril 24:00</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Progreso de Tareas</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript::;">
              <h4 class="control-sidebar-subheading">
                Documentos Resueltos
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">Configuracion General</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Reporte de uso
              <input type="checkbox" class="pull-right" checked>
            </label>
            <p>
              Sistema a cargo de la Oficina General de Tecnologias de Informacion,
              creado por el personal de la Unidad de Gestion de Sistemas y Desarrollo de Software
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.0 -->
<script src="../plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
$('#tabla').DataTable({
  "sPaginationType": "full_numbers",
  "bJqueryUI": true,
  });
});
</script>
</body>
</html>
