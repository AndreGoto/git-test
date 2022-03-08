# Octo Events

Octo Events is an application that listens to Github Events via webhooks and expose by an api for later use.

## Dependecies

- ruby 3.1.0
- rails 7.0.2.2
- bundler
- postgres

### Setup Github with webhooks
- https://docs.github.com/en/developers/webhooks-and-events/webhooks/about-webhooks

### Generate a token
- ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'

### Set an ENV with the genrated token
```
export SECRET_TOKEN=7487258d4aae187f087b8d161230fd52eec203f8a
```

## Running Application

### Install dependencies
```
bundle install
```

### Setup database
```
rails db:create && rails db:migrate
```

### Start application
```
rails s
```

## Running tests
```
rspec
```
