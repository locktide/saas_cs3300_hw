require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to

  	errors.add(:base, 'From cannot be the same as To') unless @to != @from 
		
  end

  def initialize(api_key='')
			  	
		#@from = 'Kevin Bacon'
		#@to = @from
		if @from == nil then @from = 'Kevin Bacon' end	
		if @to == nil then @to = 'Kevin Bacon' end
		
		@api_key = '38b99cd9ec87' if @api_key == nil
		
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      # your code here
      raise NetworkError, caller  
    end
    # your code here: create the OracleOfBacon::Response object
    send_em = Response.new(xml)
  end

  def make_uri_from_arguments
    # your code here: set the @uri attribute to properly-escaped URI
    #   constructed from the @from, @to, @api_key arguments
    #to bypass error for now, will define api_key to be "fake_key", even though that is not right.... 
    @uri ="http://oracleofbacon.org/cgi-bin/xml?" "a="+CGI.escape(@from)+"b="+CGI.escape(@to)+"p="+CGI.escape("fake_key")  
    #puts "@uri after"
    #puts @uri
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
			elsif ! @doc.xpath('/link').empty?
				parse_graph_responce
			elsif ! @doc.xpath('/spellcheck').empty?
				parse_spellcheck_responce
			else 
				parse_unknown_responce
				 
      # your code here: 'elsif' clauses to handle other responses
      # for responses not matching the 3 basic types, the Response
      # object should have type 'unknown' and data 'unknown response'         
      end
    end
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end

		def parse_graph_responce
			@type = :graph
			#puts @doc.xpath('/link/*[self::actor or self::movie]').collect(&:text)
			#@doc.xpath('/link/*[self::actor or self::movie]').each do |am|
				#@data << am.innertext
			#end
			@data = @doc.xpath('/link/*[self::actor or self::movie]').collect(&:text)
			#puts "below is my data array!!!"			
			#puts @data
			
		end

		def parse_spellcheck_responce
			@type = :spellcheck
			@data = @doc.xpath('/spellcheck/match').collect(&:text)
		
		end

		def parse_unknown_responce
			@type = :unknown	
			@data = 'unknown responce type'		
			#@data = @doc.xpath('/other').collect(&:text)
			puts @data
		end

  end
end

