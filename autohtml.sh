#!/bin/bash

# Crear la carpeta "p5" (si no existe)
mkdir -p p5
cd p5

# Crear el archivo HTML dentro de la carpeta "p5"
cat <<EOL > p5/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.10.0/p5.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.10.0/addons/p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="utf-8" />

  </head>
  <body>
    <main>
    </main>
    <script src="sketch.js"></script>
  </body>
</html>

EOL

cat <<EOL > p5/sketch.js
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(220);
}
EOL

echo "Archivo HTML 'p5/index.html' 'p5/sketch.js' creado con éxito."

python3 -m http.server 8000