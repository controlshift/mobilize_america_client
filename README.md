# MobilizeAmericaClient::Client

[![CI Status](https://github.com/controlshift/mobilize_america_client/actions/workflows/ci.yml/badge.svg)](https://github.com/controlshift/mobilize_america_client/actions/workflows/ci.yml)

A minimalist API client for the [MobilizeAmerica API](https://github.com/mobilizeamerica/api):

## Requirements

- Ruby 3.3, 3.4, or 4.0
- Faraday ~> 2.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mobilize-america-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mobilize-america-client

## Configuration

By default, the client accesses the public production instance without authentication.

`client = MobilizeAmericaClient::Client.new`

It is also possible to provide an API key to the client to make authenticated requests, or to specify
other endpoints.

`client = MobilizeAmericaClient::Client.new(api_key: 'abc123', api_domain: 'staging-api.mobilize.us')`


## Usage

Retrieve a list of organizations
`client.organizations(page: 2, per_page: 50)`

Retrieve a list of an organization's events
`client.organization_events(organization_id: 123)`

Retrieve a specific event
`client.organization_event(organization_id: 123, event_id: 123)`

Retrieve a list of attendances for a specific event
`client.organization_event_attendances(organization_id: 123, event_id: 123)`

Retrieve a list of an organization's attendandes
`client.organization_attendances(organization_id: 123)`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/controlshift/mobilize-america-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MobilizeAmericaClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/controlshift/mobilize-america-client/blob/master/CODE_OF_CONDUCT.md).
