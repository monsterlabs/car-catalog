require 'spec_helper'

describe CarModel do
  it { should validate_presence_of(:name) }
  it { should belong_to(:serie) }
end
