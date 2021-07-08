<?php
session_start();
require_once('../enlace/conexion.inc');
$idtrabajador=$_REQUEST['id'];

  $DesdeLetra = "a";
  $HastaLetra = "z";
  $DesdeNumero = 1000;
  $HastaNumero = 10000;

  $letra1 = chr(rand(ord($DesdeLetra), ord($HastaLetra)));
  $letra2 = chr(rand(ord($DesdeLetra), ord($HastaLetra)));
  $letra3 = chr(rand(ord($DesdeLetra), ord($HastaLetra)));
  $letra4 = chr(rand(ord($DesdeLetra), ord($HastaLetra)));
  $numero = rand($DesdeNumero, $HastaNumero);
  $letra=strtoupper($letra1).''.$letra2.''.$letra3.''.$letra4;
  $psd=$letra.''.$numero;

  $query="update usuario set clave=sha1(md5('$psd')) where idtrabajador='$idtrabajador';";
  $consulta=mysqli_query(conectar(),$query);

if ($consulta) {
  echo "<script language='JavaScript' type='text/javascript'>
  var psd='$psd';
  alert('Su nueva clave es: '+psd);
  window.location='buscarusuario.php';
  </script>";
}else {
  echo "<script language='JavaScript' type='text/javascript'>
  alert('ERROR !!!');
  window.location='buscarusuario.php';
  </script>";
}




 ?>
