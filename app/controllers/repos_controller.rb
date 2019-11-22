class ReposController < ApplicationController
  def result
    p params
  end

  private 
  def repos_params
    params.require(:repos).permit(:reposurl)
  end
end
