# Development

**This app is using Phoenix 1.6.# and Elixir 1.12.2**.

## Table of contents

- [Tech stack](#tech-stack)
- [Notable opinions and extensions](#notable-opinions-and-extensions)
- [Running this app](#running-this-app)
- [Additional resources](#additional-resources)
  - [Learn more about Docker and Phoenix](#learn-more-about-docker-and-phoenix)
  - [Deploy to production](#deploy-to-production)


## Tech stack

Chosen for a multitude of reasons.

### Back-end

- [SQLite3](https://www.sqlite.org/)

### Front-end

- [TailwindCSS](https://tailwindcss.com/)
- [Heroicons](https://heroicons.com/)


## Notable opinions and packages

Phoenix is a healthy mix of being both opinionated and unopinionated.
Here's a few note worthy additions and changes.

- **Static analysis and testing**:
    - *[credo](https://github.com/rrrene/credo)* helps create more consistent code
    - *[excoveralls](https://github.com/parroty/excoveralls)* for getting detailed test coverage reports
- **Controllers**:
    - Add `page` controller to render a `/` page and `/up` health check endpoint
- **Config**:
    - The `.env` file stores all environment variables
    - The `.iex.exs` file for IEX tweaking
    - Put prod config settings with environment variables in `config/runtime.exs` (works with releases)
- **Phoenix defaults that are changed**:
    - Cookies are encrypted see `lib/granite_web/endpoint.ex`
    - `.formatter.exs` has been configured to use 80 character line lengths
    - The project was generated with `--binary-id` for long, but safer ids

- **Front-end assets**:
    - Phoenix 1.6 uses `ESBuild`

## Running this app

You also need Elrang and Elixir installed. Check [mix.exs](mix.exs) for appropriate version requirements.

#### Clone this repo anywhere you want and move into the directory

```sh
git clone https://github.com/colindensem/granite granite
cd granite
```

#### Copy a the example files because the real files are git ignored

```sh
cp .env.example .env
cp .iex.exs.example .iex.exs
```

#### Build everything

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

#### Open the application in a browser:

Visit <http://localhost:4000> in your browser.


#### Formatting your code base:

```sh
# You can check to see if any code is not formatted correctly.
mix format --check-formatted

# You can also auto-fix any malformed code (both commands call mix format).
mix format
```

#### Analysing your code base:

```sh
# You should get a report back saying there's no issues.
mix credo
```

#### Running the test suite:

```sh
# You should see all passing tests. Warnings are typically ok.
mix test

# You can also get test coverage by running coveralls.
MIX_ENV=test mix coveralls

# You can also watch for changes and run tests as you go.
mix test.watch
```

### `.env`

This file is ignored from version control so it will never be commit. There's a
number of environment variables defined here that control certain options and
behaviour of the application. Everything is documented there.

Feel free to add new variables as needed. This is where you should put all of
your secrets as well as configuration that might change depending on your
environment (specific dev boxes, CI, production, etc.).

## Seen something you want to improve/change?

If you see anything that could be improved please open an issue or start a PR.
Any and all help is much appreciated!

### Learn more about Docker and Phoenix

#### Official documentation

- <https://docs.docker.com/>
- <https://hexdocs.pm/phoenix/Phoenix.html>
