class HomeOwner < ActiveRecord::Base

	has_many :issues
	has_many :addresses

  validates :firstname, :lastname, presence: true   
  validates :firstname, :lastname, :email, :phone, format: { without: /\s/ } #Do not allow white space for First or Last names.
  validates :firstname, :lastname, length:  { in: 1..20 }

  validates :phone, format: { with: /\A[\d]{3}[-][\d]{3}-[\d]{4}\Z/ }, allow_blank: true
  validates :email, format: { with: /.+@.+/}, allow_blank: true

  def fullname
    "#{firstname} #{lastname} "
  end

end
