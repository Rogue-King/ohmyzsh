{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "oh-my-zsh";
  version = "1.0.0";
  src = fetchFromGitHub {
    # path to the upstream repository
    owner = "Rogue-King";
    repo = "ohmyzsh";
    rev = "master";
    sha256 = "sha256-mKluzEf5zHwkMCKcD6wnWqihsTYdxGdIpIDK6p1J9GI=";
  };

  dontBuild = true;
  installPhase = ''
    echo "Contents of the source directory:"
    ls -R .
    mkdir -p $out/share/zsh/site-functions
    if [ -d themes ]; then cp -r themes $out/share/zsh; fi
    if [ -d plugins ]; then cp -r plugins $out/share/zsh; fi
    if [ -d completions ]; then cp -r completions $out/share/zsh/site-functions; fi
  '';
}
