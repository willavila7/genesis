<?php
function conectar()
{
	$server="localhost";
	$user="root";
	$password="wjac";
	$database="sisgedo";

	$connec = mysqli_connect($server,$user,$password,$database);

	return $connec;
}

function desconectar()
{
	$salir = mysqli_close(conectar());
}
?>
