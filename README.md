## Business Card OCR Challenge - [defined here](http://www.asymmetrik.com/programming-challenges/business-card-ocr.html)

### Overview
This gem allows you to take a new line delimited String, and pull out names, email addresses, and phone numbers. The String input can come from a file, STDIN, the output of another program, etc.

This concept has been specifically applied to business cards, but can easily be used more generically.

### Installation

```shell
gem install ocr_challenge
```
or in your Gemfile

```ruby
gem 'ocr_challenge'
```

### Usage

1. Create a parser with your input String

```ruby
require 'ocr_challenge'
include OcrChallenge

text =
    "Alexander Vanadio\n
    execdd17@gmail.com\n
    (123)-456-7890\n"

parser = IBusinessCardParser.new(text)
```

2. Send the parser on over to the IContactInfo class

```ruby
contact = IContactInfo.new(parser)
```

3. Get the info

```ruby
contact.to_s # =>
```
