<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>

<c:set var="Usuarios" scope="page" value="<%= servicio.getUsuarios() %>"/>
<c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
<c:set var="DetalleVentas" scope="page" value="<%= servicio.getDVentas() %>"/>
<c:set var="Ventas" scope="page" value="<%= servicio.getVentas() %>"/>
<div class="container">
<div class="row">
    
    <c:forEach items="${person.ventaList}" var="v">
        
        <div class="col s12 m6">
            <div class="card">
                
            <div class="card-content">
                 <span class="card-title activator grey-text text-darken-4">user:<br>fecha: ${v.fechaVenta} <br>total:$ ${v.totalVenta}<i class="material-icons right">more_vert</i></span>
                 <br><br>
            </div>
            <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalle facturacion:
           <c:forEach items="${v.detalleVentaList}" var="d">
                                <p>Numero de Venta : ${d.venta.idVenta}</p>
                                <p>Producto: ${d.producto.nombreProducto} </p>
                                <p>Foto Referencial: <xx:TagImage array="${d.producto.fotoProducto}" tam="50"/></p><br>
                                <hr>
                               
           </c:forEach>
          <i class="material-icons right">close</i></span>
                 
    </div>
                 <br><br>
        </div>
        
        </div>
        
    </c:forEach>
        
            
    <c:forEach items="${admin.ventaList}" var="v">
        
        <div class="col s12 m6">
            <div class="card">
                
            <div class="card-content">
                 <span class="card-title activator grey-text text-darken-4"><br>fecha: ${v.fechaVenta} <br>total:$ ${v.totalVenta}<i class="material-icons right">more_vert</i></span>
                 <br><br>
            </div>
            <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalle facturacion:
           <c:forEach items="${v.detalleVentaList}" var="d">
                                <p>Numero de Venta : ${d.venta.idVenta}</p>
                                <p>Producto: ${d.producto.nombreProducto} </p><br>
                                 <p>Foto Referencial: <xx:TagImage array="${d.producto.fotoProducto}" tam="50"/></p><br>
                                <hr>
                               
           </c:forEach>
          <i class="material-icons right">close</i></span>
                 
    </div>
                 <br><br>
        </div>
        
        </div>
        
    </c:forEach>
        
        
    </div>
    
    
    
    
</div>

</div>


<%@include file="plantilla/footer.jsp" %>