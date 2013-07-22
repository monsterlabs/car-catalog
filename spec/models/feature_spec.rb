require 'spec_helper'

describe Feature do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:descr) }
  it { should belong_to(:specification) }
  it { should have_many(:compared_features) }
end
