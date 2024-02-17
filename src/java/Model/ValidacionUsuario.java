package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sergio Trinidad
 */
public class ValidacionUsuario extends Conexion {

    public boolean autentificacion(String usuario, String contraseña) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT * from registros where Nombre= ? and password = ?";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();

            if (rs.next()) {
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
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.println("ERROR " + e);
            }
        }
        return false;
    }
}
