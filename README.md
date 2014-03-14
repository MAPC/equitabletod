### equitableTOD

A web application to display Equitable TOD (ETOD) scores, which measure how well transit-oriented development is oriented toward core riders and transit-dependent citizens.

More information on ETOD at [the Dukakis Center][pdf].

[pdf]: http://www.northeastern.edu/dukakiscenter/wp-content/uploads/2013/10/A-Rating-System-for-Equitable-TOD-RailVolution-2013.pdf



## Setting up for development

__These instructions are for [*NIX][nix] environments only. All commands are run in Terminal.__ If you have questions, email mcloyd at mapc dot org.

Make sure you have installed [rvm][rvm]. If not, do so. Make sure to follow the instruction at the end of the installation, regarding running a command that starts with `source`.

If you have not done so yet, install Ruby 2.0.0.

```sh
rvm install 2.0.0
```

Once you have installed Ruby 2.0.0, make and use a gemset for the site.

```
rvm gemset use etod --create
```

Fork the repository by clicking the Fork button at the top of the [the repo page](https://github.com/MAPC/equitabletod).

Clone your fork of the repository from GitHub and cd into it.

```sh
git clone git@github.com:<your-github-username>/equitabletod.git
cd equitabletod
```

Install all the gems by running.

```
bundle install
```

Then, assuming you have Postgres installed, run `rake db:migrate` to set up the database.


You can put a backup into the database by running `pg_restore -d newdb db/fixtures/backup.dump`.

Or, put fake sample data into the database by running `rake db:seed`.

When you are ready to run the server, run `rails s` (short for `rails server`).



## Check that it's working

Point your browser to `http://localhost:3000`. You should see a sample page.

Go to `http://localhost:3000/station_areas.json`. You should see a collection of JSON objects representing station areas.

Go to `http://localhost:3000/station_areas/1.json`. You should see a single JSON object.



## Developing

The `master` branch is to be used only for production. Develop on your own branch off of the `develop` branch.

So, if you are beechnut, before you start working, do:

```sh
git checkout develop
git checkout -b <my-branch-name>
```

Then start working and commit your changes there.

```sh
git add .
git commit -m "Your commit message here"
```

[nix]: http://en.wikipedia.org/wiki/Unix-like
[rvm]: http://rvm.io/rvm/install