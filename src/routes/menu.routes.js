import { Router } from "express";
import { getUsersCount } from "../controllers/menu.controller.js";
import { verifyToken } from "../middlewares/jwt.validador.js";

const router = Router();

router.get("/api/userscount", verifyToken, getUsersCount);

export default router;
