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
