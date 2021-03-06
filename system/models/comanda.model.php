<?php

require_once "conexion.php";

Class mdlComanda{

    public function mdlNuevaComanda($tabla1, $tabla2, $tabla3, $tabla4, $nombre, $observacion, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta){
        $obs = nl2br($observacion);
        $sql = (new Conexion)->conectar()->prepare("INSERT INTO $tabla1() VALUES(NULL, NOW(), :nombre, :observacion, :mpago)");

        $sql->bindParam(":nombre", $nombre, PDO::PARAM_STR);
        $sql->bindParam(":observacion", $obs, PDO::PARAM_STR);
        $sql->bindParam(":mpago", $metodoPay, PDO::PARAM_STR);

        if ( $sql -> execute() ){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla1 ORDER BY id_venta DESC LIMIT 1");
            $sql -> execute();
            $fila = $sql -> fetch();

            $idVenta = $fila["id_venta"];
 
            $objeto = new StdClass;
            $objeto = (array)$datosProd;

            foreach ($objeto["items"] as $key => $value) {

                $valorProducto = (int)substr($value->valorProd, 2);
                $valorIngrediente = (int)substr($value->valorIng, 2);
                
                $sql2 = (new Conexion)->conectar()->prepare("INSERT INTO $tabla2() 
                VALUES(NULL, :idVenta, :producto, :ingredientes, :valorProducto, :valoringredientes)");
                
                $sql2->bindParam(":idVenta", $idVenta, PDO::PARAM_INT);
                $sql2->bindParam(":producto", $value->Producto, PDO::PARAM_STR);
                $sql2->bindParam(":ingredientes", $value->Ingredientes, PDO::PARAM_STR);
                $sql2->bindParam(":valorProducto", $valorProducto, PDO::PARAM_INT);
                $sql2->bindParam(":valoringredientes", $valorIngrediente, PDO::PARAM_INT);   

               $sql2->execute();
            }

            $objeto2 = new StdClass;
            $objeto2 = (array)$datosRef;           
   
            if ( $datosRef != NULL){
                foreach ($objeto2["itemsRef"] as $key => $value) {

                    $valRef = (int)substr($value->valRef, 2);
                    
                    $sql3 = (new Conexion)->conectar()->prepare("INSERT INTO $tabla3() 
                    VALUES(NULL, :idVenta, :refresco, :valor)");
                    
                    $sql3->bindParam(":idVenta", $idVenta, PDO::PARAM_INT);
                    $sql3->bindParam(":refresco", $value->Refresco, PDO::PARAM_STR);
                    $sql3->bindParam(":valor", $valRef, PDO::PARAM_INT);

                $sql3->execute();

                }
            }

            $objeto3 = new StdClass;
            $objeto3 = (array)$datosAd;  
            if ( $datosAd != NULL){
                foreach ($objeto3["itemsAd"] as $key => $value) {

                    $valAd = (int)substr($value->valAd, 2);
                    
                    $sql3 = (new Conexion)->conectar()->prepare("INSERT INTO $tabla4() 
                    VALUES(NULL, :idVenta, :aderezo, :valorAderezo)");
                    
                    $sql3->bindParam(":idVenta", $idVenta, PDO::PARAM_INT);
                    $sql3->bindParam(":aderezo", $value->Aderezo, PDO::PARAM_STR);
                    $sql3->bindParam(":valorAderezo", $valAd, PDO::PARAM_INT);

                $sql3->execute();

                }
            }

            return "true";

        } else {
            return "error";
        }
    }


    public function mdlFolio($tabla){
        $sql = (new Conexion)->conectar()->prepare("SELECT * FROM venta ORDER BY id_venta DESC LIMIT 1");
        $sql -> execute();
        return $sql->fetch();
    }


    public function mdlTodasComandas(){
        $sql = (new Conexion)->conectar()->prepare("SELECT * FROM venta ORDER BY id_venta DESC");
        $sql -> execute();
        return $sql->fetchAll();
    }
}

?>