   function controltag(e) {
           tecla = (document.all) ? e.keyCode : e.which;
           if (tecla==8) return true;
           else if (tecla==0||tecla==9)  return true;
          // patron =/[0-9\s]/;// -> solo letras
           patron =/[0-9\s]/;// -> solo numeros
           te = String.fromCharCode(tecla);
           return patron.test(te);
       }
