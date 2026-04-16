{
  pkgs,
  config,
  ...
} : {
  home.packages = [ pkgs.distrobox ];

  home.activation = {
    setupDistroboxArch = config.lib.dag.entryAfter ["writeBoundary"] ''
      # Ensure podman and distrobox are available in the script's path
      PATH=$PATH:${pkgs.distrobox}/bin:${pkgs.podman}/bin:/run/current-system/sw/bin

      # 1. Create the container if it doesn't exist
      if ! distrobox list | grep -q "archlinux"; then
        echo "Creating Arch Linux Distrobox..."
        distrobox create --name archlinux --image archlinux:latest --yes
      fi

      # 2. Install IntelliJ and GUI dependencies
      echo "Syncing Arch packages..."
      distrobox enter archlinux -- sudo pacman -Syu --noconfirm \
        intellij-idea-community-edition \
        libxkbcommon libx11 libxext libxtst

      # 3. Export the app to ~/.local/share/applications
      echo "Exporting IntelliJ to Home Menu..."
      distrobox enter archlinux -- distrobox-export --app idea
    '';
  };
}
