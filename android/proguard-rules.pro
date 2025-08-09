# Mantener las anotaciones
-keepattributes *Annotation*

# Mantener todas las clases del paquete principal
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.FlutterInjector { *; }

# Mantener todas las clases y métodos de la biblioteca Flutter
-keep class io.flutter.** { *; }

# Mantener clases y métodos utilizados por plugins populares
# Si utilizas algún plugin específico, agrega aquí sus reglas de ProGuard
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.gson.** { *; }
-keep class retrofit2.** { *; }
-keep class androidx.lifecycle.** { *; }
-keep class androidx.room.** { *; }

# Eliminar métodos de logging en producción
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** e(...);
    public static *** i(...);
    public static *** v(...);
    public static *** w(...);
}

# Mantener clases de modelo para la deserialización JSON
-keep class com.example.yourpackage.model.** { *; }

# Mantener las clases de UI
-keep class com.example.yourpackage.ui.** { *; }

# Mantener métodos nativos
-keepclasseswithmembernames class * {
    native <methods>;
}

# Permitir la reflexión (opcional, dependiendo de las bibliotecas utilizadas)
-keepclassmembers class * {
    void *(...);
    *** get*(...);
    *** set*(...);
}

# Configuración para prevenir la eliminación de recursos no utilizados (opcional)
# -dontshrink

# Optimización adicional (opcional)
# -dontoptimize
