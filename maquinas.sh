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
echo "4. Vulnhub"
echo "5. Otra"

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
    4)
        plataforma="Vulhub"
        ;;
    5)
        echo "Ingrese el nombre de la plataforma:"
        read plataforma
        ;;
    *)
        echo "Opción no válida..."
        ;;
esac

echo "Seleccione la carpeta para guardar el archivo:"
echo "1. Documentos"
echo "2. Otra carpeta"

read -p "Ingrese el número correspondiente a la carpeta: " carpeta_opcion

if [ "$carpeta_opcion" == "1" ]; then
    base_dir="$HOME/Documentos"
elif [ "$carpeta_opcion" == "2" ]; then
    echo "Ingrese la ruta completa de la carpeta:"
    read base_dir
else
    echo "Opción no válida..."
fi

ubicacion="$base_dir/$plataforma/$maquina"

if [ ! -d "$ubicacion" ]; then
    mkdir -p "$ubicacion"
    echo "Se ha creado la carpeta para la máquina $maquina en $ubicacion."
fi

if [ -e "$archivo" ]; then
    mv "$archivo" "$ubicacion"
    echo "El archivo $archivo ha sido movido a $ubicacion."
else
    echo "El archivo $archivo no existe."
fi




