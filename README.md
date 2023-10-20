# Schematic

Schematic is a tool to bootstrap a project that develops and manages schema migration and jobs for a database.

## Setup a Schematic project

First, clone Schematic:

```
git clone https://github.com/metasync/schematic
cd schematic
```

Then, make a new project:

```
make create.project project=test app=sample target=/root/to/projects
```

Now project can be started:

```
cd /root/to/projects/test_sample/docker
make up
```

If MSSQL database is used, development database needs to be created before any development:

```
make shell.dev.db

# Now you get into the shell of the database container
./setup-db.sh
exit
```

Last, you can get into dev container to start your development locally. 

```
make shell.dev
```

## Development features

### List Rake tasks available

Schematic provides a few handy Rake tasks out-of-box:

```
rake -T

rake cipher:decrypt_env_var[env_var]  # Decrypt an environment variable
rake cipher:encrypt[string]           # Encrypt a string
rake cipher:encrypt_env_var[env_var]  # Encrypt an environment variable
rake cipher:generate_keys             # Generate cipher keys
rake db:applied_migration[steps]      # Show a given applied schema migration
rake db:applied_migrations            # Show applied schema migrations
rake db:apply[steps]                  # Apply last n migrations
rake db:clean                         # Remove migrations
rake db:create_migration[name]        # Create a migration file with a timestamp and name
rake db:migrate[version]              # Run migrations
rake db:migration_to_apply[steps]     # Show a given schema migration to apply
rake db:migrations_to_apply           # Show schema migrations to apply
rake db:redo[steps]                   # Redo last n migrations
rake db:reset                         # Remove migrations and re-run migrations
rake db:rollback[steps]               # Rollback last n migrations
rake deploy                           # Run deployment
```

### Create a database migration

After a new project is created, it is most likely to create your database migration before any other development work:

```
rake db:create_migration[create_samples]

New migration is created: /home/app/db/migrations/schematic/20231019015901_create_samples.rb
```

To apply the database migration:

```
rake db:migrate
```

### Configuration management

All project configurations can be maanged under folder `/docker/config`

  * project.env - project wide configurations
  * docker.env - docker container configurations
    * To setup image registry configuration
    * To use newer version of Schematic
    * To use different database adapter (default: MSSQL)
  * cipher.env - cipher configurations
  * secret.env - credential configurations
    * This file will be ignored by Git by default
    * No any credentials should be checked into source repo

### Credential management

Schematic provides handy Rake tasks to protect sensitive credentials like database password. 

First, generate RSA key pairs if it's not done yet:

```
rake cipher:generate_keys

Saving private Key (/home/app/.cipher/schematic.priv) ... done
Saving public key (/home/app/.cipher/schematic.pub) ...done
```

Then, you can encrypt your credentials via environment variables. 

Assume you have setup an environment variable, DEV_DB_PASSWORD, in your secret file `docker/config/secret.env`. 

```
rake cipher:encrypt_env_var[DB_PASSWORD]
Rv1ZR50pW7XAG6/6LNhNM7uAdtz4J0v6jgFcA1bGN/DNOcr......+013DhDuMwRDmUKjyrp9SM6kAnAAxMbKEpSrrCsMIA=
```

Please save the encrypted string (Base64 encoded) to your `docker/config/secret.env`:

```
DEV_DB_PASSWORD_ENCRYPTED=Rv1ZR50pW7XAG6/6LNhNM7uAdtz4J0v6jgFcA1bGN/DNOcr......+013DhDuMwRDmUKjyrp9SM6kAnAAxMbKEpSrrCsMIA=
```

Last, you need to restart your containers to make it effective:

```
make down

make up
```

### Build and push project image

To build the project image for QA after development is done:

```
make build.app.dev
make push.app.dev
```

To build the project image for production when it is ready to go live:

```
make build.app.rel
make push.app.rel
```

## Project folder strcuture

Here is the project folder structure for a sample project:

test-sample
├── docker
│   ├── Makefile
│   ├── Makefile.env
│   ├── build
│   │   ├── Makefile
│   │   ├── Makefile.env
│   │   ├── dev
│   │   │   ├── Dockerfile
│   │   │   ├── Makefile
│   │   │   └── build.env
│   │   ├── rel
│   │   │   ├── Dockerfile
│   │   │   ├── Makefile
│   │   │   └── build.env
│   │   └── shared
│   │       ├── build.env
│   │       └── build.mk
│   ├── cipher.env
│   ├── config
│   │   ├── cipher
│   │   ├── cipher.env
│   │   ├── docker.env
│   │   ├── project.env
│   │   └── secret.env
│   ├── docker-compose.yaml
│   └── mssql
│       ├── database.env
│       ├── docker-compose.yaml
│       └── scripts
│           ├── mssql.sh
│           ├── setup-db.sh
│           └── sql
│               └── setup-db.sql
└── src
    ├── Rakefile
    └── VERSION
