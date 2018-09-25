<?php

Class ControllerProducto{

    public function ctrBuscarProductos(){
        $tabla = "producto";
        $respuesta = (new ModelProducto)->mdlBuscarProducto($tabla);
        return $respuesta;
    }

    public function ctrBuscarIngredientes(){
        $tabla = "ingredientes";
        $respuesta = (new ModelProducto)->mdlBuscarIngredientes($tabla);
        return $respuesta;

    }

    public function ctrBuscarAderezos(){
        $tabla = "aderezo";
        $respuesta = (new ModelProducto)->mdlBuscarAderezos($tabla);
        return $respuesta;

    }

    public function ctrBuscarRefrescos(){
        $tabla = "refresco";
        $respuesta = (new ModelProducto)->mdlBuscarRefrescos($tabla);
        return $respuesta;

    }

}

?>