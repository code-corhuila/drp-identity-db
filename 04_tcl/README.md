# 04_tcl — transaction control

Outbox / commit boundaries live in `drp-identity-api` (same DB transaction as the write).
This folder is reserved for SQL that must run inside an explicit transaction if Flyway
cannot wrap it. Corte 2: empty.
