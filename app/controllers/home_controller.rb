class HomeController < ApplicationController
  def index
    @repo = Repo.new
  end
end
