# WP Docker Dev

The purpose of this repository is to get up and running quickly for local development of themes and plugins. By default, the `wp-content` directory will be linked to a local `src` directory in the root of this project after build time.

## Setup (from the root)

1. After cloning the repository run `cp .env.example .env`
2. Change the values in the .env as needed and delete the `SRC_PATH` line if not wanted
3. Run `./docker/init/all.sh` to create the ssl certificates and `/etc/hosts` line
4. Run `docker compose up -d --build`
5. Navigate via https to the value of `DOMAIN` in the `.env` and enjoy!

### Source path specifics

In `docker-compose.yml` you'll notice that both the `nginx` and `wordpress` services have a volume that is identical by default:

`- ${SRC_PATH:-./src}:/var/www/html/wp-content`

When you want to work on a specific theme or plugin, simply add that specific path to the end like `/themes/mytheme` or `/plugins/myplugins`.

### Usage

Of course, there are many ways you can choose to go about managing and origanizing your src paths via docker while having multiple plugins and themes in one repository, but the inital intention was to manage one at a time each with it own cloned version of this `wp-docker-dev` repository. This way you can focus your concerns strictly on the plugin or theme that is primarily in development.

Another usage option is to keep a separate source path outside of this directory and just point to that while this repository provides a running container for development. This would likely be ideal for when it is not desirable to distribute containerization with source.

Whatever the case may be, this is mostly boiler plate to begin working on WordPress features quickly.
