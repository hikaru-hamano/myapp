class Room < ApplicationRecord
  belongs_to :user
  
  attachment :image  
  has_many :reservations
  
  def set_date
  created_at.strftime("%Y年%m月%d日")
  end
  with_options presence: true do
    validates :title
    validates :body
    validates :image
    validates :money
  end
   
  def self.search_area(search)
    if search
      where(['address LIKE ?', "%#{search}%"]) 
    else
      Room.all
    end
  end
  
  def self.search_key(search)
    if search
      where(['title LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%"]) 
    else
      Room.all
    end
  end
  
  
end
