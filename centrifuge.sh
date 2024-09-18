#!/bin/bash

# Directorio de entrada
input_dir="/volumen1/sergio/TCruzi_Chronic/unmapped_reads"

# Directorio de salida
output_dir="/volumen1/sergio/TCruzi_Chronic/centrifuge_outputs"

# Base de datos de Centrifuge
db="p_compressed+h+v"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq en el directorio de entrada
for file in "$input_dir"/*.fastq; do
    # Obtiene el nombre base del archivo sin la ruta y sin la extensión .fastq
    filename=$(basename "$file" .fastq)
    
    # Ejecuta Centrifuge
    centrifuge -x "$db" -U "$file" --report-file "$output_dir/${filename}_report.txt" -S "$output_dir/${filename}_results.txt"
    
    # Mensaje para indicar que se ha procesado el archivo
    echo "Centrifuge completado para: $filename"
done

