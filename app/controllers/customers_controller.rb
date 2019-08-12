class CustomersController < ApplicationController
    #create POST /customers
    #request body contains customer data in JSON
    #lastName, firstName, email
    #return customer data
    def create
        @customer = Customer.find_by(email: params[:email])
        if @customer.nil? && !params[:lastName].blank? && !params[:firstName].blank? && !params[:email].blank?
            @customer = Customer.new
            @customer.lastName = params[:lastName]
            @customer.firstName = params[:firstName]
            @customer.email = params[:email].downcase
            @customer.award = 0
            @customer.lastOrder1 = 0
            @customer.lastOrder2 = 0
            @customer.lastOrder3 = 0
            @customer.save
            render json: @customer.to_json, status:201
        else
            head 400
        end
    end
    
    #GET /customers?id=:id
    #GET /customers?email=:email
    def get
        @customer = nil
        if !params[:id].nil?
        @id = params[:id]
        end
        if !params[:email].nil?
        @email = params[:email].downcase
        end
        if !@id.nil?
            @customer = Customer.find_by(id: @id)
        elsif !@email.nil?
            @customer = Customer.find_by(email: @email)
        end
        if !@customer.nil?
            render json: @customer.to_json, status: 200
        else
            head 404
        end
    end
    #PUT /customers/order
    #request contains order data -> params
    def processOrder
        @id = params[:customerId].to_i
        @award = params[:award].to_i
        @total = params[:total].to_f
        p @total
        @customer = Customer.find_by(id: @id)
        if @award == 0
            @customer.lastOrder3 = @customer.lastOrder2
            @customer.lastOrder2 = @customer.lastOrder1
            @customer.lastOrder1 = @total
            if @customer.lastOrder1 != 0.0 && @customer.lastOrder2 != 0.0 && @customer.lastOrder3 != 0.0 && @award == 0
                @customer.award = (0.10 * (@customer.lastOrder1 + @customer.lastOrder2 + @customer.lastOrder3)/3.0).round(2)
            end
        else
            #award has been redeemed. set award, order1,2,3, to 0
            @customer.award = 0
            @customer.lastOrder1 = 0
            @customer.lastOrder2 = 0
            @customer.lastOrder3 = 0
        end
        result = @customer.save
        head 200
    end
    
    
end
