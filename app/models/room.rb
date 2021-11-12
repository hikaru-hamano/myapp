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
end
