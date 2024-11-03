#!/bin/bash

# Crea la carpeta del proyecto
mkdir express-app
cd express-app

# Inicializa un proyecto Node.js
npm init -y

# Instala Express
npm install express

echo 'node_modules/' > .gitignore

# Crea el archivo principal del servidor
echo 'const express = require("express");
const app = express();
const port = 3000;

// Endpoint principal
app.get("/", (req, res) => {
  res.send("¡Tamo aqui de nuevo en express!");
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
' > server.js


