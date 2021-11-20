class Task < ApplicationRecord
  scope :mypage_search, ->(user_id, search_params = {}) do
    
    board = Board.where(user_id: user_id)
    board = board.where("title LIKE ?", "%#{search_params[:address]}%")
  end
  def self.search(search) #self.はUser.を意味する
    if search
      where(['address LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
      all #全て表示させる
    end
  end
end
