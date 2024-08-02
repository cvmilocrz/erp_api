import { getConnection } from "../database/connection.js";
import { queries } from "../database/queries.interface.js"; // Asegúrate de que esta ruta sea correcta

export const getUsersCount = async (req, res) => {
  try {
    const client = await getConnection();
    const result = await client.query(queries.menu.countUsers);
    res.status(200).json({ count: result.rows[0].count }); // Enviar la respuesta como un objeto JSON
    await client.end();
  } catch (error) {
    console.error("Error al obtener el conteo de usuarios", error);
    res.status(500).json({ error: "Error al obtener el conteo de usuarios" });
  }
};
