<?php
  session_start();
  require_once('conexion.inc');

  $tipodoc= $_POST['tipodocumento'];
  $titulo= $_POST['txttitulo'];
  $folios= $_POST['txtfolios'];
  $asunto= strtoupper($_POST['txtasunto']);
  $observacion= strtoupper($_POST['txtobservacion']);
  $prioridad= $_POST['prioridad'];
  $fecing= $_POST['txtfecing'];
  $horing= $_POST['txthoring'];
  $fecdat=$fecing.' '.$horing;
  $referencia= $_POST['referencia'];
  #$accesibilidad= $_POST['rbtconfidencialidad'];
  $usuario=$_SESSION['usuario'];
  $ruta="vacio.pdf";
  $null="null";

  $query1="SELECT ar.idarea, ar.siglas, pr.nombres, pr.apellidos from area ar,trabajador tb,usuario us, persona pr
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and us.idusuario='$usuario';";
  $consulta1=mysqli_query(conectar(),$query1);
  $resultado1=mysqli_fetch_assoc($consulta1);
  $idarea=$resultado1['idarea'];
  #$siglas=$resultado1['siglas'];
  #$nmap=$resultado1['apellidos'].''.$resultado1['nombres'];

  $select=mysqli_query(conectar(),"select tb.idtrabajador from area ar, trabajador tb
  where tb.idarea=ar.idarea and tb.responsable='1' and ar.idarea='$idarea' limit 1;");
  $responsable=mysqli_fetch_assoc($select);
  $trabajador=$responsable['idtrabajador'];
  /*
  $nombre = $_FILES['archivo']['name'];
  $extension = end( explode('.', $nombre) );
  $pdf=$siglas . "-" . $nmap . "-" . date("Y-m-d", time()) . "." . $extension;
      if ($nombre == "") {
        $ruta=$vacio;
      }else {
        $nombretmp = $_FILES['archivo']['tmp_name'];
        $destino = "../user/file/" . $pdf;
        if (copy($nombretmp, $destino)){
            $ruta=$pdf;
        } else{
            $ruta=$vacio;
        }
      }
      */
if ($tipodoc==0) {
  echo "<script language='JavaScript' type='text/javascript'>
  alert('Es importante seleccionar el tipo de documento');
  window.location='../user/ingresodesc.php';
  </script>";
}else {

  if($referencia==0){$referencia=$null;}
  if($observacion==''){$observacion='';}
  if($prioridad==0){$prioridad=3;}

  $consulta2=mysqli_query(conectar(),"select now() as now , year(now()) as anio;");
  $resultado2=mysqli_fetch_assoc($consulta2);
  $curdati=$resultado2['now'];
  $anio=$resultado2['anio'];

  $antanio=mysqli_query(conectar(),"select an.anio from expediente ex, anio an
  where an.idanio=ex.idanio and idarea='$idarea' order by expediente desc limit 1;");
  $expcons=mysqli_fetch_assoc($antanio);
  $expanio=$expcons['anio'];

  $antanio=mysqli_query(conectar(),"select idanio from anio where anio='$anio';");
  $expcons=mysqli_fetch_assoc($antanio);
  $idanio=$expcons['idanio'];

  if ($anio==$expanio) {
    $query3="SELECT ex.expediente as correlativo from expediente ex where ex.idarea='$idarea' and idanio='$idanio' order by ex.expediente desc limit 1;";
    $consulta3=mysqli_query(conectar(),$query3);
    $resultado3=mysqli_fetch_assoc($consulta3);
    $numcorr=$resultado3['correlativo'];
    $correlativo=$numcorr+1;
  }else {    $correlativo="1";  }

  $query8="INSERT into expediente(expediente,descripcion,idarea,idestadoexp,idanio) values($correlativo,'',$idarea,'1','$idanio');";
  $resultado8=mysqli_query(conectar(),$query8);

  $query9="SELECT idexpediente from expediente where expediente=$correlativo and idarea='$idarea' and idanio='$idanio';";
  $resultado9=mysqli_query(conectar(),$query9);
  $idexp=mysqli_fetch_assoc($resultado9);
  $idex=$idexp['idexpediente'];

  $query5="INSERT INTO documento(documento,asunto,folios,observacion,fechrecepcion,fechingsist,confidencialidad,ruta,tipoingreso,idexpediente,
  idpersona,idinstitucion,idtipodocumento,idprioridad,idreferencia,idtrabajador,idestadodoc)
  VALUES('$titulo','$asunto',$folios,'$observacion','$fecdat','$curdati','0','$ruta','0',$idex,$null,
    $null,$tipodoc,$prioridad,$referencia,$trabajador,'1');";
  $resultado5=mysqli_query(conectar(),$query5);

  if($resultado5){
    header("Location: ../user/ingresodesc.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Documento no registrado');
      </script>";
    }
  }

 ?>
