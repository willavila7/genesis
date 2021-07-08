<?php

	header("Content-type: application/vnd.ms-excel");
	header("Content-Disposition: attachment; filename=Reporte_excel.doc");

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
	tbody h5{
		font-weight: normal;
	}
	td{
	  color: #000000;
	}
	p{
		color: #000000;
	  text-align: center;
	  padding: 30px 10px;
	}
	</style>
	<h4>UNIVERSIDAD NACIONAL<br>SANTIAGO ANTUNEZ DE MAYOLO <br></h4>
	<h5>
		<em>"Una Nueva Universidad para el Desarrollo" <br>
		<?php AreaxUsuario($dato); ?> <br>
			<?php datosAreaxUsuario($dato,'5') ?>
			Tel: <?php datosAreaxUsuario($dato,'1'); ?> - Anexo <?php datosAreaxUsuario($dato,'2') ?><br>
			E-mail: <?php datosAreaxUsuario($dato,'3'); ?> <br>
		<h7>___________________________________________________________________</h7><br>
		"<?php NombreAnio(); ?>"<br><br>
		</em>
		RELACION DE DISTRIBUCION DE DOCUMENTOS<br>
	</h5>
        <table width="100%" border="1px;">
          <thead>
            <tr>
              <th><p><h4>EXP</h4></p></th>
              <th><p><h4>FECHA</h4></p></th>
              <th><p><h4>DOCUMENTO</h4></p></th>
              <th><p><h4>ASUNTO</h4></p></th>
              <th><p><h4>PASO A</h4></p></th>
              <th><p><h4>FIRMA</h4></p></th>
            </tr>
					</thead>
						<?php
            $ar=idAreaxUsuario($dato);
            $query="SELECT idderiva,date(fechingsist) as fecha,documento,asunto,destino from vta_seguimiento
						where idarea='$ar' order by idderiva asc;";
            $resultado=mysqli_query(conectar(), $query);
            while($fila=mysqli_fetch_assoc($resultado)){
            ?>
					<tbody>
            <tr>
              <td><p><h5 class="sn"><?php echo $fila['idderiva']; ?></h5> </p></td>
              <td><p><h5 class="sn"><?php echo $fila['fecha']; ?></h5> </p></td>
							<td><p><h5 class="sn"><?php echo $fila['documento']; ?></h5> </p></td>
              <td><p><h5 class="sn"><?php echo $fila['asunto']; ?></h5> </p></td>
              <td><p><h5 class="sn"><?php echo $fila['destino']; ?></h5> </p></td>
							<td><p></p></td>
            </tr>
						<?php
            }
						?>
          </tbody>
        </table>
</body>
</html>
?>
