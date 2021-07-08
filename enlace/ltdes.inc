  <aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="image/<?php foto($dato); ?>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php UsuarioNombre($dato); ?>
          </p>
          <!-- Estado -->
          <a href="#"><i class="fa fa-circle text-success"></i> En linea</a>
        </div>
      </div>

      <!-- Busqueda en menu opcional
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Buscar...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>-->

      <!-- Menu Lateral -->
      <ul class="sidebar-menu">
        <li class="header">Menu</li>
        <!-- Menu Archivo -->
        <li class="treeview">
          <a href="#"><i class="fa fa-cog"></i> <span>Ajustes</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="subirfoto.php"><i class="fa fa-upload"></i>Subir foto</a></li>
            <li><a href="cambio.php"><i class="fa fa-lock"></i>Cambiar Clave</a></li>
            <li><a href="../enlace/logout.php"><i class="fa fa-toggle-off"></i>Cerrar Sesion</a></li>
          </ul>
        </li>
        <!-- Menu Tramite -->
        <li class="treeview">
          <a href="#"><i class="fa fa-folder"></i> <span>Tramite</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="ingresodoc.php"><i class="fa fa-file-text"></i>Ingresar Documentos</a></li>
            <li><a href="emitirdoc.php"><i class="fa fa-file-text"></i>Emitir Documentos</a></li>
            <li><a href="recibirdoc.php"><i class="fa fa-file-text"></i>Recibir documentos<small class="label pull-right bg-red"><?php contadorRec($dato); ?></small></a></li>
            <li><a href="distribuciondoc.php"><i class="fa fa-file-text"></i>Derivar documentos</a></li>
            <li><a href="seguimientodoc.php"><i class="fa fa-file-text"></i>Seguimiento de documentos</a></li>
            <li><a href="archivardoc.php"><i class="fa fa-file-text"></i>Archivar documentos</a></li>
            <li><a href="archivo.php"><i class="fa fa-file-text"></i>Archivo</a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-file"></i><span>Reportes</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="reportedis.php"><i class="fa fa-file-o"></i>Hoja de envio</a></li>
                <li><a href="reporteing.php"><i class="fa fa-file-o"></i>Documentos ingresados</a></li>
                <li><a href="reportemit.php"><i class="fa fa-file-o"></i>Documentos emitidos</a></li>
                <li><a href="rptrecibidos.php"><i class="fa fa-file-o"></i>Documentos recibidos</a></li>
                <li><a href="documentoder.php"><i class="fa fa-file-o"></i>Documentos derivados</a></li>
                <li><a href="reporterec.php"><i class="fa fa-file-o"></i>Historico de documentos</a></li>
                <li><a href="reportecant.php"><i class="fa fa-file-o"></i>Estadisticas</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="treeview">
          <a href="directorio.php"><i class="fa fa-calendar"></i><span>Directorio</span></a>
        </li>
        <!-- Menu Tramite -->
      </ul>
    </section>
  </aside>
