class HomeOwner < ActiveRecord::Base

	has_many :issues
	has_many :addresses

  validates :firstname, :lastname, presence: true   
  validates :email, :phone, format: { without: /\s/ } #Do not allow white space for First or Last names.:firstname,:lastname,
  validates :firstname, :lastname, length:  { in: 1..40 }

  validates :phone, format: { with: /\A[\d]{3}[-][\d]{3}-[\d]{4}\Z/ }, allow_blank: true
  validates :email, format: { with: /.+@.+/}, allow_blank: true

  def fullname
    "#{firstname} #{lastname} "
  end


   def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file, extension: :xlsx)
    header = spreadsheet.row(1)     
    ActiveRecord::Base.transaction do
      spreadsheet.each(lastname: 'lastname', firstname: 'firstname') do |hash|        
        if hash[:lastname] == "lastname"
          #puts hash.inspect
        else
          begin      
          HomeOwner.create!( lastname: hash[:lastname], firstname: hash[:firstname])                     
          #sleep 0.25 #added to prevent query limit
          end          
        end 
      end
    end
  end

end
