class Repo < ApplicationRecord
  validates :repourl, presence: true
end
