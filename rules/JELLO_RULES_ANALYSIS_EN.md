Project Rules – Jello Modular Hub Analysis (EN)
1. Current Gaps & Ambiguities

Module metadata gap
The Module struct only stores address, category, type, premium flag and version. There is still no on-chain name/description metadata. This forces the frontend to rely on hardcoded labels and increases the risk of mismatch between off-chain config and on-chain reality.


Leaderboard persistence
Daily counters are defined, but it is unclear how weekly/monthly leaderboards will be persisted (on-chain vs. backend), rotated, or queried. No clear snapshot/epoch strategy is documented.

Deployment guide missing verification & rollback
The deployment order is clear, but there is no standardized step for:

Explorer verification

.env management and secrets

Rollback procedures or re-deploy strategies

Version tagging / manifest generation

Integration pre-setup is empty
For Celo AI, Talent Protocol and Self XYZ there is no collected info yet:

Base URL / API endpoints

Auth method (API key, OAuth, etc.)

Webhook / callback URLs

Which modules will actually consume these integrations

NFT economy parameters incomplete
Dynamic pricing is mentioned, but there is no clarity on:

Supply limits

Transfer rules / non-transferable logic

Royalty / fee model

Locking / staking behavior

Cross-chain / bridging policy

Advanced security & QA coverage missing
The test plan covers basic functional scenarios but does not yet include:

Fuzz testing

Invariant tests

Reentrancy-focused scenarios

Multi-chain / fork-based replay testing

Economic / griefing / manipulation cases

Preparation checklist not fully completed
Some items are still “to be prepared”, such as:

Final project definition text

Canonical category + module lists

Completed blueprints for all module families

User flow diagrams

Codex/Cursor prompt packages

2. Recommended Improvements

Extend module registry metadata
Add on-chain metadata to the module registry, e.g.:

bytes32 nameHash

string uri (points to JSON metadata or docs)

uint32 usageCount or similar tracking
And emit richer events to make the frontend alignment easier and deterministic.

Introduce on-chain leaderboard epochs
Design a LeaderboardEpoch mechanism to roll up daily counters into weekly/monthly aggregates, optionally supported by:

A cron / TaskScheduler module

Off-chain worker that reads deterministic events and stores snapshots

Standardized deploy + verify pipeline
Define a repeatable deployment process that includes:

Scripted deployment (per chain)

Automatic explorer verification (CeloScan/BaseScan/etc.)

Manifest output (contract addresses, versions, ABI refs)

Rollback guidelines and tags for each release

Create an integrations registry & doc
Under docs/integrations/README.md, maintain a table for each external integration:

Service name

Base URL / endpoints

Auth method & test key

Which modules depend on it

Environment matrix (dev/stage/prod)

Formal NFT policy document
Define and document for all NFT-related features:

Supply caps per tier

Transferability (soulbound vs free transfer)

Royalty / protocol fee settings

Lock / stake logic, if any

Cross-chain strategy (bridgeable or not)

Upgrade QA & security plan
Extend the QA layer to include:

Slither static analysis

Foundry fuzz & invariant tests

Fork tests on target networks

Specific tests for NFT pricing, fee withdrawal, and abuse scenarios

Finish all preparation docs
Complete and commit:

Canonical module/category reference

Main user journey diagrams

Codex prompt packs for module generation

Blueprint documents for each module family (GM, Donate, Mint, Badge, Governance, etc.)

3. Detailed Task List (Execution Roadmap)

Repository & folder structure

Create base structure:

contracts/

contracts/modules/

modules/blueprints/

frontend/

scripts/

docs/

Prepare shared UI components and service files (e.g. API & contract helpers).

Codex + Cursor integration

Store blueprint files under modules/blueprints/ with clear versioning.

Prepare a Codex prompt package that can generate/update modules from these blueprints.

Define Cursor tasks that map: blueprint → contract → test → register → frontend wiring.

Core smart contract development

Implement MainHub.sol (modular hub, module registry, access control).

Implement NFTAccessPass.sol or equivalent (if part of the access model).

Implement fee / commission logic (protocol fees, creator fees, treasury flow).

Define RBAC model (owner, admin, moduleManager, etc.) and emit rich events.

Module registration system

Implement registerModule, enable/disable, and getModulesByCategory queries.

Build a generic BaseModule pattern for all modules.

Implement first wave of modules according to blueprints (e.g. GM, Deploy, Donate, Mint, Claim, Governance, Badge…). Target: 50 modules in total.

Ensure module registry stores metadata and emits registration events.

Data & leaderboard layer

Add mappings and structs for: dailyActions, moduleActions, global/user stats.

Implement updateScore/updateStats and corresponding UserStatsUpdated / GlobalStatsUpdated events.

Optionally design an epoch-based rollup (on-chain or with an off-chain worker).

Frontend integration

Define contract addresses and ABIs in constants.js or equivalent config.

Implement contractService.js / hooks for:

Connecting wallet

Calling hub functions

Interacting with individual modules

Build UX flows for:

Profile creation

Module actions (gm, donate, mint, etc.)

Leaderboard and stats display

Deployment steps
Recommended deployment order:

Deploy NFT / access contracts (if any).

Deploy MainHub.

Deploy module contracts.

Register modules in MainHub.

Update frontend constants.js / config with final addresses.

Run explorer verification scripts and generate a deployment manifest.

Testing & debugging

Write basic unit tests for core hub and modules.

Add integration tests that simulate typical user flows.

Introduce fuzz/invariant tests for critical logic (fees, stats, leaderboards).

Test frontend + wallet flows across supported networks.

Security reviews

Run Slither on the full contracts set and fix critical issues.

Double-check reentrancy protection, access control, and fee withdrawal paths.

Review NFT pricing and distribution logic for manipulation vectors.

Conduct at least one internal code review pass per module type.

Pre-launch & post-launch operations

Finalize and publish docs (docs/): architecture, modules, APIs, user flows.

Fill in integration details for external services (Celo AI, Talent, Self XYZ, etc.).

Run a full regression test pass (contracts + frontend + integrations).

After deployment, verify all contracts on explorers and publish manifest.

Set up monitoring/analytics for usage, errors, fees, and module interactions.
