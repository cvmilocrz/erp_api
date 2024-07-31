import { Router } from 'express';
import { employees } from '../controllers/employees.controller.js';

const router = Router();

router.get('/api/employees', employees);

export default router;