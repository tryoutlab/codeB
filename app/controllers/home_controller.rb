class HomeController < ApplicationController
  def index
    @repo = Repo.new
  end

  def check
    @repo = Repo.new(repo_params)
    if @repo.save
      # 成功した場合
      render 'repos/create'
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
