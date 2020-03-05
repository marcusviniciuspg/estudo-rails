#descobrir quais são os numeros que somados deem 100

numbers = [4, 14, 15, 18, 29, 32, 36, 82, 95, 95]
results = []
combinations = numbers.map.with_index do |n,i| 
  numbers.combination(i).to_a
end


combinations.each do |combination|
  combination.each do |c|
    results << c if c.inject(:+) == 100
  end
end


sum = 0
number_to_100 = []
results = []

numbers.each do |n1|
  number_to_100 << n1
  sum = n1
  numbers.each do |n2|
    if  n1 != n2 and sum < 100
      sum += n2
      number_to_100 << n2
    end
    if sum == 100
      results << number_to_100
      break
    end
  end
  sum = 0
  number_to_100 = []
end

print "#{results} \n"