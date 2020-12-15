# Salaries
[![jesse-spevack](https://circleci.com/gh/jesse-spevack/salaries.svg?style=shield)](https://app.circleci.com/pipelines/github/jesse-spevack/salaries) [![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

An application for anonymously sharing salary information within the Turing community.

## Visit Salaries
Salaries is currently viewable at [https://secret-earth-99752.herokuapp.com/](https://secret-earth-99752.herokuapp.com/)

## Project Philosophy
The opacity of salary data in the web development industry adversely affects developers who take non traditional routes into the industry and in particular folks from traditionally under-represented groups in tech, such as women, people of color, and people identifying as LGBTQ.

The Turing School of Software Design has a mission to:
> Unlock human potential by training a diverse and inclusive student body to succeed in high fulfillment careers.

We believe that a small part of achieving that mission involves sharing salary data within the Turing community. While salary information has been available in a variety of forms for years, this project is an attempt to systematize the process.

## Project Road Map
We are currently working to produce an MVP defined [here](https://github.com/jesse-spevack/salaries/projects/1). The key features of the MVP include:
- Turing slack login
- Anonymous users can create multiple salary records

Subsequent projects will be scoped to give users the ability to submit granular demographic, job title, industry and company information as well as the ability to view salary data by each of those indicators.

## Technology
This project proudly uses:
[Ruby on Rails](https://rubyonrails.org/)
[Stimulus](https://stimulusjs.org/)
[Heroku](https://www.heroku.com/)

## Contributing
Follow the steps below to setup salaries locally

### System Requirements
- Ruby 2.7.2
  ```bash
  # assuming you already have homebrew installed
  $ brew update && brew upgrade ruby-build
  $ rbenv install 2.7.2
  $ rbenv local 2.7.2 # set the Ruby version for the current directory
  $ ruby -v # double check that the Ruby version was successfully changed to 2.7.2
  ```
- Rails 6.1.0
- PostgreSQL
  - Download latest version of [Postgres.app](https://postgresapp.com/downloads.html)
  - Install the [CLI tools](https://postgresapp.com/documentation/cli-tools.html)
  - Optional: install [Postico](https://eggerapps.at/postico/), a PostgreSQL GUI  

_Rails and other gem dependencies will be automatically installed by Bundler._



### Local Setup
```bash
$ git clone https://github.com/jesse-spevack/salaries.git
$ cd salaries
$ gem install bundler # if working with ruby version below 2.7.1
$ bundle install
$ rails db:{create,migrate} # configure dev and test databases
$ yarn
$ bundle exec rspec # run tests
$ bundle exec standardrb --format progress # run standard ruby linter
$ rails s # run local server to check that app can successfully launches
# ctrl + c shuts down local server
```

We welcome contributions in the form of feature development and copy writing. If you have an idea for how to improve this application, please create an issue.

## Troubleshooting tips

- In case `Webpacker can't find application.js` run:
```bash
rm -rf node_modules
rails assets:clobber
yarn
rails assets:precompile
```

- If you run into the following macOS 11.0 error when updating homebrew and rbenv:
```bash
Error: Your CLT does not support macOS 11.0.
It is either outdated or was modified.
Please update your CLT or delete it if no updates are available.
Error: An exception occurred within a child process:
  SystemExit: exit
```

  Run the following commands:
  ```bash
  $ sudo rm -rf /Library/Developer/CommandLineTools
  $ sudo xcode-select --install
  # `brew update && brew upgrade ruby-build` should now run successfully
  ```
