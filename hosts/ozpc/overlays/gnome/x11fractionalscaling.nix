final: prev: {
  mutter = prev.mutter.overrideAttrs (oldAttrs: 
    if oldAttrs.version == "46.4" then {
      patches = (oldAttrs.patches or []) ++ [
        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/refs/heads/master/x11-Add-support-for-fractional-scaling-using-Randr.patch";
          hash = "sha256-iUXsB8k9bUAkabxsqeCQpkJ8veaJHFYqlFrzbyCOzvE=";
        })
      ];
    } else throw "Mutter version mismatch. Please update the Mutter X11 fractional scaling patch, or disable. (${oldAttrs.version})"
  );
}