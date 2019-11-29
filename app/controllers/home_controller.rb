class HomeController < ApplicationController
  
  def index
    @repo = Repo.new
  end

  def check
    @repo = Repo.new(repo_params)
    if @repo.valid?
      # 成功した場合
      download_repo(repo_params[:repourl])
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

  def download_repo(repo_url)
    Open3.popen3("wget #{repo_url}") do |i, o, e, w|
      
      # コマンド結果はstderr(エラー出力)に返される
      e.each { |line| puts line }

    end
  end
end
