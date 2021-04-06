const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors");
const express = require("express");
const app = express();

const firestore = admin.initializeApp().firestore();

function getCampos(sucesso, messagem, id, campos) {
    return {
        sucesso: sucesso,
        messagem: messagem,
        id: id,
        campos: campos
    }
}

app.use(cors({ origin: true }));

app.use(async (req, res, next) => {
    try {
        await firestore.collection("logs").add({ ip: req.ip, operacao: req.method });
        functions.logger.info("Sucesso");
    } catch (error) {
        functions.logger.error("Erro: " + error);
        next();
    }
    next();
});

app.post("/UPDATE_OR_CREATE", async function (req, res) {
    var utilizador = req.header("utilizador");
    var id = req.header("id");
    var enviados;
    var tipo = req.header("tipo");
    try {
        if (tipo.toLowerCase().equals("c")) {
            enviados = await firestore.collection(`convites/${utilizador}/enviados`).doc(id).add({ email: id, ativo: true });
        } else {
            enviados = await firestore.collection(`convites/${utilizador}/enviados`).doc(id).set({ ativo: false });
        }

        res.type("application/json").status(200).send(getCampos(true, "sucesso", "id", null));
        res.end();
    } catch (exception_update) {
        console.log(exception_update);
        return res.type('application/json')
            .status(500)
            .send('erro: ' + exception_update);
    }
});

app.delete("/DELETE", async function (req, res) {
    var utilizador = req.header("utilizador");
    var id = req.header("id");
    var enviados;
    try {
        enviados = await firestore.collection(`convites/${utilizador}/enviados`).doc(id).delete();
        res.type("application/json").status(200).send(getCampos(true, "sucesso", "id", null));
        res.end();
    } catch (exception_delete) {
        console.log(exception_delete);
        return res.type('application/json')
            .status(500)
            .send('erro: ' + exception_delete);
    }
});

app.get("/SELECT", async function (req, res) {

    var lista_links_enviados = new Array();

    var utilizador = req.header("utilizador");
    var id = req.header("id");
    var enviados;
    if (utilizador == null || utilizador.length == 0) {
        firestore.collection("convites").get().then(async (email) => {
            enviados = await firestore.collection("convites").doc(email.id).collection("enviados").get();
        });
    }
    else if (id != null && id.length > 0) {
        enviados = await firestore.collection(`convites/${utilizador}/enviados/${id}`).get();
    } else {
        enviados = await firestore.collection(`convites/${utilizador}/enviados`).get();
    }

    try {
        enviados.docs.forEach(function (link) {
            lista_links_enviados.push(new Array(link.id, link.data().ativo, link.data().email));
        });

        res.type("application/json").status(200).send(getCampos(true, "sucesso", "id", lista_links_enviados));
        res.end();

    } catch (exception_select) {
        console.log(exception_select);
        return res.type('application/json')
            .status(500)
            .send('erro: ' + exception_select);
    }

});


exports.convite = functions.https.onRequest(app);
