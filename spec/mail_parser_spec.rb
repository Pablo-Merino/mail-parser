require "spec_helper"
require 'time'

describe MailParser do
  it "parses correctly sample email's date" do
    raw_email = File.open("sample-email.txt").read
    parsed_email = MailParser::Parser.new(raw_email).parse
    
    parsed_email.date.should == Time.rfc2822("Wed, 24 Sep 2014 14:23:09 +0000")
  end
  
  it "should return Address class for To field" do
    raw_email = File.open("sample-email.txt").read
    parsed_email = MailParser::Parser.new(raw_email).parse
    
    parsed_email.to.class.should == MailParser::Address
  end
  
  it "should return Address class for From field" do
    raw_email = File.open("sample-email.txt").read
    parsed_email = MailParser::Parser.new(raw_email).parse
    
    parsed_email.from.class.should == MailParser::Address
  end
  
  it "should return an Array with headers" do
    raw_email = File.open("sample-email.txt").read
    parsed_email = MailParser::Parser.new(raw_email).parse
    
    parsed_email.headers.class.should == Array
  end
end
