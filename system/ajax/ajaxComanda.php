<?php 

require_once "../controller/comanda.controller.php";
require_once "../models/comanda.model.php";



Class ajaxComanda{
    public $_nombre;
    public $_datosProd = Array();
    public $_datosRef  = Array();
    public $_datosAd  = Array();
    public $_metodoPay;
    public $_totalVenta;
    public $_observacion;


    public function nuevaComanda(){
        $nombre = $this->_nombre;
        $observacion = $this->_observacion;
        $datosProd = $this->_datosProd;
        $datosRef = $this->_datosRef;
        $datosAd = $this->_datosAd;
        $metodoPay = $this->_metodoPay;
        $totalVenta = $this->_totalVenta;

        $respuesta = (new ctrComanda)->ctrNuevaComanda($nombre, $observacion, $datosProd, $datosRef, $datosAd, $metodoPay, $totalVenta);

        echo $respuesta;
    }

}


$tipoOperacion = $_POST["tipoOperacion"]; 

$arregloProd = json_decode($_POST["glosaProd"]);
$arregloRef = json_decode($_POST["glosaRef"]);
$arregloAd = json_decode($_POST["glosaAd"]);

if ( $tipoOperacion == "ingresarComanda"){
    $nuevaComanda = (new ajaxComanda);
    $nuevaComanda ->_nombre = $_POST["nombreCliente"];
    $nuevaComanda ->_observacion = $_POST["observacion"];
    $nuevaComanda ->_datosProd = $arregloProd;
    $nuevaComanda ->_datosRef = $arregloRef;
    $nuevaComanda ->_datosAd = $arregloAd;
    $nuevaComanda ->_metodoPay = $_POST["modoPago"];
    $nuevaComanda ->_totalVenta = $_POST["TotalGral"];
    $nuevaComanda -> nuevaComanda();
}

?>