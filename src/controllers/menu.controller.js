import { getConnection } from "../database/connection.js";
import { menuQueries } from "../database/queries.interface.js";

export const getUsersCount = async (req, res) => {
  try {
    const client = await getConnection();
    const result = await client.query(menuQueries.countUsers);
    res.status(200).json(result.rows[0].count);
    await client.end();
  } catch (error) {
    console.error("Error a obtener todos los usuarios", error);
    res.status(500).json({ error: "Error al obtener los usuarios" });
  }
};
