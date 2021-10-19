const db = require('../db');


class UserController {
    async createUser(req,res) {
        const {first_name, last_name} = req.body;
        const newPerson = await db.query(`INSERT INTO users (first_name, last_name) values ($1, $2) RETURNING *`, [first_name, last_name])
        res.json(newPerson.rows[0]);
    }

    async getUsers(req,res) {
        const users = await db.query('SELECT * FROM users');
        res.json(users.rows);
    }

    async getOneUser(req,res) {
        const id = req.params.id;
        const user = await db.query('SELECT * FROM users WHERE id = $1', [id]);
        res.json(user.rows[0]);        
    }

    async updateUser(req,res) {
        const {id, first_name, last_name} = req.body;
        const user = await db.query('UPDATE users set first_name = $1, last_name = $2 where id = $3 RETURNING *', [ first_name, last_name, id]);
        res.json(user.rows[0]);
    }

    async deleteUser(req,res) {
       
        const id = req.params.id;
        const user = await db.query('DELETE FROM users WHERE id = $1', [id]);
        res.json(user.rows[0]);  ;   
        
    }
}

module.exports = new UserController();
