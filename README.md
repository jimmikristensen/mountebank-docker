# Mountebank
Mountebank is an out of process component testing tool for distributed software.

Mountebank is the first open source tool to provide cross-platform, multi-protocol test doubles over the wire. Simply point your application under test to mountebank instead of the real dependency, and test like you would with traditional stubs and mocks.

For more information head over to http://www.mbtest.org/

## Supported `Dockerfile` links
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

    docker run \
        -v ./imposters:/imposters \
        [-p IMPOSTER_1_PORT:IMPOSTER_1_PORT ...] \
        -p 2525:2525 \
        -d jkris/mountebank \
        --configfile /imposters/imposters.ejs --allowInjection