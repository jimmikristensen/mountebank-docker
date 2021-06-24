# Mountebank
Mountebank is an out of process component testing tool for distributed software.

Mountebank is the first open source tool to provide cross-platform, multi-protocol test doubles over the wire. Simply point your application under test to mountebank instead of the real dependency, and test like you would with traditional stubs and mocks.

For more information head over to http://www.mbtest.org/

## Supported `Dockerfile` links
* [`latest`, `2.4.0` (Dockerfile)](https://github.com/jimmikristensen/mountebank-docker/blob/master/Dockerfile)
* [`2.2.1` (Dockerfile)](https://github.com/jimmikristensen/mountebank-docker/blob/2.2.1/Dockerfile)
* [`2.0.0` (Dockerfile)](https://github.com/jimmikristensen/mountebank-docker/blob/2.0.0/Dockerfile)
* [`1.8.0` (Dockerfile)](https://github.com/jimmikristensen/mountebank-docker/blob/1.8.0/Dockerfile)
* [`1.5.1` (Dockerfile)](https://github.com/jimmikristensen/mountebank-docker/blob/1.5.1/Dockerfile)

## jkris/mountebank:latest

Installs the latest version of mountebank and exposes port 2525 ready for
configuration and testing.

Run the following command to run the docker image:

    docker run -p 2525:2525 -d jkris/mountebank

This will start mountebank and expose port 2525, which is the default listening port.
Visit [localhost:2525](http://localhost:2525) for configuration and manual.

If you wish to load your imposters automatically, mount your imposters as a
volume and bind the necessary ports:

```
docker run \
    -v ./imposters:/imposters \
    [-p IMPOSTER_1_PORT:IMPOSTER_1_PORT ...] \
    -p 2525:2525 \
    -d jkris/mountebank \
    --configfile /imposters/imposters.ejs --allowInjection
```

## Docker Compose

This release comes with a docker compose example that uses a _Star Trek API_ imposter stub `stapi_imposter.ejs` generated using Mountebanks `proxyOnce` mode found in the `proxy_imposter.ejs` proxy imposter example.

The docker-compose.yml file looks like this:

```
version: "3"
services:
  mountebank:
    container_name: mountebank
    image: jkris/mountebank:latest
    volumes:
    - ./imposters:/imposters
    ports:
    - 2525:2525
    - 8090:8090
    command: --configfile /imposters/imposters.ejs --allowInjection
```

It mounts the volume containing the imposters `./imposters:/imposters` and uses the _root_ `imposters.ejs` as the config file.

Another imporatnt thing to remember is to open the correct ports. Port `2525` is for Mountebank management page. Because I have defined the imposter to use port `8090` I have opened that as well:

```
{
    "port": 8090,
    "protocol": "http",
    "stubs": [
    ...
```

### Try it out

Run:

```
docker-compose up -d
```

Then run the following to see the imposter in action.

```
curl -X GET http://localhost:8090/api/v1/rest/series/search
```

### Hint

Try changing the `wait` behavior in the `stapi_imposter.ejs` file to increate the latency of the response.