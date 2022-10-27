class CategoriesController < ApplicationController
    
    get '/categories' do 
      # return categories_array.to_json
      Category.select('id', 'name', 'description').all.to_json
    end
  
    get '/categories/:id' do
      # return a particular category as json based on the id param from the url
      # Params always come to a string so we convert to an integer
      # id = params["id"].to_i
      # return category_array[id].to_json
      category =  Category.find_by_id(params[:id])
  
      if category 
        category.to_json 
      else
        halt 404
      end
    end
  
    post '/categories' do
      # Pass the request into the custom getBody function
      # body = getBody(request)
      # create the new category
      # new_category = {name: body["Fixed"], description: body["Fixed expenses"]}
      # return the new category
      # return category_array.to_json
  
      category = Category.create(params)
  
      if category 
        category.to_json
      else
        halt 500
      end
    end
  
    put '/categories/:id' do
      # get the id from params
      # id = params["id"].to_i
      # get the request body
      # body = getBody(request)
      # update the item in question
      # return the updated category 
      # return category_array[id].to_json
  
      category = Category.find_by_id(params[:id])
  
      if category
        category.update(params)
      else
        halt 404
      end
    end
  
    delete '/categories/:id' do
      # get the id from params
      #  id = params["id"].to_i
      # delete the item
      # category = category_array.delete_at(id)
      # return the deleted item as json
      # return category.to_json
  
      category = Category.find_by_id(params[:id])
  
      if category
        category.destroy
      else
        halt 404
      end
    end
  
  end