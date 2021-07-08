  <?php
  require_once('conexion.inc');
  session_start();

if (isset($_POST['regarea'])) {
  $area= strtoupper($_POST['txtarea']);
  $siglas= strtoupper($_POST['txtsiglas']);
  $telefono= $_POST['txttelefono'];
  $anexo= $_POST['txtanexo'];
  $correo= strtoupper($_POST['txtcorreo']);
  $idarea= $_POST['area'];
  $idlocal= $_POST['local'];
  $null="null";

  if($telefono==''){$telefono="";}
  if($anexo==''){$anexo="";}
  if($correo==''){$correo="";}
  if($idarea==0){$idarea=$null;}

    $query="INSERT INTO area(area,siglas,telefono,anexo,correo,area_idarea,idlocal)
    VALUES('$area','$siglas','$telefono','$anexo','$correo',$idarea,$idlocal)";
    $resultado=mysqli_query(conectar(),$query);

   if($resultado){
     header("Location: ../admin/areacargo.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('ERROR DE REGISTRO !!!);
       </script>";
     }
}
if (isset($_POST['regcargo'])) {
  $cargo= strtoupper($_POST['txtcargo']);
  $query="INSERT INTO cargo(cargo) VALUES('$cargo')";
  $resultado=mysqli_query(conectar(),$query);

   if($resultado){
     header("Location: ../admin/areacargo.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
     }
}
if (isset($_POST['reganio'])) {

  $anio= $_POST['txtanio'];
  $nombre= strtoupper($_POST['txtnombre']);
  $query="INSERT INTO anio(anio,nombre) VALUES('$anio','$nombre');";
  $resultado=mysqli_query(conectar(),$query);

  if($resultado){
    header("Location: ../admin/tabla.php");
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Faltan datos, usuario no registrado');
    </script>";
  }
}
if (isset($_POST['regproveido'])) {
  $proveido= strtoupper($_POST['txtproveido']);
  $query="INSERT INTO proveido(proveido) VALUES('$proveido')";
  $resultado=mysqli_query(conectar(),$query);

  if($resultado){
    header("Location: ../admin/tabla.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
  }
}
if (isset($_POST['regprioridad'])) {
  $prioridad= strtoupper($_POST['txtprioridad']);
  $dias= $_POST['txtdias'];

  $query="INSERT INTO prioridad(prioridad,descripcion,dias) VALUES('$prioridad','','$dias')";
  $resultado=mysqli_query(conectar(),$query);

  if($resultado){
    header("Location: ../admin/tabla.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
    }
}
if (isset($_POST['regpersona'])) {
  $dni= $_POST['txtdni'];
  $ruc= $_POST['txtruc'];
  $apellidos= strtoupper($_POST['txtapellidos']);
  $nombres= strtoupper($_POST['txtnombres']);
  #$genero= $_POST['rbtgenero'];
  $direccion= strtoupper($_POST['txtdireccion']);
  $celular= $_POST['txtcelular'];
  $telefono= $_POST['txttelefono'];
  $correo1= strtoupper($_POST['txtcorreo1']);
  $correo2= strtoupper($_POST['txtcorreo2']);
  #$iddistrito= $_POST['distritos'];

  if($ruc==""){$ruc="";}
  if($direccion==""){$direccion="";}
  if($telefono==""){$telefono="";}
  if($correo1==""){$correo1="";}
  if($correo2==""){$correo2="";}

  if (trim(strlen($dni))==8) {
    if (isset($_POST['rbtgenero'])) {
      if (isset($_POST['distritos'])) {
        $consulta=mysqli_query(conectar(),"select * from persona where dni='$dni';");
        $existe=mysqli_num_rows($consulta);
        if ($existe>0) {
          echo "<script language='JavaScript' type='text/javascript'>
          alert('La persona ya existe con este DNI');
          window.location='../admin/persona.php';
          </script>";
        }else {
          $genero=$_POST['rbtgenero'];
          $iddistrito= $_POST['distritos'];
          $query="INSERT INTO persona(dni,ruc,apellidos,nombres,genero,direccion,telefono1,telefono2,correo1,correo2,intext,idlocal)
          VALUES('$dni','$ruc','$apellidos','$nombres','$genero','$direccion','$celular','$telefono','$correo1','$correo2','0','$iddistrito')";
          $resultado=mysqli_query(conectar(),$query);

           if($resultado){
             header("Location: ../admin/persona.php");
            }else{
               echo "<script language='JavaScript' type='text/javascript'>
               alert('Faltan datos, usuario no registrado');
               window.location='../admin/persona.php';
               </script>";
             }
        }
      }else {
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Es necesario seleccionar el distrito de procedencia de la persona');
        window.location='../admin/persona.php';
        </script>";
      }
    }else {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Es necesario seleccionar el genero de la persona');
      window.location='../admin/persona.php';
      </script>";
    }
  }else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('El DNI necesita contener 8 digitos');
    window.location='../admin/persona.php';
    </script>";
  }
}
if (isset($_POST['reginstitucion'])) {
  $razonsocial= strtoupper($_POST['txtrazonsocial']);
  $ruc= $_POST['txtruc'];
  $correo= strtoupper($_POST['txtcorreo']);
  $direccion= strtoupper($_POST['txtdireccion']);
  $telefono= $_POST['txttelefono'];
  #$iddistrito= $_POST['distritos'];
  $tipinst= $_POST['tipoinstitucion'];
  $dni=$_POST['txttramite'];

  if ($correo=='') {    $correo=='';  }
  if ($telefono=='') {    $telefono=='';  }
  if ($direccion=='') {    $direccion=='';  }

  if (trim(strlen($ruc))==11) {
    if (isset($_POST['distritos'])) {
      if ($tipinst==0) {
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Seleccione el tipo de institucion');
        window.location='../admin/institucion.php';
        </script>";
      }else {
        if (trim(strlen($dni))==8) {

          $resultado=mysqli_query(conectar(),"SELECT idpersona FROM persona WHERE dni='$dni' and intext='0';");
          $fila=mysqli_fetch_assoc($resultado);
          $idpersona=$fila['idpersona'];

          if ($idpersona=='') {
            echo "<script language='JavaScript' type='text/javascript'>
            alert('El DNI del tramitante aun no ha sido registrado');
            window.location='../admin/persona.php';
            </script>";
          }else {
            $insert=mysqli_query(conectar(),"INSERT INTO institucion(ruc,razonsocial,correo,direccion,telefono,idpersona,idtipoinstitucion,idlocal)
            VALUES('$ruc','$razonsocial','$correo','$direccion','$telefono','$idpersona','$tipinst','$iddistrito')");

            if($insert){
              header("Location: ../mp/institucion.php");
              }else{
                echo "<script language='JavaScript' type='text/javascript'>
                alert('Faltan datos, usuario no registrado');
                window.location='../admin/institucion.php';
                </script>";
              }
          }
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          alert('El DNI necesita tener 8 digitos');
          window.location='../admin/institucion.php';
          </script>";
        }
      }
    }else {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Seleccione un distrito de procedencia para la institucion');
      window.location='../admin/institucion.php';
      </script>";
    }
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('El ruc necesita tener 11 digitos');
    window.location='../mp/institucion.php';
    </script>";
  }
}
if (isset($_POST['regempleado'])) {
  $dni= $_POST['txtdni'];
  $ruc= $_POST['txtruc'];
  $nombres= strtoupper($_POST['txtnombres']);
  $apellidos= strtoupper($_POST['txtapellidos']);
  #$genero= $_POST['rbtgenero'];
  $fechnac= $_POST['txtfechnac'];
  $direccion= strtoupper($_POST['txtdireccion']);
  $celular= $_POST['txtcelular'];
  $telefono= $_POST['txttelefono'];
  $correo1= strtoupper($_POST['txtcorreo1']);
  $correo2= strtoupper($_POST['txtcorreo2']);
  #$iddistrito= $_POST['distritos'];
  $idarea= $_POST['area'];
  $idcargo= $_POST['cargo'];
  $modalidad= $_POST['modalidad'];
  #$categoria=$_POST['categoria'];
  $res= $_POST['rbtres'];
  $feching=$_POST['txtfechingreso'];
  $resing= strtoupper($_POST['txtresing']);
  $null="null";

  if($ruc==""){$ruc="";}
  if($direccion==""){$direccion="";}
  if($telefono==""){$telefono="";}
  if($correo1==""){$correo1="";}
  if($correo2==""){$correo2="";}
  #if($categoria==0){$categoria=$null;}

  if (trim(strlen($dni))==8) {
    if (isset($_POST['rbtgenero'])) {
      if (isset($_POST['distritos'])) {
  if ($idarea==0 || $idcargo==0 || $modalidad==0) {
          echo "<script language='JavaScript' type='text/javascript'>
          alert('Seleccione todos los campos');
          window.location='../admin/empleado.php';
          </script>";
        }else {
          $consulta=mysqli_query(conectar(),"select * from persona where dni='$dni';");
          $existe=mysqli_num_rows($consulta);
          if ($existe>0) {
            echo "<script language='JavaScript' type='text/javascript'>
            alert('La persona ya existe con este DNI');
            window.location='../admin/empleado.php';
            </script>";
          }else {
            $genero= $_POST['rbtgenero'];
            $iddistrito= $_POST['distritos'];
            $query="INSERT INTO persona(dni,ruc,apellidos,nombres,fechnac,genero,direccion,telefono1,telefono2,correo1,correo2,intext,idlocal)
            VALUES('$dni','$ruc','$apellidos','$nombres','$fechnac','$genero','$direccion','$celular','$telefono','$correo1','$correo2','1','$iddistrito')";
            $resultado=mysqli_query(conectar(),$query);

            $query1="SELECT idpersona FROM persona WHERE dni='$dni';";
            $captura=mysqli_query(conectar(),$query1);
            $idpersona=mysqli_fetch_assoc($captura);
            $idper=$idpersona['idpersona'];

            $query2="INSERT INTO trabajador(responsable,fechingreso,resingreso,fechcese,rescese,estado,idpersona,idarea,idcargo,idmodalidad,idcategoria)
            VALUES('$res','$feching','$resing',$null,'','0',$idper,$idarea,$idcargo,$modalidad,$null);";
            $resultado1=mysqli_query(conectar(),$query2);

           if($resultado1){
             header("Location: ../admin/empleado.php");
            }else{
               echo "<script language='JavaScript' type='text/javascript'>
               alert('Faltan datos, empleado no registrado');
               window.location='../admin/empleado.php';
               </script>";
             }
          }
        }
      }else {
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Seleccione el distrito de procedencia del empleado');
        window.location='../admin/empleado.php';
        </script>";
      }
    }else {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Seleccione el genero del empleado');
      window.location='../admin/empleado.php';
      </script>";
    }
  }else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Es necesario que el DNI contenga 8 digitos');
    window.location='../admin/empleado.php';
    </script>";
  }
}
if (isset($_POST['regfoto'])) {
  if(empty($_FILES['archivo']['name'])) {
   echo "<script language='JavaScript' type='text/javascript'>
   alert('Cargue antes su foto');
   window.location='../admin/subirfoto.php';
   </script>";
 }else {
   $nombre = $_FILES['archivo']['name'];
   $vacio="user.jpg";
   $usu=$_SESSION['usuario'];
   $null="null";
       if ($nombre == "") {
         $ruta=$vacio;
       }else {
         $nombretmp = $_FILES['archivo']['tmp_name'];
         $destino = "../admin/image/" . $nombre;
         if (copy($nombretmp, $destino)){
             $ruta=$nombre;
             $query="UPDATE usuario set ruta='$ruta' where idusuario='$usu'";
             $consulta=mysqli_query(conectar(),$query);
             header("Location: ../admin/subirfoto.php");
         } else{
             $ruta=$vacio;
           }
       }
 }
}
if (isset($_POST['regperfil'])) {

  $direccion = strtoupper($_POST['txtdireccion']);
  $celular = $_POST['txtcelular'];
  $telefono = $_POST['txttelefono'];
  $correo1 = strtoupper($_POST['txtcorreo1']);
  $correo2 = strtoupper($_POST['txtcorreo2']);
  $usu=$_SESSION['usuario'];
  $null="null";
  if($direccion==""){$direccion="";}
  if($celular==""){$celular="";}
  if($telefono==""){$telefono="";}
  if($correo1==""){$correo1="";}
  if($correo2==""){$correo2="";}

  $query="UPDATE persona pr, trabajador tb, usuario us
  set pr.direccion='$direccion',pr.telefono1='$celular',pr.telefono2='$telefono',pr.correo1='$correo1',pr.correo2='$correo2'
  where us.idtrabajador=tb.idtrabajador and tb.idpersona=pr.idpersona and idusuario='$usu';";
  $consulta=mysqli_query(conectar(),$query);

  if($consulta){
    header("Location: ../admin/subirfoto.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, datos no registrado');
      </script>";
    }
}
if (isset($_POST['regemper'])) {
  $idpersona=$_SESSION['idpr'];
  $idarea= $_POST['area'];
  $idcargo= $_POST['cargo'];
  $modalidad= $_POST['modalidad'];
  $res= $_POST['rbtres'];
  $feching=$_POST['txtfechingreso'];
  $resing= $_POST['txtresing'];
  $null="null";
  if ($idarea==0 || $idcargo==0 || $modalidad==0) {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Seleccione todos los campos');
    window.location='../admin/peremp.php';
    </script>";
  }else {
    $consulta=mysqli_query(conectar(),"select * from persona where dni='$dni';");
    $existe=mysqli_num_rows($consulta);

    $query="update persona set intext='1' where idpersona=$idpersona;";
    $resultado=mysqli_query(conectar(),$query);
    
    $query1="INSERT INTO trabajador(responsable,fechingreso,resingreso,fechcese,estado,idpersona,idarea,idcargo,idmodalidad)
    VALUES('$res','$feching','$resing',$null,'1',$idpersona,$idarea,$idcargo,$modalidad);";
    $resultado1=mysqli_query(conectar(),$query1);

    if($resultado1){
      header("Location: ../admin/persona.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, empleado no registrado');
      window.location='../admin/peremp.php';
      </script>";
    }    
  }
}
 ?>
