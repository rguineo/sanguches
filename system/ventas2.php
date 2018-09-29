<?php
    require_once "controller/producto.controller.php";
    require_once "models/producto.model.php";
    
    require_once "controller/comanda.controller.php";
    require_once "models/comanda.model.php";

    require_once "../php/seguridad.php";
    require_once "modulos/modal-venta.php";

    date_default_timezone_set("America/Santiago");
    $fecha = date("Y-m-d G:i:s");

    $usuario = $_SESSION["nombre"];

    $respuesta = (new ControllerProducto)->ctrBuscarProductos();
    $ingrediente = (new ControllerProducto)->ctrBuscarIngredientes();
    $aderezos = (new ControllerProducto)->ctrBuscarAderezos();
    $refrescos = (new ControllerProducto)->ctrBuscarRefrescos();
    $folio = (new ctrComanda)->crtFolio();

    if( $folio["id_venta"] == NULL ){
        $nfolio = 1;
    } else {
        $nfolio = (int)$folio["id_venta"] + 1;
    }
    

?>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">    <link rel="stylesheet" href="dist/css/select2.css">
    <link rel="stylesheet" href="dist/css/select2-bootstrap.min.css">   

    <!-- CCS para taba dinamica avanzada -->
    <link href='dist/css/dataTables.bootstrap4.min.css' rel='stylesheet'>
    <link href='dist/css/dataTables.responsive.css' rel='stylesheet'>


    <link rel="stylesheet" href="dist/css/styleVentas.css">   
    

    <title>Ventas Sangucheria</title>
  </head>
  <body>
  <nav class="navbar navbar-dark bg-info">
  <a class="navbar-brand" href="#">El Ajo - Sangucheria</a>

    <div class="btn-group">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <?php echo $usuario; ?>
        </button>
        <div class="dropdown-menu dropdown-menu-right" id="drop1">

            <a class="dropdown-item" href="#"><i class="fas fa-user"></i> Perfil</a>
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#busquedaComanda"><i class="fas fa-search"></i> Comandas</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="../php/cerrar.php"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>

        </div> 
    </div>
