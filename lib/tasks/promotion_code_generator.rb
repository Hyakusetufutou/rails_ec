# frozen_string_literal: true

require 'securerandom'

class PromotionCodeGenerator
  def self.generate_code(digit)
    SecureRandom.alphanumeric(digit)
  end

  def self.reduced_rate(min:, max:)
    rand(min..max)
  end
end
