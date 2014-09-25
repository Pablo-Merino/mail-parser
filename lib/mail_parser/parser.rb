require 'time'

module MailParser
  class Parser
    attr_accessor :raw_email
    attr_accessor :raw_headers
  
    HEADER_REGEX = /([A-Za-z-]+):\s([^\r\n]+(?:\r?\n(?![A-Za-z-]+:\s)[^\r\n]+)*)/mx
    HEADER_SEPARATOR = "\n"
    HEADER_BODY_SEPARATOR = "\n\n"
  
    SUBJECT_REGEX = /^Subject: (.+)/i
    TO_REGEX = /^To: (.+)/i
    FROM_REGEX = /^From: (.+)/i
    DATE_REGEX = /^Date: (.+)/i
    
    def initialize(raw_email)
      @raw_email = raw_email
    end
  
    def parse
      split_email = @raw_email.split(HEADER_BODY_SEPARATOR)
      headers = split_email[0]
      split_email.shift
      body = split_email.join("\n\n")
      
      parsed_metadata = parse_metadata(headers)

      parsed_headers = parse_headers(headers)
    
      Mail.new([parsed_headers, parsed_metadata, body, @raw_email])
    end
  
    def parse_headers(headers)
      headers_array = []
      matches = headers.scan(HEADER_REGEX)
            
      matches.map do |key, value|
        headers_array << {key => value}
      end
      
      headers_array
    end
  
    def parse_metadata(raw_headers)
      subject_match = SUBJECT_REGEX.match(raw_headers)[1]
      to_match = TO_REGEX.match(raw_headers)[1]
      from_match = FROM_REGEX.match(raw_headers)[1]
      date_match = DATE_REGEX.match(raw_headers)[1]
      {:date => Time.rfc2822(date_match), :subject => subject_match, :to => Address.new(to_match), :from => Address.new(from_match)}
    end
    
  end
end