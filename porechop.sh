#!/bin/bash

# Directorios de entrada y salida
input_dir="/volumen1/sergio/TCruzi_Chronic/filtered_outputs"
output_dir="/volumen1/sergio/TCruzi_Chronic/porechop"

# Crea el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq en el directorio de entrada
for file in "$input_dir"/*.fastq; do
  # Obtiene el nombre base del archivo sin la ruta
  filename=$(basename "$file" .fastq)

  # Ejecuta porechop y guarda el archivo de salida en el directorio de salida
  porechop -i "$file" -o "$output_dir/${filename}_porechopped.fastq"
  
  echo "Archivo procesado con porechop: ${filename}_porechopped.fastq"
done

