# drp-identity-db

Identity schema for SpaceHub. **Migrations only.** The PostgreSQL instance lives in [`drp-infra-postgres`](https://github.com/code-corhuila/drp-infra-postgres). This repo must not define a database container or volume. `drp-identity-api` must not own DDL.

Contract / model: `drp-docs` `06-data/models.md` (schema `identity`, user `identity_app`).

## Layout (Anexo J)

| Folder | Flyway |
|--------|--------|
| `01_ddl/` | `V001__create_users_and_roles.sql` |
| `02_dml/` | `V002__seed_corte2_users.sql` |
| `03_dcl/` | `V003__table_grants_identity_app.sql` |
| `04_tcl/` | reserved (outbox is in the API) |
| `05_rollbacks/` | manual undo for empty local volumes |
| `deploy/compose.yml` | Flyway job only |

Control table: `identity.flyway_identity_history` (per domain).

## Run (after infra is up)

```bash
# from drp-infra-postgres
cp env/dev.env.example env/dev.env
docker compose --env-file env/dev.env -f deploy/compose.yml up -d

# from this repo
docker compose --env-file .env.example -f deploy/compose.yml run --rm identity-migrate
```

Corte 2 UI (`drp-front`) does **not** need this migrate: it uses synthetic contract data.

## Branching

Three permanent branches. **None of them accepts a direct commit** — child branch + Pull Request.

Promotion: `git cherry-pick -x`. Never merge `develop` → `qa` or `qa` → `main`.

`main` requires **1 approval from `ariel5253`**.
