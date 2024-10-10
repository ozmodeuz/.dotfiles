final: prev: {
  gnome-control-center = prev.gnome-control-center.overrideAttrs (oldAttrs: 
    if oldAttrs.version == "46.4" then {
      patches = (oldAttrs.patches or []) ++ [
        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/refs/heads/mutter-46/display-Allow-fractional-scaling-to-be-enabled.patch";
          hash = "sha256-uoWTZ1UjjeBAw1PvtR01oYi1Mv0qkTxbXTbWMDweIHE=";
        })
        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/refs/heads/mutter-46/display-Support-UI-scaled-logical-monitor-mode.patch";
          hash = "sha256-qskSQtYWTHsDqhxOLAt84QwwyeQKmKIBHdvgg0gsKKA=";
        })
      ];
    } else throw "Gnome Control Center version mismatch. Please update the Gnome Control Center X11 fractional scaling patch, or disable. (${oldAttrs.version})"
  );
}