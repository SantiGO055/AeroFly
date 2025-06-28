# Configuración Segura de Firebase

## ⚠️ IMPORTANTE: Seguridad de API Keys

Este proyecto ha sido configurado para proteger las API keys de Firebase. Los archivos de configuración originales han sido removidos del control de versiones y agregados al `.gitignore`.

## Archivos de Configuración Requeridos

Para que el proyecto funcione correctamente, necesitas crear los siguientes archivos con tus credenciales reales de Firebase:

### 1. Android Configuration
**Archivo:** `android/app/google-services.json`
- Copia el contenido de `android/app/google-services.json.example`
- Reemplaza todos los valores `YOUR_*` con tus credenciales reales de Firebase

### 2. iOS Configuration
**Archivo:** `ios/Runner/GoogleService-Info.plist`
- Copia el contenido de `ios/Runner/GoogleService-Info.plist.example`
- Reemplaza todos los valores `YOUR_*` con tus credenciales reales de Firebase

### 3. Flutter Configuration
**Archivo:** `lib/firebase_options.dart`
- Copia el contenido de `lib/firebase_options.dart.example`
- Reemplaza todos los valores `YOUR_*` con tus credenciales reales de Firebase

## Cómo Obtener las Credenciales

1. Ve a la [Consola de Firebase](https://console.firebase.google.com/)
2. Selecciona tu proyecto
3. Ve a Configuración del proyecto (ícono de engranaje)
4. En la pestaña "General", desplázate hacia abajo hasta "Tus apps"
5. Descarga los archivos de configuración para cada plataforma

## Comandos para Configurar

```bash
# Copiar archivos de ejemplo
cp android/app/google-services.json.example android/app/google-services.json
cp ios/Runner/GoogleService-Info.plist.example ios/Runner/GoogleService-Info.plist
cp lib/firebase_options.dart.example lib/firebase_options.dart

# Editar los archivos con tus credenciales reales
# (Usa tu editor preferido)
```

## Verificación

Después de configurar los archivos, ejecuta:

```bash
flutter clean
flutter pub get
flutter run
```

## Notas de Seguridad

- ✅ Los archivos de configuración están en `.gitignore`
- ✅ Los archivos de ejemplo no contienen credenciales reales
- ✅ Las API keys no se subirán accidentalmente al repositorio
- ⚠️ Mantén tus credenciales seguras y no las compartas

## Troubleshooting

Si encuentras errores relacionados con Firebase:
1. Verifica que todos los archivos de configuración estén presentes
2. Asegúrate de que las credenciales sean correctas
3. Ejecuta `flutter clean` y `flutter pub get`
4. Verifica que el bundle ID/package name coincida con tu configuración de Firebase 