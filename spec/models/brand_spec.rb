require 'spec_helper'

describe Brand do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:series) }
  it { should have_many(:compared_cars) }
end
