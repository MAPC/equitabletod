# tstation.info
A web application to display Equitable TOD (ETOD) scores, which measure how well transit-oriented development is oriented toward core riders and transit-dependent citizens.

More information on ETOD at [the Dukakis Center](http://www.northeastern.edu/dukakiscenter/wp-content/uploads/2013/10/A-Rating-System-for-Equitable-TOD-RailVolution-2013.pdf).

## Development
Due to the fact that Ruby 2.0.0 is no longer supported, development of this app on MacOS is currently run through [Docker Compose](https://docs.docker.com/compose/). Docker was configured by following [this tutorial](https://docs.docker.com/compose/rails/).

There is a race condition between the database and web containers when you run `docker-compose up`. You can avoid this race condition by uncommenting [entrypoint.sh:7-12](https://github.com/MAPC/equitabletod/blob/master/bin/entrypoint.sh#L7-L12). You will need to initialize the db container with seed data. If you already have docker-compose available on your system the basic start-up is as follows:

```sh
docker-compose build
docker-compose run web rake db:create
docker-compose run web pg_restore -h db -U postgres -d equitabletod_development db/fixtures/etod.dump
docker-compose up
```

## Check that it's working

* Point your browser to `http://localhost:3000`. You should see a sample page.
* Go to `http://localhost:3000/station_areas.json`. You should see a collection of JSON objects representing station areas.
* Go to `http://localhost:3000/station_areas/1.json`. You should see a single JSON object.

## Heroku set up and Deploy to Production Comments
I think this is correct. I have only been able to do this twice, so next time I will update in case there is something I missed.
Read this first to familiarize yourself with the process https://devcenter.heroku.com/articles/git#for-an-existing-heroku-app
Make sure you have a login to Heroku and are set up as user on the etod instance in Heroku.
Also make sure you have install Heroku CLI via Brew
```brew tap heroku/brew && brew install heroku```
If you use zsh-oh-my the install is a little different that the zsh or the bash versions
https://docs.brew.sh/Shell-Completion
Load up your ssh keys into Heroku
```heroku keys:add --yes```
Clone the heroku version of the git code
```heroku git:clone -a etod```
Apply your changes to the above code base which is different from the code base of this read me, however they are the same.
Do your git add and commit.
Then run
```git push heroku master```
And skip the deploy below.


## Production Deployment
Since Heroku no longer supports Ruby 2, we now deploy to Heroku using a Docker strategy. A basic deployment to a new heroku container can be

```sh
heroku create
heroku stack:set container
git push heroku master
```
