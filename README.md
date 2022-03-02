# EmailDebugger

Setup

  * Install docker and phoenix
  * Build docker container with `docker-compose build`
  * Run setup commant with `docker-compose run web sh -c 'mix do deps.get, deps.compile && cd assets && yarn install'`
  * Run docker container with `docker-compose run --rm --service-ports web sh`

To start your Phoenix server:

  * Run docker container with `docker-compose run --rm --service-ports web sh`
  * Start Phoenix endpoint with `iex -S mix phx.server` or `mix phx.server`

Now you can visit [`localhost:4000/email-debugger`](http://localhost:4000/email-debugger) from your browser.
