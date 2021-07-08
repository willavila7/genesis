<?php
  session_start();
  require_once('conexion.inc');

  $tipodoc= $_POST['tipodocumento'];
  $titulo= $_POST['txttitulo'];
  $folios= $_POST['txtfolios'];
  $asunto= strtoupper($_POST['txtasunto']);
  $observacion= strtoupper($_POST['txtobservacion']);
  $prioridad= $_POST['rbtprioridad'];
  $referencia= $_POST['referencia'];
  $usuario=$_SESSION['usuario'];
  $area= $_POST['area'];
  $expediente=$_POST['txtexpediente'];
  
  $ruta="vacio.pdf";
  $null="null";

  $query1="SELECT ar.idarea, ar.siglas, pr.nombres, pr.apellidos,tb.idtrabajador from area ar,trabajador tb,usuario us, persona pr
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and us.idusuario='$usuario';";
  $consulta1=mysqli_query(conectar(),$query1);
  $resultado1=mysqli_fetch_assoc($consulta1);
  $idarea=$resultado1['idarea'];
  $datotb=$resultado1['idtrabajador'];
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

  if($referencia==0){$referencia=$null;}
  if($observacion==''){$observacion='';}
    
  $select1=mysqli_query(conectar(),"select * from tipodocumento where idtipodocumento=$tipodoc;");
  $result=mysqli_fetch_assoc($select1);
  $tipdoc=$result['tipodocumento'];

  $texto=$tipdoc.' '.$titulo; 
  // $consulta=mysqli_query(conectar(),"select funtipodoctit('$titulo') as idtpd;");
  // $resultado=mysqli_fetch_assoc($consulta);
  // $tipodoc=$resultado['idtpd']; 

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

  $query8="INSERT into expediente(expediente,descripcion,idarea,idestadoexp,idanio) values($expediente,'',$idarea,'1','$idanio');";
  $resultado8=mysqli_query(conectar(),$query8);

  $query9="SELECT idexpediente from expediente where expediente=$correlativo and idarea='$idarea' and idanio='$idanio';";
  $resultado9=mysqli_query(conectar(),$query9);
  $idexp=mysqli_fetch_assoc($resultado9);
  $idex=$idexp['idexpediente'];

  $query5="INSERT INTO documento(documento,asunto,folios,observacion,fechrecepcion,fechingsist,confidencialidad,ruta,tipoingreso,idexpediente,
  idpersona,idinstitucion,idtipodocumento,idprioridad,idreferencia,idtrabajador,idestadodoc)
  VALUES('$texto','$asunto',$folios,'$observacion',$null,'$curdati','0','$ruta','1',$idex,$null,
    $null,$tipodoc,$prioridad,$referencia,$trabajador,'1');";
  $resultado5=mysqli_query(conectar(),$query5);

  for ($i=0;$i<count($area);$i++){

  $query2=mysqli_query(conectar(),"SELECT tb.idtrabajador FROM trabajador tb, area ar WHERE tb.idarea=ar.idarea AND ar.idarea='$area[$i]' and tb.responsable='1';");
  $trab=mysqli_fetch_assoc($query2);
  $idtb[$i]=$trab['idtrabajador'];

  $query3=mysqli_query(conectar(),"SELECT dc.iddocumento from documento dc, expediente ex where dc.idexpediente=ex.idexpediente and ex.idexpediente='$idex';");
  $doc=mysqli_fetch_assoc($query3);
  $iddc=$doc['iddocumento'];

  $query4="UPDATE expediente set idestadoexp='1' where idexpediente='$idex';";
  $insert4=mysqli_query(conectar(),$query4);

  $query5="UPDATE documento set idestadodoc='2' where iddocumento='$iddc';";
  $insert5=mysqli_query(conectar(),$query5);

  $consulta="INSERT into deriva(deriva,fechderiva,idexpediente,idtrabajadoring,idtrabajadordes)
  values('','$curdati',$idex,$datotb,$idtb[$i]);";
  $insert=mysqli_query(conectar(),$consulta);

  $rs = mysqli_query(conectar(),"SELECT MAX(idderiva) AS id FROM deriva");
  if ($row = mysqli_fetch_row($rs)) {$id = trim($row[0]);}

  $query6="INSERT into seguimiento(idderiva,idtrabajadorderiva,idtrabajadorrecepcion) values($id,$datotb,$null);";
  $resultado6=mysqli_query(conectar(),$query6);

  }
    if($resultado6){
    header("Location: ../mp/emitirdoc.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Documento no registrado');
      </script>";
    }

 ?>
