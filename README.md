# docker-confv

Sample Docker volume setup for your `/etc/confd` files.


## Usage

Setup your `confd` instructions/templates into `./etc/confd/conf.d` and 
`./etc/confd/templates` respectively.

---

Build the `confv` image.

    docker build -t confv .

---

Run the image to get the volume.

    docker run -v /etc/confd --name sample-confv confv

*You won't want to `--rm` here.*

    $ docker ps -a
    CONTAINER ID   IMAGE    COMMAND    CREATED           STATUS                       PORTS    NAMES
    187c6582ecc8   confv    "/nop"     29 minutes ago    Exited (0) 29 minutes ago             sample-confv

---

Mount the volume onto your `confd` container.

    docker run --volumes-from=sample-confv --rm --name confd \
        confd -interval 60 -node $(echo $ETCDCTL_ENDPOINT | sed 's/,/ /g')

