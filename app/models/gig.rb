class Gig < ActiveRecord::Base
  has_many :proposals
  belong_to :category
  has_many :abilities
  has_many :skills, through: :abilities
end