import { getConnection } from "../database/connection.js";
import fs from "fs";
import path from "path";


//
export const addArlFile = async (req, res) => {
  const { file_name, validated_status, employee_id } = req.body;
  const doc_file = req.file;


  if (!file_name || !doc_file || validated_status === undefined || !employee_id) {
    return res.status(400).json({ error: "Faltan datos requeridos" });
  }

  try {
    const filePath = path.resolve(doc_file.path); // Ruta absoluta al archivo
    console.log(`Leyendo archivo desde: ${filePath}`);
    
    const fileBuffer = fs.readFileSync(filePath);
    
    const client = await getConnection();
    console.log("Conexión a la base de datos establecida");
    
    const result = await client.query(
      "INSERT INTO arl_afiliation (file_name, doc_file, validated_status, employee_id) VALUES ($1, $2, $3, $4)",
      [file_name, fileBuffer, validated_status, employee_id]
    );
    console.log("Archivo insertado en la base de datos");

    fs.unlinkSync(filePath); // Elimina el archivo después de leerlo
    console.log(`Archivo eliminado: ${filePath}`);

    await client.end();
    res.status(200).json({ msg: "Archivo subido correctamente" });
  } catch (error) {
    console.error("Error al subir archivo:", error);
    res.status(500).json({ error: "Error al subir archivo" });
  }
};

export const getArlFile = async (req, res) => {
  const { employee_id } = req.query;

  if (!employee_id) {
    return res.status(400).json({ error: "Falta el id de usuario" });
  }

  try {
    const client = await getConnection();
    const result = await client.query("SELECT * FROM arl_afiliation WHERE employee_id = $1", [employee_id]);
    
    if (result.rows.length === 0) {
      await client.end();
      return res.status(404).json({ error: "No se encontró el archivo" });
    }

    const fileRow = result.rows[0];
    const fileBuffer = fileRow.doc_file;

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `attachment; filename=${fileRow.file_name}`);
    res.send(fileBuffer);

    await client.end();
  } catch (error) {
    console.error("Error al obtener los archivos", error);
    res.status(500).json({ error: "Error al obtener los archivos" });
  }
};

