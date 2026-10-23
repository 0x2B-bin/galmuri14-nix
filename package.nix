{
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  pname = "galmuri14";
  version = "2.40.4";

  src = fetchzip {
    url = "https://github.com/quiple/galmuri/releases/download/v${version}/Galmuri-v${version}.zip";
    hash = "sha256-RNM+YeGDZJn4gyYY7KMmQUoUJRf+FCttqgqiwlt8e1U=";
    stripRoot = false;
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/galmuri14/
    cp *.ttc *.bdf *.ttf *.woff2 $out/share/fonts/galmuri14/

    runHook postInstall
  '';
}
