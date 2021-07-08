<?php
session_start();
require_once('conexion.inc');

$area= $_POST['area'];
$proveido= $_POST['proveido'];
$asunto= strtoupper($_POST['txtasunto']);
$documento= $_POST['documento'];
$usuario= $_SESSION['usuario'];
$null="null";

$query="SELECT now() as fechora;";
$resultado=mysqli_query(conectar(),$query);
$fecha = mysqli_fetch_assoc($resultado);
$curdate=$fecha["fechora"];

$query1="SELECT tb.idtrabajador FROM trabajador tb, usuario us where us.idtrabajador=tb.idtrabajador and us.idusuario='$usuario';";
$resultado1=mysqli_query(conectar(),$query1);
$filatb=mysqli_fetch_assoc($resultado1);
$datotb=$filatb['idtrabajador'];


if($asunto==''){  $asunto='';}

for ($j=0;$j<count($documento);$j++){

  for ($i=0;$i<count($area);$i++){

    $query2=mysqli_query(conectar(),"SELECT tb.idtrabajador FROM trabajador tb, area ar WHERE tb.idarea=ar.idarea AND ar.idarea='$area[$i]' and tb.responsable='1';");
    $trab=mysqli_fetch_assoc($query2);
    $idtb[$i]=$trab['idtrabajador'];

    $query3=mysqli_query(conectar(),"SELECT dc.iddocumento from documento dc, expediente ex where dc.idexpediente=ex.idexpediente and ex.idexpediente='$documento[$j]';");
    $doc=mysqli_fetch_assoc($query3);
    $iddc=$doc['iddocumento'];

    $query4="UPDATE expediente set idestadoexp='2' where idexpediente='$documento[$j]';";
    $insert4=mysqli_query(conectar(),$query4);

    $query5="UPDATE documento set idestadodoc='2' where iddocumento='$iddc';";
    $insert5=mysqli_query(conectar(),$query5);

    $consulta="INSERT into deriva(deriva,fechderiva,idexpediente,idtrabajadoring,idtrabajadordes)
    values('$asunto','$curdate',$documento[$j],$datotb,$idtb[$i]);";
    $insert=mysqli_query(conectar(),$consulta);

    $rs = mysqli_query(conectar(),"SELECT MAX(idderiva) AS id FROM deriva");
    if ($row = mysqli_fetch_row($rs)) {$id = trim($row[0]);}

    $query6="INSERT into seguimiento(idderiva,idtrabajadorderiva,idtrabajadorrecepcion) values($id,$datotb,$null);";
    $resultado6=mysqli_query(conectar(),$query6);

    if ($proveido!=0) {
      $consulta1="INSERT into deriva_has_proveido values($id,$datotb,$proveido);";
      $insert1=mysqli_query(conectar(),$consulta1);
    }
  }
}
if($resultado6){
  header("Location: ../mp/distribuciondoc.php");
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('ERROR DE DISTRIBUCION !!!');
    </script>";
  }
 ?>
