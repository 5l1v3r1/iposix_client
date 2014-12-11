package acertum.verificadocumentos.dao;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class DatosDto {
	private int idProducto;
	private int subproducto;
	private int etapa;
	private int idPais;
	private int idCanal;
	private int idSucursal;
	private int folio;
	
	public DatosDto(){}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public int getSubproducto() {
		return subproducto;
	}

	public void setSubproducto(int subproducto) {
		this.subproducto = subproducto;
	}

	public int getEtapa() {
		return etapa;
	}

	public void setEtapa(int etapa) {
		this.etapa = etapa;
	}


	public int getIdPais() {
		return idPais;
	}

	public void setIdPais(int idPais) {
		this.idPais = idPais;
	}

	public int getIdCanal() {
		return idCanal;
	}

	public void setIdCanal(int idCanal) {
		this.idCanal = idCanal;
	}

	public int getIdSucursal() {
		return idSucursal;
	}

	public void setIdSucursal(int idSucursal) {
		this.idSucursal = idSucursal;
	}

	public int getFolio() {
		return folio;
	}

	public void setFolio(int folio) {
		this.folio = folio;
	}
	
	
}
