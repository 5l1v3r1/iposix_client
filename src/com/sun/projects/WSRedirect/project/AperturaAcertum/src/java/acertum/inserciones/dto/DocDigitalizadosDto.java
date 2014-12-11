package acertum.inserciones.dto;

public class DocDigitalizadosDto {
	
	private int idTipoDocto;
	private  String nombre;
	private String nombrePagina;
	private String ruta;
	
	public DocDigitalizadosDto(){}

	public int getIdTipoDocto() {
		return idTipoDocto;
	}

	public void setIdTipoDocto(int idTipoDocto) {
		this.idTipoDocto = idTipoDocto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombrePagina() {
		return nombrePagina;
	}

	public void setNombrePagina(String nombrePagina) {
		this.nombrePagina = nombrePagina;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	
	
	
}
