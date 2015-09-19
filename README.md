# Logleaks

Dead simple memory logging for rack apps. Because you already have a logging solution setup
and you just want to include per request memory statistics in them.

This is intended to be used in production mode. It will log rss memory usage before and after
every request so, actions/requests that leak memory may be indentified.

After identifying troublesome areas in production, a tool like ruby-prof may be required to
deep dive into the issue in development mode.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logleaks'
```

And then execute:

    $ bundle

## Usage

Add in your apps middleware

```
require 'logleaks/middleware'
use Logleaks::Middleware, logger: Rails.logger
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/logleaks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
