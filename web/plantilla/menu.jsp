<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div class="nav-wrapper brown lighten-1">
      <a href="inicio.jsp" class="brand-logo">
          <c:if test="${not empty sessionScope.admin}">
              Bienvenido ${sessionScope.admin.nombreUser}
              
          </c:if>
              
              <c:if test="${not empty sessionScope.person}">
                  Bienvenido ${sessionScope.person.nombreUser} 
              <!-- accedemos al atributo del nombre en la base de datos -->
              
          </c:if>
              <img src="img/imagen49.gif" height=50 width="50">
      </a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
          
          <c:if test="${not empty sessionScope.admin}">
               <li> <a href="Categoria.jsp">Modulo Categoria</a></li>
               <li> <a href="Producto.jsp">Modulo Producto</a></li>
               <li> <a href="MVentas.jsp">Ventas realizadas</a></li>
                <li> <a href="Catalogo.jsp">Venta</a></li>
                <c:if test="${carro.size()>0}">
                <li><a href="detallecarro.jsp">Carrito(${carro.size()})</a></li>
                </c:if>
                  <li> <a href="Salir.jsp">Cerrar Sesión</a></li>
              
          </c:if>
          
           <c:if test="${not empty sessionScope.person}">
               <li> <a href="MVentas.jsp">Ventas realizadas</a></li>
                <li> <a href="Catalogo.jsp">Venta</a></li>
                <c:if test="${carro.size()>0}">
                <li><a href="detallecarro.jsp">Carrito(${carro.size()})</a></li>
                </c:if>
                  <li> <a href="Salir.jsp">Cerrar Sesión</a></li>
              
          </c:if>
          
         
         
      </ul>
    </div>
    </nav>