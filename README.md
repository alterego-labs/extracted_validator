# ExtractedValidator

[![Code Climate](https://codeclimate.com/github/alterego-labs/extracted_validator/badges/gpa.svg)](https://codeclimate.com/github/alterego-labs/extracted_validator)
[![Test Coverage](https://codeclimate.com/github/alterego-labs/extracted_validator/badges/coverage.svg)](https://codeclimate.com/github/alterego-labs/extracted_validator)
[![Build Status](https://travis-ci.org/alterego-labs/extracted_validator.svg)](https://travis-ci.org/alterego-labs/extracted_validator)

ActiveRecord and ActiveModel, as parts of Rails, are powerfull and cool
things. They can do many works with simple API call. But coupling of model,
validations and business logic in one place is awkward and ugly. Espessialy
in big projects. And sometimes simple creating record for testing is painfull
and I want to cry :cry:.

And we must make our life and coding easier! Extract validations rules!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'extracted_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extracted_validator

## Usage

### Basic usage

Validator is defining as separated class. For example:

```ruby
class PostValidator < ExtractedValidator::Base
  validate :title_for_blank

  def title_for_blank
    add_error('Title must be set!') if title.blank?
  end
end
```

Then pass model that must be validated to initializer and use same API
as well as you use validations on model directly.

```ruby
post = Post.new title: 'New amazing post'

validator = PostValidator.new(post)

# Check if model valid
validator.valid?

# Return Errors instance
validator.errors

# Return errors messages
validator.errors_messages
validator.errors_full_messages
```

### Model class required validations

Some validations is required model class for do work well. For example,
`validates_uniqueness_of` and others. To consider this cases we must pass
model class like in the next example:

```ruby
class PostValidator < ExtractedValidator::Base[Post]
  validates :title, presence: true
  validates_uniqueness_of :title
end
```

### Place for validators

IMHO validators must be contained in `app/validators` folder. Don't forget
to add this path for autoloading in `config/application.rb`

```ruby
config.autoload_paths += %W(#{config.root}/app/validators)
```

## Contributing

1. Fork it ( https://github.com/alterego-labs/extracted_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
