var database = require("../database/config");

// 10 times mais favoritados
function buscarTop10MaisFavoritados() {
    var instrucaoSql = `
        SELECT t.nome, COUNT(f.fk_time) AS total_favoritos
        FROM favoritar f
        JOIN times t ON f.fk_time = t.id
        GROUP BY f.fk_time
        ORDER BY total_favoritos DESC
        LIMIT 10;
    `;
    return database.executar(instrucaoSql);
}

// 10 times menos favoritados (inclui os que não foram favoritados)
function buscarTop10MenosFavoritados() {
    var instrucaoSql = `
        SELECT t.nome, COUNT(f.fk_time) AS total_favoritos
        FROM times t
        LEFT JOIN favoritar f ON f.fk_time = t.id
        GROUP BY t.id
        ORDER BY total_favoritos ASC
        LIMIT 10;
    `;
    return database.executar(instrucaoSql);
}

// 5 usuários com mais favoritos
function buscarTop5UsuariosMaisFavoritaram() {
    var instrucaoSql = `
        SELECT u.nome, COUNT(f.fk_usuario) AS total_favoritos
        FROM favoritar f
        JOIN usuarios u ON f.fk_usuario = u.id
        GROUP BY f.fk_usuario
        ORDER BY total_favoritos DESC
        LIMIT 5;
    `;
    return database.executar(instrucaoSql);
}

// Favoritos por conferência
function buscarFavoritosPorConferencia() {
    var instrucaoSql = `
        SELECT c.conferencia, COUNT(f.fk_time) AS total_favoritos
        FROM favoritar f
        JOIN times t ON f.fk_time = t.id
        JOIN divisao d ON t.fk_divisao = d.id
        JOIN conferencia c ON d.fk_conferencia = c.id
        GROUP BY c.id;
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarTop10MaisFavoritados,
    buscarTop10MenosFavoritados,
    buscarTop5UsuariosMaisFavoritaram,
    buscarFavoritosPorConferencia
};