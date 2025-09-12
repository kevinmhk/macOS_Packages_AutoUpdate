# Tasks: macOS Packages AutoUpdate

**Input**: Design documents from `/specs/001-build-2-scripts/`
**Prerequisites**: plan.md, research.md, quickstart.md

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → If not found: ERROR "No implementation plan found"
   → Extract: tech stack, libraries, structure
2. Load optional design documents:
   → data-model.md: Extract entities → model tasks
   → contracts/: Each file → contract test task
   → research.md: Extract decisions → setup tasks
3. Generate tasks by category:
   → Setup: project init, dependencies, linting
   → Tests: contract tests, integration tests
   → Core: models, services, CLI commands
   → Integration: DB, middleware, logging
   → Polish: unit tests, performance, docs
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness:
   → All contracts have tests?
   → All entities have models?
   → All endpoints implemented?
9. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions
- **Single project**: `src/`, `tests/` at repository root

## Phase 3.1: Setup
- [ ] T001 Create project structure: `src/scripts` and `tests/unit`.
- [ ] T002 Install `bats-core` for testing.

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**
- [ ] T003 [P] Write a failing unit test for the update script in `tests/unit/test_update.bats`.
- [ ] T004 [P] Write a failing unit test for the installation script in `tests/unit/test_install.bats`.

## Phase 3.3: Core Implementation (ONLY after tests are failing)
- [ ] T005 Implement the update script `src/scripts/update.sh`.
- [ ] T006 Implement the installation script `src/scripts/install.sh`.

## Phase 3.4: Integration
- N/A

## Phase 3.5: Polish
- [ ] T007 [P] Review and finalize the `quickstart.md` documentation.
- [ ] T008 Review and finalize the scripts and tests.

## Dependencies
- T001, T002 must be done before T003, T004.
- T003 must be done before T005.
- T004 must be done before T006.
- T005, T006 must be done before T008.

## Parallel Example
```
# Launch T003-T004 together:
Task: "Write a failing unit test for the update script in tests/unit/test_update.bats."
Task: "Write a failing unit test for the installation script in tests/unit/test_install.bats."
```
