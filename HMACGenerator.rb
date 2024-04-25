require_relative 'KeyGenerator'
require 'openssl'

class HMACGenerator
  attr_accessor :move_string
  def initialize(move_string)
    @move_string=move_string
    # puts @move_string
  end
  def generate_hmac()
    a=KeyGenerator.new()
    
    key = a.generate_key()
    #puts "secrete key : #{key}"
    digest = OpenSSL::Digest.new('sha256')
    
    hmac = OpenSSL::HMAC.hexdigest(digest, key, @move_string)
    # puts "I was here"
    return hmac.upcase,key
  end
end