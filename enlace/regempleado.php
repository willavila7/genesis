<?php
  require_once('conexion.inc');

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
            VALUES('$res','$feching','$resing',$null,'','1',$idper,$idarea,$idcargo,$modalidad,$null);";
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
 ?>
