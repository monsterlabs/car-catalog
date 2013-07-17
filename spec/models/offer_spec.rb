require 'spec_helper'

describe Offer do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:validUntil) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:largeImage) }
end
