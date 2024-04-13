import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

allprojects {
    repositories {
        System.getenv()["NIX_MAVEN_REPO"]?.let {
            mavenLocal {
                url = uri(it)
                metadataSources {
                    mavenPom()
                    gradleMetadata()
                }
            }
        }
            ?: run { mavenCentral() }
    }
}

plugins {
    kotlin("jvm") version "1.9.23"
    application
}

group = "org.example"

version = "1.0-SNAPSHOT"

dependencies {
    testImplementation(kotlin("test"))
    testImplementation("io.kotest:kotest-runner-junit5:5.8.0")
    testImplementation("io.kotest:kotest-assertions-core:5.8.0")
}

tasks.test { useJUnitPlatform() }

tasks.withType<KotlinCompile> { kotlinOptions.jvmTarget = "21" }

application { mainClass.set("MainKt") }
