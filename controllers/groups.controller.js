const db = require('../db');


class GroupsController {
    async createGroup(req,res) {
        const {group_name} = req.body;
        const newGroup = await db.query(`INSERT INTO groups (group_name) values ($1) RETURNING *`, [group_name])
        res.json(newGroup.rows[0]);
    }

    async getGroups(req,res) {
        const groups = await db.query('SELECT * FROM groups');
        res.json(groups.rows);
    }

    async getOneGroup(req,res) {
        const id = req.params.id;
        const user = await db.query('SELECT * FROM users WHERE id = $1', [id]);
        res.json(user.rows[0]);        
    }

    async updateGroup(req,res) {
        const {id, first_name, last_name} = req.body;
        const user = await db.query('UPDATE users set first_name = $1, last_name = $2 where id = $3 RETURNING *', [ first_name, last_name, id]);
        res.json(user.rows[0]);
    }

    async getUsersInGroup(req,res) {
        const id = req.params.id;
        const user = await db.query('SELECT * FROM users WHERE id = $1', [id]);
        res.json(user.rows[0]);        
    }

    async deleteGroup(req,res) {
       
        const id = req.params.id;
        const user = await db.query('DELETE FROM users WHERE id = $1', [id]);
        res.json(user.rows[0]);  ;   
        
    }
}

module.exports = new GroupsController();