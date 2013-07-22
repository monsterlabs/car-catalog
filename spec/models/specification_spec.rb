require 'spec_helper'

describe Specification do
  it { should belong_to(:car) }
  it { should belong_to(:specification_type) }
end
