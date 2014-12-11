package acertum.inserciones.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class DocumentoDto {
	private int idProducto;
	private int idGabinete;
	private int idTipoProducto;
	private int correcto;
	
	public DocumentoDto(){}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public int getIdGabinete() {
		return idGabinete;
	}

	public void setIdGabinete(int idGabinete) {
		this.idGabinete = idGabinete;
	}

	public int getIdTipoProducto() {
		return idTipoProducto;
	}

	public void setIdTipoProducto(int idTipoProducto) {
		this.idTipoProducto = idTipoProducto;
	}

	public int getCorrecto() {
		return correcto;
	}

	public void setCorrecto(int correcto) {
		this.correcto = correcto;
	}
	
	

}
