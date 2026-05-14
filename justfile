# SPDX-FileCopyrightText: 2026 Avish J <avish.j@pm.me>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

set dotenv-load

default:
    @just --list

install:
    bun install --frozen-lockfile

lint:
    bunx --bun astro check
    bunx --bun tsc --noEmit


test *args:
    bunx --bun vitest run {{ args }}

build:
    bunx --bun astro build

dev:
    bunx --bun astro dev

ci:
    just lint
    just test
    just build

clean:
    rm -rf dist/ .astro/ node_modules/ coverage/
