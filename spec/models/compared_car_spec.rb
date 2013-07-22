require 'spec_helper'

describe ComparedCar do
  it { should validate_presence_of(:modelName) }
  it { should validate_presence_of(:year) }
  it { should belong_to(:brand) }
  it { should have_many(:comparatives) }
end
