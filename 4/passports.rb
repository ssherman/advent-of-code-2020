class Passports
  attr_accessor :requirements, :passport_data

  def initialize(data)
    @requirements = requirements
    raw_passport_data = data.split(/\s\s\s/)
    @passport_data = raw_passport_data.map do |pdata|
      parts = pdata.split(/\s/)
      parts.delete_if { |p| p.strip == ''}
      password_attributes = parts.map do |part|
        key, value = part.split(":")
        {key.to_sym => value.downcase}
      end.inject(:merge)

      Passport.new(password_attributes)
    end
  end
end

class Passport
  attr_accessor :data
  def initialize(data)
    @data = data
  end
end