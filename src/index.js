import express from 'express'
import morgan from 'morgan'
import cors from 'cors'
import { PORT } from './config/config.js'

//Configuración del servidor
const app = express();

//importación de las rutas
import userRoutes from '../src/routes/users.routes.js'
import menuRoutes from '../src/routes/menu.routes.js'
import employeesRoutes from '../src/routes/employees.routes.js'
import fileRoutes from '../src/routes/files.routes.js'

//Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());


//Rutas
app.use(userRoutes);
app.use(menuRoutes);
app.use(employeesRoutes);
app.use(fileRoutes);

//configuración del servidor
app.get('/', (req, res) => {
  res.render(process.cwd() + '/web/index.ejs')
});

const server = app.listen(PORT, () => {
  const host = `http://localhost:${PORT}`;
  console.log(`Servidor corriendo en: ${host}`);
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Error interno del servidor');
});

process.on('SIGINT', () => {
  server.close(() => {
      console.log('Servidor cerrado correctamente');
      process.exit(0);
  });
});

