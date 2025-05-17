var express = require("express");
var router = express.Router();
var dashboardController = require("../controllers/dashboardController");

router.get("/mais-favoritados", dashboardController.getTop10MaisFavoritados);

router.get("/menos-favoritados", dashboardController.getTop10MenosFavoritados);

router.get("/usuarios-mais-favoritaram", dashboardController.getTop5UsuariosMaisFavoritaram);

router.get("/favoritos-por-conferencia", dashboardController.getFavoritosPorConferencia);

module.exports = router;