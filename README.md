# latex_docker
Generating PDF from TeX file in Docker container.

# Run

Mounting point for volume is `/project`.
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	m1k1o/latex \
		--help
```

Available options are:
```
entrypoint.sh [-h] [-i index] [-o index] [-s] [-b] [-c]

where:
        -h, --help
                Display this help.

        -i, --input
                Set input TeX file (default ./index).
                File must be .tex extension.

        -o, --output
                Set output PDF file (default is same as input).

        -s, --silent
                Won't display anything.

        -b, --biber
                Run biber as well.

        -c, --clear
                Clear all temporary files.

(c) 2019 by m1k1o
```

# Build

You can build default Dockerfile like this:
```
docker build --tag m1k1o/latex:latest .
```

Or you can choose custom Dockerfile (listed below):
```
docker build --file Dockerfile.full --tag m1k1o/latex:full .
```

## Dockerfile
Performs `texlive` installation, about 240 MB. Available from docker hub as `m1k1o/latex:latest`.

## Dockerfile.full
Performs `texlive-full` installation, about 4714 MB. Available from docker hub as `m1k1o/latex:full`.

## Dockerfile.iso690
TeX settings and `czechslovak` language packages including `iso690` citation as it is required form in many Czech and Slovak universities. Available from docker hub as `m1k1o/latex:iso690`.

## Examples

Using **iso690**: If you have your project in `/home/user/doc` and your TeX file is `index.tex`, you can run it like this:
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	m1k1o/latex:iso690
```

Using **full**: Setting custom options:
```
docker run \
	--rm \
	--volume /home/user/doc:/project \
	m1k1o/latex:full \
		--input first-page.tex \
		--output custom.pdf \
		--clear \
		--biber
```
