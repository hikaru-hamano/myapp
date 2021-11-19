class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :money
    validates :people
  end
  
  def days
  self.end_date.to_date - self.start_date.to_date
  end
  validate :date_cannot_be_in_the_past 
def date_cannot_be_in_the_past
  if start_date.present? && start_date < Date.today
    errors.add(:start_date, "：過去の日付は無効です") 
  end

  if end_date.present? && end_date < Date.today
    errors.add(:end_date, "：過去の日付は無効です") 
  end

  if end_date.present? && end_date < start_date
    errors.add(:end_date, "：終了日は開始日より前に指定はできません")
  end
end
end
