# Usar la imagen oficial de SWI-Prolog
FROM swipl:latest

# Crear directorio de trabajo
WORKDIR /app

# Copiar los 3 archivos del proyecto al contenedor
COPY Proyecto.pl Interfaz.html logo.png ./

# Ejecutar el servidor automáticamente al encender la máquina
CMD ["swipl", "-g", "arrancar", "-t", "halt", "Proyecto.pl"]
