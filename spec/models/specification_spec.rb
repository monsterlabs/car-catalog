require 'spec_helper'

describe Specification do
  it { should belong_to(:car) }
  it { should belong_to(:specification_type) }
  it { should have_many(:features) }
  it { should have_many(:comparatives) }
end
