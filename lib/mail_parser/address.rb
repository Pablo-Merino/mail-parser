module MailParser
  
  class Address
    attr_accessor :name
    attr_accessor :address
    
    EMAIL_REGEX = /^(.+) <(.+)>$/i
    
    def initialize(string)
      matches = EMAIL_REGEX.match(string)
      @name = matches[1]
      @address = matches[2]
    end
    
  end
  
end