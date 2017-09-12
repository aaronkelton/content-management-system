class AdminUser < ApplicationRecord

  ##### ASSOCIATIONS #####
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits
  ########################

  ################################
  ## explicitly define ar_table
  # self.table_name = "admin_user"
  ################################
end
