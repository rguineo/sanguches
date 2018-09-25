<?php

require_once "conexion.php";

Class mdlComanda{

    public function mdlNuevaComanda($tabla1, $tabla2, $nombre, $datosProd, $metodoPay, $totalVenta){

        $sql = (new Conexion)->conectar()->prepare("INSERT INTO $tabla1() VALUES(NULL, NOW(), :nomre, :mpago)");

        $sql->bindParam(":nombre", $nombre, PDO::PARAM_STR);
        $sql->bindParam(":mpago", $metodoPay, PDO::PARAM_STR);

        if ( $sql -> execute() ){
            return "ok";
        } else {
            return "error";
        }


    }
}

?>