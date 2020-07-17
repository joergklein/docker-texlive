# Docker base image for TEX-Live "Full"

LaTeX is a shortening of Lamport TeX) is a document preparation system. When
writing, the writer uses plain text as opposed to the formatted text found in
WYSIWYG word processors like Microsoft Word, LibreOffice Writer and Apple Pages.
The writer uses markup tagging conventions to define the general structure of a
document (such as article, book, and letter), to stylise text throughout a
document (such as bold and italics), and to add citations and cross-references.
A TeX distribution such as TeX Live is used to produce an output file (such as
PDF or DVI) suitable for printing or digital distribution.

[joergklein/texlive][1] is a [Docker][2].base image in CI builds for document
authoring systems.

[1]: https://hub.docker.com/r/joergklein/texlive
[2]: https://docker.com

Documentation: https://www.tug.org/texlive/

## Pull the image

`docker pull joergklein/texlive`

## Build the image

```sh
git clone https://github.com/joergklein/docker-texlive.git
cd docker-texlive
Notice: building it's a very long process
docker build -t texlive .
```

## Make comands

```sh
make pull    # pull the docker container from the prebuilt public image
make build   # build the image from this GitHub repository. long process
make shell   # allows you to interact with the container
make run     # run the container and then destroys it
make start   # start the container
make stop    # stop the container
make rm      # remove the container and free disk space
```
