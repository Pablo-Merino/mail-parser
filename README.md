mail-parser
===========

A simple mail parser using Regex

Usage
=====

```
require 'mail_parser'
raw_email = File.open("sample-email.txt").read
parsed_email = MailParser::Parser.new(raw_email).parse

# parsed_email now has all the attributes in lib/mail_parser/mail.rb
```ruby