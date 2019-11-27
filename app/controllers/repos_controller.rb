class ReposController < ApplicationController
  def create
        
  end

  private 
  def repos_params
    params.require(:repos).permit(:reposurl)
  end
end
