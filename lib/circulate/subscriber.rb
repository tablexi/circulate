module Circulate
  module Subscriber
    extend ActiveSupport::Concern

    module ClassMethods
      def subscribe(*publication_names)
        publication_names.each do |name|
          ActiveSupport::Notifications.subscribe(name.to_s) do |*args|
            event = ActiveSupport::Notifications::Event.new(*args)
            self.send name, event.payload
          end
        end
      end
    end

  end
end
