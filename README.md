# Logleaks

Dead simple memory logging for rack apps. Because you already have a logging solution setup
and you just want to include per request memory statistics in them.

This is intended to be used in production mode. It will log rss memory usage before and after
every request so, actions/requests that leak memory may be indentified.

After identifying troublesome areas in production, a tool like ruby-prof may be required to
deep dive into the issue in development mode.

This was developed for use with the Unicorn server, but should work for any rack based server.

```
Started GET "/" for 127.0.0.1 at 2015-09-19 03:11:45 +0100
Processing by SiteController#home as HTML
  ...
Completed 200 OK in 342ms (Views: 274.4ms | ActiveRecord: 14.1ms)

Request rss memory for process 49449: before: 185704448.0 (177.1015625 MB), after: 211513344.0 (201.71484375 MB), difference: 25808896.0 (24.61328125 MB)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logleaks'
```

And then execute:

    $ bundle

## Usage

Add to your application's middleware. Usually `config.ru`.

```
require 'logleaks/middleware'
use Logleaks::Middleware, logger: Rails.logger
```

## Testing

We use minitest. `bundle exec rake` to run.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/logleaks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
