assumes that files are in a folder:
```
~/.workspace-changed/
```


compile with:
```
gcc -O2 -DWNCK_I_KNOW_THIS_IS_UNSTABLE -o wschanged `pkg-config --cflags libwnck-3.0` wschanged.c `pkg-config --libs libwnck-3.0`
```
