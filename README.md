# WP Docker Dev

The purpose of this repository is to get up and running quickly for local development of themes and plugins. By default, the `wp-content` directory will be linked to a local `src` directory at the root of this project after build time.

## Setup (from the root)

1. After cloning the repository, run `cp .env.example .env`.
2. Change the values in the `.env` file as needed and delete the `SRC_PATH` line if not wanted.
3. Run `./docker/init/all.sh` to create the SSL certificates and `/etc/hosts` line.
4. Run `docker-compose up -d --build`.
5. Navigate via HTTPS to the value of `DOMAIN` in the `.env` file and enjoy!

### Source Path Specifics

In `docker-compose.yml`, you'll notice that both the `nginx` and `wordpress` services have a volume that is identical by default:

`- ${SRC_PATH:-./src}:/var/www/html/wp-content`

When you want to work on a specific theme or plugin, simply add that specific path to the end, such as `/themes/mytheme` or `/plugins/myplugin`.

### Folder Structure

- `docker` - Stores all of the service and init scripts related to bringins up a container.
- `docker/db` - The data from the database is store here and is created after build. It is ignored and not needed, but good to know where the database will be.
- `docker/certs` - SSL certs will be created here upon running `./docker/init/all.sh`. It is ignored, but worth noting where the certificates are.

### Usage

Of course, there are many ways you can choose to go about managing and organizing your src paths via Docker while having multiple plugins and themes in one repository, but the initial intention was to manage one at a time, each with its own cloned version of this `wp-docker-dev` repository. This way, you can focus your concerns strictly on the plugin or theme that is primarily in development.

Another usage option is to keep a separate source path outside of this directory and just point to that, while this repository provides a running container for development. This would likely be ideal for when it is not desirable to distribute containerization with source.

Whatever the case may be, this is mostly boilerplate to begin working on WordPress features quickly.
