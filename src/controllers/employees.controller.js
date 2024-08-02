import { getConnection } from "../database/connection.js";
import { queries } from "../database/queries.interface.js"; // Asegúrate de que esta ruta sea correcta

export const employees = async (req, res) => {
  try {
    const client = await getConnection();
    const result = await client.query(queries.users.getUsers); // Usamos la query definida
    res.status(200).json(result.rows);
    await client.end();
  } catch (error) {
    console.error("Error al obtener todos los usuarios", error);
    res.status(500).json({ error: "Error al obtener los usuarios" });
  }
};