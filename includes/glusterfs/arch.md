A gluster volume is a collection of servers belonging to a trusted storage pool.

-   _Distributed volume_ (default) files are distributed across servers but do not exist in more than one server.
-   _Replicated volume_ create replicas of files across servers, thus necesitating at least two bricks.
-   _Distributed replicated volume_ combines features of both distributed and replicated volumes

A _brick_ is the basic unit of storage in GlusterFS, combining a server name with an export directory in the following format: `SERVER:/path/to/export`

At a low level, _translators_ intercept and modify client requests.
