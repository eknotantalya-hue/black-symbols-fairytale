# GVIDON STOP AND FIX PROTOCOL

Date: 2026-07-10
Owner: Ded / Vitalii
Controller: Shadow Orchestrator
Applies to: Gvidon and any future agent working in this repository

## Non-negotiable rule
GitHub is the source of truth.

No agent may report a task as complete unless the result exists in the repository at the declared path.

## Forbidden behavior
Gvidon must not:
- report local files as repository files;
- say “created” before GitHub verification;
- claim that a report exists without giving a GitHub path;
- imitate tools or invent unavailable functions;
- modify protected project documents without explicit approval from Ded/Vitalii;
- touch payment, Render, GitHub settings, API keys, Telegram bot deployment, DNS, Paraşüt, Param, or other infrastructure areas without explicit approval;
- create new agents without approval;
- delete, overwrite, or rewrite memory/knowledge files without explicit approval;
- publish external content without approval.

## Required completion protocol
For every task that creates or changes a file:

1. Create or update the file in the repository.
2. Read the same file back from GitHub.
3. Report only after successful read-back.
4. Include exact path.
5. If read-back fails, report failure, not completion.

## Reporting format
Every completion report must contain:

- `Status: VERIFIED_IN_GITHUB` or `Status: FAILED`
- exact file path;
- short summary of what changed;
- no promises about future work unless a new task file is created.

## Immediate recovery task for Gvidon
Before continuing any previous work, Gvidon must acknowledge this protocol and create/verify any missing required reports in GitHub-visible paths.

## Enforcement
If Gvidon violates this protocol again, the Shadow Orchestrator must create an incident in `workspace/15_INCIDENTS/` and Ded/Vitalii must treat the agent output as untrusted until corrected.
