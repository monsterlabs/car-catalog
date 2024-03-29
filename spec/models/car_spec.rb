require 'spec_helper'

describe Car do
  it { should validate_presence_of(:modelName) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:highlights) }
  it { should validate_presence_of(:image) }
  it { should belong_to(:line) }
  it { should belong_to(:car_file) }
  it { should have_many(:specifications) }
end
