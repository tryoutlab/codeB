class Repo
  include ActiveModel::Model

  attr_accessor :repourl

  validates :repourl, presence: true
end