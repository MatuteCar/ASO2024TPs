#!/bin/bash

# TP N 5 - Parte 1
# Adivinanza de un Numero Aleatorio

# Generacion de un numero aleatorio entre 1 y 100
numero_secreto=$((RANDOM % 100 + 1))

# Mensaje inicial

echo "Un numero aleatorio entre 1 y 100 fue generado. Intente adivinarlo:"
echo ""

# Inicializacion de variables
intentos=0
num_us=0

# Bucle para permitir multiples intentos
while true; do
    # Incrementar contador de intentos
    ((intentos++))

    # Solicitar y leer el intento del usuario
    read -p "Intento #$intentos: " num_us

    # Validar la entrada del usuario (numero entre 1 y 100)
    if ! [[ "$num_us" =~ ^[1-9][0-9]?$|^100$ ]]; then
        echo "Por favor ingrese un numero valido entre 1 y 100."
        continue
    fi

    # Comparar el intento del usuario con el numero secreto
    if [ "$num_us" -gt "$numero_secreto" ]; then
        echo "El numero ingresado es mayor que el numero secreto."
    elif [ "$num_us" -lt "$numero_secreto" ]; then
        echo "El numero ingresado es menor que el numero secreto."
    else
        # Si el usuario adivina el numero
        echo "Felicitaciones! Has adivinado el numero $numero_secreto en $intentos intentos!"
        break
    fi
done


