import bcrypt from "bcrypt";
import { getConnection } from "../database/connection.js";
import { userQueries } from "../database/queries.interface.js";
/* TODO: implementar un usuario en la tabla de usuarios */
export const login = async (req, res) => {
  const { user, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({
      msg: "Por favor proporciona un correo electrónico y una contraseña válidas.",
    });
  }

  try {
    const client = await getConnection();
    const result = await client.query(userQueries.getUsersByEmail, [email]);
    await client.end();
    if (result.rows.length > 0) {
      const user = result.rows[0];
      const passwordMatch = await bcrypt.compare(password, user.user_password);
      if (passwordMatch) {
        const token = await jwt.sign(
          {
            id: user.id,
            name: user.name,
            email: user.email,
            rol: user.rol,
            permissions: user.permissions,
          },
          API_KEY
        );
        return res.status(200).json({
          token: token,
          user: {
            id: user.id,
            name: user.name,
            email: user.email,
            rol: user.rol,
            permissions: user.permissions,
          },
        });
      } else {
        return res.status(401).json({
          msg: "Correo electrónico o contraseña incorrectos.",
        });
      }
    } else {
      return res.status(404).json({
        msg: "Usuario no encontrado.",
      });
    }
  } catch (error) {
    console.error("Error al validar usuario:", error);
    return res.status(500).json({
      msg: "Error interno del servidor.",
    });
  }
};
