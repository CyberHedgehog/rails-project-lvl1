# HexletCode
[![hexlet-check](https://github.com/CyberHedgehog/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/CyberHedgehog/rails-project-lvl1/actions/workflows/hexlet-check.yml) 
[![Rubocop](https://github.com/CyberHedgehog/rails-project-lvl1/actions/workflows/rubocop.yml/badge.svg)](https://github.com/CyberHedgehog/rails-project-lvl1/actions/workflows/rubocop.yml)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage
```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'James', job: 'Metallica', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.input :gender, as: :select, collection: %w[m f]
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input type="text" value="James" name="name">
#   <label for="Job">Job</label>
#   <textarea cols="20" rows="40" name="job">Metallica</textarea>
#   <label for="gender">Gender</label>
#   <select name="gender">
#     <option value="m" selected>m</option>
#     <option value="f">f</option>
#   </select>
#   <input type="submit" value="Save" name="commit">
# </form>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CyberHedgehog]/hexlet_code.
test

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
