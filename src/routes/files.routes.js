import express from "express";
import { addArlFile, getArlFile } from "../controllers/files.controller.js";
import upload from "../middlewares/uploads.js";

const router = express.Router();

router.post("/api/add", upload.single('file'), addArlFile);
router.get("/api/get", getArlFile);

export default router;
