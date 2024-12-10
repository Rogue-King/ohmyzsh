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
    echo "Contents of the source directory:"
    ls -R .
    mkdir -p $out/share/zsh/site-functions
    cp -r themes plugins $out/share/zsh
    cp -r completions $out/share/zsh/site-functions
  '';
}
