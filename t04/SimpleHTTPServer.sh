docker run -d --rm --name simple_http --publish 8000:8000 -v "$PWD":/usr/src/myapp -w /usr/src/myapp python python3 server.py
