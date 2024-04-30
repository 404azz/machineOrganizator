#!/bin/bash

cowthink -f tux "Puedes visitar mi blog en https://404azz.github.io"

echo "Nombre del archivo: "
read archivo

echo "Nombre de la máquina: "
read maquina

echo "Seleccione la plataforma: "
echo "1. HTB"
echo "2. Docker"
echo "3. Vulnyx"

read -p "Ingrese el número correspondiente a la plataforma: " opcion

case $opcion in
    1)
        plataforma="HTB"
        ;;
    2)
        plataforma="Docker"
        ;;
    3)
        plataforma="Vulnyx"
        ;;
    *)
        echo "Opción no válida. Saliendo del script."
        exit 1
        ;;
esac

if [ -d "$HOME/Documentos" ]; then
    base_dir="$HOME/Documentos"
elif [ -d "$HOME/Documents" ]; then
    base_dir="$HOME/Documents"
else
    echo "No se encontró la carpeta /Documentos o /Documents. Saliendo del script."
    exit 1
fi

ubicacion="$base_dir/$plataforma/$maquina"

if [ ! -d "$ubicacion" ]; then
    mkdir -p "$ubicacion"
    echo "Se ha creado la carpeta para la maquina $maquina en $ubicacion."
fi

if [ -e "$archivo" ]; then
    mv "$archivo" "$ubicacion"
    echo "El archivo $archivo ha sido movido a $ubicacion."
else
    echo "El archivo $archivo no existe."
fi
