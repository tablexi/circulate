RSpec::Matchers.define :publish do |method_name|
  match do |receiver|
    ActiveSupport::Notifications.should_receive :instrument
    receiver.send method_name
    true
  end
end

RSpec::Matchers.define :subscribe_to do |method_name|
  match do |receiver|
    receiver.should_receive method_name
    ActiveSupport::Notifications.instrument method_name.to_s
    true
  end
end
