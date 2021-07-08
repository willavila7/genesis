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
              <li class="footer"><a href="recibirdoc.php">Ver Todos los Documentos por Recibir</a></li>
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
          <!--<li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>-->
        </ul>
      </div>
    </nav>
  </header>