</nav>
<div class="container">
    <center><h2>PUNTO DE VENTA - SANGUCHERIA EL AJO</h2></center>
    <p><br></p>
    <div class="form-group row">
        <div class="col-lg-5">
            <h2>VENTA</h2>
        </div>
        <label class="col-lg-5 control-label TotalVenta">Folio</label>
            <div class="col-lg-2">
                <input type="text" class="form-control folio" name="folio" id="folio" value="<?php echo $nfolio; ?>"/>
            </div>
    </div>
    
    <hr>
    <div class="card">
        <div class="card-header ventasCard">
        Configuraci&oacute;n Venta
        </div>
    <form action="" id="ventas">
 
        <div class="form-group row cliente">
            <div class="col-sm-1"></div>
            <!-- <label for="" class="col-sm-1 col-form-label">Cliente</label> -->
            <div class="col-sm-offset-1 col-sm-4">
                <input class="form-control" type="text" id="nombreCliente" name="nombreCliente" placeholder="Nombre Cliente" required>
            </div>
            <div class="col-sm-3">
            </div>
            <!-- <label for="" class="col-sm-2 col-form-label">Fecha/Hora</label> -->
            <div class="col-sm-3">
                <input class="form-control fechaVenta" type="text" id="fechaActual" value="<?php echo $fecha; ?>" name="fechaActual" disabled> 
            </div>
        </div>
        <hr>
        <div class="form-group row cliente">
            <!-- <label for="" class="col-sm-1 col-form-label">Producto</label> -->
            <div class="col-sm-1">
            </div>
            <div class="col-sm-4">
                <select class="custom-select" name="productoSelect" id="productoSelect">
                    <?php
                        echo '<option value=""></option>';
                        foreach ($respuesta as $key => $value) {
                            echo "<option value=".$value["id_prod"]." valorProd=".$value["precio_prod"].">".strtoupper($value["nom_prod"])."</option>";
                        }
                    ?>
                </select>
            </div>
            <div class="col-sm-1">
            </div>

            <!-- <label for="" class="col-sm-2 col-form-label">Ingredientes</label>  -->
            <div class="col-sm-4">
                <select class="custom-select" name="ingredienteSelect" id="ingredienteSelect" multiple disabled>
                    <?php
                    foreach ($ingrediente as $key => $value) {
                        echo "<option value=".$value["id_ingr"]." valorIng=".$value["precio_ingr"].">".strtoupper($value["nom_ingr"])."</option>";
                    }
                    ?>
                </select>
            </div>

            <div class="col-md-2">
                <button class="btn btn-success btn-sm" type="button" id="btnAddProd" title="Agregar al Pedido" disabled>+ Agregar</button>
            </div>
            
        </div>

       <!-- Aderezo y refrescos -->
        <div class="form-group row cliente">
        <div class="col-sm-1">
            </div>
            <!-- <label for="" class="col-sm-1 col-form-label">Aderezos</label> -->
            <div class="col-sm-4">
                <select class="custom-select" name="" id="aderezosSelect" multiple>
                    <option value="0"></option>
                    <?php
                        foreach ($aderezos as $key => $value) {
                            echo "<option value=".$value["id_aderezo"]." valor=".$value["precio_aderezo"].">".strtoupper($value["nom_aderezo"])."</option>";
                        }
                    ?>
                </select>
            </div>
            <div class="col-md-1">
                <button class="btn btn-success btn-sm" type="button" id="btnAgregarAD" title="Agregar Aderezo">+</button>
                <button class="btn btn-success btn-sm" type="button" id="btnAddAD" title="Repetir Aderezo">R</button>
            </div>

            <!-- <label for="" class="col-sm-1 col-form-label">Refrescos</label> -->

            <div class="col-sm-4">
                <select class="custom-select" name="" id="refrescosSelect" multiple>
                    <option value="0"></option>
                    <?php
                    foreach ($refrescos as $key => $value) {
                        echo "<option value=".$value["id_ref"]." valor=".$value["precio_ref"].">".strtoupper($value["nom_ref"])."</option>";
                    }
                    ?>
                
                </select>
            </div>

            <div class="col-md-2">
                <button class="btn btn-success btn-sm" type="button" id="btnAgregarRF" title="Agregar Refresco">+</button>
                <button class="btn btn-success btn-sm" type="button" id="btnAddRef" title="Repetir Refresco">R</button>

            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <p>
            <button class="btn btn-outline-success btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Observaciones
            </button>
        </p>
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
            <textarea class="form-control" name="observacion" id="observacion" cols="30" rows="2"></textarea>
            </div>
        </div>
    
    <br>
    </div>

    <div>
        <table class="table tablaProductos" id="tablaProductos">
            <thead class="thead-light">
                <tr>
                    <th> Item </th>
                    <th> Producto </th>
                    <th> Ingredientes </th>
                    <th> $ Producto </th>
                    <th> $ Ingredientes</th>
                    <th> $ Total</th>
                    <th> #</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table> 
    </div>
    <hr>
    <div class="form-group row">
        <div class="col-sm-6">
        <table class="table TablaExtras" id="tablaAderezos">
            <thead class="thead-light">
                <tr>
                    <th> Item </th>
                    <th> Aderezos </th>
                    <th> $ Aderezo </th>
                    <th> #</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table> 
        </div>

        <div class="col-sm-6">
        <table class="table TablaExtras" id="tablaRefrescos">
            <thead class="thead-light">
                <tr>
                    <th> Item </th>
                    <th> Refresco </th>
                    <th> $ Refresco </th>
                    <th> #</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table> 
        </div>
    </div><hr>
    <div class="form-group row">
        <label class="col-lg-2 control-label TotalVenta">Total Pedido</label>
        <div class="col-lg-2">
            <select class="form-control" name="llevar" id="llevar">
                    <option value="1">Servir en Local</option>
                    <option value="2">Llevar</option>
                    <option value="3">Delivery</option>
            </select>
        </div>

        <label class="col-lg-2 control-label TotalVenta">Metodo Pago</label>
        <div class="col-lg-2">
            <select class="form-control" name="modoPago" id="modoPago">
                <option value="1">EFECTIVO</option>
                <option value="2">TARJETA CREDITO</option>
                <option value="3">TARJETA DEBITO</option>
            </select>
        </div>
        <label class="col-lg-2 control-label TotalVenta">Total Pedido</label>
        <div class="col-lg-2">
            <input type="text" class="form-control" name="TotalGral" id="TotalGral"/>
        </div>
    </div><hr>
    <div class="col-lg-12 btn-guardar" >
        <input type="hidden" name="tipoOperacion" id="tipoOperacion" value="ingresarComanda">
        <button type="submit" class="btn btn-primary"><i class="far fa-save"></i> Guardar / Imprimir <i class="fas fa-print"></i></button>
    </div>
    </form>
</div>

    <footer>
        <div class="col-lg-12 footer" >
            <p>Todos los derechos reservados 2018 - Sangucheria El Ajo Ancud</p>
        </div>
    </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="dist/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="dist/js/select2.min.js"></script>
    <script src="dist/fontawesome/js/fontawesome.min.js"></script>
    <script src="dist/sweetalert/sweetalert2.all.min.js"></script>
    <!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script> -->

    <script src="dist/js/jquery.dataTables.min.js"></script>
    <script src="dist/js/dataTables.bootstrap4.min.js"></script>

    <script src="recursos/funciones.js"></script>
    <script>
        $(document).ready(function() { $("#e1").select2(); });
        $('#productoSelect').select2({
            // minimumInputLength: 2,
            theme: 'bootstrap',
            placeholder: "Seleccione Productos",
            allowClear: true
        })
        $("#ingredienteSelect").select2({
            theme: 'bootstrap',
            placeholder: "Seleccione Ingredientes"
        });

        $("#aderezosSelect").select2({
            theme: 'bootstrap',
            placeholder: "Seleccione Aderezos"
        });

        $("#refrescosSelect").select2({
            theme: 'bootstrap',
            placeholder: "Seleccione Refrescos"
        });

    </script>
  </body>

</html>