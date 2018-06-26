<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>

<c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>

<div class="row">
     <div class="col s6 offset-s3 ">
        <div class="center-align">
         <div class="card-panel">
             
             <form action="control.do" method="post">
                <h5>Detalle de compra </h5>
                <button class="btn-floating pulse btn-large waves-effect waves-light blue right" accesskey="" type="submit" name="boton" value="compra">                       
                             <i class="material-icons">shopping_cart</i>
                        </button>  
                <input class="col s6" type="text" name="rut" placeholder="RUT del cliente"/>
               
                <br>
                <table class="bordered">
                <tr>
            
                    <td>NOMBRE</td>
                    <td>PRECIO</td>
                    <td>Foto Referencia</td>
                    <td>UNIDADES</td>
                </tr>   
                <tr>
                <c:forEach items="${carro}" var="p">
                    <td>${p.nombreProducto}</td>
                    <td>${p.precioProducto}</td>
                    <td><xx:TagImage array="${p.fotoProducto}" tam="50"/></td>
                    <td class="col s6">
                        <select name="unidades${p.idProducto}">
                            <c:forEach begin="1" end="${p.unidadesProducto}" var="i">
                                <option>${i}</option>
                            </c:forEach>
                        
                        </select>
                    </td>
                    
                    <td>
                        <a href="control.do?boton=deletecar&codigo=${p.idProducto}"
                           class="btn-floating red">
                            <i class="material-icons">delete</i>
                        </a>
                           
                    </td>
                      </tr>
                </c:forEach> 
                </table>
                ${msg}
            </form>
             
             
         </div>
       
        </div>
     </div>
     
     
 </div>
<%@include file="plantilla/footer.jsp" %>
