module Circulate
  module Publisher
    extend ActiveSupport::Concern

    module ClassMethods
      def publish(*method_names)
        mod = Module.new do
          method_names.each do |name|
            define_method name do |*args|
              ActiveSupport::Notifications.instrument(name.to_s, self) { super *args }
            end
          end
        end

        prepend mod
      end
    end

  end
end
