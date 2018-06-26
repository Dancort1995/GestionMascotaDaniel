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
import java.util.Date;
import java.util.List;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author clrubilarc
 */
@Singleton
public class ServicioBean implements ServicioBeanLocal {

    @PersistenceContext(unitName = "GestionMascotas2018PU")
    private EntityManager em;
    
    @Override
    public Usuario iniciarSesion(String rut, String clave){
        try{
            return  em.createNamedQuery("Usuario.iniciarSesion", Usuario.class)
            .setParameter("rutUser",rut)
                    .setParameter("clave",clave)
                    .getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void guardar(Object o) {
       em.persist(o);
    }

    @Override
    public List<Categoria> getCategorias() {
        return em.createNamedQuery("Categoria.findAll").getResultList();
    }

    @Override
    public List<Producto> getProductos() {
         return em.createNamedQuery("Producto.findAll").getResultList();
    }
    @Override
    public List<Usuario> getUsuarios() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }
    @Override
    public List<Perfil> getPerfiles() {
        return em.createNamedQuery("Perfil.findAll").getResultList();
    }
        @Override
    public List<DetalleVenta> getDVentas() {
       return em.createNamedQuery("DetalleVenta.findAll").getResultList();
    }

    @Override
    public List<Venta> getVentas() {
       return em.createNamedQuery("Venta.findAll").getResultList();
    }

    
    @Override
    public void sincronizar(Object o) {
        em.merge(o);//actualiza la categoria
        em.flush();//sincroniza
    }

    @Override
    public Categoria buscarCategoria(int id) {
        return em.find(Categoria.class, id);
    }

    @Override
    public Usuario buscarUsuario(String rut) {
        return em.find(Usuario.class, rut);
    }

    @Override
    public Perfil buscarPerfil(int id) {
        return em.find(Perfil.class, id);
    }

    @Override
    public Producto buscarProducto(int id) {
       return em.find(Producto.class, id);
    }

    @Override
    public void compra(String rut, ArrayList<String> lista) throws TransactionException {
       ArrayList<DetalleVenta> detallelist = new ArrayList<>();    
        
    Usuario user = buscarUsuario(rut);  
    
    Venta newventa = new Venta();
    newventa.setUsuario(user);
    newventa.setFechaVenta(new Date());
    
    int codigo;
    int unidad;
    int suma=0;
        for (String s : lista) {
            String []x =s.split(",");
        codigo = Integer.parseInt(x[0]);
        unidad = Integer.parseInt(x[1]);
        
        Producto p = buscarProducto(codigo);
        
            if (p.getUnidadesProducto()< unidad) {
             throw new TransactionException();   
            }
            p.setUnidadesProducto(p.getUnidadesProducto()-unidad);
            em.merge(p);
        
            
            DetalleVenta newdetalle = new DetalleVenta();
            newdetalle.setProducto(p);
            newdetalle.setVenta(newventa);
            newdetalle.setPrecio(p.getPrecioProducto());
            
            detallelist.add(newdetalle);
            
            suma += p.getPrecioProducto()*unidad;
            
        }
        newventa.setTotalVenta(suma);
        
        em.persist(newventa);
        //asocial la venta con cada detalle
        newventa.setDetalleVentaList(detallelist);
        em.merge(newventa);
        //asociar el usuario con la venta
        user.getVentaList().add(newventa);
        em.merge(user);
        //sincronización
        em.flush();
    }





  
}
