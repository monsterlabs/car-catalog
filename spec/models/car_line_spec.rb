require 'spec_helper'

describe CarLine do
  it { should validate_presence_of(:name) }
  it { should belong_to(:serie) }
  it { should have_many(:cars) }
end
