require 'securerandom'

class KeyGenerator
  def generate_key()
    return SecureRandom.hex(32).upcase # 32 byte or 256 bits generating
  end
end
