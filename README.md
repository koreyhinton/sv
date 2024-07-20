# Separated Value store

The sv command starts a bash process that provides a cli for editing csv files

- requires [dot-ns](https://github.com/koreyhinton/dot-ns)

## start a sv (bash) shell session

```sh
export PATH="${PATH}:${PWD}"
sv
```

## run commands in a sv session

### add a record

```sh

# Run the 'add' command

sv_sep=,
sv_book_name=Beowulf
sv_book_author=Anonymous
sv_file=books/poems.csv

. ns run add

cat "$sv_file"
```

```
book_author,book_name
Anonymous,Beowulf
```

### other commands

tbd
