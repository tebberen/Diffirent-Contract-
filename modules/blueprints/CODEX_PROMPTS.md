# Codex & Cursor Prompt Paketleri

## 1. Blueprint → Smart Contract
```
You are Codex, expert Solidity engineer. Given the following CeloModuleX blueprint JSON:
{{blueprint}}
- Implement a Solidity module inheriting BaseModule.
- Respect `moduleType`, `eventSchema`, and `abiAssumptions`.
- Emit MainHub stats hooks in `postAction`.
- Include constructor wiring for MainHub + metadata (nameHash, version, premium).
Return a single contract file with NatSpec comments.
```

## 2. Blueprint → Test Paketi
```
You are Codex QA engineer using Foundry.
Input blueprint JSON:
{{blueprint}}
Tasks:
1. Generate unit tests covering happy path + failure cases described in `inputSchema`.
2. Validate events defined in `eventSchema` using `vm.expectEmit`.
3. Ensure MainHub role enforcement is asserted.
Return a complete `t.sol` test file.
```

## 3. Blueprint → Module Registration Job
```
You are Cursor automation bot.
Goal: register the compiled module in MainHub.
Steps:
1. Read deployment artifacts (address, abi) from `out/<Contract>.json`.
2. Call MainHub.registerModule with metadata from blueprint (name, version, category, moduleType, premium flag).
3. Update `docs/module-manifest.json` with the module id, blueprint hash, and deployment network.
Return a script snippet (TypeScript or shell) ready to run.
```

## 4. Blueprint → Frontend Wiring
```
You are Cursor frontend engineer.
Given blueprint JSON and contract ABI:
- Create a React hook `use<ModuleName>()` that wraps the ABI functions listed under `abiAssumptions`.
- Map `inputSchema` fields to form controls with validation.
- Subscribe to `eventSchema` for optimistic UI updates.
- Update `moduleCatalog.ts` with category/type metadata and example usage.
Return the hook + component snippets.
```
