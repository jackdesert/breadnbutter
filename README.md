# BreadnButter

Creates a linkable breadcrumb trail based on your RESTful url:

RESTful example: 

    localhost:3000/users/john/entries/how-the-world-goes-round/edit

becomes

[Home](http://localhost:3000/) » [Users](http://localhost:3000/users/) » [John](http://localhost:3000/users/john/) » [Entries](http://localhost:3000/users/john/entries/) » [How the World Goes Round](http://localhost:3000/users/john/entries/how-the-world-goes-round) » Edit

(Note how you can tell from the url that *John* is a *user* and he wrote an *Entry* named *how-the-world-goes-round* and that you are in the *edit* action.

Non RESTful counterexample: 

    localhost:3000/beach-play

(error: not able to determine model name from url)


## Installation

Add this line to your application's Gemfile:

    gem 'breadnbutter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install breadnbutter

## Requirements

Requires Rails 3.1 or greater, since it uses Engine and Railtie

Requires RESTful urls. 

RESTful example: 

    localhost:3000/users/john/entries/how-the-world-goes-round/edit

(Note how you can tell from the url that *John* is a *user* and he wrote an *Entry* named *how-the-world-goes-round* and that you are in the *edit* action.

Non RESTful counterexample: 

    localhost:3000/beach-play

(error: not able to determine model name from url)



## Usage

On any view that you want breadcrumbs, call
 
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
      crumb a{
        color: gold;
      }
      crumb{
        color: grey;
      }
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
