#!/bin/bash

# Directorio que contiene los archivos .fastq.gz
input_dir="/volumen1/sergio/TCruzi_Chronic/ALL"

# Crea el directorio de salida si no existe
output_dir="/volumen1/sergio/TCruzi_Chronic/filtered_outputs"
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq.gz en el directorio de entrada
for file in "$input_dir"/*.fastq.gz; do
  # Obtiene el nombre base del archivo sin la ruta
  filename=$(basename "$file" .fastq.gz)

  # Ejecuta filtlong y genera el archivo de salida con el prefijo 'filtered_'
  filtlong --min_length 1000 --min_mean_q 10 "$file" > "$output_dir/filtered_${filename}.fastq"
  
  echo "Archivo filtrado generado: filtered_${filename}.fastq"
done

