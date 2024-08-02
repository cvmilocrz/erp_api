export const queries = {
    menu: {
        countUsers: 'SELECT COUNT(*) FROM users',
    },
    users: {
        getUsers: 'SELECT * FROM users',
        getUsersById: 'SELECT * FROM users WHERE id = $1',
        createUsers: `INSERT INTO users (name, cargo, email, phone, departament, rol, permissions, user_status, user_password) 
                      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
        deleteUsers: 'DELETE FROM users WHERE id = $1',
        updateUsers: `UPDATE users SET 
                        name = $1, cargo = $2, email = $3, phone = $4, departament = $5, 
                        rol = $6, permissions = $7, user_status = $8, user_password = $9 
                      WHERE id = $10`,
    },
    clients: {},
    humanResources: {},
    contability: {},
    financial: {},
    inventory: {},
    sales: {},
    marketing: {},
    procurement: {},
};
