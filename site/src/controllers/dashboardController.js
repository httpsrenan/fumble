var dashboardModel = require("../models/dashboardModel");

function getTotalFavoritos(req, res) {
    dashboardModel.buscarTotalFavoritos()
        .then(resultado => res.json(resultado[0]))
        .catch(erro => res.status(500).json(erro.sqlMessage));
}

function getTotalUsuarios(req, res) {
    dashboardModel.buscarTotalUsuarios()
        .then(resultado => res.json(resultado[0]))
        .catch(erro => res.status(500).json(erro.sqlMessage));
}

function getTop10MaisFavoritados(req, res) {
    dashboardModel.buscarTop10MaisFavoritados()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao buscar top 10 mais favoritados:", erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function getTop10MenosFavoritados(req, res) {
    dashboardModel.buscarTop10MenosFavoritados()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao buscar top 10 menos favoritados:", erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function getTop5UsuariosMaisFavoritaram(req, res) {
    dashboardModel.buscarTop5UsuariosMaisFavoritaram()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao buscar top 5 usuários:", erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function getFavoritosPorConferencia(req, res) {
    dashboardModel.buscarFavoritosPorConferencia()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao buscar favoritos por conferência:", erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    getTop10MaisFavoritados,
    getTop10MenosFavoritados,
    getTop5UsuariosMaisFavoritaram,
    getFavoritosPorConferencia,
    getTotalFavoritos,
    getTotalUsuarios
};