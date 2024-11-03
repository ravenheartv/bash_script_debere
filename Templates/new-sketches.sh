#!/bin/bash

# Crea la carpeta principal p5 y navega a ella
mkdir -p p5
cd p5

# Crea el archivo index.html en la carpeta p5 (sobreescribiendo el existente si lo hay)
echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>p5 Sketches</title>
  </head>
  <body>
    <h1>Bienvenido a p5 Sketches</h1>
    <p>Haz clic en un sketch para abrirlo:</p>
    <ul>' > index.html

# Crea la carpeta sketches si no existe y navega a ella
mkdir -p sketches
cd sketches

# Encuentra el número del último sketch creado
last_num=$(ls sketch-*.html 2>/dev/null | grep -o -E '[0-9]+' | sort -n | tail -1)
if [ -z "$last_num" ]; then
  new_num=0
else
  new_num=$((last_num + 1))
fi

# Crea el nuevo archivo HTML de sketch con el siguiente número disponible
echo '<!DOCTYPE html>
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
    <script src="sketch-'$new_num'.js"></script>
  </body>
</html>' > sketch-$new_num.html

# Crea el archivo JavaScript correspondiente para el nuevo sketch
echo 'function setup() {
  createCanvas(400, 400);
  background(220); 
}

function draw() {
  fill(0); 
  ellipse(mouseX, mouseY, 10, 10); 
}' > sketch-$new_num.js

# Regresa a la carpeta p5 para actualizar el archivo index.html
cd ..

# Actualiza index.html agregando enlaces a cada sketch
for file in sketches/sketch-*.html; do
  file_name=$(basename "$file")
  echo "      <li><a href=\"sketches/$file_name\">$file_name</a></li>" >> index.html
done

# Cierra las etiquetas de index.html
echo '    </ul>
  </body>
</html>' >> index.html