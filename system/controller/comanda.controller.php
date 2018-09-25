<?php


Class ctrComanda{

    public function ctrNuevaComanda($nombre, $datosProd, $metodoPay, $totalVenta){
        $tabla1 = "venta";
        $tabla2 = "det_venta";
        
        $respuesta = (new mdlComanda)->mdlNuevaComanda($tabla1, $tabla2, $nombre, $datosProd, $metodoPay, $totalVenta);


    }


}

?>