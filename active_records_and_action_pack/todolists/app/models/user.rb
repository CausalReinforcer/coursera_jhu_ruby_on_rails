class User < ActiveRecord::Base
  has_one :profile, dependent: :delete
  has_many :todo_lists
end
