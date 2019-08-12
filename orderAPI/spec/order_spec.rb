require 'rails_helper'
RSpec.describe "OrdersController", type: :request do
     it "POSTs an order successfully" do
        item = { "description" => "a test description", "price" => "10", "stockQty" => "12" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        customer = { "firstName" => "Ryan", "lastName" => "Tashiro", "email" => "rtashiro-evans@csumb.edu" }
        customerResult = HTTParty.post('http://localhost:8081/customers', 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        customerResult = HTTParty.get("http://localhost:8081/customers?email=#{customer['email']}", 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        order = { "itemid" => "1", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    expect(orderResult.code).to eq(201)
    expect(orderResult['price']).to eq(itemResult['price'])
    end
    
    
    
    
    
    it "GET retreives order by id" do
        item = { "description" => "a test description", "price" => "10", "stockQty" => "12" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        customer = { "firstName" => "Ryan", "lastName" => "Tashiro", "email" => "rtashiro-evans@csumb.edu" }
        customerResult = HTTParty.post('http://localhost:8081/customers', 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        customerResult = HTTParty.get("http://localhost:8081/customers?email=#{customer['email']}", 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        order = { "itemid" => "1", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
    GETresult = HTTParty.get('http://localhost:8080/orders?id=1')
    expect(GETresult.code).to eq(200)
    expect(GETresult['description']).to eq('a test description')
    end
    
    
    
    it "GET retreives order by email" do
        item = { "description" => "a test description", "price" => "10", "stockQty" => "12" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        item = { "description" => "another test description", "price" => "110", "stockQty" => "112" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        customer = { "firstName" => "Ryan", "lastName" => "Tashiro", "email" => "rtashiro-evans@csumb.edu" }
        customerResult = HTTParty.post('http://localhost:8081/customers', 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        customerResult = HTTParty.get("http://localhost:8081/customers?email=#{customer['email']}", 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        order = { "itemid" => "1", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        order = { "itemid" => "2", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
    
    GETresult = HTTParty.get("http://localhost:8080/orders/?email=#{customerResult['email']}")
    p GETresult
    expect(GETresult.code).to eq(200)
    
    end
    
    
    
    it "GET retreives order by customer id" do
        item = { "description" => "a test description", "price" => "10", "stockQty" => "12" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        item = { "description" => "another test description", "price" => "110", "stockQty" => "112" }
        itemResult = HTTParty.post('http://localhost:8082/items', 
                :body => item.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        customer = { "firstName" => "Ryan", "lastName" => "Tashiro", "email" => "rtashiro-evans@csumb.edu" }
        customerResult = HTTParty.post('http://localhost:8081/customers', 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        customerResult = HTTParty.get("http://localhost:8081/customers?email=#{customer['email']}", 
                :body => customer.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
        order = { "itemid" => "1", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
        order = { "itemid" => "2", "email" => "rtashiro-evans@csumb.edu"}
        orderResult = HTTParty.post('http://localhost:8080/orders', 
                :body => order.to_json,
                :headers => {'Content-Type' => 'application/json', 'ACCEPT' => 'application/json'}
    )
    
    
    GETresult = HTTParty.get("http://localhost:8080/orders/?customerId=#{customerResult['id']}")
    p GETresult
    expect(GETresult.code).to eq(200)
    
    end
end