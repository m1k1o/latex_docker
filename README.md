# latex_docker
Generating PDF from TeX file in Docker container.

# Build

You can build default Dockerfile like this:
```
docker build --tag latex_docker .
```

Or you can choose custom Dockerfile:
```
docker build --file Dockerfile.full --tag latex_docker .
```

## Dockerfile
Performs `texlive` installation, about 240 MB. 

## Dockerfile.full
Performs `texlive-full` installation, about 4714 MB.

## Dockerfile.iso690
TeX settings and `czechslovak` language packages including `iso690` citation as it is required form in many Czech and Slovak universities.

# Run

Mounting point for volume is `/project`.
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	latex_docker \
		--help
```

## Examples

If you have your project in `/home/user/doc` and your TeX file is `index.tex`, you can run it like this:
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	latex_docker
```

Setting custom options:
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	latex_docker \
		--input first-page.tex \
		--output custom.pdf \
		--clear \
		--biber
```