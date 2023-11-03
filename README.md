La aplicación consta de dos pantallas: una pantalla de inicio y una pantalla de detalles.

Pantalla de inicio:
- Un textfield que permite filtrar la lista por nombre.
- Una lista de inicialmente 10 personas con un scroll infinito que solicita 10 nuevas personas cuando llega al final.
- Un botón de refrescar la lista.
- Al presionar una tarjeta, navega a la pantalla de detalles.

Pantalla de detalles:
- Cabecera con una imagen, nombre, edad y género de la persona.
- Tres tarjetas:
    - Una tarjeta con la ubicación que abre un mapa y coloca un marcador en las coordenadas proporcionadas por la API.
    - Una tarjeta con el correo electrónico, al presionarla se copia el correo al portapapeles.
    - Una tarjeta con el número de teléfono, que al presionarla abre la aplicación de móvil y escribe el número (solo en dispositivos físicos).