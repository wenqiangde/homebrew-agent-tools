# Homebrew Tap For Agent Tools

This repository is the public Homebrew tap and binary distribution channel for
AgentSetup and AgentOps.

AgentSetup installs and syncs reusable agent rules, skills, and templates into
configured projects.

## Install

Install directly:

```bash
brew install wenqiangde/agent-tools/agentsetup
```

Or tap first:

```bash
brew tap wenqiangde/agent-tools
brew install agentsetup
brew install agentops
```

Verify the install:

```bash
agentsetup version
agentsetup self doctor
```

## Registry Setup

AgentSetup uses a local custom registry checkout for reusable skills, rules,
templates, packages, and project assignment metadata. The registry repository is
owned by you or your team and can be named anything.

Default registry path:

```text
~/.agentsetup/repo
```

Initialize it from your registry repository:

```bash
mkdir -p ~/.agentsetup
git clone git@github.com:<owner>/<registry-repo>.git ~/.agentsetup/repo
agentsetup repo doctor
```

`~/.agentsetup/repo` is the registry checkout. It is not the AgentSetup CLI
source repository.

Recommended registry layout:

```text
.
├── registry.json
├── projects/
│   └── myapp.json
├── sources/
│   ├── package-manifest.tsv
│   ├── skills/
│   │   └── <skill-name>/
│   │       └── SKILL.md
│   ├── rules/
│   │   ├── codex/
│   │   ├── claude/
│   │   ├── cursor/
│   │   └── trae/
│   └── templates/
│       ├── codex/
│       ├── claude/
│       ├── cursor/
│       └── trae/
└── packages/
    ├── codex/
    ├── claude/
    ├── cursor/
    └── trae/
```

Edit `sources/`; run `agentsetup build` to regenerate `packages/`.

## Add A Project

From the target project directory:

```bash
cd /path/to/myapp
agentsetup init
agentsetup init --confirm
```

`init` derives the project name from the directory and detects the target agent
when possible.

You can also be explicit:

```bash
agentsetup init myapp --path /path/to/myapp --target codex
agentsetup init myapp --path /path/to/myapp --target codex --confirm
```

Check configuration:

```bash
agentsetup config doctor
agentsetup project list
```

## Install Or Sync Agent Files

Install rules, skills, and templates into one project:

```bash
agentsetup install myapp
agentsetup install myapp --confirm
agentsetup doctor myapp
```

Refresh an installed project from the current registry package:

```bash
agentsetup sync myapp
agentsetup sync myapp --confirm
```

Run across all configured projects:

```bash
agentsetup install all
agentsetup install all --confirm

agentsetup sync all
agentsetup sync all --confirm
```

Write-capable commands preview first. Add `--confirm` only after reviewing the
planned changes.

## Switch Or Repair

Switch a project between supported agents:

```bash
agentsetup switch myapp claude
agentsetup switch myapp claude --confirm

agentsetup switch myapp codex
agentsetup switch myapp codex --confirm
```

Repair interrupted installs, syncs, or switches:

```bash
agentsetup status myapp
agentsetup doctor myapp
agentsetup repair myapp
agentsetup repair myapp --confirm
```

## Registry Maintenance

Update the local registry checkout:

```bash
agentsetup repo doctor
agentsetup repo pull
agentsetup repo pull --confirm
```

After editing reusable registry content:

```bash
agentsetup build
agentsetup verify
git -C ~/.agentsetup/repo status -sb
agentsetup repo push
agentsetup repo push --confirm
```

## One Skill Workflow

Sync one reusable skill into a project:

```bash
agentsetup sync-skill myapp quick-dev-loop
agentsetup sync-skill myapp quick-dev-loop --confirm
```

Import one project-installed skill back into the registry:

```bash
agentsetup repo import-skill myapp quick-dev-loop
agentsetup repo import-skill myapp quick-dev-loop --confirm
agentsetup build
agentsetup verify
```

Keep project-only rules, private paths, credentials, customer details, and
product-specific business logic inside the project.

## MCP

Run the AgentSetup MCP server:

```bash
agentsetup mcp
```

Register it with Codex:

```bash
codex mcp add agentsetup -- agentsetup mcp
```

Inspect tools:

```bash
agentsetup mcp tools
agentsetup mcp tools --json
```

## Upgrade And Uninstall

Upgrade through Homebrew:

```bash
brew upgrade agentsetup
```

Uninstall the CLI:

```bash
brew uninstall agentsetup
```

Homebrew removes the CLI binary. It does not remove your local AgentSetup
runtime data under `~/.agentsetup`.

## Distribution

This tap's formula downloads public release assets from this repository:

```text
https://github.com/wenqiangde/homebrew-agent-tools/releases
```

The AgentSetup CLI source repository is:

```text
https://github.com/wenqiangde/agentsetup
```

The registry content repository is custom. It is cloned locally at:

```text
~/.agentsetup/repo
```
