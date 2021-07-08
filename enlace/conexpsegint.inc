<?php
$usuario=$_SESSION['usuario'];
$query1="select ar.idarea from area ar, trabajador tb,usuario us
where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
$consar=mysqli_query(conectar(),$query1);
$ida=mysqli_fetch_assoc($consar);
$idar=$ida['idarea'];

if(isset($_POST['consulta'])){
$expediente = mysqli_real_escape_string(conectar(),$_POST['txtseguimiento']);

$query = "select dc.iddocumento, ex.idexpediente, ex.idarea, dc.documento
from documento dc, expediente ex
where dc.idexpediente=ex.idexpediente and ex.expediente='$expediente' and ex.idarea='$idar';";
$resultado = mysqli_query(conectar(), $query);

$filan = mysqli_num_rows($resultado);
if($filan>0){
	$filac = $resultado=mysqli_fetch_assoc($resultado);
	$_SESSION['documento']=$filac["documento"];
	$_SESSION['iddocumento']=$filac["iddocumento"];
	}
	else {
	echo "<script>alert('No hay registros con estos datos, revise sus datos o vuelva a intentarlo')</script>";
	}
}
?>
