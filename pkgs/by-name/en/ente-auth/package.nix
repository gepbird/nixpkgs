{ lib
, flutter316
, fetchFromGitHub
, webkitgtk
, sqlite
, substituteAll
, stdenvNoCC
, libayatana-appindicator
, pkgs
}:

let
  # this dependency of ente-auth is trying to download sqlite,
  # vendor it and use an offline patch
  sqlite3-flutter-libs = stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "sqlite3-flutter-libs";
    version = "0.5.24";

    src = fetchFromGitHub {
      owner = "simolus3";
      repo = "sqlite3.dart";
      rev = "d3a7aa52707ab124e510ee2f954a571e4776e1ff";
      hash = "sha256-S60lBuMmw/RZPtGGepQCilxyT0RhOv+FDwhykL4w/a8=";
    };

    sourceRoot = "${finalAttrs.src.name}/sqlite3_flutter_libs";

    patches = [
      (substituteAll {
        src = ./offline-sqlite.patch;
        sqlite_src = sqlite.src;
      })
    ];

    dontBuild = true;

    installPhase = ''
      cp -r . $out
    '';
  });
  # intermediary derivation because sqlite3_flutter_libs
  # can't be included before buildFlutterApplication checks pubspecLock
  # error: The package sources for sqlite3_flutter_libs are missing. Is the following path inside the source derivation?
  sqlite3-flutter-libs_ente-auth_combined = stdenvNoCC.mkDerivation
    (finalAttrs: {
      pname = "sqlite3-flutter-libs_ente-auth_combined";
      version = "unstable";

      src = fetchFromGitHub {
        owner = "ente-io";
        repo = "ente";
        rev = "auth-v3.1.3";
        hash = "sha256-6eMSqeSNV8tTEfxR5VRTk3mYbLBtoWkFkpu4E/oS91I=";
      };

      sourceRoot = "${finalAttrs.src.name}/auth";

      #patches = [
      #  (substituteAll {
      #    src = ./local-sqlite3-flutter-libs.patch;
      #    sqlite3-flutter-libs = sqlite3-flutter-libs;
      #  })
      #];

      dontBuild = true;

      installPhase = ''
        mkdir -p $out/sqlite3_flutter_libs
        cp -r . $out
        cp -r ${sqlite3-flutter-libs}/* $out/sqlite3_flutter_libs
        ls $out
      '';
    });
in
flutter316.buildFlutterApplication rec {
  pname = "ente-auth";
  version = "3.1.3";

  #src = fetchFromGitHub {
  #  owner = "ente-io";
  #  repo = "ente";
  #  rev = "auth-v3.1.3";
  #  hash = "sha256-6eMSqeSNV8tTEfxR5VRTk3mYbLBtoWkFkpu4E/oS91I=";
  #};
  #sourceRoot = "${src.name}/auth";
  #src = /home/gep/ente/auth;
  src = sqlite3-flutter-libs_ente-auth_combined;

  buildInputs = [
    webkitgtk
    libayatana-appindicator
  ];

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  gitHashes = {
    desktop_webview_window = "sha256-jdNMpzFBgw53asWlGzWUS+hoPdzcL6kcJt2KzjxXf2E=";
    ente_crypto_dart = "sha256-XBzQ268E0cYljJH6gDS5O0Pmie/GwuhMDlQPfopSqJM=";
    flutter_local_authentication = "sha256-r50jr+81ho+7q2PWHLf4VnvNJmhiARZ3s4HUpThCgc0=";
    flutter_secure_storage_linux = "sha256-x45jrJ7pvVyhZlpqRSy3CbwT4Lna6yi/b2IyAilWckg=";
    sqflite = "sha256-TdvCtEO7KL1R2oOSwGWllmS5kGCIU5CkvvUqUJf3tUc=";
  };
}
