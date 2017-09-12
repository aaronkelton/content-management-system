class AdminUser < ApplicationRecord

  ##### ASSOCIATIONS #####
  has_and_belongs_to_many :pages
  ########################

  ################################
  ## explicitly define ar_table
  # self.table_name = "admin_user"
  ################################
end
