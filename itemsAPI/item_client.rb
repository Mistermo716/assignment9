require 'httparty'
input = ''
until input[0] == 'q' do
puts 'What do you want to do: create, update, get or quit'
input = gets.chomp.downcase
if input[0] == 'c'
    puts 'enter item description: '
    description = gets.chomp
    puts 'enter item price: '
    price = gets.chomp.to_f
    puts 'Enter Quantity: '
    quantity = gets.chomp.to_i
    item = {description: description, price: price, stockQty: quantity}
    result = HTTParty.post('http://localhost:3000/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    p "status code #{result.code}"
    p result.body
end

if input[0] == 'u'
puts 'Enter item id: '
id = gets.chomp
puts 'Enter Description'
description = gets.chomp
puts 'enter price'
price = gets.chomp.to_f
puts 'enter quantity'
quantity = gets.chomp.to_i
item = {description: description, price: price, stockQty: quantity}
result = HTTParty.patch("http://localhost:3000/items/#{id}", 
    :body => item.to_json,
    :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
)
p "status code #{result.code}"
p result.body
end

if input[0] == 'g'
    puts 'Enter id of item'
    id = gets.chomp.to_i
    result = HTTParty.get("http://localhost:3000/items/#{id}.json")
    p "status code #{result.code}"
    p result.body
end

end