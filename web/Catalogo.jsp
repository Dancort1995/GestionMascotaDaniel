<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
   <c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
    <c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
    ${requestScope.msg}
    <center><h1>Catalogo de la veterinaria <img src="img/giphy.gif" width="100" height="100"></h1></center>
    <div class="row">
    <c:forEach items="${pageScope.productos}" var="p">
        <c:if test="${p.unidadesProducto>0}">
      	  <div class="col s5 m3">
	  <div class="card-panel hoverable brown "> 
              <form action="control.do" method="post">
                  <center>
              <div class="responsive-img">
                  
                      <xx:TagImage array="${p.fotoProducto}" tam="100"/>
                  
              </div>
                  <br>
                  <input type="hidden" name="codigo" value="${p.idProducto}"/>
                  <h3> <span class="white-text">${p.nombreProducto}</span></h3>
              <span class="white-text text-darken-2" ><h4>${p.categoria.nombreCategoria}</h4></span>
          <div class="card-content">
              <h5><span class="white-text">${p.descripcionProducto} <br> Precio:$ ${p.precioProducto}</span></h5>
        </div>
              </center>
               <button class="btn-floating pulse btn-large waves-effect waves-light red right" accesskey="" type="submit" name="boton" value="addcarro">                       
                             <i class="material-icons">add_shopping_cart</i>
               </button>  
            </form>
        <br><br>
	  </div>
	  </div>
  </c:if>
    </c:forEach>
    </div>
<%@include file="plantilla/footer.jsp" %>