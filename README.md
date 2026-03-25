# nix-config

NixOS + Home Manager configuration for host-specific systems and user-level dotfiles.

## Hyprland Behavior

`home/hyprland/default.nix` writes Hyprland files under `.config/hypr`.

- Top-level config files from `home/hyprland/config` are linked.
- `hyprland.conf` is generated from Nix so `$mainMod` can be set per host through `hyprMainMod` in `flake.nix`.
- `home/hyprland/config/keybindings` is linked recursively.
- `home/hyprland/scripts` is linked recursively and marked executable.

## Apply Configuration

For your main host:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

For the VM host:

```bash
sudo nixos-rebuild switch --flake .#vm
```

## Notes

- Host-specific values (for example `hyprMainMod`) are passed through `home-manager.extraSpecialArgs` in `flake.nix`.
- User-level programs should live in Home Manager modules under `home/` and be imported by `users/<name>/home.nix`.

## Structure

- `flake.nix`: entry point and host outputs.
- `hosts/`: host-specific NixOS config (`nixos`, `vm`).
- `modules/`: reusable NixOS modules (bootloader, display manager, system, Hyprland enablement).
- `users/`: user-level system and Home Manager entry files.
- `home/`: Home Manager modules and dotfiles.

## Home Manager Layout

- `home/core.nix`: base user settings.
- `home/hyprland/default.nix`: deploys Hyprland config and scripts.
- `home/hyprland/config/`: static Hyprland config files.
- `home/hyprland/scripts/`: Hyprland helper scripts.
- `home/vsCodium/default.nix`: VSCodium user configuration.
