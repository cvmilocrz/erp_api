import pg from 'pg';
import { dbSettings } from '../config/config.js';

const { Client } = pg;

//funcion para realizar el connection pool
export const getConnection = async () => {
  const client = new Client(dbSettings);
  
  try {
    await client.connect();
    return client;
  } catch (error) {
    console.error('Error conectando a la DB:', error);
    throw error;
  }
};