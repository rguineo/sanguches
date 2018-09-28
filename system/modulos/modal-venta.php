<?php

$comanda = (new ctrComanda)->crtTodasComandas();

?>


<!-- Modal -->
<div class="modal fade bd-example-modal-lg comandas" id="busquedaComanda" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="background: #17a2b8">
        <h5 class="modal-title" style="color: white" id="exampleModalLabel"><i class='fa fa-search'></i> Busqueda Comandas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead style="text-align: center; font-size: 12px;">
            <tr>
                <th>Folio</th>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Observaciones</th>
                <th>Ver</th>
            </tr>
            </thead>

            <tbody style="font-size: 12px;">
            <?php 
                foreach ($comanda as $key => $value) {
                    echo "<tr>";
                        echo "<td><center>".$value["id_venta"]."</center></td>";
                        echo "<td>".date($value["fecha_venta"])."</td>";
                        echo "<td>".$value["nom_venta"]."</td>";
                        echo "<td>".$value["obs_venta"]."</td>";
                        
                        echo "<td><center><a href='#' id='".$value["id_venta"]."'><i class='fa fa-search'></i></center></a></td>";
                    echo "</tr>";
                }
            ?>
            
            </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>