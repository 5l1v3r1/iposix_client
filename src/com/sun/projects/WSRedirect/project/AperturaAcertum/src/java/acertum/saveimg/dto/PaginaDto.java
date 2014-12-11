package acertum.saveimg.dto;

public class PaginaDto {
	private int idProducto;
	private int idGabinete;
	private int idTipoDocto;
	private String workstation;
	private String usuario;
	private int idPaisCU;
	private int idCanalCU;
	private int idSucursalCU;
	private int folioCU;
	private String fechaAlta;
	private String tamImagen;
	private String ruta;
	private String rutaNom;
	private int correcto;   //1 correcto. 0 no se completo la operacion;
	private String[] imagen64;
	
	public PaginaDto(){}

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

	public int getIdTipoProd() {
		return idTipoDocto;
	}

	public void setIdTipoProd(int idTipoProd) {
		this.idTipoDocto = idTipoProd;
	}


	public String getWorkstation() {
		return workstation;
	}

	public void setWorkstation(String workstation) {
		this.workstation = workstation;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public int getIdPaisCU() {
		return idPaisCU;
	}

	public void setIdPaisCU(int idPaisCU) {
		this.idPaisCU = idPaisCU;
	}

	public int getIdCanalCU() {
		return idCanalCU;
	}

	public void setIdCanalCU(int idCanalCU) {
		this.idCanalCU = idCanalCU;
	}

	public int getIdSucursalCU() {
		return idSucursalCU;
	}

	public void setIdSucursalCU(int idSucursalCU) {
		this.idSucursalCU = idSucursalCU;
	}

	public int getFolioCU() {
		return folioCU;
	}

	public void setFolioCU(int folioCU) {
		this.folioCU = folioCU;
	}

	public String getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public String getTamImagen() {
		return tamImagen;
	}

	public void setTamImagen(String tamImagen) {
		this.tamImagen = tamImagen;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public String getRutaNom() {
		return rutaNom;
	}

	public void setRutaNom(String rutaNom) {
		this.rutaNom = rutaNom;
	}

	public int getCorrecto() {
		return correcto;
	}

	public void setCorrecto(int correcto) {
		this.correcto = correcto;
	}

	public int getIdTipoDocto() {
		return idTipoDocto;
	}

	public void setIdTipoDocto(int idTipoDocto) {
		this.idTipoDocto = idTipoDocto;
	}

	public String[] getImagen64() {
		return imagen64;
	}

	public void setImagen64(String[] imagen64) {
		this.imagen64 = imagen64;
	}
	
	public String getPath(){
		String path = getRuta().substring(0,ruta.length()-rutaNom.length()-1);
		return  path;
	}
}
