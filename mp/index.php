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
  ?>
  <header class="main-header">
      <a href="index.php" class="logo">
        <span class="logo-mini"><b>TD</b>-U</span>
        <span class="logo-lg"><b>SISGEDO</b></span>
      </a>
      <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <li class="dropdown messages-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-envelope-o"></i>
                <span class="label label-success"><?php contadorRec($dato); ?></span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">Tiene <?php contadorRec($dato); ?> documentos por recibir</li>
                <li>
                  <ul class="menu">
                    <?php
                    $idare=idAreaxUsuario($dato);
                    $querym="select * from vta_recepciondoc where idarea='$idare' and idestadoexp='2' and idestadodoc='2'
                    order by idexpediente desc;";
                    $resultadom=mysqli_query(conectar(), $querym);
                    while($filam=mysqli_fetch_assoc($resultadom)){
                    ?>
                    <li>
                      <a href="recibirdoc.php">
                        <div class="pull-left">
                          <img src="image/<?php echo $filam['foto']; ?>" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          <?php echo $filam['origen']; ?>
                          <small><!--<i class="fa fa-clock-o"></i>--><?php echo $filam['fecha']; ?></small>
                        </h4>
                        <p><?php echo $filam['documento']; ?></p>
                      </a>
                    </li>
                    <?php
                    }
                    ?>
                  </ul>
                </li>
                <li class="footer"><a href="recibirdoc.php">Ver Todos los Documentos Recibidos</a></li>
              </ul>
            </li>
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="image/<?php foto($dato); ?>" class="user-image" alt="User Image">
                <span class="hidden-xs"><?php UsuarioNombre($dato); ?></span>
              </a>
              <ul class="dropdown-menu">
                <li class="user-header">
                  <img src="image/<?php foto($dato); ?>" class="img-circle" alt="User Image">
                  <p>
                    <?php
                    UsuarioNombre($dato);
                    ?> - <?php CargoUsuario($dato); ?>
                    <small><?php Miembro($dato); ?></small>
                  </p>
                </li>
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="subirfoto.php" class="btn btn-default btn-flat">Perfil</a>
                  </div>
                  <div class="pull-right">
                    <a href="../enlace/logout.php" class="btn btn-default btn-flat">Cerrar Sesion</a>
                  </div>
                </li>
              </ul>
            </li>
            <li>
              <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
            </li>
          </ul>
        </div>
      </nav>
    </header>
  <?php
  MenuPermiso($dato,'1');
   ?>
  <div class="content-wrapper">
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
    <?php MenuPermiso($dato,'4') ?>
  </div>
  <footer class="main-footer">
    <div class="pull-right hidden-xs">Gerencia de Operaciones</div>
    <strong>Copyright &copy; 2021 <a href="http://www.retait.com/" target="_blank">RETAIT</a>.</strong> Todos los derechos reservados.
  </footer>
  <aside class="control-sidebar control-sidebar-dark">
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <!--<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>-->
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Actividades Recientes</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript::;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cumpleaños de <?php UsuarioNombre($dato); ?></h4>
                <p><?php Aniversario($dato); ?></p>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </aside>
  <div class="control-sidebar-bg"></div>
</div>
<script src="../plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../dist/js/app.min.js"></script>

</body>
</html>
