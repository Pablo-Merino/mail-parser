module MailParser
  
  class Main
    
    def initialize(mail_raw)
      MailParser::Parser.new(mail_raw).parse
    end
    
  end
  
end

require 'mail_parser/parser'
require 'mail_parser/mail'
require 'mail_parser/address'