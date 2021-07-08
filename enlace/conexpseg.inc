<?php
session_start();
require_once "conexion.inc";

if(isset($_POST['consulta'])){

$dni = mysqli_real_escape_string(conectar(),$_POST['txtdni']);
$expediente = mysqli_real_escape_string(conectar(),$_POST['txtexpediente']);

$query = "select pr.dni, pr.apellidos, dc.documento, dc.idexpediente, ex.expediente
from persona pr, documento dc, expediente ex
where dc.idexpediente=ex.idexpediente and dc.idpersona=pr.idpersona and pr.dni='$dni' and ex.expediente='$expediente' and ex.idarea='63';";
$resultado = mysqli_query(conectar(), $query);
$filan = mysqli_num_rows($resultado);

if($filan>0){
	$filac = $resultado=mysqli_fetch_assoc($resultado);
		$_SESSION['documento']=$filac["documento"];
	}
	else {
	echo "<script>alert('No hay registros con estos datos, revise sus datos o vuelva a intentarlo')</script>";
	}
}
?>
