# UpNext Mobile

Este proyecto es una aplicación desarrollada en **Flutter**, compatible tanto con **dispositivos móviles Android** como con **Web**. Aquí encontrarás instrucciones detalladas para ejecutar la app, generar APKs y trabajar con el proyecto.

---

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

- [Flutter](https://flutter.dev/docs/get-started/install) (versión estable)
- [Android Studio](https://developer.android.com/studio) con el SDK de Android
- [Visual Studio Code](https://code.visualstudio.com/) (opcional)
- Para desarrollo web: Chrome u otro navegador compatible

Verifica tu entorno con:

```bash
flutter doctor
```

Debe mostrar que Flutter y la toolchain de Android están listos.

---

## Clonar el proyecto

```bash
git clone https://github.com/marianadiaz179/UX_UpNext.git

cd UX_UpNext
```

---

## Instalar dependencias

Dentro de la raíz del proyecto, ejecuta:

```bash
flutter pub get
```

Esto instalará todas las dependencias necesarias.

---

## Ejecutar en móvil (Android)

Conecta un dispositivo o inicia un emulador con android studio y luego ejecuta:

```bash
flutter run
```

---

## Ejecutar en web

Si la carpeta web no existe o quieres regenerarla, primero crea los archivos base:

```bash
flutter create .
```

Luego ejecuta la aplicación en el navegador:

```bash
flutter run -d chrome
```

Y esto abrira en un puerto de tu maquina local desplegada la aplicación para sus pruebas, se puede realizar lo mismo con otro navegador, el ejemplo de arriba es para chrome.

---

## Generar APK

```bash
flutter build apk --release
```

Por defecto, Flutter generará el APK en:

```bash
build/app/outputs/flutter-apk/app-release.apk
```

Para esta entrega, el apk generado se puede encontrar en la siguiente ruta

```bash
apk/upnext.apk
```