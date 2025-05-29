// ✅ Required imports for Properties and FileInputStream
import java.util.Properties
import java.io.FileInputStream
import java.io.File

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ Load keystore properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.example.zbooma"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
           applicationId = "zbooma.aplicfdx" // or your current app ID
    minSdk = 23
    targetSdk = 35

    versionCode = 2       // ✅ This is the internal version for Play Store (must increase with each release)
    versionName = "2.0.0" // ✅ This is the visible version users see
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String 
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
          release {
        signingConfig = signingConfigs.getByName("release")
        isMinifyEnabled = true // 🔧 Enable code shrinking
        isShrinkResources = true // 🔧 Now resource shrinking works
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
    }
}

flutter {
    source = "../.."
}
