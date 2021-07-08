<?php

	header("Content-type: application/vnd.ms-excel");
	header("Content-Disposition: attachment; filename=Reporte_excel.xls");

    session_start();
    include('../enlace/conexion.inc');
    include('../enlace/funcion.php');
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tramite Documentario | RETAIT</title>
</head>
<body>
	<?php
	if(isset($_SESSION['usuario'])){
			$dato=$_SESSION['usuario'];
	}else{  echo "no hay nombre";}
	$ini=$_POST['txtfecini'];
	$fin=$_POST['txtfecfin'];
	 ?>
	<style>
	*{
	  padding: 0px;
	  margin: 0px;
	}
	div{
	  align: center;
	}
	h3{
		font-weight: bold;
		text-align: center;
	}
	h4{
		text-align: center;
	}
	h5{
		text-align: center;
		font-weight: bold;
	}
	td{
	  color: #000000;
	}
	p{
		color: #000000;
	  text-align: center;
	}
	table{
		max-width: 45%;
	}
	</style>
	<h4>UNIVERSIDAD NACIONAL<br>SANTIAGO ANTUNEZ DE MAYOLO <br></h4>
	<h5>
		<em>"Una Nueva Universidad para el Desarrollo" <br>
		<?php AreaxUsuario($dato); ?> <br>
			<?php datosAreaxUsuario($dato,'5') ?>
			Tel: <?php datosAreaxUsuario($dato,'1'); ?> - Anexo <?php datosAreaxUsuario($dato,'2') ?><br>
			E-mail: <?php datosAreaxUsuario($dato,'3'); ?> <br>
		<h7>___________________________________________________________________________________________________</h7><br>
		"<?php NombreAnio(); ?>"<br>
		</em>
		RELACION DE DOCUMENTOS RECIBIDOS<br>
	</h5>
        <table class="" width="45%" border="1px;">
          <thead>
            <tr>
							<th><p><br>DOCUMENTO</p><h6></h6></th>
							<th><p><br>ASUNTO</p></th>
							<th><p><br>FOLIOS</p></th>
							<th><p><br>PROVEIDO</p></th>
							<th><p><br>FECHA</p></th>
            </tr>
					</thead>
						<?php
            $ar=idAreaxUsuario($dato);
            $query="SELECT * from vta_recepciondoc where fechrecepcion>='$ini 00:00:00' and fechrecepcion<='$fin 23:59:59' and idarea='$ar';";
            $resultado=mysqli_query(conectar(), $query);
            while($fila=mysqli_fetch_assoc($resultado)){
            ?>
					<tbody>
            <tr>
							<td><p><br><?php echo $fila['documento']; ?></p><h6></h6></td>
							<td><p><br><?php echo $fila['asunto']; ?></p></td>
							<td><p><br><?php echo $fila['folios']; ?></p></td>
							<td><p><br><?php echo $fila['proveido']; ?></p></td>
              <td><p><br><?php echo $fila['fechrecepcion']; ?></p></td>
            </tr>
						<?php
            }
						?>
          </tbody>
        </table>
</body>
</html>
?>
