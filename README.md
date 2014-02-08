jsontr
======

Command-line tool to flatten/unflatten JSON files.

## Purpose

`flatten` will transform this file:

    {
      "foo": {
        "bar": "Hello world!"
      }
    }

Into this file:

    {
      "foo.bar": "Hello world!"
    }

`unflatten` will do the opposite.

## Usage

    coffee bin/jsontr.coffee [METHOD] [FILEPATH]
    
Example, for `flatten`:

    coffee bin/jsontr.coffee flatten ~/files/helloworld.json

And for `unflatten`:

    coffee bin/jsontr.coffee unflatten ~/files/helloworld.json
