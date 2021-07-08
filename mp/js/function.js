function soloNumeros(e) {
 tecla = (document.all) ? e.keyCode : e.which;
 if (tecla==8) return true;
 else if (tecla==0||tecla==9)  return true;
  // patron =/[0-9\s]/;// -> solo letras
 patron =/[0-9\s]/;// -> solo numeros
 te = String.fromCharCode(tecla);
 return patron.test(te);
}
function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
   especiales = "8-37-39-46";

   tecla_especial = false
   for(var i in especiales){
        if(key == especiales[i]){
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla)==-1 && !tecla_especial){
        return false;
    }
}
function cambiomp(txtantigua, txtnueva, txtrepita){
  var parametros = {
  "txtantigua" : txtantigua,
  "txtnueva" : txtnueva,
  "txtrepita" : txtrepita
  };
  $.ajax({
    data:  parametros,
    url:   '../enlace/regcambiomp.php',
    type:  'post',
    beforeSend: function () {
      $("#resultado").html("Procesando, espere por favor...");
      },
    success:  function (response) {
      $("#resultado").html(response);
    }
  });
}
function consultadni(tipoingreso, txtdniruc){
  var parametros = {
  "tipoingreso" : tipoingreso,
  "txtdniruc" : txtdniruc
  };
  $.ajax({
    data:  parametros,
    url:   'consultadniruc.php',
    type:  'post',
    beforeSend: function () {
      $("#resultado").html("Procesando, espere por favor...");
      },
    success:  function (response) {
      $("#resultado").html(response);
    }
  });
}
function consultaexpediente(txtexpediente){
  var parametros = {
  "txtexpediente" : txtexpediente
  };
  $.ajax({
    data:  parametros,
    url:   'consultaexp.php',
    type:  'post',
    beforeSend: function () {
      $("#resultado").html("Procesando, espere por favor...");
      },
    success:  function (response) {
      $("#resultado").html(response);
    }
  });
}
  $(document).ready(function(){
    var $select_area = $(".select2_area").select2();
    $("#checkFacultades").on("click", function () {
      if(this.checked) {
        if(document.getElementById('checkOficinas').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286",
            "25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286"]).trigger("change");
        }
      }else{
        if(document.getElementById('checkOficinas').checked) {
          $select_area.val(["25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(null).trigger("change");
        }
      }
    });

    $("#checkOficinas").on("click", function () {
      if(this.checked) {
        if(document.getElementById('checkFacultades').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286",
            "25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }else{
          $select_area.val(["25","28","29","32","58","66","68","73","74","78","82"]).trigger("change");
        }
      }else{
        if(document.getElementById('checkFacultades').checked) {
          $select_area.val(["90","114","134","154","174","191","211","230","249","270","286"]).trigger("change");
        }else{
          $select_area.val(null).trigger("change");
        }
      }
    });


    
  });