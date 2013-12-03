require 'spec_helper'
require 'pdns_tools'

describe PdnsTools do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
