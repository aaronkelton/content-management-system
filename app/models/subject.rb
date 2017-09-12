class Subject < ApplicationRecord
  ################# ASSOCIATIONS ####################
  has_one :page
  # has_many :pages
  # has_many :sections, through: :pages
  ################# END ASSOCIATIONS ################

  ################# SCOPES! #########################
  # Subject.where(visible: true)
  scope :visible, lambda { where(visible: true) }

  # Subject.where(visible: false) # stabby lambda
  scope :invisible, -> { where(visible: false) }

  # Subject.order(:position) # class method
  def self.sorted
    order(position: :ASC)
  end

  # Subject.order(created_at: DESC) # sans parens
  scope :newest_first, lambda { order created_at: :DESC }

  # Subject.where(name: LIKE "%#{query}%") ???
  scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%"])
  }
  ################# END SCOPES! #####################

end
