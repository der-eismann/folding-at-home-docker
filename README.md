# folding-at-home-docker

Docker container for running [Folding@Home](https://foldingathome.org/)

## Usage

```bash
docker run --rm -it -p 7396:7396 -v /home/sysop/fah-data:/data
    eismann/folding-at-home:latest --user=eismann --team=70335 --power=full
```

The web interface is accessible in your browser via [http://localhost:7396](http://localhost:7396).
