require 'spec_helper'

describe ComparedFeature do
  it { should belong_to(:comparative) }
  it { should belong_to(:feature) }
end
