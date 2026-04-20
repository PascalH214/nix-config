# nix-config

NixOS + Home Manager configuration for host-specific systems and user-level dotfiles.

## Layout

- `flake.nix`: flake entry point and host wiring.
- `hosts/`: host-specific NixOS configs (`nixos`, `laptop`, `vm`).
- `modules/`: reusable NixOS modules shared across hosts.
- `modules/system/system-config/`: focused system submodules for networking, locale, input, audio, virtualization, and desktop integration.
- `modules/gpu/amd/`: AMD GPU system settings and tools such as `amdgpu_top`.
- `home/`: reusable Home Manager modules and dotfiles.
- `users/`: user entry points for NixOS and Home Manager (`users/pascal`).

## Ownership rules

- **System-level:** hardware, boot, networking, timezone, audio stack, virtualization, and GPU tools belong in `modules/` or `hosts/`.
- **User-level:** shell, editor, app packages, themes, cursor settings, and user session variables belong in `home/` and `users/<name>/home.nix`.
- **Host-specific values:** host tuning such as `hyprMainMod` is passed through `home-manager.extraSpecialArgs` in `flake.nix`.

## Clone

Clone with submodules (required for `home/ags/config`):

```bash
git clone --recurse-submodules git@github.com:PascalH214/nix-config.git
cd nix-config
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

## Apply configuration

Update flake inputs first:

```bash
nix flake update
```

Build and switch your main host:

```bash
sudo nixos-rebuild switch --flake '.?submodules=1#nixos'
```

Build and switch the VM host:

```bash
sudo nixos-rebuild switch --flake '.?submodules=1#vm'
```

## Short-lived builds

Build without switching:

```bash
sudo nixos-rebuild build --flake '.?submodules=1#nixos'
```

Apply the built result temporarily:

```bash
sudo ./result/bin/switch-to-configuration test
```

Build a flake output directly:

```bash
nix build '.#nixosConfigurations.nixos.config.system.build.toplevel'
```

## Cleanup

Delete old system generations:

```bash
sudo nix-collect-garbage --delete-older-than 7d
```

Delete old Home Manager generations:

```bash
home-manager expire-generations "-7 days"
```

Run garbage collection:

```bash
sudo nix-store --gc
```

## Notes

- `home/hyprland/default.nix` writes Hyprland files under `.config/hypr`.
- `home/hyprland/config/keybindings` and `home/hyprland/scripts` are linked recursively.
- `home/hyprland/scripts` is marked executable.
- `home-manager.users.pascal` is imported from `users/pascal/home.nix`.
- `users/pascal/nixos.nix` contains the normal user definition and system user-group membership.
