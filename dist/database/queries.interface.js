"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.userQueries = exports.salesQueires = exports.procurement = exports.menuQueries = exports.marketingQueries = exports.inventoryQueries = exports.humanReourcesQueries = exports.financialQueries = exports.contabilityQueries = exports.clientsQueries = void 0;
var menuQueries = exports.menuQueries = {
  countUsers: 'SELECT COUNT(*) FROM users'
};
var userQueries = exports.userQueries = {
  getUsers: 'SELECT * FROM users',
  getUsersById: 'SELECT * FROM users WHERE id = $1',
  createUsers: 'INSERT INTO users (name, cargo, email, phone, departament, rol, permissions, user_status, user_password) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',
  deleteUsers: 'DELETE FROM users WHERE id = $1',
  updateUsers: 'UPDATE users SET name = $1, cargo = $2, email = $3, phone = $4, departament = $5, rol = $6, permissions = $7, user_status = $8, user_password = $9 WHERE id = $10'
};
var clientsQueries = exports.clientsQueries = {};
var humanReourcesQueries = exports.humanReourcesQueries = {};
var contabilityQueries = exports.contabilityQueries = {};
var financialQueries = exports.financialQueries = {};
var inventoryQueries = exports.inventoryQueries = {};
var salesQueires = exports.salesQueires = {};
var marketingQueries = exports.marketingQueries = {};
var procurement = exports.procurement = {};