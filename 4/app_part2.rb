require_relative './passports'

data = File.read('input.txt')
requirements = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]

passports = Passports.new(data)

def passport_valid?(passport, requirements)
  return false if !(requirements - passport.data.keys).empty?

  requirements.each do |req|
    case req
    when :byr
      return false unless /^[0-9]{4}$/.match? passport.data[:byr]
      return false unless passport.data[:byr].to_i >= 1920 && passport.data[:byr].to_i <= 2002
    when :iyr
      return false unless /^[0-9]{4}$/.match? passport.data[:iyr]
      return false unless passport.data[:iyr].to_i >= 2010 && passport.data[:iyr].to_i <= 2020
    when :eyr
      return false unless /^[0-9]{4}$/.match? passport.data[:eyr]
      return false unless passport.data[:eyr].to_i >= 2020 && passport.data[:eyr].to_i <= 2030
    when :hgt
      match_data = /^([0-9]+)(cm|in)/.match(passport.data[:hgt])
      return false if match_data.nil?
      number = match_data[1].to_i
      unit = match_data[2]
      if unit == 'cm'
        return false unless number >= 150 && number <= 193
      else
        return false unless number >= 59 && number <= 76
      end
    when :hcl
      return false unless /^\#[0-9a-f]{6}$/.match? passport.data[:hcl]
    when :ecl
      return false unless ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(passport.data[:ecl])
    when :pid
      return false unless /^[0-9]{9}$/.match? passport.data[:pid]
    else
      return false
    end
  end
  true
end

valid = 0

passports.passport_data.each do |passport|
  if passport_valid?(passport, requirements)
    pp passport.data
    puts "valid: #{passport.data.inspect}"
    valid += 1 
  end
end
puts "there are #{valid} valid passports"