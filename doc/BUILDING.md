Compiling "sunxi-fel" on Windows in cygwin:

```
PKG_CONFIG_PATH=/usr/i686-w64-mingw32/sys-root/mingw/lib/pkgconfig/ make CC=i686-w64-mingw32-gcc EXTRA_CFLAGS="-static -lws2_32" sunxi-fel
```
