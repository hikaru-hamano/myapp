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
