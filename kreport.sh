#!/bin/bash

# Directorio de entrada donde están los archivos results.txt
input_dir="/volumen1/sergio/TCruzi_Chronic/centrifuge_outputs"

# Directorio de salida para los archivos kreport.txt
output_dir="/volumen1/sergio/TCruzi_Chronic/kraken_reports_format"

# Base de datos de Centrifuge
db="p_compressed+h+v"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos *_results.txt en el directorio de entrada
for file in "$input_dir"/*_results.txt; do
    # Obtiene el nombre base del archivo sin la ruta y sin la extensión _results.txt
    filename=$(basename "$file" _results.txt)
    
    # Ejecuta centrifuge-kreport para generar el archivo kreport.txt
    centrifuge-kreport -x "$db" "$file" > "$output_dir/${filename}_kreport.txt"
    
    # Mensaje para indicar que se ha procesado el archivo
    echo "Kreport generado para: $filename"
done

