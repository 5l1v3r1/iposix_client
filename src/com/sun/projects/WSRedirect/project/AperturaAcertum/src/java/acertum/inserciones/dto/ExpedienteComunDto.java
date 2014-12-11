package acertum.inserciones.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ExpedienteComunDto {
	
	private int idPais;
	private int idCanal;
	private int idSucursal;
	private int folio;
	private String nombre;
	private String aPaterno;
	private String aMaterno;
	private int idCanalDig;
	private int idSucursalDig;
	private int idGabinete;  // Este es el identificador �nico del Cliente Unico.
	private String fechaAlta; //Este dato es informativo, si el campo es NULL quiere decir que el campo es nuevo, en caso de tener informaci�n indica que fecha fue dado de alta.
	private int correcto; // Campo informativo que indica con 1, si se realizo la operaci�n de manera satisfactoria y 0 si no se pudo completar la operaci�n.
	
	public ExpedienteComunDto() {
//		idPais = 1;
//		idCanal = 1;
//		idSucursal =1;
//		folio = 1124;
//		nombre = "pedro";
//		aPaterno = "Perea";
//		aMaterno = "Lopez";
//		idCanalDig = 1; 
//		idSucursalDig = 1;
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}

	public String getaMaterno() {
		return aMaterno;
	}

	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public int getIdCanalDig() {
		return idCanalDig;
	}

	public void setIdCanalDig(int idCanalDig) {
		this.idCanalDig = idCanalDig;
	}

	public int getIdSucursalDig() {
		return idSucursalDig;
	}

	public void setIdSucursalDig(int idSucursalDig) {
		this.idSucursalDig = idSucursalDig;
	}

	public int getIdGabinete() {
		return idGabinete;
	}

	public void setIdGabinete(int idGabinete) {
		this.idGabinete = idGabinete;
	}

	public String getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public int getCorrecto() {
		return correcto;
	}

	public void setCorrecto(int correcto) {
		this.correcto = correcto;
	}
	
	
	
	
}
