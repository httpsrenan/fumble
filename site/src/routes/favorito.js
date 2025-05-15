var express = require("express");
var router = express.Router();
var favoritoController = require("../controllers/favoritoController");

router.post("/atualizar", function (req, res) {
    favoritoController.atualizarFavorito(req, res);
});

router.get("/verificar/:idUsuario/:idTime", function (req, res) {
    favoritoController.verificarFavorito(req, res);
});

module.exports = router;