<?php
  session_start();
  require_once('conexion.inc');
  $idtrabajador=$_SESSION['idtb'];

  $area=$_POST['area'];
  $cargo=$_POST['cargo'];
  $fecha=$_POST['txtfecha'];
  $resp=$_POST['rbtres'];

  $delete="delete from usuario where idtrabajador='$idtrabajador';";
  $drop=mysqli_query(conectar(),$delete);

  $update="update trabajador set idarea='$area', idcargo='$cargo', fechingreso='$fecha', responsable='$resp'
  where idtrabajador='$idtrabajador';";
  $refresh=mysqli_query(conectar(),$update);

  $insert="insert into rotacion(idtrabajador,idarea) values($idtrabajador,$area);";
  $fila=mysqli_query(conectar(),$insert);

/*  $query="SELECT ar.siglas, left(pr.apellidos,'1') as segundo, pr.apellidos, left(pr.nombres,'1') as primero, pr.genero from area ar,trabajador tb, persona pr
  where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and  tb.idtrabajador='$idtrabajador';";
  $consulta=mysqli_query(conectar(),$query);
  $resultado=mysqli_fetch_assoc($consulta);
  $tercero=substr(end( explode(' ', $resultado['apellidos']) ),0, 1);

  $usuario=$resultado['siglas'].'-'.$resultado['primero'].''.$resultado['segundo'].''.$tercero;

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

  $query1="update usuario set idusuario='$usuario',set clave=sha1(md5('$clave')) where idtrabajador='$idtrabajador';";
  $consulta1=mysqli_query(conectar(),$query1);*/

 if($fila){
  echo "<script language='JavaScript' type='text/javascript'>
  window.location='../admin/editempleado.php';
   </script>";
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('ERROR !!!');
       </script>";
     }
 ?> 
