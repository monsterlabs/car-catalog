require 'spec_helper'

describe CarFile do
  it { should validate_presence_of(:xls) }
  it { should validate_presence_of(:image) }
  it { should have_one(:car) }
end
