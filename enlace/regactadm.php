<?php
  session_start();
  require_once('conexion.inc');
  if (isset($_POST['actarea'])) {
    $idarea=$_SESSION['idarea'];
    $area= strtoupper($_POST['txtarea']);
    $siglas= strtoupper($_POST['txtsiglas']);
    $telefono= $_POST['txttelefono'];
    $anexo= $_POST['txtanexo'];
    $correo= strtoupper($_POST['txtcorreo']);
    $idar= $_POST['area'];
    $idlocal= $_POST['local'];

    if($siglas==''){$siglas=$null;}
    if($telefono==''){$telefono=$null;}
    if($anexo==''){$anexo=$null;}
    if($correo==''){$correo=$null;}

      $query="UPDATE area set area='$area', siglas='$siglas', telefono='$telefono', anexo='$anexo', correo='$correo',
      area_idarea='$idar', idlocal='$idlocal' where idarea='$idarea';";
      $resultado=mysqli_query(conectar(),$query);

     if($resultado){
       header("Location: ../admin/areacargo.php");
      }else{
         echo "<script language='JavaScript' type='text/javascript'>
         alert('Faltan datos, usuario no registrado');
         </script>";
       }
  }
  if (isset($_POST['actcargo'])) {
    $idcargo=$_SESSION['idcargo'];
    $cargo= strtoupper($_POST['txtcargo']);

    $query="UPDATE cargo set cargo='$cargo' where idcargo='$idcargo';";
    $resultado=mysqli_query(conectar(),$query);

    if($resultado){
      header("Location: ../admin/areacargo.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
    }
  }
  if (isset($_POST['actanio'])) {
    $idanio=$_SESSION['idanio'];
    $anio= $_POST['txtanio'];
    $nombre= strtoupper($_POST['txtnombre']);

    $query="UPDATE anio set anio='$anio', nombre='$nombre' where idanio='$idanio';";
    $resultado=mysqli_query(conectar(),$query);

      if($resultado){
        header("Location: ../admin/tabla.php");
      }else{
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Faltan datos, usuario no registrado');
        </script>";
      }
  }
  if (isset($_POST['actproveido'])) {
    $idproveido=$_SESSION['idproveido'];
    $proveido= strtoupper($_POST['txtproveido']);

    $query="UPDATE proveido set proveido='$proveido' where idproveido='$idproveido';";
    $resultado=mysqli_query(conectar(),$query);

    if($resultado){
      header("Location: ../admin/tabla.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
    }
  }
  if (isset($_POST['actprioridad'])) {
    $idprioridad=$_SESSION['idprioridad'];
    $prioridad= strtoupper($_POST['txtprioridad']);
    $dias= $_POST['txtdias'];

    $query="UPDATE prioridad set prioridad='$prioridad', dias='$dias' where idprioridad='$idprioridad';";
    $resultado=mysqli_query(conectar(),$query);

    if($resultado){
      header("Location: ../admin/tabla.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
    }
  }
  if (isset($_POST['actempleado'])) {
    $idempleado=$_SESSION['idempleado'];
    $dni= $_POST['txtdni'];
    $ruc= $_POST['txtruc'];
    $nombres= strtoupper($_POST['txtnombres']);
    $apellidos= strtoupper($_POST['txtapellidos']);
    $fechnac= $_POST['txtfechnac'];
    $feching=$_POST['txtfechingreso'];
    $resing=$_POST['txtresing'];
    $res= $_POST['rbtres'];
    $null="null";

    if($ruc==""){$ruc="";} 
    if(isset($_POST['rbtres'])){$res=$_POST['rbtres'];}else { $res='0';} 

      $query1="UPDATE persona pr, trabajador tr
      set pr.dni='$dni', pr.ruc='$ruc', pr.apellidos='$apellidos',pr.nombres='$nombres',pr.fechnac='$fechnac',
      tr.fechingreso='$feching',tr.resingreso='$resing',tr.responsable='$res'
      WHERE tr.idpersona=pr.idpersona and tr.idtrabajador='$idempleado';";
      $captura=mysqli_query(conectar(),$query1);

     if($captura){
       header("Location: ../admin/empleado.php");
      }else{
         echo "<script language='JavaScript' type='text/javascript'>
         alert('Faltan datos, usuario no registrado');
         </script>";
    }
  }
  if (isset($_POST['actinstitucion'])) {
    $idinstitucion=$_SESSION['idinstitucion'];
    $razonsocial= strtoupper($_POST['txtrazonsocial']);
    $ruc= $_POST['txtruc'];
    $correo= strtoupper($_POST['txtcorreo']);
    $direccion= strtoupper($_POST['txtdireccion']);
    $telefono= $_POST['txttelefono'];
    $iddistrito= $_POST['distritos'];
    $tipinst= $_POST['tipoinstitucion'];
    $dni=$_POST['txttramite'];

    $query="SELECT idpersona FROM persona WHERE dni='$dni'";
    $resultado=mysqli_query(conectar(),$query);
    $fila=mysqli_fetch_assoc($resultado);

    $idpersona=$fila['idpersona'];

    $query1="UPDATE institucion set ruc='$ruc',razonsocial='$razonsocial',correo='$correo',direccion='$direccion',telefono='$telefono',
    idpersona='$idpersona',idtipoinstitucion='$tipinst',idlocal=$iddistrito where idinstitucion='$idinstitucion';";
    $resultado1=mysqli_query(conectar(),$query1);

    if($resultado1){
      header("Location: ../admin/institucion.php");
      }else{
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Faltan datos, institucion no registrado');
        </script>";
      }
  }
  if (isset($_POST['actpersona'])) {
    $idpersona=$_SESSION['idpersona'];
    $dni= $_POST['txtdni'];
    $ruc= $_POST['txtruc'];
    $apellidos= strtoupper($_POST['txtapellidos']);
    $nombres= strtoupper($_POST['txtnombres']);
    $genero= $_POST['rbtgenero'];
    $fechnac= $_POST['txtfechnac'];
    $direccion= strtoupper($_POST['txtdireccion']);
    $celular= $_POST['txtcelular'];
    $telefono= $_POST['txttelefono'];
    $correo1= strtoupper($_POST['txtcorreo1']);
    $correo2= strtoupper($_POST['txtcorreo2']);
    $iddistrito= $_POST['distritos'];

    if($ruc==""){$ruc="";}
    if($direccion==""){$direccion="";}
    if($telefono==""){$telefono="";}
    if($correo1==""){$correo1="";}
    if($correo2==""){$correo2="";}

      $query="UPDATE persona set dni='$dni',ruc='$ruc',apellidos='$apellidos',nombres='$nombres',fechnac='$fechnac',genero='$genero',direccion='$direccion',
      telefono1='$celular',telefono2='$telefono',correo1='$correo1',correo2='$correo2',idlocal=$iddistrito where idpersona='$idpersona'";
      $resultado=mysqli_query(conectar(),$query);

     if($resultado){
       header("Location: ../admin/persona.php");
       echo "Persona registrada";
      }else{
         echo "<script language='JavaScript' type='text/javascript'>
         alert('Faltan datos, usuario no registrado');
         </script>";
       }
  }
 ?>
