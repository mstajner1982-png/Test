# Keep the main activity and composable symbols required for runtime reflection
-keep class com.example.sigduty.MainActivity { *; }
-keepclassmembers class * {
    @androidx.compose.runtime.Composable <methods>;
}
-dontwarn kotlin.*
