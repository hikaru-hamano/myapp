class Room < ApplicationRecord
  belongs_to :user
  attachment :image  
end
