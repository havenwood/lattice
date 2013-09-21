![Lattice](https://github.com/celluloid/lattice/raw/master/logo.png)
==========
[![Gem Version](https://badge.fury.io/rb/lattice.png)](http://rubygems.org/gems/lattice)
[![Build Status](https://secure.travis-ci.org/celluloid/lattice.png?branch=master)](http://travis-ci.org/celluloid/lattice)
[![Code Climate](https://codeclimate.com/github/celluloid/lattice.png)](https://codeclimate.com/github/celluloid/lattice)
[![Coverage Status](https://coveralls.io/repos/celluloid/lattice/badge.png)](https://coveralls.io/r/celluloid/lattice)
[![Dependency Status](https://gemnasium.com/celluloid/lattice.png)](https://gemnasium.com/celluloid/lattice)

Lattice is an actor-based web framework for Ruby built on top of
[Celluloid][celluloid], [Reel][reel], and [Webmachine][webmachine]. Designed
from the ground up for realtime applications, end-to-end streaming, and
Websockets, Lattice provides solutions to some of the biggest pain points in
web application development today.

[celluloid]: https://github.com/celluloid/celluloid/
[reel]: https://github.com/celluloid/reel
[webmachine]: https://github.com/seancribbs/webmachine-ruby/

## Features

* **Resources**: the main glue type between Lattice and the web, resources
  provide an HTTP endpoint which interfaces with other entities in the system.
  Lattice uses [Webmachine][webmachine] as its base for its resource framework.

[webmachine]: https://github.com/seancribbs/webmachine-ruby

## Vaporware Features (Coming Soon™!)

* **Cells**: Lattice's go-to domain model object. Cells represent data
  dependencies of resources, or are resources themselves. All Cells are
  Celluloid actors and run in parallel. Cells map data dependencies into "slots"
  which can be computed in parallel while resources are rendering.

[futures]: https://github.com/celluloid/celluloid/wiki/futures
[decent_exposure]: https://github.com/voxdolo/decent_exposure

* **Renderers**: translate data within the system, as fetched by cells, into
  a requested representation. Renderers handle the specifics of dynamically
  constructing output documents from components. Lattice comes with renderers
  that understand various template languages.

* **WebSockets**: WebSocket connections back to individual clients. Lattice
  makes it simple to send and receive messages from any part of a distributed
  system, including background jobs.

Usage
-----

Lattice provides a Rails-like experience for getting you up-and-running.

First, install the Lattice gem:

```
$ gem install lattice
```

Now create a new Rails app using the Lattice command line appliaction:

```
$ lattice new my_app
```

Unlike Rails we don't automatically run Bundler for you. You'll have to do
that yourself:

```
$ cd my_app
$ bundle
```

Your new Lattice app is ready to go!


Copyright
---------

Copyright © 2013 Tony Arcieri. Distributed under the MIT license.
See LICENSE.txt for further details.
