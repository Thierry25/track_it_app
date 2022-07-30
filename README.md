# TrackIt App

Web application for TrackIt system that allows accounts within an organization to collaborate on projects and share issues regarding a project.

Please also note the Web API that it uses: https://github.com/Thierry25/track_it

## Install

Install this application by cloning the _relevant branch_ and use bundler to install specified gems from `Gemfile.lock`:

```shell
bundle install
```

## Test

This web app does not contain any tests yet :(

## Execute

Launch the application using:

```shell
rake run:dev
```

The application expects the API application to also be running (see `config/app.yml` for specifying its URL)
