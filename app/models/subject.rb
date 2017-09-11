class Subject < ApplicationRecord
  has_many :pages
  has_many :sections, through: :pages
end
