Lattice
=======

Lattice is a pervasively multithreaded web framework for Ruby which makes
building realtime web applications with WebSockets simple and fun. It's
built on the following primitives:

* Resources: the main glue type between Lattice and the web, resources provide
  an HTTP endpoint for interacting with entities in the system. Resources are
  in fact a special type of component, one which forms an entry point into the
  system.

* Components: data dependencies of resources (or resources themselves).
  Components are inherently multithreaded and computed in parallel. Somewhat
  analogous to "models" in frameworks like Rails, components are the natural
  abstraction Lattice provides for subdividing the work needed to compute a
  representation of a particular resource, and are where things like database
  interactions and additional queries to external services should take place.
  Components map data dependencies into "slots" which can be used by renderers
  to compute representations of data within the system.

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