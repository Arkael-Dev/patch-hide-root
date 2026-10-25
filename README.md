# patch-hide-root (Arkael-Dev)

Loadable kernel module (LKM) loader for **SUSFS**, built and adapted specifically for the **Arkael** kernel (`arkael-kernel-a12-5.10` and related GKI variants 5.10 / 6.1 / 6.6 / 6.12, KernelSU-Next + manual hooks).

> 🌐 Original upstream docs (Mandarin/English): [original README (zh)](https://github.com/inforcqb/susfs4ksu-lkm/blob/main/README.md) · [original README (en)](https://github.com/inforcqb/susfs4ksu-lkm/blob/main/README.en.md)

## Credit

This repo is derived from **[inforcqb/susfs4ksu-lkm](https://github.com/inforcqb/susfs4ksu-lkm)** — all LKM logic, hooks, and the loading infrastructure (`patch_memory`, `lsm_hook`, `symbol_resolver`, etc.) are inforcqb's work.

inforcqb's project itself builds on:
- [susfs4ksu](https://gitlab.com/simonpunk/susfs4ksu) by simonpunk — SUSFS feature logic and hook points
- [SukiSU-Ultra](https://github.com/SukiSU-Ultra/SukiSU-Ultra) — `patch_memory` / `lsm_hook` / `symbol_resolver`

License: **GPL-2.0** (see [LICENSE](LICENSE)).

## What's different in this fork

- `module/kmi.sh` got an explicit mapping for the Arkael kernel, since its `osrelease` (e.g. `5.10.272-Arkael/8eab6f338`) carries no standard GKI `android<N>` tag that upstream's loader relies on to pick a `.ko`.
- Build targets: `android12-5.10`, `android14-6.1`, `android15-6.6`, `android16-6.12` — matching the Arkael kernel variants.
- Builds still use upstream's own GitHub Actions workflow (`.github/workflows/build-ddk.yml`).

## Usage

Same as upstream — see the original docs linked above, or [PROC_INTERFACES.md](PROC_INTERFACES.md) for the full list of `/proc` control nodes.

## Disclaimer

For technical research and study only. Use at your own risk.
