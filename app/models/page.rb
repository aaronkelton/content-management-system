class Page < ApplicationRecord
  ################# ASSOCIATIONS ####################
  belongs_to :subject, { optional: true } # 5.0+ defaults false
  has_and_belongs_to_many :admin_users
  # has_many :sections

  #, join_table: :pages_admin_users # override conventions

  ################# END ASSOCIATIONS ################
end
