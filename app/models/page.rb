class Page < ApplicationRecord
  ################# ASSOCIATIONS ####################
  belongs_to :subject, { optional: true }
  # has_many :sections
  ################# END ASSOCIATIONS ################
end
