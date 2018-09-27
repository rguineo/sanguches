<?php 

class Conexion {

	public function Conectar () {

		// $link = new PDO("mysql:host=localhost;dbname=technoso_ajo", 
		// 	"technoso_ajousr",
		// 	"ajo123",
		// 	array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
		// );

		$link = new PDO("mysql:host=localhost;dbname=sangucheria", 
			"root",
			"",
			array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
		);


		return $link;

	}
}

?>