#!/bin/bash

# Directorios de entrada y salida
input_dir="/volumen1/sergio/TCruzi_Chronic/porechop"
output_dir="/volumen1/sergio/TCruzi_Chronic/unmapped_reads"

# Archivo de referencia
ref_genome="GCF_000001635.27_GRCm39_genomic.fna"

# Crea el directorio de salida si no existe
mkdir -p "$output_dir"

# Recorre todos los archivos .fastq en el directorio de entrada
for file in "$input_dir"/*.fastq; do
  # Obtiene el nombre base del archivo sin la ruta
  filename=$(basename "$file" .fastq)

  # Ejecuta minimap2, pipelining directamente hacia samtools para evitar generar un archivo .sam intermedio
  minimap2 -ax map-ont "$ref_genome" "$file" | samtools view -f 4 -b | samtools fastq - > "$output_dir/${filename}_unmapped.fastq"

  echo "Lecturas no mapeadas guardadas en: ${filename}_unmapped.fastq"
done

