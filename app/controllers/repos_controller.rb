class ReposController < ApplicationController
  def create
    p params[:repourl]
    @repo = Repo.new(params[:repourl])
    if @repo.save
      p "2"
      redirect_to root_path
    else
      p "1"
      redirect_to root_path
    end
  end
end
