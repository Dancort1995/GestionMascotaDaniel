<%@include file="plantilla/header.jsp" %>
<c:set var="usuarios" scope="page" value="<%=servicio.getUsuarios() %>"/>
<c:set var="perfiles" scope="page" value="<%=servicio.getPerfiles() %>"/>
 
<body background="img/back.jpg">
<img src="img/cat_rego_w1920.png" style="float: left; padding-top:100px; padding-left: auto">
<img src="img/dog.jpg"  style="float: right;  padding-top:100px; padding-left:  -50px" >

<div class="container">
 <div class="row">
     <div class="col s6 offset-s3 z-depth-3" style="background-color: white; padding-top: -300px">
          <h2> Registro</h2>
        <form action="control.do" method="post">
            <label>Rut</label>
            <input type="text" name="rut"/>
            <br>
            <label>Nombre</label>
            <input type="text" name="nombre"/>
            <br>
            <label>Apellido</label>
            <input type="text" name="apellido"/>
            <br>
            <label>Email</label>
            <input type="text" name="email"/>
            <br>
            <label>Clave</label>
            <input type="password" name="clave" />
            <br>
            <label>Ingrese tipo de perfil</label>
            <select name="perfiles">
                     <c:forEach items="${pageScope.perfiles}" var="p">
                          <option value="${p.idPerfil}" var="p">${p.nombrePerfil}</option>
                     </c:forEach>       
            </select>
            <br> 
            
            <button class="btn pulse left" name="boton" type="submit" value="nuevousuario">Aceptar</button>
            <a class="right" href="index.jsp">Regresar</a>
            <br><br>
           
        </form>
       <br>
       <p class="red-text"> ${requestScope.msg}</p>
         
         
     </div>
     
     
 </div>
       </div>
      </body>
   <%@include file="plantilla/footer.jsp" %>