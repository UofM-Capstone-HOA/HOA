class Issue < ActiveRecord::Base

 	belongs_to :address
  	belongs_to :home_owner #, class_name: "HomeOwner", foreign_key: "homeOwner_id"
  	belongs_to :letter
  	belongs_to :user
  	belongs_to :issue_category #, class_name: "IssueCategory", foreign_key: "issue_category_id"

  	validates :issue_category, presence: true
    validates :date, :addressId, :user_id, :issueCategory_id, presence: true
    validates :note, length: { in: 1..500}

  # for carrierwave
  mount_uploader :picture, ImageUploader

  # def get_address
  # 	Address.find(self.addressId)
  # end 

end
