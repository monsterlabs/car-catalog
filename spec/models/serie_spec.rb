require 'spec_helper'

describe Serie do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:brand) }
  it { should have_many(:lines) }
end
