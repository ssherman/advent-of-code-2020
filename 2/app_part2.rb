valid = []
File.open('input.txt','r').each do |password_data|
  pwd_requirements_data, password = password_data.split(': ')
  indices, letter = pwd_requirements_data.split(' ')
  index_a, index_b = indices.split('-').map { |c| c.to_i }

  if password[index_a - 1] == letter && password[index_b - 1] != letter
    valid << password
  elsif password[index_a - 1] != letter && password[index_b - 1] == letter
    valid << password
  end
end
puts "there are #{valid.count} valid passwords"