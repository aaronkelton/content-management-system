class Page < ApplicationRecord
  ################# ASSOCIATIONS ####################
  belongs_to :subject, optional: false # 5.0+ defaults false
  has_many :sections
  has_and_belongs_to_many :admin_users

  #, join_table: :pages_admin_users # override conventions

  ################# END ASSOCIATIONS ################
end
