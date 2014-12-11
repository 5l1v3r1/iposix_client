/**
 * 
 */
package acertum.inserciones.dto;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 
 *	
 */
@XmlRootElement
public class AcertumDto {

	private int idGabinete;
	private int idPais;
	private int idCanal;
	private int idSucursal;
	private int folio;
	private int canalDig;
	private int idSucursalDig;
	private int idCorreo;
	private String cuentaAhorro;
	private String correo;
	private int correcto;
	
	public AcertumDto(){}

	public int getIdGabinete() {
		return idGabinete;
	}

	public void setIdGabinete(int idGabinete) {
		this.idGabinete = idGabinete;
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

	public int getCanalDig() {
		return canalDig;
	}

	public void setCanalDig(int canalDig) {
		this.canalDig = canalDig;
	}

	public int getIdSucursalDig() {
		return idSucursalDig;
	}

	public void setIdSucursalDig(int idSucursalDig) {
		this.idSucursalDig = idSucursalDig;
	}

	public int getIdCorreo() {
		return idCorreo;
	}

	public void setIdCorreo(int idCorreo) {
		this.idCorreo = idCorreo;
	}

	public String getCuentaAhorro() {
		return cuentaAhorro;
	}

	public void setCuentaAhorro(String cuentaAhorro) {
		this.cuentaAhorro = cuentaAhorro;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public int getCorrecto() {
		return correcto;
	}

	public void setCorrecto(int correcto) {
		this.correcto = correcto;
	}
	
	
	
	
}
