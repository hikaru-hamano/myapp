class HomeController < ApplicationController
  def index
    @tasks = Task.paginate(page: params[:page], per_page: 5).search(params[:search])
  end
end
