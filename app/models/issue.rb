class Issue < ActiveRecord::Base

 	  belongs_to :address
  	belongs_to :home_owner #, class_name: 'HomeOwner', foreign_key: "home_owner_id"
  	belongs_to :letter
  	belongs_to :user
  	belongs_to :issue_category #, class_name: "IssueCategory", foreign_key: "issue_category_id"
    belongs_to :issue_status_category

    validates :issue_status_category, presence: :true
  	validates :issue_category, presence: true
    validates :date, :address_id, :user_id, :issue_category_id, :home_owner, presence: true
    validates :note, length: { in: 0..500}

  # for carrierwave
  mount_uploaders :pictures, ImageUploader

  # def get_address
  # 	Address.find(self.addressId)
  # end 

  def issue_status
    if issue_status_category_id == 1
      "Open"
    elsif issue_status_category_id == 5
      "Resolved"
    else
      "Lien"
    end
  end

end
