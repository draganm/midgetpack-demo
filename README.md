# Midgetpack encyption of Golang binaries

This is a demonstration of using a modified [Midgetpack]( https://github.com/draganm/midgetpack) to encrypt Golang binaries to be used with Docker.

Build and encrypt the demo application use
```bash
  docker build --build-arg KEY=abc -t encrypted .
```


Once build, the application can be started with

```bash
  docker run -e BP=abc encrypted
```

For more information check my blog post.
