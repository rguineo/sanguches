<?php 

Class ajaxComanda{
    public $_nombre;
    public $_datosProd = Array();
    public $_datosRef  = Array();
    public $_datosAd  = Array();
    public $_metodoPay;
    public $_totalVenta;


    public function nuevaComanda(){
        $nombre = $this->_nombre;
        $datosProd = $this->_datosProd;
        $metodoPay = $this->_metodoPay;
        $totalVenta = $this->_totalVenta;

        $respuesta = (new ctrComanda)->ctrNuevaComanda($nombre, $datosProd, $metodoPay, $totalVenta);
        echo $respuesta;
    }

}


$tipoOperacion = $_POST["tipoOperacion"]; 

if ( $tipoOperacion == "ingresarComanda"){
    $nuevaComanda = (new ajaxComanda);
    $nuevaComanda -> _nombre = $_POST["nombreCliente"];
    $nuevaComanda ->_datosProd = $data;
    $nuevaComanda ->_metodoPay = $_POST["modoPago"];
    $nuevaComanda ->_totalVenta = $_POST["TotalGral"];
    $nuevaComanda -> nuevaComanda();
}

?>