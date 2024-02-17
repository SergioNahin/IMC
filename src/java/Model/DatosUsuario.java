package Model;

import java.sql.PreparedStatement;

/**
 *
 * @author Sergio Trinidad
 */
public class DatosUsuario extends Conexion {

    private Long id;
    private String nombre;
    private String apellido;
    private String edad;
    private String genero;
    private float altura;
    private float peso;
    private float IMC;
    private String fecha;

    public DatosUsuario() {

    }

    public void setnombre(String nombre) {   //nombre
        this.nombre = nombre;
    }

    public String getnombre() {
        return nombre;
    }

    public void setapellido(String apellido) {   //apellido
        this.apellido = apellido;
    }

    public String getapellido() {
        return apellido;
    }

    public void setedad(String edad) {   //edad
        this.edad = edad;
    }

    public String getedad() {
        return edad;
    }

    public void setgenero(String genero) {   //genero
        this.genero = genero;
    }

    public String getgenero() {
        return genero;
    }

    public void setaltura(float altura) {   //altura
        this.altura = altura;
    }

    public float getaltura() {
        return altura;
    }

    public void setpeso(float peso) {   //peso
        this.peso = peso;
    }

    public float getpeso() {
        return peso;
    }

    public void setIMC(float IMC) {   //IMC
        this.IMC = IMC;
    }

    public float getIMC() {
        return IMC;
    }

    public void setfecha(String fecha) {   //fecha
        this.fecha = fecha;
    }

    public String gefecha() {
        return fecha;
    }

    protected DatosUsuario(Long id, String nombre, String brand, String madein, float price) {
        super();
        this.id = id;
    }

    public void calcularImc() {
        if (altura >= 2.5 || altura <= 1.5 || peso <= 0) {
            this.setpeso(0);
            this.setaltura(0);
        } else if (Integer.parseInt(edad) <= 15) {
            this.setedad("0");
            this.setaltura(0);
            this.setpeso(0);
        } else {
            float estatu = (float) Math.pow(altura, 2);
            float resultado = peso / estatu;
            this.setIMC(resultado);
        }
    }

    public boolean registrar(String nombre, String apellido, String edad, String genero,
            float estatura, float peso, float IMC, String fecha, String password) {
        PreparedStatement pst = null;

        try {
            String consulta = "insert into registros(Nombre, Apellido, Edad, Genero, Estatura, Peso, IMC, Fecha, password) "
                    + "values (?,?,?,?,?,?,?,?,?)";

            pst = getconexion().prepareStatement(consulta);

            pst.setString(1, nombre);
            pst.setString(2, apellido);
            pst.setString(3, edad);
            pst.setString(4, genero);
            pst.setFloat(5, estatura);
            pst.setFloat(6, peso);
            pst.setFloat(7, IMC);
            pst.setString(8, fecha);
            pst.setString(9, password);

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("ERROR " + e);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
                if (pst != null) {
                    pst.close();
                }

            } catch (Exception e) {
                System.err.println("ERROR " + e);
            }
        }
        return false;

    }

    public boolean actualizarIMC(String nombre, float estatura, float peso, float IMC, String fecha) {
        PreparedStatement pst = null;
        try {
            String consulta = "UPDATE registros SET Estatura = ?, Peso = ?, IMC = ?, Fecha = ? WHERE Nombre = ?";
            pst = getconexion().prepareStatement(consulta);

            pst.setFloat(1, estatura);
            pst.setFloat(2, peso);
            pst.setFloat(3, IMC);
            pst.setString(4, fecha);
            pst.setString(5, nombre);

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("ERROR " + e);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
                if (pst != null) {
                    pst.close();
                }

            } catch (Exception e) {
                System.err.println("ERROR " + e);
            }
        }
        return false;

    }

    public boolean historialIMC(String nombre, float estatura, float peso, float IMC, String fecha) {
        PreparedStatement pst = null;
        try {
            String consulta = "INSERT INTO historial(Usuario,Altura,Peso,IMC,Fecha)"
                    + "values (?,?,?,?,?)";

            pst = getconexion().prepareStatement(consulta);

            pst.setString(1, nombre);
            pst.setFloat(2, estatura);
            pst.setFloat(3, peso);
            pst.setFloat(4, IMC);
            pst.setString(5, fecha);

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("ERROR " + e);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
                if (pst != null) {
                    pst.close();
                }

            } catch (Exception e) {
                System.err.println("ERROR " + e);
            }
        }
        return false;

    }

}
