import { API_KEY } from "../config/config.js";
import jwt from 'jsonwebtoken';

export const verifyToken = (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(403).json({
      atención: "Acceso no autorizado"
    });
  }

  jwt.verify(token, API_KEY, (err, decoded) => {
    if (err) {
      return res.status(401).json({
        message: "No Autorizado"
      });
    }

    req.user = decoded;
    next();
  });
};
