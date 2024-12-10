{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "oh-my-zsh-${version}";
  version = "1.0.0";
  src = fetchFromGitHub {
    # path to the upstream repository
    owner = "Rogue-King";
    repo = "ohmyzsh";
    rev = "v${version}";
    sha256 = "sha256-pLHEn8N4pN8wmaThN9lqxHG62G+6X3hxWEmvQbl1Dbs=";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/zsh/site-functions
    cp {themes,plugins} $out/share/zsh
    cp completions $out/share/zsh/site-functions
  '';
}
