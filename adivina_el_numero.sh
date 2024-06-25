#!/bin/bash

# Generar un número aleatorio entre 1 y 100
numero_aleatorio=$((RANDOM % 100 + 1))


echo "Un numero aleatorio entre 1 y 100 fue generado. Intente adivinarlo:"

# Iniciar el bucle para permitir múltiples intentos
while true; do
    read -p "Ingresa tu número: " intento

    # Validar si el intento es un número válido
    if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar un número entero."
        continue
    fi

    # Comparar el intento con el número secreto
    if [ "$intento" -eq "$numero_aleatorio" ]; then
        echo "¡Felicitaciones! Has adivinado el número secreto."
        break
    elif [ "$intento" -lt "$numero_aleatorio" ]; then
        echo "El número es más alto. Intenta nuevamente."
    else
        echo "El número es más bajo. Intenta nuevamente."
    fi
done
