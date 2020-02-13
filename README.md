### Information Station
A web application to display Equitable TOD (ETOD) scores, which measure how well transit-oriented development is oriented toward core riders and transit-dependent citizens.

More information on ETOD at [the Dukakis Center](http://www.northeastern.edu/dukakiscenter/wp-content/uploads/2013/10/A-Rating-System-for-Equitable-TOD-RailVolution-2013.pdf).

## Development
Due to the fact that Ruby 2.0.0 is no longer supported, development of this app on MacOS is currently run through [Docker Compose](https://docs.docker.com/compose/). Docker was configured by following [this tutorial](https://docs.docker.com/compose/rails/).

There is a race condition between the database and web containers when you run `docker-compose up`. You can avoid this race condition by uncommenting [entrypoint.sh:7-12](https://github.com/MAPC/equitabletod/blob/master/bin/entrypoint.sh#L7-L12). You will need to initialize the db container with seed data. If you already have docker-compose available on your system the basic start-up is as follows:

```sh
docker-compose build
docker-compose run web rake db:create
docker-compose run web pg_restore -h db -U postgres -d equitabletod_development db/fixtures/backup.dump
docker-compose up
```

## Check that it's working

* Point your browser to `http://localhost:3000`. You should see a sample page.
* Go to `http://localhost:3000/station_areas.json`. You should see a collection of JSON objects representing station areas.
* Go to `http://localhost:3000/station_areas/1.json`. You should see a single JSON object.

## Production Deployment
Since Heroku no longer supports Ruby 2, we now deploy to Heroku using a Docker strategy. A basic deployment to a new heroku container can be

```sh
heroku create
heroku stack:set container
git push heroku master
```
