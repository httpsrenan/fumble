var database = require("../database/config");

function inserirFavorito(idUsuario, idTime) {
  var instrucaoSql = `
    insert into favoritar (fk_usuario, fk_time) values (${idUsuario}, ${idTime});
  `;
  return database.executar(instrucaoSql);
}

function removerFavorito(idUsuario, idTime) {
  var instrucaoSql = `
    delete from favoritar where fk_usuario = ${idUsuario} and fk_time = ${idTime};
  `;
  return database.executar(instrucaoSql);
}

function verificarFavorito(idUsuario, idTime) {
    var instrucaoSql = `
        select * from favoritar
        where fk_usuario = ${idUsuario} and fk_time = ${idTime};
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
  inserirFavorito,
  removerFavorito,
  verificarFavorito
};