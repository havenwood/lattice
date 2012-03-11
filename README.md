![Lattice](https://github.com/celluloid/lattice/raw/master/logo.png)
==========
[![Build Status](https://secure.travis-ci.org/celluloid/lattice.png?branch=master)](http://travis-ci.org/tarcieri/lattice)

Lattice is a pervasively multithreaded web framework for Ruby which makes
building realtime web applications with WebSockets simple and fun. It's
built on the following primitives:

* Resources: the main glue type between Lattice and the web, resources provide
  an HTTP endpoint for interacting with entities in the system. Resources are
  in fact a special type of component, one which forms an entry point into the
  system.

* Cells: Lattice's go-to domain model object. Cells represent data dependencies
  of resources, or are resources themselves. Every Cell is a Cellulid actor, 
  which makes them multithread and allows them to compute in parallel on modern
  Ruby interpreters such as JRuby and Rubinius which don't have a Global
  Interpreter Lock preventing concurrent execution of Ruby code. Cells map data
  dependencies into "slots" which can be used by renderers to compute
  representations of data within the system.

* Renderers: translate data within the system, as fetched by components, into
  a requested representation. Renderers handle the specifics of dynamically
  constructing output documents from components. Lattice comes with renderers
  that understand various template languages.

* Sockets: WebSocket connections back to individual clients. Lattice makes it
  simple to send and receive messages from any part of a distributed system,
  including background jobs.

Copyright
---------

Copyright © 2011 Tony Arcieri. See LICENSE.txt for further details.
