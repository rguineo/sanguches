<?php


Class ctrComanda{

    public function ctrNuevaComanda($nombre, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta){
        $tabla1 = "venta";
        $tabla2 = "ventaproducto";
        $tabla3 = "ventarefresco";
        $tabla4 = "ventaaderezo";
        
        $respuesta = (new mdlComanda)->mdlNuevaComanda($tabla1, $tabla2, $tabla3, $tabla4, $nombre, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta);
        return $respuesta;

    }


}

?>