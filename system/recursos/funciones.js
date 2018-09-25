var TotalGeneral = 0

$(document).ready(function(){
    $('#btnAddProd').click(function(){
        agregar()
    })

    $('#btnAgregarRF').click(function(){
        agregarRf()
    })

    $('#btnAgregarAD').click(function(){
        agregarAd()
    })


    $('#productoSelect').on('change', function(){
        $('#ingredienteSelect').prop('disabled', false)
        $('#btnAddProd').prop('disabled', false)
    })

    $("#ventas").submit(function (e) {
        e.preventDefault()
        
        swal({
            title: '¿El pedido está correcto?',
            text: "Se enviará comanda !",
            icon: 'warning',
            buttons: true,
            dangerMode: true,
          }).then((willSend) => {
              if (willSend){

                var items = []
                // Extraer datos de la tabla

                $("#tablaProductos tbody tr").each(function(el) {
                    var itemOrder = {}
                   
                        var tds = $(this).find("td")
                        itemOrder.item = tds.filter(":eq(0)").text()
                        itemOrder.IdProd = tds.filter(":eq(1)").text()
                        itemOrder.Producto = tds.filter(":eq(2)").text()
                        itemOrder.idsIng = tds.filter(":eq(3)").text()
                        itemOrder.Ingredientes = tds.filter(":eq(4)").text()
                        itemOrder.valorProd = tds.filter(":eq(5)").text()
                        itemOrder.valorIng = tds.filter(":eq(6)").text()
                        itemOrder.valorTotal = tds.filter(":eq(7)").text()

                        items.push(itemOrder)
        
                })
                
                var Orden = {}
                Orden.items = items
                console.log(Orden)
                var datos = JSON.stringify(Orden)
                console.log(datos)
                enviarDatos(datos)

              }
          })	

    })

})

var cont=0

function agregar(){
    var producto = $('select[name="productoSelect"] option:selected').text()
    var precioProducto = parseInt($('select[name="productoSelect"] option:selected').attr("valorProd"))
    var idProducto = $('select[name="productoSelect"] option:selected').val()
    
    var precioIng = 0
    var total = 0
    var datostxt = new Array()
    var id = new Array()

     $('#ingredienteSelect option:selected').each(function(){ 
        datostxt.push($(this).text())
        id.push($(this).val())
        precioIng = precioIng + parseInt($(this).attr("valorIng"))
    })

    // Suma producto + ingredientes
    total = precioProducto + precioIng
    var ingredientes = ""
    $.each(datostxt, function (ind, elem) { 
        ingredientes = ingredientes + elem +','
      })    
    cont++
    var fila='<tr class="selected" id="fila'+cont+'"><td>'+cont+'</td><td hidden>'+idProducto+'</td><td>'+producto+'</td><td hidden>'+id+'</td><td>'+datostxt+'</td><td>$ '+precioProducto+'</td><td>$ '+precioIng+'</td><td>$ '+total+'</td><td><i class="fas fa-trash-alt" id="'+cont+'" totalPedido="'+total+'" onClick="remover(this.id, '+total+')"></i></td></tr>'
    $('#tablaProductos').append(fila)
    TotalGeneral = TotalGeneral + total
    refrechTotal(TotalGeneral)
    reordenar()
    $('#productoSelect').val(null).trigger('change'); //Resetear Select2
    $('#ingredienteSelect').val(null).trigger('change');
}

function remover(id, totalPedido){
    $("#fila"+id).remove()
    TotalGeneral = TotalGeneral - parseInt(totalPedido)
    refrechTotal(TotalGeneral)
    reordenar()
}

function reordenar(){
    var num=1
    $('#tablaProductos tbody tr').each(function(){
        $(this).find('td').eq(0).text(num)
        num++
    })
}

function refrechTotal(TotalGeneral){
    $('#TotalGral').val("$"+TotalGeneral)
}

function removerRf(id, totalRef){
    $("#filaR"+id).remove()
    TotalGeneral = TotalGeneral - parseInt(totalRef)
    refrechTotal(TotalGeneral)
    reordenarRF()
}

function removerAd(id, totalRef){
    $("#filaA"+id).remove()
    TotalGeneral = TotalGeneral - parseInt(totalRef)
    refrechTotal(TotalGeneral)
    reordenarAd()
}

function reordenarRF(){
    var num=1
    $('#tablaRefrescos tbody tr').each(function(){
        $(this).find('td').eq(0).text(num)
        num++
    })
}

function reordenarAd(){
    var num=1
    $('#tablaAderezos tbody tr').each(function(){
        $(this).find('td').eq(0).text(num)
        num++
    })
}
function agregarRf(){
    var valorRef
    var datostxt 

     $('#refrescosSelect option:selected').each(function(){ 
        datostxt = $(this).text()
        valorRef = parseInt($(this).attr("valor"))
        idRF = $(this).val()
        cont++
        var fila='<tr class="selected" id="filaR'+cont+'"><td>'+cont+'</td><td hidden>'+idRF+'</td><td>'+datostxt+'</td><td>$'+valorRef+'</td><td><i class="fas fa-trash-alt" id="'+cont+'" totalPedido="'+valorRef+'" onClick="removerRf(this.id, '+valorRef+')"></i></td></tr>'
        $('#tablaRefrescos').append(fila)
        TotalGeneral = TotalGeneral + valorRef
        refrechTotal(TotalGeneral)
     })

    reordenarRF()
    $('#refrescosSelect').val(null).trigger('change') //Resetear Select2

}

function agregarAd(){
    var valorAde
    var datostxt 

     $('#aderezosSelect option:selected').each(function(){ 
        datostxt = $(this).text()
        valorAde = parseInt($(this).attr("valor"))
        idAD = $(this).val()
        cont++
        var fila='<tr class="selected" id="filaA'+cont+'"><td>'+cont+'</td><td hidden>'+idAD+'</td><td>'+datostxt+'</td><td>$'+valorAde+'</td><td><i class="fas fa-trash-alt" id="'+cont+'" totalPedido="'+valorAde+'" onClick="removerAd(this.id, '+valorAde+')"></i></td></tr>'
        $('#tablaAderezos').append(fila)
        TotalGeneral = TotalGeneral + valorAde
        refrechTotal(TotalGeneral)
     })

    reordenarRF()
    $('#aderezosSelect').val(null).trigger('change') //Resetear Select2

}

function enviarDatos(datos){
    console.log("Enviar Datos ajax")   
    $.ajax({
        url: "ajax/ajaxComanda.php",
        type: "POST",
        // data: "codigo=algo",
        // success: function (response) {
        //     console.log(response)
        //     //swal("Done!", "It was succesfully deleted!", "success");
        // }
    })
}