{ lib, stdenv, jdk, gradle_8, ktlint, callPackage }:
let
  buildMavenRepo = callPackage ./maven-repo.nix { };

  mavenRepo = buildMavenRepo {
    name = "nix-maven-repo";
    repos = [
      "https://repo1.maven.org/maven2"
      "https://plugins.gradle.org/m2"
      "https://maven.pkg.jetbrains.space/kotlin/p/kotlin/dev"
    ];
    deps = builtins.fromJSON (builtins.readFile ./deps.json);
  };
in stdenv.mkDerivation {
  pname = "minimal-kotlin-nix-example";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ gradle_8 ktlint ];

  JDK_HOME = "${jdk.home}";

  buildPhase = ''
    runHook preBuild
    export GRADLE_USER_HOME=$TMP/gradle-home
    export NIX_MAVEN_REPO=${mavenRepo}
    gradle build -x test \
      --offline --no-daemon \
      --warning-mode=all --parallel --console=plain \
      -PnixMavenRepo=${mavenRepo}
    runHook postBuild
  '';

  doCheck = true;
  checkPhase = ''
    runHook preCheck
    ktlint src/**/*.kt
    export GRADLE_USER_HOME=$TMP/gradle-home
    export NIX_MAVEN_REPO=${mavenRepo}
    gradle check \
      --offline --no-daemon \
      --warning-mode=all --parallel --console=plain \
      -PnixMavenRepo=${mavenRepo}
    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r build/distributions/* $out
    runHook postInstall
  '';

  dontStrip = true;
}
