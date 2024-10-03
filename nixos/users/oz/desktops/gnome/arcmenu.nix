{
  nixpkgs.overlays = [
    (final: prev: {
      gnomeExtensions = prev.gnomeExtensions // {
        arcmenu = prev.gnomeExtensions.arcmenu.overrideAttrs (old: {
          version = "v61";
          src = prev.fetchFromGitLab {
            owner = "Arcmenu";
            repo = "Arcmenu";
            rev = "f2eb22279778c9985b7d1793066ef3cf86847baf";
            sha256 = "+F73pfHg1LP3IpEqXj3sZv0s4GH4ubwVhfge71W2WWU=";
          };
        });
      };
    })
  ];
}