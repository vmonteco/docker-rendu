#/bin/zsh

docker build -t dockerception .

docker run --privileged -ti --rm dockerception zsh