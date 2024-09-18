#!/bin/bash


# Iterar sobre las carpetas barcode01 a barcode99
for barcode_dir in barcode{01..99}; do
    if [ -d "$barcode_dir" ]; then  # Verificar si la carpeta existe
        echo "Procesando archivos en la carpeta $barcode_dir..."
        cd "$barcode_dir" || exit 1  # Cambiar al directorio de la carpeta barcode

        # Combinar archivos .fastq.gz en un solo archivo comprimido
        start_time=$(date +%s)
        echo "Combinando archivos .fastq.gz en merged_plate_1_$barcode_dir.fastq.gz..."
        zcat *.fastq.gz | gzip > merged_plate_1_"$barcode_dir".fastq.gz
        end_time=$(date +%s)
        elapsed_time=$((end_time - start_time))
        echo "Combinación completada en $elapsed_time segundos."

        # Mover el archivo combinado a la carpeta ALL
        echo "Moviendo merged_plate_1_$barcode_dir.fastq.gz a la carpeta ALL..."
        mv merged_plate_1_"$barcode_dir".fastq.gz /sc/arion/projects/MML/mice_tcruzi/ALL/
        
        echo "Archivos en la carpeta $barcode_dir combinados y movidos a la carpeta ALL"
        
        cd ..  # Regresar al directorio padre
    else
        echo "La carpeta $barcode_dir no existe."
    fi
done
