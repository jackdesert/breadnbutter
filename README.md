# BreadnButter

Creates a breadcrumb trail:

### [Home](http://localhost:3000/) » [Users](http://localhost:3000/users/) » [John](http://localhost:3000/users/john/) » [Entries](http://localhost:3000/users/john/entries/) » [How the World Goes Round](http://localhost:3000/users/john/entries/how-the-world-goes-round) » Edit

from your RESTful url:

### localhost:3000/users/john/entries/how-the-world-goes-round/edit


## Installation

Add this line to your application's Gemfile:

    gem 'breadnbutter'

And then execute:

    $ bundle

## Requirements

* Rails 3.1 or greater, since it uses Engine and Railtie
* RESTful urls. 
* Each model must have a :name attribute if you want text displayed for it instead of an id  

## Usage

Wherever you want a breadcrumb, call
 
    <%= render_breadcrumbs %>

Typically it makes sense to put this in app/views/layouts/application.html.erb

## Customization

The following can be set to further customize BreadnButter
    
    # config/application.rb

    # Use a different character between crumbs
    config.breadnbutter_joiner = ':'

    # Specify any text elements you want hidden
    config.breadnbutter_hidden_elements = ['Hide Me']

    # Change the text for the 'Home' link
    config.breadnbutter_home_text = 'Noteworthy Name'

    # Change the url for the 'Home' link
    config.breadnbutter_home_url = 'http://classy_url.com/'

## Styling

For the aesthete in you, add some styling and tweak to taste.
    
    #breadnbutter{
      padding: 1ex 1ex;
      font-size: 20px;
      background-color: black;
      joiner{
        padding: 0 0.5ex;
        color: grey;
      }
      crumb{
        color: grey;
      }
      crumb a{
        color: gold;
      }
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
