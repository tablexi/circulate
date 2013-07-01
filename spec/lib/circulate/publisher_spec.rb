require 'spec_helper'

describe Circulate::Publisher do

  class Provider
    include Circulate::Publisher

    publish :a_job, :another_job

    def a_job
    end

    def another_job(param1, param2)
    end
  end

  subject { Provider.new }

  it { should publish :a_job }

  it { should publish :another_job }

  it { should be_a Circulate::Publisher }

end
