module MailParser
  class Mail
  
    attr_accessor :headers
    attr_accessor :body
    attr_accessor :raw
    attr_accessor :from
    attr_accessor :to
    attr_accessor :date
    attr_accessor :subject
  
    def initialize(parsed_email)
      @headers = parsed_email[0]
      parsed_metadata = parsed_email[1]
      @body = parsed_email[2]
      @raw = parsed_email[3]
          
      @from = parsed_metadata[:from]
      @to = parsed_metadata[:to]
      @subject = parsed_metadata[:subject]
      @date = parsed_metadata[:date]
    end
  end
end