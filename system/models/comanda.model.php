<?php

require_once "conexion.php";

Class mdlComanda{

    public function mdlNuevaComanda($tabla1, $tabla2, $tabla3, $tabla4, $nombre, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta){

        $arr1 = $datosProd;
        $arr2 = $datosRef;
        $arr3 = $datosAd;
        
        $sql = (new Conexion)->conectar()->prepare("INSERT INTO $tabla1() VALUES(NULL, NOW(), :nombre, NULL, :mpago)");

        $sql->bindParam(":nombre", $nombre, PDO::PARAM_STR);
        $sql->bindParam(":mpago", $metodoPay, PDO::PARAM_STR);

        if ( $sql -> execute() ){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla1 ORDER BY id_venta DESC LIMIT 1");
            $sql -> execute();
            $fila = $sql -> fetch();

            $idVenta = $fila["id_venta"];
            $i=0;
            foreach ($datosProd as $key => $value) {

                $valorProducto = (int)substr($value[$i]->valorProd, 2);
                $valorIngrediente = (int)substr($value[$i]->valorIng, 2);
                
                $sql2 = (new Conexion)->conectar()->prepare("INSERT INTO $tabla2() 
                VALUES(NULL, :idVenta, :producto, :ingredientes, :valorProducto, :valoringredientes)");
                
                $sql2->bindParam(":idVenta", $idVenta, PDO::PARAM_INT);
                $sql2->bindParam(":producto", $value[$i]->Producto, PDO::PARAM_STR);
                $sql2->bindParam(":ingredientes", $value[$i]->Ingredientes, PDO::PARAM_STR);
                $sql2->bindParam(":valorProducto", $valorProducto, PDO::PARAM_INT);
                $sql2->bindParam(":valoringredientes", $valorIngrediente, PDO::PARAM_INT);   

               $sql2->execute();
               $i++;
            }
            return "true";

        } else {
            return "error";
        }
    }
}

?>