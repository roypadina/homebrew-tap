# roypadina/homebrew-tap

[![Website](https://img.shields.io/badge/website-apps.roypadina-2F62E6)](https://apps.roypadina.synology.me/)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-support-F16061?logo=ko-fi&logoColor=white)](https://ko-fi.com/roypadina)

One `brew tap` for all of [Roy Padina](https://github.com/roypadina)'s free, open-source Mac tools: small, focused menu-bar apps and a few Claude Code command-line tools, all MIT licensed. Screenshots, details and install notes for each live on the apps site: **[apps.roypadina.synology.me](https://apps.roypadina.synology.me)**.

## Install

```bash
brew install --cask roypadina/tap/languard
```

(or `brew tap roypadina/tap` then `brew install --cask languard`)

## Apps

| App | What it does | Install | macOS | Arch |
|---|---|---|---|---|
| [LanGuard](https://github.com/roypadina/LanGuard) | Wi-Fi off when you are wired, back on when you are not | `brew install --cask roypadina/tap/languard` | 14+ | Universal |
| [MaccyPlus](https://github.com/roypadina/maccyplus) | Maccy plus rules, hotkeys, plugins and a CLI for AI agents | `brew install --cask roypadina/tap/maccyplus` | 14+ | Universal |
| [Agents Monitor](https://github.com/roypadina/AgentsMonitor) | Claude Code and Codex usage limits before you hit them | `brew install --cask roypadina/tap/agents-monitor` | 14+ | Apple Silicon only |
| [AgentsSessionHopper](https://github.com/roypadina/AgentsSessionHopper) (BETA) | Run your Claude accounts side by side; continue a conversation on another when one runs low | `brew install --cask roypadina/tap/agents-session-hopper` | 14+ | Universal |
| [MeetAlert](https://github.com/roypadina/MeetAlert) | Meeting alerts you cannot miss: a popup that stays, a phone push that escalates | `brew install --cask roypadina/tap/meetalert` | 14+ | Universal |
| [SmartHiddenBar](https://github.com/roypadina/SmartHiddenBar) | Hide the menu bar clutter, reach it in one click | `brew install --cask roypadina/tap/smarthiddenbar` | 27+ | Apple Silicon only |
| [Window Organizer](https://github.com/roypadina/window-organizer) | Minimize, close or quit every app and window with one shortcut | `brew install --cask roypadina/tap/window-organizer` | 14+ | Universal |
| [VaultBar](https://github.com/roypadina/VaultBar) | Encrypted vaults, one click from the menu bar | `brew install --cask roypadina/tap/vaultbar` | 14+ | Universal |
| [Obsidian Vault Git Watcher](https://github.com/roypadina/ObsidianVaultGitWatcher) | Reminds you to commit and push your vaults | `brew install --cask roypadina/tap/obsidian-vault-git-watcher` | 14+ | Universal |
| [agentctl](https://github.com/roypadina/agentctl) | Find and resume any Claude Code or Codex session from one terminal menu | `brew install --cask roypadina/tap/agentctl` | CLI, needs Node 18+ | Any |
| [claude-jam](https://github.com/roypadina/claude-jam) | Share one real Claude Code session with other humans | `brew install roypadina/tap/claude-jam` | CLI, needs Node 22+ and tmux | Any |
| [NtfyBar](https://github.com/roypadina/NtfyBar) | ntfy notifications on your Mac: popups that stay, rules, commands and sandboxed plugins | `brew install --cask roypadina/tap/ntfybar` | 14+ | Universal |

## Casks

| Cask | Description |
|---|---|
| **agentctl** | Terminal menu to start or resume Claude/Codex coding-agent sessions (CLI only). [Repo](https://github.com/roypadina/agentctl) |
| **agents-monitor** | Menu-bar monitor for Claude Code and Codex usage limits across multiple accounts, with usage graphs and burn-rate warnings. [Repo](https://github.com/roypadina/AgentsMonitor) |
| **agents-session-hopper** | BETA. Profiles for Claude Code: your own accounts side by side, confirmed hand-off of a conversation to another when one runs low; menu-bar app + `sessionhopper` CLI. [Repo](https://github.com/roypadina/AgentsSessionHopper) |
| **languard** | Menu-bar app: turns Wi-Fi off on wired LAN, back on when unplugged; optional connection protection keeps running connections alive across LAN↔Wi-Fi switches. [Repo](https://github.com/roypadina/LanGuard) |
| **maccyplus** | Maccy fork: clipboard manager with rule-based actions, plugins, a headless config CLI, and an agent clipboard API (labelled values from AI sessions). [Repo](https://github.com/roypadina/maccyplus) |
| **meetalert** | Unmissable meeting alerts: desktop popup, ntfy phone push, urgent escalation. [Repo](https://github.com/roypadina/MeetAlert) |
| **ntfybar** | Menu-bar client for ntfy (ntfy.sh or self-hosted): notifications, popups, rules, shell commands and sandboxed JavaScript plugins. [Repo](https://github.com/roypadina/NtfyBar) |
| **obsidian-vault-git-watcher** | Menu-bar app: reminds you to commit and push your Obsidian vaults (or any git repo) once you stop editing; per-vault schedules, snooze/skip, one-click commit & push, native Settings. [Repo](https://github.com/roypadina/ObsidianVaultGitWatcher) |
| **smarthiddenbar** | macOS 27 menu bar manager: one click hides items, per-display click modes, always-hidden apps, icon bar (resizable icons, hover names) + Apps list, use hidden items' menus without unhiding. [Repo](https://github.com/roypadina/SmartHiddenBar) |
| **vaultbar** | Menu-bar app: lock and unlock encrypted disk-image vaults with a password popup, auto-lock on sleep, screen lock and idle. [Repo](https://github.com/roypadina/VaultBar) |
| **window-organizer** | Menu-bar app: minimize, close, quit or force quit all apps and windows at once with recordable global shortcuts and per-app rules. [Repo](https://github.com/roypadina/window-organizer) |

## Formulae

```bash
brew install roypadina/tap/claude-jam
```

| Formula | Description |
|---|---|
| **claude-jam** | Share one real Claude Code session with other humans, live over WebSockets. [Repo](https://github.com/roypadina/claude-jam) |

## More Mac apps by Roy

Browse every app with screenshots and install steps at **[apps.roypadina.synology.me](https://apps.roypadina.synology.me/)**.

## Support

These are free and I build them in my spare time. If one saves you a click, a coffee keeps the next one coming.

[![Support me on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/roypadina)

## License

MIT (c) Roy Padina
