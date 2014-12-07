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

text = """
    Alexander Vanadio\n
    execdd17@gmail.com\n
    (123)-456-7890\n
"""

parser = IBusinessCardParser.new(text)
```

2. Send the parser on over to the IContactInfo class

```ruby
contact = IContactInfo.new(parser)
```

3. Get the information through your contact instance

```ruby
contact.get_name            # =>  "Name: Alexander Vanadio"
contact.get_email_address   # => "Email: execdd17@gmail.com"
contact.get_phone_number    # => "Phone: 123-456-7890"

contact.to_s # => "Name: Alexander Vanadio\nEmail: execdd17@gmail.com\nPhone: 123-456-7890"
```

### Advanced Usage

Let's use a more complicated String input. The IBusinessCard parser will attempt to find all email addresses and phone numbers, but not fax numbers.Once it does, you can get them directly from your IContactInfo instance.

```ruby
require 'ocr_challenge'
include OcrChallenge

text = """
    Alexander Vanadio\n
    Software Engineer
    My Company Name
    execdd17@gmail.com\n
    anotherEmail@gmail.com\n
    Phone: 1-(123)-456-7890\n
    Cell: 123.444.7890\n
    Fax: 892-234-5467
"""

parser  = IBusinessCardParser.new(text)
contact = IContactInfo.new(parser)

contact.to_s # => "Name: Alexander Vanadio\nEmail: anotherEmail@gmail.com\nEmail: execdd17@gmail.com\nPhone Number: 123-444-7890\nPhone Number: 123-456-7890\n"

# you can also access the names, email_addresses, and phone_numbers directly
contact.names
contact.email_addresses
contact.phone_numbers
```

### Running Tests and Code Coverage

```bash
cd orc_challenge
rspec
firefox coverage/index.html
```
