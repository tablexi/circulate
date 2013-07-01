require 'spec_helper'

describe Circulate::Subscriber do

  class Receiver
    include Circulate::Subscriber

    subscribe :a_job

    def self.a_job(publisher)
    end
  end

  subject { Receiver.new }

  it 'subscribes to a_job' do
    Receiver.should subscribe_to :a_job
  end

  it { should be_a Circulate::Subscriber }

end
