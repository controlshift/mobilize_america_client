# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-11

### Breaking Changes
- Now requires Faraday 2.x (previously supported Faraday 1.x)
- Dropped support for Ruby versions older than 3.3. Officially supported versions are Ruby 3.3, 3.4, and 4.0.

### Added
- `ServerError` exception class for 500-599 status codes
- `ClientError` exception class for 400-499 status codes (except 401/404)
- Comprehensive test coverage for all error scenarios (401, 404, 400, 422, 500, 503)

### Removed
- Removed juwelier dependency and tasks

## [0.5.1] - Previous release

(Previous changelog entries would go here)
