valid = []
File.open('input.txt','r').each do |password_data|
  pwd_requirements_data, password = password_data.split(': ')
  min_max, letter = pwd_requirements_data.split(' ')
  min, max = min_max.split('-').map { |c| c.to_i }

  match_count = password.scan(/#{letter}/)
  if match_count.length >= min && match_count.length <= max
    valid << password 
  end
end
puts "there are #{valid.count} valid passwords"