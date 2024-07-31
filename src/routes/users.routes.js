import { Router } from 'express';
import { getUsers, getUsersById, createUsers, deleteUsers, updateUsers } from '../controllers/users.controller.js';

const router = Router();

router.get('/api/users', getUsers);
router.get('/api/usersbyid/:id', getUsersById);
router.post('/api/createusers', createUsers);
router.put('/api/updateusers/:id', updateUsers);
router.delete('/api/deleteusers/:id', deleteUsers);

export default router