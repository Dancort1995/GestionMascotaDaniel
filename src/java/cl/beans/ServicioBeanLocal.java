/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import cl.controller.TransactionException;
import cl.entities.Categoria;
import cl.entities.DetalleVenta;
import cl.entities.Perfil;
import cl.entities.Producto;
import cl.entities.Usuario;
import cl.entities.Venta;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author clrubilarc
 */
@Local
public interface ServicioBeanLocal {
    Usuario iniciarSesion(String rut,String clave);
    void guardar(Object o);
    void sincronizar(Object o);
    
    
    Categoria buscarCategoria(int id);
    Usuario buscarUsuario(String rut);
    Perfil buscarPerfil(int id);
    Producto buscarProducto(int id);
    List<DetalleVenta> getDVentas();
    List<Venta>getVentas();
    List<Perfil> getPerfiles();
    List<Categoria> getCategorias();
    List<Producto> getProductos();
    List<Usuario> getUsuarios();
    
    void compra(String rut,ArrayList<String> lista) throws TransactionException;
}
