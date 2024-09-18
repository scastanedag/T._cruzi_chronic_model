#!/bin/bash

# Directorio de entrada con los archivos .fastq
input_dir="/volumen1/sergio/TCruzi_Chronic/unmapped_reads"

# Directorio de salida para los ensamblados de Flye
output_dir="/volumen1/sergio/TCruzi_Chronic/flye_outputs"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq en el directorio de entrada
for file in "$input_dir"/*.fastq; do
    # Obtiene el nombre base del archivo sin la ruta y sin la extensión .fastq
    filename=$(basename "$file" .fastq)
    
    # Crea un subdirectorio para cada muestra con el nombre original
    sample_output_dir="$output_dir/${filename}_flye_output"
    
    # Ejecuta Flye para ensamblar la muestra
    flye --nano-corr "$file" --out-dir "$sample_output_dir"
    
    # Mensaje para indicar que se ha procesado el archivo
    echo "Flye completado para: $filename"
done

