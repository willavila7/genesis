<?php
session_start();
require_once('../enlace/conexion.inc');
/*$tipousu=$_POST['tipousuario'];*/
$idtrabajador=$_REQUEST['id'];

/*if ($tipousuario=='0') {
  echo "<script language='JavaScript' type='text/javascript'>
  alert('Seleccione antes el tipo de usuario');
    window.location='crearusuario.php';
  </script>";
}else {*/

  $query="SELECT ar.idarea, ar.siglas, left(pr.apellidos,'1') as segundo, pr.apellidos, left(pr.nombres,'1') as primero, pr.genero, lc.idlocal
  from area ar,trabajador tb, persona pr, local lc
  where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and  ar.idlocal=lc.idlocal and  tb.idtrabajador='$idtrabajador';";
  $consulta=mysqli_query(conectar(),$query);
  $resultado=mysqli_fetch_assoc($consulta);
  $idlocal=$resultado['idlocal'];
  $tercero=substr(end( explode(' ', $resultado['apellidos']) ),0, 1);

  $usuario=$resultado['siglas'].'-'.$resultado['primero'].''.$resultado['segundo'].''.$tercero;

  if ($resultado['genero']=='F') {$ruta="userf.png";}
  if ($resultado['genero']=='M') {$ruta="userm.png";}

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
  $clave=$letra.''.$numero;
 
  if ($idlocal!=1) {    $tipousuario=4;  }else { $tipousuario=3; }
  
  $query1="update trabajador tb set tb.estado='1' where tb.idtrabajador=$idtrabajador;";
  $consulta1=mysqli_query(conectar(),$query1);

  $query2="insert into usuario(idusuario,clave,ruta,idtrabajador,idtipousuario)
  values('$usuario',sha1(md5('$clave')),'$ruta',$idtrabajador,'$tipousuario');";
  $consulta2=mysqli_query(conectar(),$query2);
  if ($consulta2) {
    echo "<script language='JavaScript' type='text/javascript'>
    var usu='$usuario';
    var psd='$clave';
    alert('Su usuario es: '+usu+' y clave: '+psd);
      window.location='crearusuario.php';
    </script>";
  }else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('ERROR DE REGISTRO !!!');
      window.location='crearusuario.php';
    </script>";
  }
/*}*/
 ?>
