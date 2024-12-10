{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "exemplary-zsh-customization-${version}";
  version = "1.0.0";
  src = fetchFromGitHub {
    # path to the upstream repository
    owner = "Rogue-King";
    repo = "ohmyzsh";
    rev = "master";
    sha256 = "";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/zsh/site-functions
    cp {themes,plugins} $out/share/zsh
    cp completions $out/share/zsh/site-functions
  '';
}
