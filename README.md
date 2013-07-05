Circulate
=========

This gem lets you circulate messages around the [ActiveSupport::Notifications](http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html)
pubsub system. It provides a syntax for publishing calls to instance methods and subscribing to them through class methods.

Installation
------------

`gem install circulate`

Dependencies
------------

The gem relies on active_support, but not the entire Rails stack. It also requires Ruby 2.0.0-p195+. Note that
Ruby 2.0.0-p0 will not work because of a bug in `Module.prepend`.


Example
-------

    class ChicagoTribune
        include Circulate::Publisher

        publish :daily_edition

        def daily_edition
            puts "delivered to your door!"
        end
    end

    class Reader
        include Circulate::Subscriber

        subscribe :daily_edition

        def self.daily_edition(tribune)
            puts "Tribune edition #{tribune} received!"
        end
    end

    tribune = ChicagoTribune.new
    tribune.daily_edition

Outputs...

delivered to your door!<br/>
Tribune edition #&lt;ChicagoTribune:0x007fd78350d1d0&gt; received!


Why do this?
------------

So classes can be "poked" when a method is called on an instance. Sometimes you don't want or need to have an
instance object sitting around waiting for a notification. Also, it removes you from having to keep track of
notifications by String name, and you don't have to deal with the somewhat cumbersome ActiveSupport::Notifications
syntax.


Testing
-------

The gem also includes RSpec matchers for your test suite. To use them add `require 'circulate/matchers'` to your
spec_helper. Then, in your tests, you can:

    describe ChicagoTribune do
        it { should publish :daily_edition }
    end

    describe Reader do
        it { should subscribe_to :daily_edition }
    end
