<?php


Class ctrComanda{

    public function ctrNuevaComanda($nombre, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta){
        $tabla1 = "venta";
        $tabla2 = "ventaproducto";
        $tabla3 = "ventarefrescos";
        $tabla4 = "ventaaderezos";
        
        $respuesta = (new mdlComanda)->mdlNuevaComanda($tabla1, $tabla2, $tabla3, $tabla4, $nombre, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta);
        return $respuesta;

    }

    public function crtFolio(){
        $tabla = "venta";

        $respuesta = (new mdlComanda)->mdlFolio($tabla);
        return $respuesta;
    }




}

?>