class Page < ApplicationRecord
  ################# ASSOCIATIONS ####################
  belongs_to :subject
  # has_many :sections
  ################# END ASSOCIATIONS ################
end
