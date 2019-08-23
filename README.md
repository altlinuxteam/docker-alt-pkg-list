# Build

```sh
docker build -t alt-pkg-list .
```

# Run

```sh
docker run [ -e REPO_URL=http://mirror.yandex.ru/altlinux/Sisyphus ] [ -e ARCH=x86_64 ] \
             -e PKG_LIST="pkg_names" alt-pkg-list
```
