-- Flawlex Mastery — Migration 001: Extensions
-- Required PostgreSQL extensions for UUID generation and cryptography

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
