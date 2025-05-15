var database = require("../database/config");

function inserirFavorito(idUsuario, idTime) {
  var instrucaoSql = `
    INSERT INTO favoritar (fk_usuario, fk_time) VALUES (${idUsuario}, ${idTime});
  `;
  return database.executar(instrucaoSql);
}

function removerFavorito(idUsuario, idTime) {
  var instrucaoSql = `
    DELETE FROM favoritar WHERE fk_usuario = ${idUsuario} AND fk_time = ${idTime};
  `;
  return database.executar(instrucaoSql);
}

function verificarFavorito(idUsuario, idTime) {
    var instrucaoSql = `
        SELECT * FROM favoritar
        WHERE fk_usuario = ${idUsuario} AND fk_time = ${idTime};
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
  inserirFavorito,
  removerFavorito,
  verificarFavorito
};