build:
	podman build --rm --force-rm -t localhost/ide-zettlr .
run:
	podman rm -f zettlr || true
	podman run --rm -it --shm-size=1024m --name=zettlr -v /tmp/.X11-unix:/tmp/.X11-unix -v ./notes:/home/user/notes -e DISPLAY=unix${DISPLAY} localhost/ide-zettlr
