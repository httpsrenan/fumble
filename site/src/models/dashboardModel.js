var database = require("../database/config");

// Total de favoritos
function buscarTotalFavoritos() {
    var instrucaoSql = `select count(*) as total from favoritar`;
    return database.executar(instrucaoSql);
}

// Total de usuários
function buscarTotalUsuarios() {
    var instrucaoSql = `select count(*) as total from usuarios`;
    return database.executar(instrucaoSql);
}

// 10 times mais favoritados
function buscarTop10MaisFavoritados() {
    var instrucaoSql = `
        select t.nome, count(f.fk_time) as total_favoritos
        from favoritar f
        inner join times t on f.fk_time = t.id
        group by f.fk_time
        order by total_favoritos desc
        limit 10;
    `;
    return database.executar(instrucaoSql);
}

// 10 times menos favoritados (inclui os que não foram favoritados)
function buscarTop10MenosFavoritados() {
    var instrucaoSql = `
        select t.nome, count(f.fk_time) as total_favoritos
        from times t
        left join favoritar f on f.fk_time = t.id
        group by t.id
        order by total_favoritos asc
        limit 10;
    `;
    return database.executar(instrucaoSql);
}

// 5 usuários com mais favoritos
function buscarTop5UsuariosMaisFavoritaram() {
    var instrucaoSql = `
        select u.nome, count(f.fk_usuario) as total_favoritos
        from favoritar f
        inner join usuarios u on f.fk_usuario = u.id
        group by f.fk_usuario
        order by total_favoritos desc
        limit 5;
    `;
    return database.executar(instrucaoSql);
}

// Favoritos por conferência
function buscarFavoritosPorConferencia() {
    var instrucaoSql = `
        select c.conferencia, count(f.fk_time) as total_favoritos
        from favoritar f
        inner join times t on f.fk_time = t.id
        inner join divisao d on t.fk_divisao = d.id
        inner join conferencia c on d.fk_conferencia = c.id
        group by c.id;
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarTop10MaisFavoritados,
    buscarTop10MenosFavoritados,
    buscarTop5UsuariosMaisFavoritaram,
    buscarFavoritosPorConferencia,
    buscarTotalFavoritos,
    buscarTotalUsuarios
};