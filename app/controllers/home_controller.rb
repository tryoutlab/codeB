class HomeController < ApplicationController
  
  def index
    @repo = Repo.new
  end

  def check
    @repo = Repo.new(repo_params)
    if @repo.valid?
      # 成功した場合
      @gitclone_result = gitclone_repo(repo_params[:repourl])
      #puts @gitclone_result
      render 'home/check'
    else
      # 失敗した場合
      render 'home/index'
    end
  end

  private
  def repo_params
    params.require(:repo).permit(:repourl)
  end

  def gitclone_repo(repo_url)
    #o, e, s = Open3.capture3("cd /tmp && ls && git clone #{repo_url}")
    repo_url_split = repo_url.split("/")
    p repo_url_split
    repo_name = repo_url_split[4].split(".").slice(0)
    o, e, s = Open3.capture3("git clone --progress --verbose #{repo_url} /tmp/#{repo_name} 2>&1")

    o
    #Open3.popen3("wget #{repo_url}") do |i, o, e, w|
      
      # コマンド結果はstderr(エラー出力)に返される
      #e.each { |line| puts line }

  end
end
