# Reserva-de-canchas
Sistema de reservas para centros deportivos

---

## Cómo clonar y compilar el proyecto desde cero
Al descargar el repositorio de GitHub, el proyecto no vendrá con las dependencias instaladas ni con los archivos ocultos de compilación (lo cual es correcto para mantener el repositorio ligero).

Para volverlo a la vida y compilarlo para la Web, los pasos exactos son estos:

### 1. Clonar el repositorio
```bash
git clone TU_URL_DE_GITHUB_AQUÍ.git
```
### 2. Descargar las dependencias de Flutter (Paso indispensable)
Este comando lee el archivo pubspec.yaml y descarga todo lo necesario para que el proyecto funcione:

```bash
flutter pub get
```
### 3. Compilar / Ejecutar para desarrollo Web
Una vez que las dependencias terminan de descargarse, se lanza el proyecto en el servidor local con el siguiente comando:

```bash
flutter run -d web-server --web-port=8080
```
