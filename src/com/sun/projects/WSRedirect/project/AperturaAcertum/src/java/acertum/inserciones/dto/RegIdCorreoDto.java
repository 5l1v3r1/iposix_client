package acertum.inserciones.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RegIdCorreoDto {

    private int idCorreo;
    private int idProducto;

    public RegIdCorreoDto() {
    }

    public int getIdCorreo() {
        return idCorreo;
    }

    public void setIdCorreo(int idCorreo) {
        this.idCorreo = idCorreo;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
}
