require 'spec_helper'

describe Feature do
  it { should belong_to(:specification) }
  it { should have_many(:compared_features) }
end
