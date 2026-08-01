# Nostromo

A modern Ruby on Rails project focused on exploring the Rails ecosystem through production-oriented engineering practices.

Rather than solving a specific business domain, Nostromo serves as a technical playground for experimenting with Rails conventions, architecture, tooling, deployment strategies, and modern development workflows.

## Stack

![Ruby](https://img.shields.io/badge/Ruby-3.4-CC342D?logo=ruby)
![Rails](https://img.shields.io/badge/Rails-8.0-CC0000?logo=rubyonrails)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57?logo=sqlite)
![Hotwire](https://img.shields.io/badge/Hotwire-Turbo_+_Stimulus-FF4F00)
![Importmap](https://img.shields.io/badge/Importmap-Rails-CC0000)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)
![Kamal](https://img.shields.io/badge/Kamal-Deploy-CC0000)
![Solid Queue](https://img.shields.io/badge/Solid_Queue-Rails-CC0000)
![Solid Cache](https://img.shields.io/badge/Solid_Cache-Rails-CC0000)
![Solid Cable](https://img.shields.io/badge/Solid_Cable-Rails-CC0000)
![Testing](https://img.shields.io/badge/Testing-Minitest-00C853)
![Quality](https://img.shields.io/badge/Code_Quality-RuboCop-000000)
![Security](https://img.shields.io/badge/Security-Brakeman-orange)

## Overview

Nostromo is a continuously evolving Rails application used to explore the framework beyond CRUD examples.

The objective is to understand how Rails applications are designed, structured, deployed, tested, secured, and maintained while adopting conventions used in production environments.

Instead of emphasizing a particular business domain, the project focuses on software engineering practices and the capabilities provided by modern Rails.

## Areas of Exploration

- Rails conventions and project organization
- MVC architecture
- Active Record
- Routing and controllers
- View rendering with ERB
- Hotwire (Turbo + Stimulus)
- Background jobs
- Caching
- Action Mailer
- Asset management
- Deployment with Kamal
- Docker-based environments
- Testing with Minitest
- Security and static analysis
- Code quality and linting

## Current Features

- Movie catalog used as a sample domain
- Active Record models and associations
- RESTful controllers
- Server-rendered views
- Responsive application layout
- PWA manifest
- Docker support
- Kamal deployment configuration
- RuboCop, Brakeman and Bundler Audit integration

## Tech Stack

### Backend

- Ruby 3.4
- Ruby on Rails 8
- SQLite
- Active Record

### Frontend

- ERB
- Hotwire
- Turbo
- Stimulus
- Importmap

### Infrastructure

- Docker
- Kamal
- Puma
- Thruster

### Quality

- Minitest
- RuboCop
- Brakeman
- Bundler Audit

## Project Structure

```text
app/
config/
db/
docs/
public/
test/
```

The repository intentionally follows the default Rails conventions while keeping the codebase organized and easy to extend.

## Getting Started

Clone the repository:

```bash
git clone https://github.com/armandomariscal/nostromo.git
cd nostromo
```

Install dependencies:

```bash
bundle install
```

Prepare the database:

```bash
bin/rails db:prepare
```

Start the development server:

```bash
bin/dev
```

## Development Commands

Run tests:

```bash
bin/rails test
```

Run RuboCop:

```bash
bin/rubocop
```

Run Brakeman:

```bash
bin/brakeman
```

Run Bundler Audit:

```bash
bin/bundler-audit
```

## Project Goals

This repository is intended to explore and document modern Rails development, including:

- Framework conventions
- Maintainable project architecture
- Testing strategies
- Secure development practices
- Performance-oriented tooling
- Deployment workflows
- Continuous code quality improvements

As the project evolves, new Rails features and engineering patterns will be incorporated incrementally.

## Status

Active development.

## License

MIT
