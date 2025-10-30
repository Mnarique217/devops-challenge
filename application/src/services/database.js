class Database {

    constructor() {
    }

    checkConnection() {
        let x = Math.floor((Math.random() * 100) + 1);
        return x > 98 ? false : true
    }
}
module.exports = Database