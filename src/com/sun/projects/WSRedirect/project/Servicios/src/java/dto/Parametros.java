/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author B246583
 */
@XmlRootElement
public class Parametros {

    private int idPais;
    private int idCanal;
    private int idSucursal;
    private int idFolio;
    private int idTipoProd;
    private String imagen64;
    private String parametros;

    /**
     * @return the idPais
     */
    public int getIdPais() {
        return idPais;
    }

    /**
     * @param idPais the idPais to set
     */
    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    /**
     * @return the idCanal
     */
    public int getIdCanal() {
        return idCanal;
    }

    /**
     * @param idCanal the idCanal to set
     */
    public void setIdCanal(int idCanal) {
        this.idCanal = idCanal;
    }

    /**
     * @return the idSucursal
     */
    public int getIdSucursal() {
        return idSucursal;
    }

    /**
     * @param idSucursal the idSucursal to set
     */
    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    /**
     * @return the idFolio
     */
    public int getIdFolio() {
        return idFolio;
    }

    /**
     * @param idFolio the idFolio to set
     */
    public void setIdFolio(int idFolio) {
        this.idFolio = idFolio;
    }

    /**
     * @return the parametros
     */
    public String getParametros() {
        return parametros;
    }

    /**
     * @param parametros the parametros to set
     */
    public void setParametros(String parametros) {
        this.parametros = parametros;
    }

    /**
     * @return the imagen64
     */
    public String getImagen64() {
        return imagen64;
    }

    /**
     * @param imagen64 the imagen64 to set
     */
    public void setImagen64(String imagen64) {
        this.imagen64 = imagen64;
    }

    /**
     * @return the idTipoProd
     */
    public int getIdTipoProd() {
        return idTipoProd;
    }

    /**
     * @param idTipoProd the idTipoProd to set
     */
    public void setIdTipoProd(int idTipoProd) {
        this.idTipoProd = idTipoProd;
    }


}
