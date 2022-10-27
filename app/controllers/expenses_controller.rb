class ExpensesController < ApplicationController 

    get '/expenses' do 
      # return expense_array.to_json
      Expense.select('id', 'name', 'amount_cents', 'category_id').all.to_json
    end
  
    get '/expenses/:id' do
      # return a particular expense as json based on the id param from the url
      # Params always come to a string so we convert to an integer
      # id = params["id"].to_i
      # return expense_array[id].to_json
      expense =  Expense.find_by_id(params[:id])
  
      if expense
        expense.to_json 
      else
        halt 404
      end
    end
  
    post '/expenses' do
      # Pass the request into the custom getBody function
      # body = getBody(request)
      # create the new expense
      # new_expense = {name: body["Rent"], amount_cents: body[500.00]}
      # # return the new expense
      # return expense_array.to_json
      
      new_params = category_id.merge(params) 
      
      expense = Expense.create(new_params)
  
      if expense
        expense.to_json
      else
        halt 500
      end
    end
  
    put '/expenses/:id' do
      # get the id from params
      # id = params["id"].to_i
      # get the request body
      # body = getBody(request)
      # update the item in question
      # return the updated expense 
      # return expense_array[id].to_json
  
      expense = Expense.find_by_id(params[:id])
  
      if expense
        expense.update(params)
      else
        halt 404
      end
    end
  
    delete '/expenses/:id' do
      #  get the id from params
      #  id = params["id"].to_i
      #  delete the item
      #  expense = expense_array.delete_at(id)
      #  return the deleted item as json
      #  return expens.to_json
  
      expense = Expense.find_by_id(params[:id])
  
      if expense
        expense.destroy
      else
        halt 404
      end
    end 
  
    def category_id
      category = Category.find(2)
  
      { category_id: category.id }
    end
  end