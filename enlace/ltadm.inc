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
        <!-- Menu Mantenimiento -->
        <li class="treeview">
          <a href="#"><i class="fa fa-laptop"></i> <span>Mantenimiento</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-user"></i>Registro Empleados<i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu menu-open">
                <li><a href="empleado.php"><i class="fa fa-plus"></i>Crear Empleados</a></li>
                <li><a href="editempleado.php"><i class="fa fa-search"></i>Mantenimiento Empleados</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-user"></i>Registro Usuarios<i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu menu-open">
                <li><a href="crearusuario.php"><i class="fa fa-plus"></i>Crear Usuarios</a></li>
                <li><a href="buscarusuario.php"><i class="fa fa-search"></i>Buscar Usuarios</a></li>
              </ul>
            </li>
            <li><a href="persona.php"><i class="fa fa-user"></i>Registro Persona</a></li>
            <li><a href="institucion.php"><i class="fa fa-user"></i>Registro Institucion</a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-table"></i><span>Tablas</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="areacargo.php"><i class="fa fa-list-alt"></i>Area y Cargos</a></li>
                <li><a href="tabla.php"><i class="fa fa-list-alt"></i>Proveido</a></li>
                <li><a href="tabla.php"><i class="fa fa-list-alt"></i>Año</a></li>
                <li><a href="tabla.php"><i class="fa fa-list-alt"></i>Prioridad</a></li>
              </ul>
            </li>
          </ul>
          <li class="treeview">
            <a href="documento.php"><i class="fa fa-file"></i><span>Documentos</span></a>
          </li>
          <li class="treeview">
            <a href="directorio.php"><i class="fa fa-calendar"></i><span>Directorio</span></a>
          </li>
        </li>
        <!-- Menu Mantenimiento -->
      </ul>
    </section>
  </aside>
