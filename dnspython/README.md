# dnspython
[dnspython](https://github.com/rthalley/dnspython) inside a docker container

## Usage

### Configuration

* Define your script in a file and mount to `/script/script.py`.

See the [example](./example) to get started.

## Build and run 
```bash
docker build . -t dnspython
docker run --rm \
      -v "$(pwd)/example/script.py:/script/script.py" \
      dnspython
```

## Uses
[![](https://img.shields.io/badge/code-rthalley%2Fdnspython-blue.svg)](https://github.com/rthalley/dnspython "Code repo")
