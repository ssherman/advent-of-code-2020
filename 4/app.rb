require_relative './passports'

data = File.read('input.txt')
requirements = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]

passports = Passports.new(data)
valid = 0
passports.passport_data.each do |passport|
  valid += 1 if (requirements - passport.data.keys).empty?
end

puts "there are #{valid} valid passports"