#!/bin/bash

# Generar un numero aleatorio entre 1 y 100
numero_aleatorio=$((RANDOM % 100 + 1))


echo "Un numero aleatorio entre 1 y 100 fue generado. Intente adivinarlo:"

# Iniciar el bucle para permitir multiples intentos
while true; do
    read -p "Ingresa tu numero: " intento

    # Validar si el intento es un numero valido
    if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar un numero entero."
        continue
    fi

    # Comparar el intento con el numero secreto
    if [ "$intento" -eq "$numero_aleatorio" ]; then
        echo "¡Felicitaciones! Has adivinado el numero secreto."
        break
    elif [ "$intento" -lt "$numero_aleatorio" ]; then
        echo "El numero es más alto. Intenta nuevamente."
    else
        echo "El numero es más bajo. Intenta nuevamente."
    fi
done
