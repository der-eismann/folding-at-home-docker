# folding-at-home-docker

Docker container for running [Folding@Home](https://foldingathome.org/)

## Usage

```bash
docker run --rm -it -p 36330:36330 eismann/folding-at-home:latest \
    --user=eismann --team=70335
```

You can send remote commands via port `36330`.
