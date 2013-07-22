require 'spec_helper'

describe Comparative do
  it { should belong_to(:compared_car) }
  it { should belong_to(:specification) }
  it { should have_many(:compared_features) }
end
