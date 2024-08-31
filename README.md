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

### load a record into sv_ variables

Now you will load the record previously added to the csv file.

Close your existing session by typing 'exit' and then start a new session with
the 'sv' command.

```sh

# run the 'load' command

sv_file=books/poems.csv
sv_book_name=Beowulf
. ns run load
echo "$sv_book_author"  # column variable was automatically loaded into memory
# uncomment to see all sv_ var names/values:
#     set | grep '^sv_'
```

```
Anonymous
```

### save a record

Edit a record that was previously added and save it.

```sh
# retrieve the record
sv_file=books/poems
sv_book_name=Beowulf
. ns run load

# edit
sv_book_author="anon."

# save
. ns run save
```

### other commands

tbd
