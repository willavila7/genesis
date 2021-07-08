<?php
/*//RUTA: enlace/funcion.php -- OK*/
/***************************GENERA SELECT DEPARTAMENTOS***************/
function generaSelect()
{
  conectar();
  $consulta=mysqli_query(conectar(),"select iddepartamento, departamento FROM departamento");
  desconectar();
  // Voy imprimiendo el primer select compuesto por los paises
  echo "<select class='form-control' name='departamentos' id='departamentos' onChange='cargaContenido(this.id)'>";
  echo "<option value='0'>Elige</option>";
  while($registro=mysqli_fetch_row($consulta))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function cargaSelect($tabla,$tipo)
{
  conectar();
  $id='id'.$tabla;
  $consulta=mysqli_query(conectar(),"select $id, $tabla from $tabla order by $tabla asc;");
  desconectar();
  // Voy imprimiendo el primer select compuesto por los paises
  if ($tipo==1) {
    echo "<select class='form-control' name='$tabla' id='$tabla'>";
    echo "<option value='0'>Seleccione...</option>";
    while($registro=mysqli_fetch_row($consulta))
    { echo "<option value='".$registro[0]."'>".$registro[1]."</option>"; }
    echo "</select>";
  }
  if ($tipo==2) {
    echo "<select class='form-control select2 select2-hidden-accessible' style='width: 100%;' aria-hidden='true' name='$tabla' id='$tabla'>";
    echo "<option value='0'>Seleccione...</option>";
    while($registro=mysqli_fetch_row($consulta))
    { echo "<option value='".$registro[0]."'>".$registro[1]."</option>"; }
    echo "</select>";
  }
}
function generaAreaMultiple($usuario)
{
  conectar();
  $consulta1=mysqli_query(conectar(),"select * from usuario us where us.idusuario='$usuario';");
  $fila=mysqli_fetch_assoc($consulta1);
  $tipousuario=$fila['idtipousuario'];

  $consulta2=mysqli_query(conectar(),"select ar.idarea from area ar, trabajador tb, usuario us where us.idtrabajador=tb.idtrabajador and
  tb.idarea=ar.idarea and us.idusuario='$usuario';");
  $fila2=mysqli_fetch_assoc($consulta2);
  $idar=$fila2['idarea'];
  desconectar();

  if($tipousuario==2){
    $consulta=mysqli_query(conectar(),"select ar.idarea,ar.area,ar.siglas from persona pr, trabajador tb, area ar
    where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and tb.responsable='1' and tb.estado='1' and ar.idarea<>'$idar';");
    echo "<select class='form-control select2 select2_area' multiple='multiple' data-placeholder='Escriba el Destino' style='width: 100%;' name='area[]' id='area'>";
    echo "<option value='0'>Seleccione...</option>";
    while($registro=mysqli_fetch_row($consulta))
    {    echo "<option value='".$registro[0]."'>".$registro[1]." (".$registro[2].")</option>";  }
    echo "</select>";
  }
  if($tipousuario==3){
    if ($idar==1 || $idar==10 || $idar==23) {
      $consulta=mysqli_query(conectar(),"select ar.idarea,ar.area,ar.siglas from persona pr, trabajador tb, area ar
      where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and tb.responsable='1' and tb.estado='1' and ar.idarea<>'$idar';");
      echo "<select class='form-control select2 select2_area' multiple='multiple' data-placeholder='Escriba el Destino' style='width: 100%;' name='area[]' id='area'>";
      echo "<option value='0'>Seleccione...</option>";
      while($registro=mysqli_fetch_row($consulta))
      {    echo "<option value='".$registro[0]."'>".$registro[1]." (".$registro[2].")</option>";  }
      echo "</select>";
    }else{
      $consulta=mysqli_query(conectar(),"select ar.idarea,ar.area,ar.siglas from persona pr, trabajador tb, area ar
      where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and tb.responsable='1' and tb.estado='1'
      and ar.idarea<>1 and ar.idarea<>10 and ar.idarea<>23 and ar.area<>36 and ar.area<>62  and ar.area<>49 and ar.idarea<>'$idar';");
      echo "<select class='form-control select2 select2_area' multiple='multiple' data-placeholder='Escriba el Destino' style='width: 100%;' name='area[]' id='area'>";
      echo "<option value='0'>Seleccione...</option>";
      while($registro=mysqli_fetch_row($consulta))
      {    echo "<option value='".$registro[0]."'>".$registro[1]." (".$registro[2].")</option>";  }
      echo "</select>";
    }
  }
  if($tipousuario==4){
    $consulta=mysqli_query(conectar(),"select ar.idarea,ar.area,ar.siglas from persona pr, trabajador tb, area ar
    where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and tb.responsable='1' and tb.estado='1'
    and ar.idarea<>1 and ar.idarea<>10 and ar.idarea<>23 and ar.area<>36 and ar.area<>62  and ar.area<>49 and ar.idarea<>'$idar';");
    echo "<select class='form-control select2 select2_area' multiple='multiple' data-placeholder='Escriba el Destino' style='width: 100%;' name='area[]' id='area'>";
    echo "<option value='0'>Seleccione...</option>";
    while($registro=mysqli_fetch_row($consulta))
    {    echo "<option value='".$registro[0]."'>".$registro[1]." (".$registro[2].")</option>";  }
    echo "</select>";
  }

  // Voy imprimiendo el primer select compuesto por los paises

}
function generaLocal()
{
  conectar();
  $consulta=mysqli_query(conectar(),"select idlocal,concat(local,' - ',direccion) as local from local;");
  desconectar();

  // Voy imprimiendo el primer select compuesto por los paises
  echo "<select class='form-control' name='local' id='local'>";
  echo "<option value='0'>Seleccione...</option>";
  while($registro=mysqli_fetch_row($consulta))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function Referencia($usuario)
{
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $query1="select dc.iddocumento, dc.documento, dc.idestadodoc, ex.idestadoexp from area ar,documento dc, expediente ex
  WHERE dc.idexpediente=ex.idexpediente and ex.idarea=ar.idarea and ex.idarea='$idar' and dc.idestadodoc='1' and (ex.idestadoexp='1' or ex.idestadoexp='2');";
  $consulta=mysqli_query(conectar(),$query1);
  desconectar();
  // Voy imprimiendo el primer select compuesto por los paises
  echo "<select class='form-control select2 select2-hidden-accessible' style='width: 100%;' aria-hidden='true' name=referencia id=referencia>";
  echo "<option value='0'>Seleccione...</option>";
  while($registro=mysqli_fetch_row($consulta))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function BuscarporDNI()
{
  //document.location.reload();
  conectar();
  if (isset($_POST['txttramite'])) {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Usuario exixtente');
    </script>";
  } else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Usuario no exixtente');
    </script>";;
  }

}
function generaEmpleadoArea()
{
  conectar();
  $consulta=mysqli_query(conectar(),"select concat(pr.nombres,' ',pr.apellidos) from trabajador tb, persona pr where tb.idpersona=pr.idpersona AND idarea='63';");
  desconectar();

  // Voy imprimiendo el primer select compuesto por los paises
  echo "<select class='form-control' name='cargos' id='cargos'>";
  echo "<option value='0'>Cargo</option>";
  while($registro=mysqli_fetch_row($consulta))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function NumeroExp($usuario){
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $curanio=mysqli_query(conectar(),"select year(curdate()) as anio;");
  $anioact=mysqli_fetch_assoc($curanio);
  $anio=$anioact['anio'];

  $antanio=mysqli_query(conectar(),"select an.anio from expediente ex, anio an
  where an.idanio=ex.idanio and idarea='$idar' order by expediente desc limit 1;");
  $expcons=mysqli_fetch_assoc($antanio);
  $expanio=$expcons['anio'];

  if ($anio==$expanio) {
    $query3="SELECT ex.expediente as correlativo from expediente ex where ex.idarea='$idar' order by ex.expediente desc limit 1;";
    $consulta3=mysqli_query(conectar(),$query3);
    $resultado3=mysqli_fetch_assoc($consulta3);
    $numcorr=$resultado3['correlativo'];
    $correlativo=$numcorr+1;
    echo "".$correlativo;
  }else {
    echo "1";
  }


}
function contadorDoc($usuario){
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $consulta="select count(*) as cantidad from vta_docarea where idarea='$idar';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  echo "".$numero;
}
function contadorRec($usuario){
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $consulta="select count(*) as cantidad from vta_recepciondoc where idarea='$idar' and idestadoexp='2' and idestadodoc='2';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  desconectar();
  echo "".$numero;
}
function contadorArc($usuario){
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $consulta="select count(*) as cantidad from vta_docarea where idarea='$idar' and idestadoexp='3' and idestadodoc='1';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  echo "".$numero;
}
function contadorBan($usuario){
  conectar();
  $query="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];

  $consulta="select count(*) as cantidad from vta_docarea where idarea='$idar' and (idestadodoc='1' or idestadodoc='2');";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  echo "".$numero;
}
function CargoUsuario($usuario){
  conectar();
  $query="select cr.cargo from  trabajador tb, usuario us, cargo cr where us.idtrabajador=tb.idtrabajador and tb.idcargo=cr.idcargo and us.idusuario='$usuario';";
  $consulta=mysqli_query(conectar(),$query);
  $fila=mysqli_fetch_assoc($consulta);
  $cargo=$fila['cargo'];
  echo $cargo;
  desconectar();
}
function Miembro($usuario){
  conectar();
  $query="select funfechingreso('$usuario') as miembro;";
  $consulta=mysqli_query(conectar(),$query);
  $fila=mysqli_fetch_row($consulta);
  $miembro=$fila[0];
  echo $miembro;
  desconectar();
}
function Aniversario($usuario){
  conectar();
  $query = "select funaniversario('$usuario') as funaniversario;";
  $resultado = mysqli_query(conectar(), $query);
  $fila = mysqli_fetch_assoc($resultado);
  $nombre=$fila['funaniversario'];
  desconectar();
  echo $nombre;
}
function UsuarioNombre($usuario){
  conectar();
  $query = "select funnom('$usuario') as funnom;";
  $resultado = mysqli_query(conectar(), $query);
  $fila = mysqli_fetch_assoc($resultado);
  $nombre=$fila['funnom'];
  desconectar();
  echo $nombre;
}
function UsuarioNombre1($tb){
  conectar();
  $query = "select pr.nombres,pr.apellidos from persona pr, trabajador tb
  where tb.idpersona=pr.idpersona and tb.idtrabajador='$tb';";
  $resultado = mysqli_query(conectar(), $query);
  $fila = mysqli_fetch_assoc($resultado);
  $nombre=$fila['nombres'];
  $apellidos=$fila['apellidos'];
  desconectar();
  echo $nombre.' '.$apellidos;
}
function UsuarioNombre2($pr){
  conectar();
  $query = "select pr.nombres,pr.apellidos from persona pr where pr.idpersona='$pr';";
  $resultado = mysqli_query(conectar(), $query);
  $fila = mysqli_fetch_assoc($resultado);
  $nombre=$fila['nombres'];
  $apellidos=$fila['apellidos'];
  desconectar();
  echo $nombre.' '.$apellidos;
}
function contadorPer(){
  conectar();
  $consulta="select count(*) as cantidad from persona where intext='0';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  desconectar();
  echo "".$numero;
}
function contadortbsinusu(){
  conectar();
  $consulta="select count(*) as cantidad from vta_sinusu where intext='1';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  desconectar();
  echo "".$numero;
}
function contador($tabla){
  conectar();
  $consulta="select count(*) as cantidad from $tabla;";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $numero=$fila['cantidad'];
  desconectar();
  echo "".$numero;
}
function foto($usuario){
  conectar();
  $consulta="select ruta from usuario where idusuario='$usuario';";
  $query=mysqli_query(conectar(),$consulta);
  $fila=mysqli_fetch_assoc($query);
  $foto=$fila['ruta'];
  desconectar();
  echo "".$foto;
}
function AreaxUsuario($usuario){
  conectar();
  $query6="select ar.area from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query6);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['area'];
  desconectar();
  echo $idar;
}
function idAreaxUsuario($usuario){
  conectar();
  $query6="select ar.idarea from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query6);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['idarea'];
  desconectar();
  return $idar;
}
function ModalidadxUsuario($usuario){
  conectar();
  $query6="select ar.modalidad from area ar, trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consar=mysqli_query(conectar(),$query6);
  $ida=mysqli_fetch_assoc($consar);
  $idar=$ida['modalidad'];
  desconectar();
  echo $idar;
}
function NombreAnio(){
  conectar();
  $query6="select nombre from anio where anio=year(curdate());";
  $consar=mysqli_query(conectar(),$query6);
  $resultado=mysqli_fetch_assoc($consar);
  $nombre=$resultado['nombre'];
  desconectar();
  echo $nombre;
}
function Salir(){
  session_start();
  session_unset();
  session_destroy();
  header("Location: http://facebook.com");
}

function EmpleadosArea($usuario){
  conectar();
  $query="select ar.idarea, ar.area_idarea from trabajador tb, area ar, usuario us
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consulta=mysqli_query(conectar(),$query);
  $fila=mysqli_fetch_assoc($consulta);
  $idarea=$fila['idarea'];
  $a_idarea=$fila['area_idarea'];

  if (is_null($a_idarea)) {
    $query1="select tb.idtrabajador, concat(pr.nombres,' ',pr.apellidos) as nombres
    from area ar, trabajador tb, persona pr
    where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and ar.idarea='$idarea';";
    $consulta1=mysqli_query(conectar(),$query1);
  } else {
    $query1="select tb.idtrabajador, concat(pr.nombres,' ',pr.apellidos) as nombres
    from area ar, trabajador tb, persona pr
    where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and (ar.area_idarea='$idarea' or ar.idarea='$idarea');";
    $consulta1=mysqli_query(conectar(),$query1);
  }


  desconectar();

  echo "<select class='form-control' name='personal' id='personal'>";
  echo "<option value='0'>Seleccione...</option>";
  while($registro=mysqli_fetch_row($consulta1))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function Imprimir($usuario,$iddocumento){
  $query1="select dc.confidencialidad as secreto, dc.ruta from documento dc where dc.iddocumento='$iddocumento';";
  $consulta1=mysqli_query(conectar(),$query1);
  $fila1=mysqli_fetch_assoc($consulta1);
  $secreto=$fila1['secreto'];

  if($secreto==0){
    echo "".$fila1['ruta'];
  }else {
    $query2="select tb.responable from trabajador tb, area ar, usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
    $consulta2=mysqli_query(conectar(),$query2);
    $fila2=mysqli_fetch_assoc($consulta);
    $responsable=$fila2['responsable'];

    if($responsable==1){
      echo "".$fila1['ruta'];
    }else {
      echo "confidencial.pdf";
    }
  }

  $query1="select tb.idtrabajador, concat(pr.nombres,' ',pr.apellidos) as nombres
  from area ar, trabajador tb, persona pr
  where tb.idarea=ar.idarea and tb.idpersona=pr.idpersona and (ar.area_idarea='$idarea' or ar.idarea='$idarea');";
  $consulta1=mysqli_query(conectar(),$query1);
  desconectar();

  echo "<select class='form-control' name='personal' id='personal'>";
  echo "<option value='0'>Seleccione...</option>";
  while($registro=mysqli_fetch_row($consulta1))
  {
    echo "<option value='".$registro[0]."'>".$registro[1]."</option>";
  }
  echo "</select>";
}
function UsuarioDatos($usuario,$pos)
{
  conectar();
  $consulta=mysqli_query(conectar(),"select concat(pr.nombres,' ',pr.apellidos) as nombres, pr.dni, pr.ruc, funfechesp(pr.fechnac),pr.direccion,pr.telefono1,pr.telefono2,
  pr.correo1,pr.correo2 from usuario us, trabajador tb, persona pr
  where us.idtrabajador=tb.idtrabajador and tb.idpersona=pr.idpersona and us.idusuario='$usuario';");
  desconectar();
  $registro=mysqli_fetch_row($consulta);
  echo $registro[$pos];
}
function DiasFaltantes($idex)
{
  conectar();
  $query = "select fundiaqueda('$idex') as falta;";
  $resultado = mysqli_query(conectar(), $query);
  $fila = mysqli_fetch_assoc($resultado);
  $falta=$fila['falta'];
  desconectar();
  echo $falta;
}
function UsuarioUbicacion($usuario)
{
  conectar();
  $consulta=mysqli_query(conectar(),"select concat(lc.local,', ',lc.direccion) as ubicacion from area ar, local lc, trabajador tb, usuario us
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and ar.idlocal=lc.idlocal and us.idusuario='$usuario';");
  desconectar();
  $fila=mysqli_fetch_assoc($consulta);
  $ubicacion=$fila['ubicacion'];
  echo $ubicacion;
}
function ActDatosDoc($usuario,$idexpediente,$pos)
{
  conectar();
  $query="select ar.idarea from area ar, usuario us, trabajador tb
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_assoc($consulta);
  $idarea=$registro['idarea'];

  $query1="select * from vta_docarea where idexpediente='$idexpediente' and idarea='$idarea';";
  $consulta1=mysqli_query(conectar(),$query1);
  $registro1=mysqli_fetch_row($consulta1);
  if (is_numeric($pos)) {
  echo $registro1[$pos];
}if (is_string($pos)) {
    if ($pos=='fecha') {
      $date=mysqli_query(conectar(),"select date('$registro1[7]') as fecha;");
      $fec=mysqli_fetch_assoc($date);
      echo $fec['fecha'];
    }
    if ($pos=='hora') {
      $time=mysqli_query(conectar(),"select time('$registro1[7]') as hora;");
      $hor=mysqli_fetch_assoc($time);
      echo $hor['hora'];
    }
  }
}
function ActDatosEmp($idempleado,$pos)
{
  conectar();
  $query="select * from vta_empleado where idtrabajador='$idempleado';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function ActDatosPer($idpersona,$pos)
{
  conectar();
  $query="select * from vta_persona where intext='0' and idpersona='$idpersona';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function ActDatosIns($idinstitucion,$pos)
{
  conectar();
  $query="select * from vta_institucion where idinstitucion='$idinstitucion';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function ActDatosAre($idarea,$pos)
{
  conectar();
  $query="select * from area where idarea='$idarea';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function ActDatosCargo($idcargo,$pos)
{
  conectar();
  $query="select * from cargo where idcargo='$idcargo';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function ActDatostabla($tabla,$idtabla,$pos)
{
  conectar();
  $id="id".$tabla;
  $query="select * from $tabla where $id='$idtabla';";
  $consulta=mysqli_query(conectar(),$query);
  $registro=mysqli_fetch_row($consulta);
  desconectar();
  echo $registro[$pos];
}
function datosAreaxUsuario($usuario,$pos){
  conectar();
  $consulta=mysqli_query(conectar(),"select ar.idarea from usuario us, trabajador tb, area ar
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';");
  $resultado=mysqli_fetch_assoc($consulta);
  $idarea=$resultado['idarea'];

  $consulta1=mysqli_query(conectar(),"select ar.idarea,ar.telefono,ar.anexo,ar.correo,lc.local,lc.direccion
  from area ar, local lc where ar.idlocal=lc.idlocal and idarea='$idarea';");
  $registro=mysqli_fetch_row($consulta1);
  desconectar();
  echo $registro[$pos];
}
function hora(){
  /*$now=time();
  $hora=date("H:i:s", $now);*/

  $consulta=mysqli_query(conectar(),"select hour(timediff(time(now()),'05:00:00')) as hora,minute(time(now())) as minuto,second(time(now())) as segundo;");
  $resultado=mysqli_fetch_assoc($consulta);

  if($resultado['hora']<10){    $hora='0'.$resultado['hora'];  } else { $hora=$resultado['hora']; }
  if($resultado['minuto']<10){    $minuto='0'.$resultado['minuto'];  } else { $minuto=$resultado['minuto']; }
  if($resultado['segundo']<10){    $segundo='0'.$resultado['segundo'];  } else { $segundo=$resultado['segundo']; }

  echo $hora.':'.$minuto;
}
function fecha(){
  /*$now=time();
  $fecha=date("Y-m-d", $now);*/

  $consulta=mysqli_query(conectar(),"select date(now()) as date;");
  $resultado=mysqli_fetch_assoc($consulta);
  $date=$resultado['date'];

  echo $date;
}
function estado($estado,$id){
  if ($estado=='0' && $id=='') {
      echo "<td><label class='label label-info'>DENEGADO</label></td>";
    }
  if ($estado=='1' && $id=='') {
    echo "<td><label class='label label-success'>AUTORIZADO</label></td>";
  }
  if ($estado=='0' && $id!='') {
    echo "<td><a class='btn btn-sm btn-danger' href='../enlace/bajausu.php?id=$id'><i class='fa fa-lock'></i></a></td>";
  }
  if ($estado=='1' && $id!='') {
    echo "<td><a class='btn btn-sm btn-success' href='../enlace/bajausu.php?id=$id'><i class='fa fa-unlock'></i></a></td>";
  }

}
function btnrotdes($condicion,$idtb,$est,$ie){
  if ($est==0 && $ie==0) {
    echo "<a class='btn btn-sm btn-success' href='contratar.php?id=$idtb'><i class='fa fa-thumbs-up'></i></a>";
  }
  if ($est==0 && $ie==1) {
    echo "
    <div class='btn-group'>
      <a class='btn btn-sm btn-info' href='rotar.php?id=$idtb'><i class='fa fa-refresh'></i></a>
      <a class='btn btn-sm btn-danger' href='../enlace/despedir.php?id=$idtb'><i class='fa fa-thumbs-down'></i></a>
    </div>";
  }
  if ($est==1 && $ie==1) {
    if ($condicion!=4) {
      echo "
      <div class='btn-group'>
        <a class='btn btn-sm btn-info' href='rotar.php?id=$idtb'><i class='fa fa-refresh'></i></a>
        <a class='btn btn-sm btn-danger' href='../enlace/despedir.php?id=$idtb'><i class='fa fa-thumbs-down'></i></a>
      </div>
      ";
    }else {
      echo "<a class='btn btn-sm btn-danger' href='../enlace/despedir.php?id=$idtb'><i class='fa fa-thumbs-down'></i></a>";
    }
  }
}
function MenuPermiso($dato,$opcion){
  $consulta=mysqli_query(conectar(),"select idtipousuario from usuario where idusuario='$dato';");
  $resultado=mysqli_fetch_assoc($consulta);
  $idtipousuario=$resultado['idtipousuario'];
  if ($opcion==1) {/* BARRA lateral*/
    if ($idtipousuario==1) { include('../enlace/ltadm.inc');  }
    if ($idtipousuario==2) { include('../enlace/ltmp.inc');  }
    if ($idtipousuario==3) { include('../enlace/ltuser.inc');  }
    if ($idtipousuario==4) { include('../enlace/ltdes.inc');  }
  }
  if ($opcion==2) {/*texto lateral*/
    if ($idtipousuario==3) { echo "Emitir Documentos";  }
    if ($idtipousuario==4) { echo "Emitir / Ingresar Documentos";  }
  }
  if ($opcion==3) {
    if ($idtipousuario==3) { echo "emitirdoc.php";  }
    if ($idtipousuario==4) { echo "ingresodesc.php";  }
  }
  if ($opcion==4) { //INDEX MENUS
    if ($idtipousuario==1) { include('../enlace/mnixadm.inc'); }
    if ($idtipousuario==2) { include('../enlace/mnixmp.inc'); }
    if ($idtipousuario==3 || $idtipousuario==4) { include('../enlace/mnixuser.inc'); }
  }
}
function seguimiento($dc){
  if ($dc!='') {
  $query="select * from vta_seguimiento where documento='$dc' or idreferencia='$dc' order by fechderiva asc;";
  $tabla="
  <div class='box'>
    <div class='box-header'>
      <h3 class='box-title'><strong>Recorrido del expediente</strong></h3>
    </div>
    <div class='box-body table-responsive no-padding'>
      <table class='table table-striped'>
        <thead>
          <tr>
            <th>OFICINA</th>
            <th>EXP.</th>
            <th>DOCUMENTO</th>
            <th>ASUNTO</th>
            <th>DIAS</th>
            <th>OFICINA</th>
          </tr>
        </thead>
        <tbody>";
          $resultado=mysqli_query(conectar(),$query);
          while($fila=mysqli_fetch_assoc($resultado)){
          $tabla.="
          <tr>
            <td><p>" . $fila['origen'] . "</p></td>
            <td><p>" . $fila['expediente'] . "</p></td>
            <td><p>" . $fila['documento'] . "</p></td>
            <td><p>" . $fila['asunto'] . "</p></td>
            <td><p>" . $fila['dias'] . "</p></td>
            <td><p>" . $fila['destino'] . "</p></td>
          </tr>";
          }
          $tabla.="
        </tbody>
      </table>
    </div>
  </div>
  ";
  echo $tabla;
  }else {    echo "";  }
}
function seguimientointerno($expediente,$idarea,$pos){
  $query = "SELECT dc.iddocumento, dc.documento, ex.expediente, ex.idarea
  from documento dc, expediente ex
  where dc.idexpediente=ex.idexpediente and ex.expediente='$expediente' and ex.idarea='$idarea' order by fechrecepcion asc;";
  $resultado = mysqli_query(conectar(), $query);
  $fila=mysqli_fetch_row($resultado);
  return $fila[$pos];
}
function totaldoc($idarea){
  conectar();
  $query="select count(*) as cantidad,ex.idarea
  from expediente ex, documento dc, tipodocumento td
  where dc.idexpediente=ex.idexpediente and dc.idtipodocumento=td.idtipodocumento and ex.idarea='$idarea';";
  $resultado=mysqli_query(conectar(), $query);
  $fila=mysqli_fetch_assoc($resultado);
  $cantidad=$fila['cantidad'];
  desconectar();
  return $cantidad;
}
function reportefirma($estadoexp,$estadodoc,$destino){
  if ($estadoexp==2 && $estadodoc==2) {    return $destino;  }
  else {
    if ($estadoexp==4) {      return "ANULADO";    }
    if ($estadoexp==6) {      return "DEVUELTO AL INTERESADO";    }
  }
}
function reportefecha($fecha1,$fecha2){
  if (is_null($fecha1)) {    return $fecha2;  }
  else { return $fecha1; }
}
function SinConexion(){
  header("Location: http://www.unasam.edu.pe/tramite");
}
function JefexUsuario($usuario){
conectar();
  $consulta=mysqli_query(conectar(),"select ar.idarea from usuario us, trabajador tb, area ar
  where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';");
  $resultado=mysqli_fetch_assoc($consulta);
  $idarea=$resultado['idarea'];

  $consulta1=mysqli_query(conectar(),"select concat(pr.apellidos,' ',pr.nombres) as jefe from persona pr, trabajador tb, area ar
where tb.idpersona=pr.idpersona and tb.idarea=ar.idarea and tb.responsable=1 and ar.idarea='$idarea';");
  $registro=mysqli_fetch_assoc($consulta1);
  desconectar();
  echo $registro['jefe'];
}
function estadodoc($estexp,$estdoc){
  if ($estexp=='1' && $estdoc=='1') {/*enviado en oficina*/
    echo "<label class='label label-success'>ENVIADO EN OFICINA</label>";
  }
  if ($estexp=='1' && $estdoc=='2') {/*enviado por recibir*/
    echo "<label class='label label-warning'>ENVIADO POR RECIBIR</label>";
  }
  if ($estexp=='2' && $estdoc=='1') {/*derivado en oficina*/
    echo "<label class='label label-success'>DERIVADO EN OFICINA</label>";
  }
  if ($estexp=='2' && $estdoc=='2') {/*derivado por recibir*/
    echo "<label class='label label-warning'>DERIVADO POR RECIBIR</label>";
  }
  if ($estexp=='3' && $estdoc=='1') {/*archivado*/
    echo "<label class='label label-aqua'>ARCHIVADO</label>";
  }
  if ($estexp=='4' && $estdoc=='1') {/*anulado*/
    echo "<label class='label label-danger'>ANULADO</label>";
  }
  if ($estexp=='5' && $estdoc=='1') {/*vencido*/
    echo "<label class='label label-primary'>VENCIDO</label>";
  }
  if ($estexp=='6' && $estdoc=='1') {/*devuelto al interesado*/
    echo "<label class='label label-info'>DEVUELTO AL INTERESADO</label>";
  }
}
function proveido($idprov){
  conectar();
  $consulta=mysqli_query(conectar(),"select proveido from proveido where idproveido='$idprov';");
  $resultado=mysqli_fetch_assoc($consulta);
  desconectar();
  if (is_null($resultado['proveido'])) {
    echo "";
  } else {
    echo $resultado['proveido'];
  }
}
?>
