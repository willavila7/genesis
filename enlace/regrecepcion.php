<?php
  session_start();
  require_once('conexion.inc');

if (isset($_POST['recepcionar'])){

    $expediente= $_POST['expediente'];
    $usuario= $_SESSION['usuario'];
    $fcrc= $_POST['txtfechrecepcion'];
    $hrrc= $_POST['txthorarecepcion'];
    $fr=$fcrc." ".$hrrc;
    $null="null";

    $confec="SELECT now() as fechora;";
    $confec1=mysqli_query(conectar(),$confec);
    $confec2 = mysqli_fetch_assoc($confec1);
    $fecrec=$confec2["fechora"];

    $query="SELECT ar.idarea,ar.siglas FROM area ar, trabajador tb,usuario us
    WHERE us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
    $consar=mysqli_query(conectar(),$query);
    $ida=mysqli_fetch_assoc($consar);
    $idar=$ida['idarea'];
    $slg=$ida['siglas'];

    $query1=mysqli_query(conectar(),"SELECT tb.idtrabajador FROM trabajador tb, usuario us
    WHERE us.idtrabajador=tb.idtrabajador and us.idusuario='$usuario';");
    $trab=mysqli_fetch_assoc($query1);
    $idtrabajador=$trab['idtrabajador'];

    for ($i=0;$i<count($expediente);$i++){

        $query2=mysqli_query(conectar(),"SELECT dc.iddocumento from documento dc, expediente ex
        where dc.idexpediente=ex.idexpediente and ex.idexpediente='$expediente[$i]';");
        $doc=mysqli_fetch_assoc($query2);
        $iddc=$doc['iddocumento'];

        $query12=mysqli_query(conectar(),"select idderiva,destino from vta_reporte where idexpediente='$expediente[$i]' and destino='$slg';");
        $resultado12=mysqli_fetch_assoc($query12);
        $iddv=$resultado12['idderiva'];

        $query3="UPDATE deriva dv, expediente ex, documento dc set dc.idestadodoc='1'
        where dv.idexpediente=ex.idexpediente and dc.idexpediente=ex.idexpediente and dc.iddocumento='$iddc' and dv.idderiva='$iddv';";
        $insert3=mysqli_query(conectar(),$query3);

        $query4=mysqli_query(conectar(),"SELECT * from documento where iddocumento='$iddc';");
        $fila=mysqli_fetch_assoc($query4);

        $docu=$fila['documento'];      $asun=$fila['asunto'];               $foli=$fila['folios'];          $obse=$fila['observacion'];
        #$fr=$fila['fechrecepcion'];    $fi=$fila['fechingsist'];
        $tig=$fila['tipoingreso'];     $idpr=$fila['idpersona'];
        $idi=$fila['idinstitucion'];   $idtd=$fila['idtipodocumento'];      $idpd=$fila['idprioridad'];     $idr=$fila['idreferencia'];
        $ided=$fila['idestadodoc'];    $conf=$fila['confidencialidad'];     $rut=$fila['ruta'];

        if ($idpr=='') { $idpr=$null;}
        if ($idi=='') { $idi=$null;}
        if ($idr=='') { $idr=$null;}

        $query5="SELECT ex.expediente as correlativo from expediente ex where ex.idarea='$idar' order by ex.expediente desc limit 1;";
        $consulta5=mysqli_query(conectar(),$query5);
        $resultado5=mysqli_fetch_assoc($consulta5);
        $numcorr=$resultado5['correlativo'];
        $correlativo=$numcorr+1;

        $query6="INSERT into expediente(expediente,descripcion,idarea,idestadoexp,idanio) values('$correlativo','',$idar,'1','55');";
        $resultado6=mysqli_query(conectar(),$query6);

        $query7="SELECT idexpediente from expediente where expediente='$correlativo' and idarea='$idar';";
        $resultado7=mysqli_query(conectar(),$query7);
        $idexp=mysqli_fetch_assoc($resultado7);
        $idex=$idexp['idexpediente'];

        $query8="INSERT into documento(documento,asunto,folios,observacion,fechrecepcion,fechingsist,confidencialidad,ruta,tipoingreso,idexpediente,
          idpersona,idinstitucion,idtipodocumento,idprioridad,idreferencia,idtrabajador,idestadodoc)
        VALUES('$docu','$asun',$foli,'$obse','$fr','$fecrec',$conf,'$rut',$tig,$idex,$idpr,$idi,$idtd,$idpd,$idr,$idtrabajador,$ided);";
        $resultado8=mysqli_query(conectar(),$query8);
    /*
          $query9="SELECT idderiva from deriva where idexpediente ='$expediente[$i]';";
          $resultado9=mysqli_query(conectar(),$query9);
          $idderiv=mysqli_fetch_assoc($resultado9);
          $idderiva=$idderiv['idderiva'];
    */
          $query10="UPDATE seguimiento set idtrabajadorrecepcion='$idtrabajador' where idderiva='$iddv';";
          $resultado10=mysqli_query(conectar(),$query10);

          $query11="INSERT into recepcion(estado,fechrecepcion,idtrabajador) value($null,'$fecrec',$idtrabajador);";
          $resultado11=mysqli_query(conectar(),$query11);
      }

      if($query10){
        header("Location: ../mp/recibirdoc.php");
        }else{
          echo "<script language='JavaScript' type='text/javascript'>
          alert('Error de registro, datos no registrado');
          </script>";
        }
  }
  if (isset($_POST['devolver'])){
    $expediente= $_POST['expediente'];

    for ($i=0;$i<count($expediente);$i++){
    $consulta=mysqli_query(conectar(),"select * from deriva where idexpediente='$expediente[$i]';");
    $fila=mysqli_fetch_assoc($consulta);
    $idderiva=$fila['idderiva'];

    $delete=mysqli_query(conectar(),"delete deriva_has_proveido from deriva_has_proveido where idderiva='$idderiva';");
    $delete1=mysqli_query(conectar(),"delete seguimiento from seguimiento where idderiva='$idderiva';");
    $delete2=mysqli_query(conectar(),"delete deriva from deriva where idexpediente='$expediente[$i]';");
    $update=mysqli_query(conectar(),"update expediente set idestadoexp='1' where idexpediente='$expediente[$i]';");
    $update1=mysqli_query(conectar(),"update documento set idestadodoc='1' where idexpediente='$expediente[$i]';");
  }
    if ($update1) {
      header("Location: ../mp/recibirdoc.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('No se devolvio el(los) documento(s)');
      window.location='../mp/recibirdoc.php';
      </script>";
    }
  }
 ?>
