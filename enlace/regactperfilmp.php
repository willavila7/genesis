<?php
  session_start();
  require_once('conexion.inc');

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
      header("Location: ../mp/subirfoto.php");
      }else{
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Faltan datos, datos no registrado');
        </script>";
      }

 ?>
