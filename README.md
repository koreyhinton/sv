# Separated Value command-line tool

The sv-* commands assist in editing csv files using bash / bash syntax with sv_* bash in/output variables.

- Requires [dot-ns](https://github.com/koreyhinton/dot-ns) installed with [ns-clone](https://github.com/koreyhinton/ns-clone).

## installation

```sh
ns-clone sv https://github.com/koreyhinton/sv.git
```
You must start a new bash shell after cloning.

*Deprecated install instructions can be found at commit #[329be3](https://github.com/koreyhinton/sv/tree/329be3011df476cad9d6d513e835811593b5e1ed/README.md)*

## csv editing commands

### sv-add command

Assign values to custom column names using the sv_ prefix, and then run sv-add which will add the assigned column values as a row (and create the file if it doesn't exist yet).

```sh
sv_sep=','  # optional (the default is ',')
sv_book_name=Beowulf
sv_book_author=Anonymous
sv_file=books/poems.csv

sv-add

cat "$sv_file"
```

```
book_author,book_name
Anonymous,Beowulf
```

### sv-load command

Now you will load the record previously added to the csv file. Any assigned columns will function as a lookup key to load the first matching row into memory again.

```sh

. ns delete "sv_book_*"  # clear out your in-memory sv_book_* variables (to demonstrate loading it)
echo "$sv_book_author"   # prints empty

sv_file=books/poems.csv
sv_book_name=Beowulf
sv-load
echo "$sv_book_author"  # prints this row-column variable that was automatically loaded into memory
# uncomment to see all sv_ var names/values that it loaded:
#     sv-values
```

```

Anonymous
```

### sv-save command

Edit the record that was previously added and save it with a new value.

```sh
# retrieve the record
sv_file=books/poems.csv
sv_book_name=Beowulf
sv-load

# edit
sv_book_author="anon."

# save
sv-save
```

### sv-print command

Prints the csv (w.i.p.: currently it works for columns that are narrow enough to fit on one line).

The sv-print command will also run sv-values at the end unless SV_VERBOSE is set to 0.

```sh
sv_file=books/poems.csv
sv-print
```

```
 +-------------+-----------+
 | book_author | book_name |
 +-------------+-----------+

 +-------------+-----------+
 | anon.       | Beowulf   |
 +-------------+-----------+
```

### sv-values command

Use the sv-values command to see which row-column values are current assigned in value, as well as to see which ones are not set.

```sh
sv_file=books/poems.csv
sv-values
```

```
{ , sv_file=books/poems.csv, sv_row=1, sv_sep=, }

sv_book_author=anon.
sv_book_name=Beowulf
```

## development info

### running tests

```sh
cd files  # for now must be done from the ./files (child sub-directory within the repository root)

# Run all tests
sv-test

# OR:
#
# Uncomment to run all user scenario tests:
#     sv-test-user-scenarios
#
# Uncomment to run an individual test:
#     sv-test-user-scenarios-print-mult-line-comma
```
