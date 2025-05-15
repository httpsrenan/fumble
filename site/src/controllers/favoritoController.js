var favoritoModel = require("../models/favoritoModel");

function atualizarFavorito(req, res) {
    var { idUsuario, idTime, favoritar } = req.body;

    if (favoritar) {
        favoritoModel.inserirFavorito(idUsuario, idTime)
            .then(() => res.json("Time favoritado com sucesso"))
            .catch(err => res.status(500).json(err));
    } else {
        favoritoModel.removerFavorito(idUsuario, idTime)
            .then(() => res.json("Time desfavoritado com sucesso"))
            .catch(err => {
                console.error("Erro no favorito:", err);
                res.status(500).json(err.message || err);
            });;
    }
}

function verificarFavorito(req, res) {
    var idUsuario = req.params.idUsuario;
    var idTime = req.params.idTime;

    favoritoModel.verificarFavorito(idUsuario, idTime)
        .then(resultado => {
            if (resultado.length > 0) {
                res.json({ favoritado: true });
            } else {
                res.json({ favoritado: false });
            }
        }).catch(erro => {
            console.error("Erro ao verificar favorito:", erro.sqlMessage);
            res.status(500).json({ erro: erro.sqlMessage });
        });
}

module.exports = {
    atualizarFavorito,
    verificarFavorito
};