final: prev: {
  gnomeExtensions = prev.gnomeExtensions // {
    display-configuration-switcher = final.stdenv.mkDerivation {
      pname = "display-configuration-switcher";
      version = "6";

      src = final.fetchFromGitLab {
        owner = "knokelmaat";
        repo = "display-configuration-switcher-gnome-extension";
        rev = "c84f163ab59e4d28a89dc258a4964922a976e743";
        sha256 = "D2pyQ+430Oxk1RqnqLarIZcyjjked7huNenzP6ypKjE=";
      };

      passthru = {
        extensionUuid = "display-configuration-switcher@knokelmaat.gitlab.com";
        extensionPortalSlug = "display-configuration-switcher";
      };

      buildInputs = [
        prev.glib prev.gnome-shell
      ];

      buildPhase = ''
        runHook preBuild
        glib-compile-schemas --strict --targetdir=schemas schemas
        runHook postBuild
      '';
      
      installPhase = ''
        runHook preInstall
        mkdir -p "$out/share/gnome-shell/extensions/display-configuration-switcher@knokelmaat.gitlab.com"
        cp -r * "$out/share/gnome-shell/extensions/display-configuration-switcher@knokelmaat.gitlab.com"
        runHook postInstall
      '';
      
      # Metadata about the package
      meta = with prev.lib; {
        description = "Quickly change the display configuration from the system menu. Multiple display configurations can be saved with custom names. A display configuration contains all display settings: resolution, scaling, orientation, position...";
        homepage = "https://gitlab.com/knokelmaat/display-configuration-switcher-gnome-extension";
        license = licenses.gpl3;
        maintainers = with maintainers; [ "ozmodeuz" ];
        platforms = platforms.linux;
      };
    };
  };
}