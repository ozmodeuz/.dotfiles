final: prev: {

  deskflow = prev.stdenv.mkDerivation rec {
    pname = "deskflow";

    version = "1.17.0";

    src = prev.fetchFromGitHub {
      owner = "deskflow";
      repo = "deskflow";
      rev = "${version}+r1";
      hash = "sha256-OXgL3AmN5s38tlp3yYcMc6y9y8Gf48FuaD0ilKnoKiE=";
    };

    nativeBuildInputs = [
      prev.cmake
      prev.ninja
      prev.pkg-config
      prev.qt6.wrapQtAppsHook
    ];

    postPatch = ''
      substituteInPlace cmake/Packaging.cmake --replace-warn "set(CMAKE_INSTALL_PREFIX /usr)" ""
    '';

    cmakeFlags = [
      "-DCMAKE_SKIP_RPATH=ON"
    ];

    buildInputs = [
      prev.tomlplusplus
      prev.cli11
      prev.gtest
      prev.libei
      prev.libportal
      prev.xorg.libX11
      prev.xorg.libxkbfile
      prev.xorg.libXinerama
      prev.xorg.libXi
      prev.xorg.libXrandr
      prev.xorg.libXtst
      prev.libxkbcommon
      prev.pugixml
      prev.gdk-pixbuf
      prev.libnotify
      prev.python3
      prev.qt6.qtbase
    ];

    postInstall = ''
      substituteInPlace $out/share/applications/deskflow.desktop \
          --replace-fail "Path=/usr/bin" "Path=$out/bin" \
          --replace-fail "Exec=/usr/bin/deskflow" "Exec=deskflow"
    '';

    meta = {
      homepage = "https://github.com/deskflow/deskflow";
      description = "Deskflow lets you share one mouse and keyboard between multiple computers on Windows, macOS and Linux";
      mainProgram = "deskflow";
      maintainers = with prev.lib.maintainers; [ aucub ];
      license = prev.lib.licenses.gpl2Plus;
      platforms = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      broken = prev.stdenv.hostPlatform.isDarwin;
    };
  };
}