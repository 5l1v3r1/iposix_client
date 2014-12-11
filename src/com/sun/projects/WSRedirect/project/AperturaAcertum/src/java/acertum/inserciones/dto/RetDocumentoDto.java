package acertum.inserciones.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RetDocumentoDto {
        private int idProducto;
	private String valor1;
	private String valor2;
	private String valor3;
	private String valor4;
        private String valor5;
        private String valor6;
	private List<Object> cursor;

        

        public String getClienteUnico(){
            String cteUnico = valor1.concat("-"+valor2).concat("-"+valor3).concat("-"+valor4);
            return cteUnico;
        }

    /**
     * @return the idProducto
     */
    public int getIdProducto() {
        return idProducto;
    }

    /**
     * @param idProducto the idProducto to set
     */
    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    /**
     * @return the valor1
     */
    public String getValor1() {
        return valor1;
    }

    /**
     * @param valor1 the valor1 to set
     */
    public void setValor1(String valor1) {
        this.valor1 = valor1;
    }

    /**
     * @return the valor2
     */
    public String getValor2() {
        return valor2;
    }

    /**
     * @param valor2 the valor2 to set
     */
    public void setValor2(String valor2) {
        this.valor2 = valor2;
    }

    /**
     * @return the valor3
     */
    public String getValor3() {
        return valor3;
    }

    /**
     * @param valor3 the valor3 to set
     */
    public void setValor3(String valor3) {
        this.valor3 = valor3;
    }

    /**
     * @return the valor4
     */
    public String getValor4() {
        return valor4;
    }

    /**
     * @param valor4 the valor4 to set
     */
    public void setValor4(String valor4) {
        this.valor4 = valor4;
    }

    /**
     * @return the valor5
     */
    public String getValor5() {
        return valor5;
    }

    /**
     * @param valor5 the valor5 to set
     */
    public void setValor5(String valor5) {
        this.valor5 = valor5;
    }

    /**
     * @return the valor6
     */
    public String getValor6() {
        return valor6;
    }

    /**
     * @param valor6 the valor6 to set
     */
    public void setValor6(String valor6) {
        this.valor6 = valor6;
    }

    /**
     * @return the cursor
     */
    public List<Object> getCursor() {
        return cursor;
    }

    /**
     * @param cursor the cursor to set
     */
    public void setCursor(List<Object> cursor) {
        this.cursor = cursor;
    }
}
	
	
