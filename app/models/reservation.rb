class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :money
    validates :people
    
  end
  def total
    money * people
  end
  
  def date_gap
  self.end_date - self.start_date
  end
end
