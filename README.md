# BSON
![Logo](BSONLogo.svg)

**BSON** *[bee · sahn]*, short for **Bin­ary** [**JSON**](https://json.org), is a bin­ary-en­coded seri­al­iz­a­tion of JSON-like doc­u­ments. [**More Information.**](https://bsonspec.org)

This project parses BSON files into anonymous structures for you to use, just as you would with `haxe.Json`, with the exception of having the advantages BSON proposes, introducing a Test sample for you to use plus the BSON parser which consists of:
* Bson.hx: A class similar to `haxe.Json` which leads to more readability plus an easier way to shortcut things.
* format: the folder where lays the required elements to parse the file in question. It introduces the following files:
    * BsonParser.hx: 
    * ElementType.hx: An enumerated integer abstract where all the types of elements are stored.

At the moment, this only supports a basic String an Int Bson fields due to a lack of understanding of how to generate these BSON files.
If, by chance, you know where to generate BSON files, I'd appreciate it if you shared some tools inside an issue of some sort.
