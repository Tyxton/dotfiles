---
<div align="center">
**My Personal Dotfiles**
[My Documentation Website](https://nottyxton.net)
</div>
---

# The Breakdown

```
dotfiles/
├── global/     # Shared configurations used across both systems
├── snake/      # Machine-specific config for Snake
└── otacon/     # Machine-specific config for Otacon
```

---

# Snake (archlinux-zen)

Snake is my primary Development, Workstation, and Gaming rig. It is optimized for NVIDIA hardware and higher refresh rate workflows.

- WM: Hyprland
- Term: Foot
- Bar: Waybar

## Hardware Manifest

| Component | Specification           |
| :-------- | :---------------------- |
| CPU       | Intel i9-12900K         |
| GPU       | NVIDIA GeForce RTX 2060 |
| RAM       | 32GB                    |

---

# Otacon (archlinux-lts)

Otacon is my portable Thinkpad X220, used for mobile development and focus-heavy work. It utilizes a lightweight TUI-centric stack for effeciency.

- WM: i3
- Term: URxvt (rxvt-unicode)
- Bar: Polybar

## Hardware Manifest

| Component | Specification                     |
| :-------- | :-------------------------------- |
| CPU       | Intel i5-2410M                    |
| GPU       | Intel 2nd Gen Integrated Graphics |
| RAM       | 8GB                               |

---

# Global

The core toolkit shared across both systems to ensure a consistent environment:

- Bootloader: systemd-boot
- Editor: Neovim
- Shell: zsh

---

# Custom Scripts

## System

- `btrfs-snap-pre.sh`: Automation for BTRFS snapshots prior to updates or changes.
- `vpn-toggle.sh`: Quick CLI toggle for VPN connectivity

## Polybar

- `vpn-status.sh`: VPN Status indicator for the bar.
- `launch.sh`: Multi-monitor aware bar initialization.
- `power.sh`: System power management and logout menu.

---

_Eventually I intend to add the custom install scripts as well and automated symlinking._

---
