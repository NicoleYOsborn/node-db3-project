const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep
}

function find() {
    return db('schemes')
}

function findById(id){
    return db('schemes')
    .where({id})
    .first();
}

function findSteps(id) {
    return db('steps as st')
    .join('schemes as sc', 'st.scheme_id', "sc.id")
    .select('st.step_number', "sc.scheme_name", "st.instructions")
    .where({scheme_id: id});
}

function add(scheme) {
    return db('schemes').insert(scheme)
        .then(ids =>{
            return findById(ids[0]);
        });
}

function update(changes, id) {
    return db("schemes")
        .where({ id })
        .update(changes)
        .then(count =>{
            return findById(id);
        })
}

function remove(id) {
    return db('schemes')
    .where({ id })
    .del();
}

function addStep(step, scheme_id) {
    step.scheme_id = scheme_id;
    return db('steps')
    .insert(step);
}