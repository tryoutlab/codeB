class HomeController < ApplicationController
  def index
    @repo = Repo.new
  end

  def check
    @repo = Repo.new(repo_params)
    if @repo.valid?
      # 成功した場合
      render 'home/index'
    else
      # 失敗した場合
      render 'home/index'
    end
  end

  private
  def repo_params
    params.require(:repo).permit(:repourl)
  end

end
