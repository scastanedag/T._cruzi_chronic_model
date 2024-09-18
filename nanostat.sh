#!/bin/bash

# Directorio que contiene los archivos .fastq.gz
input_dir="/volumen1/sergio/TCruzi_Chronic/ALL"

# Directorio de salida para los reportes
output_dir="/volumen1/sergio/TCruzi_Chronic/statreports"

# Crea el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq.gz en el directorio de entrada
for file in "$input_dir"/*.fastq.gz; do
  # Obtiene el nombre base del archivo sin la ruta
  filename=$(basename "$file")
  
  # Ejecuta NanoStat y genera el reporte de salida con el nombre original del archivo
  NanoStat --fastq "$file" --outdir "$output_dir" --name "${filename%.fastq.gz}_report"
  
  echo "Reporte generado para $filename"
done
