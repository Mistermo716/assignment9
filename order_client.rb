require 'httparty'
include HTTParty

while true
    puts "Do you want to: newOrder, retreive an existing order, register a new customer, custLookup, create a new item, itemLookup?"
    user_input = gets.chomp
    case user_input
    
    
    
        when 'newOrder'
            puts "Enter the item ID and an email"
            custData = gets.chomp!.split()
            order = { "itemid" => custData[0], "email" => custData[1]}
            res = HTTParty.post('http://localhost:8080/orders', 
                  :body => order.to_json,
                  :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'})
            puts "status #{res.code}"
            puts res.body
            
            
        
        when 'retreive'
            puts "retreive by orderId, customerId, or email?"
            method = gets.chomp
            case method
                when 'orderId'
                    puts "Enter the order id"
                    custData = gets.chomp!
                    res = HTTParty.get("http://localhost:8080/orders/?id=#{custData}")
                    puts "status #{res.code}"
                    puts res.body
                
                when 'customerId'
                    puts "Enter the order id"
                    custData = gets.chomp!
                    res = HTTParty.get("http://localhost:8080/orders/?customerId=#{custData}")
                    puts "status #{res.code}"
                    puts res.body
                
                when 'email'
                    puts "Enter the order id"
                    custData = gets.chomp!
                    res = HTTParty.get("http://localhost:8080/orders/?email=#{custData}")
                    puts "status #{res.code}"
                    puts res.body
            end
        
        
        
        when 'register'
            puts "Enter last name, first name, and email in order:"
            custData = gets.chomp!.split()
            formattedData = {"lastName" => custData[0], "firstName" => custData[1], "email" => custData[2]}
            res = HTTParty.post('http://localhost:8081/customers', 
                :body => formattedData.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'})
            puts "status #{res.code}"
            puts res.body
            
        
        
        when 'custLookup'
            puts "lookup by id or email?"
            method = gets.chomp
            case method
                when 'id'
                    puts "Enter the customer id"
                    custData = gets.chomp!
                    res = HTTParty.get("http://localhost:8081/customers?id=#{custData}")
                    puts "status #{res.code}"
                    puts res.body
                
                when 'email'
                    puts "Enter the customer email"
                    custData = gets.chomp!
                    res = HTTParty.get("http://localhost:8081/customers?email=#{custData}")
                    puts "status #{res.code}"
                    puts res.body
            end
                
            
            
        when 'create'
            puts "Enter a description of the item"
            desc = gets.chomp!
            puts "Enter the price and stock quantity of the item"
            custData = gets.chomp!.split()
            item = { "description" => desc, "price" => custData[0], "stockQty" => custData[1] }
            res = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'})
            puts "status #{res.code}"
            puts res.body
            
        when 'itemLookup'
            puts "enter an item id number"
            custData = gets.chomp!
            res = HTTParty.get("http://localhost:8080/orders?id=#{custData}")
            puts "status #{res.code}"
            puts res.body
        
        when 'quit'
            break
    end
end