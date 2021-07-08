<?php
  session_start();
  require_once('conexion.inc');

  $expediente= $_POST['txtexpediente'];
  $documento= $_POST['txtdocumento'];
  $folios= $_POST['txtfolios'];
  $fecing= $_POST['txtfecing'];
  $horing= $_POST['txthoring'];
  $fec=$fecing.' '.$horing;
  $prioridad= $_POST['rbtprioridad'];
  $tipodoc= $_POST['tipodocumento'];
  $tiping= $_POST['tipoingreso'];
  $asunto= $_POST['txtasunto'];
  $observacion= $_POST['txtobservacion'];
  $dni= $_POST['txtdniruc'];
  #$referencia= $_POST['referencia'];
  $usu=$_SESSION['usuario'];
  $ruta="vacio.pdf";
  $null="null";
/*
  $nombre = $_FILES['archivo']['name'];
  $extension = end( explode('.', $nombre) );
  $pdf=$siglas . "-" . $usuario . "-" . time() . "." . $extension;
      if ($nombre == "") {
        $ruta=$vacio;
      }else {
        $nombretmp = $_FILES['archivo']['tmp_name'];
        $destino = "../mp/file/" . $pdf;
        if (copy($nombretmp, $destino)){
            $ruta=$pdf;
        } else{
            $ruta=$vacio;
        }
      }
*/
    if ($dni=="") {
      echo "<script language='JavaScript' type='text/javascript'>
        alert('Ingrese dni del tramitante');
        </script>";
    } else {
    
    if ($tiping==1) {
      $iti='1';
      $query1="SELECT idpersona FROM persona WHERE dni=$dni and intext='0';";
      $resultado1=mysqli_query(conectar(),$query1);
      $fila1 = mysqli_fetch_assoc($resultado1);
      $ipr=$fila1["idpersona"];
    } 
    if ($tiping==2) {
      $iti='2';
      $query1="SELECT idpersona FROM persona WHERE dni=$dni and intext='1';";
      $resultado1=mysqli_query(conectar(),$query1);
      $fila1 = mysqli_fetch_assoc($resultado1);
      $ipr=$fila1["idpersona"];
    }
    

    $curanio=mysqli_query(conectar(),"select year(now()) as anio;");
    $anioact=mysqli_fetch_assoc($curanio);
    $anio=$anioact['anio'];

    $antanio=mysqli_query(conectar(),"select idanio from anio where anio='$anio';");
    $expcons=mysqli_fetch_assoc($antanio);
    $idanio=$expcons['idanio'];

    $query6="SELECT ar.idarea FROM area ar, trabajador tb,usuario us WHERE us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usu';";
    $consar=mysqli_query(conectar(),$query6);
    $ida=mysqli_fetch_assoc($consar);
    $idar=$ida['idarea'];

    $select1=mysqli_query(conectar(),"select * from tipodocumento where idtipodocumento=$tipodoc;");
    $result=mysqli_fetch_assoc($select1);
    $tipdoc=$result['tipodocumento'];

    $texto=$tipdoc.' '.$documento; 
    /*$consulta=mysqli_query(conectar(),"select funtipodoctit('$documento') as idtpd;");
    $resultado=mysqli_fetch_assoc($consulta);
    $tipodoc=$resultado['idtpd'];*/

    $select=mysqli_query(conectar(),"select tb.idtrabajador from area ar, trabajador tb
    where tb.idarea=ar.idarea and tb.responsable='1' and ar.idarea='$idar' limit 1;");
    $responsable=mysqli_fetch_assoc($select);
    $idtr=$responsable['idtrabajador'];

    $consulta1=mysqli_query(conectar(),"select now() as now;");
    $resultado1=mysqli_fetch_assoc($consulta1);
    $curdati=$resultado1['now'];

    $query8="INSERT into expediente(expediente,descripcion,idarea,idestadoexp,idanio) values('$expediente','',$idar,'1','$idanio');";
    $resultado8=mysqli_query(conectar(),$query8);

    if($prioridad==0){$prioridad=3;}
    if($observacion==''){$observacion='';}

    $query9="SELECT idexpediente from expediente where expediente='$expediente' and idarea='$idar' and idanio='$idanio';";
    $resultado9=mysqli_query(conectar(),$query9);
    $idexp=mysqli_fetch_assoc($resultado9);
    $idex=$idexp['idexpediente'];

    $query5="INSERT INTO documento(documento,asunto,folios,observacion,fechrecepcion,fechingsist,confidencialidad,ruta,tipoingreso,idexpediente,
    idpersona,idinstitucion,idtipodocumento,idprioridad,idreferencia,idtrabajador,idestadodoc)
    VALUES('$texto','$asunto',$folios,'$observacion','$fec','$curdati','0','$ruta',$iti,$idex,$ipr,$null,$tipodoc,$prioridad,$null,$idtr,'1');";
    $resultado5=mysqli_query(conectar(),$query5);

    if($resultado5){
      header("Location: ../mp/ingresodoc.php");
      }else{
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Documento datos no registrado');
        </script>";
      }
    }

 ?>
