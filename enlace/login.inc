<?php
session_start();
require_once ('conexion.inc');

if(isset($_POST['login'])){

$usuario = mysqli_real_escape_string(conectar(),$_POST['txtusuario']);
$clave = mysqli_real_escape_string(conectar(),$_POST['txtclave']);

$query = "SELECT us.idusuario,us.clave,us.idtipousuario,tb.estado from usuario us, trabajador tb
where us.idtrabajador=tb.idtrabajador and us.idusuario='$usuario' and us.clave=sha1(md5('$clave')) and tb.estado='1';";
$resultado = mysqli_query(conectar(), $query);
$filan = mysqli_num_rows($resultado);

if($filan>0){
	$filac = $resultado=mysqli_fetch_assoc($resultado);
	$_SESSION['usuario']=$filac["idusuario"];
	$_SESSION['tipousuario']=$filac["idtipousuario"];
	if (isset($_SESSION['usuario'])){
		switch ($_SESSION['tipousuario']){
			case '1' : header("Location: admin/index.php");
			           break;
			case '2' : header("Location: mp/index.php");
			           break;
			case '3' : header("Location: mp/index.php");
					 			 break;
			case '4' : header("Location: mp/index.php");
								 break;
			}
		}
	}
	else {
		echo "<script>alert('usuario o contraseña incorrectos, intente de nuevo!')</script>";
	}
}
?>
