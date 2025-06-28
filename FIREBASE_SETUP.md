# Configuración de Firebase para AeroFly

## Pasos para configurar Firebase con Google Sign-In

### 1. Crear proyecto en Firebase Console

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Haz clic en "Crear un proyecto"
3. Dale un nombre a tu proyecto (ej: "aerofly-app")
4. Sigue los pasos del asistente

### 2. Habilitar Authentication

1. En la consola de Firebase, ve a "Authentication"
2. Haz clic en "Get started"
3. Ve a la pestaña "Sign-in method"
4. Habilita "Google" como proveedor de autenticación
5. Configura el nombre del proyecto y el correo de soporte

### 3. Configurar Android

1. En la consola de Firebase, ve a "Project settings" (ícono de engranaje)
2. En la sección "Your apps", haz clic en el ícono de Android
3. Registra la app con:
   - Package name: `com.example.aerofly`
   - App nickname: `AeroFly Android`
4. Descarga el archivo `google-services.json`
5. Reemplaza el archivo `android/app/google-services.json` con el descargado

### 4. Configurar iOS

1. En la misma página de configuración, haz clic en el ícono de iOS
2. Registra la app con:
   - Bundle ID: `com.example.aerofly`
   - App nickname: `AeroFly iOS`
3. Descarga el archivo `GoogleService-Info.plist`
4. Reemplaza el archivo `ios/Runner/GoogleService-Info.plist` con el descargado

### 5. Actualizar firebase_options.dart

1. Ejecuta el siguiente comando para generar las opciones de Firebase:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

2. O manualmente actualiza `lib/firebase_options.dart` con los valores de tu proyecto:
   - Reemplaza `TU_API_KEY` con tu API Key
   - Reemplaza `TU_PROJECT_NUMBER` con tu Project Number
   - Reemplaza `TU_APP_ID` con tu App ID
   - Reemplaza `tu-proyecto-id` con tu Project ID

### 6. Configurar SHA-1 para Android (Opcional pero recomendado)

1. Obtén tu SHA-1 fingerprint:
   ```bash
   cd android
   ./gradlew signingReport
   ```

2. En la consola de Firebase, ve a Project Settings > General
3. En la sección "Your apps" > Android app, haz clic en "Add fingerprint"
4. Agrega el SHA-1 fingerprint

### 7. Instalar dependencias

```bash
flutter pub get
```

### 8. Probar la aplicación

```bash
flutter run
```

## Estructura de archivos creados/modificados

- `lib/services/auth_service.dart` - Servicio de autenticación
- `lib/firebase_options.dart` - Configuración de Firebase
- `lib/main.dart` - Inicialización de Firebase
- `lib/views/pages/login_page.dart` - Página de login actualizada
- `android/app/google-services.json` - Configuración de Firebase para Android
- `ios/Runner/GoogleService-Info.plist` - Configuración de Firebase para iOS

## Notas importantes

1. **Seguridad**: Nunca subas los archivos de configuración de Firebase a repositorios públicos
2. **Testing**: Para testing, puedes usar cuentas de Google de prueba
3. **Producción**: Para producción, asegúrate de configurar las reglas de seguridad en Firebase

## Solución de problemas comunes

### Error: "Google Sign-In failed"
- Verifica que el SHA-1 esté configurado correctamente
- Asegúrate de que Google Sign-In esté habilitado en Firebase Console

### Error: "Firebase not initialized"
- Verifica que `firebase_options.dart` esté configurado correctamente
- Asegúrate de que los archivos de configuración estén en las ubicaciones correctas

### Error: "App not authorized"
- Verifica que el package name/bundle ID coincida con el configurado en Firebase
- Asegúrate de que la app esté registrada en Firebase Console 