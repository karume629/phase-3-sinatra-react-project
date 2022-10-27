class Expense < ActiveRecord::Base 
    has_one :category
end
  