#!/bin/bash

echo "Ingrese un nombre para ver su edad estimada: "
read nombre

# Llamada a la API Agify para obtener la edad estimada
api=$(curl -s "https://api.agify.io/?name=${nombre}")

# Extraer la edad del resultado JSON usando jq
edad=$(echo "$api" | jq -r '.age')

# Verificar si se encontró una edad válida
if [ "$edad" = "null" ]; then
    echo "No se ingresó un nombre válido o no se encontró información."
else
    echo "La edad estimada para $nombre es $edad años."
fi
