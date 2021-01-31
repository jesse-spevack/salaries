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

## User Anonymity
Many people are uncomfortable sharing their salaries, but feel less averse to providing that information anonymously. For that reason, we take the following steps to ensure user anonymity.
1. Users authenticate using Turing Slack, which ensures that only members of the Turing community can use this application.
2. The only data returned to this app through the slack authentication process we touch is the user's `slack_id`. We do not look at any other data returned via the oauth request flow.
3. Rather than saving the slack_id to our database, and thus undermining the goal of preserving anonymity, we hash the slack_id using a one way, deterministic hashing algorithm. It is not possible to get back to the user's `slack_id` from the hashed version in our database. For more information we encourage you to review this [pr](https://github.com/jesse-spevack/salaries/pull/37).

## Project Road Map
We are currently working to produce an MVP defined [here](https://github.com/jesse-spevack/salaries/projects/1). The key features of the MVP include:
- Turing slack login
- Anonymous users can create multiple salary records

Subsequent projects will be scoped to give users the ability to submit granular demographic, job title, industry and company information as well as the ability to view salary data by each of those indicators.

## Technology
This project proudly uses:
- [Ruby on Rails](https://rubyonrails.org/)
- [Stimulus](https://stimulusjs.org/)
- [Heroku](https://www.heroku.com/)

## Contributing
Follow the steps below to setup salaries locally

### System Requirements
- Ruby 3.0.0
  ```bash
  # assuming you already have homebrew installed
  $ brew update && brew upgrade ruby-build
  $ rbenv install 3.0.0
  $ rbenv local 3.0.0 # set the Ruby version for the current directory
  $ ruby -v # double check that the Ruby version was successfully changed to 3.0.0
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
$ gem install bundler # if working with ruby version below 3.0.0
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
