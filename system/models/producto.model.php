<?php
    require_once "conexion.php";

    Class ModelProducto{

        public function mdlBuscarProducto($tabla){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla");
            $sql -> execute();
            return $sql->fetchAll();
        }

        public function mdlBuscarIngredientes($tabla){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla");
            $sql -> execute();
            return $sql->fetchAll();
        }

        public function mdlBuscarAderezos($tabla){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla");
            $sql -> execute();
            return $sql->fetchAll();
        }

        public function mdlBuscarRefrescos($tabla){
            $sql = (new Conexion)->conectar()->prepare("SELECT * FROM $tabla");
            $sql -> execute();
            return $sql->fetchAll();
        }
    }

?>