require 'spec_helper'

describe PushNotificationDevice do
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:ip_address) }
  it { should validate_presence_of(:timezone) }
  it { should validate_uniqueness_of(:token) }
end
