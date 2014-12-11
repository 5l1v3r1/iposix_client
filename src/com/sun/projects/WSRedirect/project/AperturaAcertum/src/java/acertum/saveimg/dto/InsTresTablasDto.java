package acertum.saveimg.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class InsTresTablasDto {
	private int idPais;
	private int idCanal;
	private int idSucursal;
	private int idFolio;
	private String nombre;
	private String aMaterno;
	private String aPaterno;
	private int idTipoProd;
	private int idTipoDocto;
	private String workstation;
	private int idCanalDig;
	private int idSucursalDig;
	private String usuario;
	//private String correo;
	private String tamImagen;
	//private String cuentaAhorro;
	private String ruta;
	private String imagen64;
	
	public InsTresTablasDto(){}

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

	public int getIdFolio() {
		return idFolio;
	}

	public void setIdFolio(int idFolio) {
		this.idFolio = idFolio;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getaMaterno() {
		return aMaterno;
	}

	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}
	

	public int getIdTipoDocto() {
		return idTipoDocto;
	}

	public void setIdTipoDocto(int idTipoDocto) {
		this.idTipoDocto = idTipoDocto;
	}

	public String getWorkstation() {
		return workstation;
	}

	public void setWorkstation(String workstation) {
		this.workstation = workstation;
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

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

//	public String getCorreo() {
//		return correo;
//	}
//
//	public void setCorreo(String correo) {
//		this.correo = correo;
//	}

	public String getTamImagen() {
		return tamImagen;
	}

	public void setTamImagen(String tamImagen) {
		this.tamImagen = tamImagen;
	}

//	public String getCuentaAhorro() {
//		return cuentaAhorro;
//	}
//
//	public void setCuentaAhorro(String cuentaAhorro) {
//		this.cuentaAhorro = cuentaAhorro;
//	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	
	public String getImagen64() {
		return imagen64;
	}

	public void setImagen64(String imagen64) {
		this.imagen64 = imagen64;
	}
        public String getPath(){
		String path = "No disponible";
		if(ruta != null){
				path = ruta.substring(0,ruta.length()-16);
		}
		return path;
	}
/**
 *
 * @return El nombre el cliente unico + nombre del archivo. folio-
 */
        public String getNombreImg(){
            String name;
            if(ruta != null){
                name = ruta.substring(ruta.length()-15, ruta.length());
            }else{
                name = "arch-no-disponible";
            }
            return name;
        }

        public String getClienteUnico(){
            return String.valueOf(idPais +"-"+idCanal +"-"+idSucursal +"-"+idFolio);
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
