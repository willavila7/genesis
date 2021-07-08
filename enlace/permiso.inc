<?php
/**
 * Esta procedimiento verifica que se tiene un tipo de rol concreto y en caso de que no se tenga
 * dicho rol se redirige a la pagina principal.
 * @param $rol Cadena
 */
function verificarPermisos($rol){
	if($rol != $_SESSION['tipo']){
		header("Location: ../index.php");
	}
}
?>
