class Repo
  include ActiveModel::Model
  attr_accessor :repo

  validate :repo , presence: true
end