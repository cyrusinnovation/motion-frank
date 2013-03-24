motion-frank
============

A gem to use integration of [frank-cucumber](http://testingwithfrank.com/) into RubyMotion projects.

#### Installation

```bash
> gem install motion-frank
```
or better yet, use Bundler with rvm or rbenv.

#### Getting started

In your Rakefile:
```ruby
require 'motion-frank'
```

Then from the command line you can see the new tasks:
```bash
> rake -T
rake frank                 # Shorthand for frank:run
rake frank:init_features   # Create first feature files
rake frank:run             # Build app for simulator, launch simulator and run features
rake frank:symbiote        # Run app with symbiote enabled
```

#### Starter features

Before using ```rake frank:run``` you'll need some feature files to start. Use ```rake frank:init_features``` to create these.

#### Symbiote

Symbiote is a web-based tool for inspecting the state of your native iOS application. See [the Symbiote site](https://github.com/TestingWithFrank/symbiote) for more details.

Run ```rake frank:symbiote``` to enable symbiote in the simulator, and
visit http://localhost:37265 (or run ```frank inspect```) to browse your app.

Symbiote will crash if your application doesn't have a view, so you will
have to try it out with more than just a ```motion create``` app.
 
#### Versioning

The versions of this gem will track the version of frank-cucumber, so that 1.1.8.* requires frank-cucumber 1.1.8.

#### Credits

Thanks to Caleb Cohoon for writing very useful [instructions](http://calebcohoon.blogspot.com/2012/06/test-rubymotion-apps-using-cucumber.html) that this gem is based on.


