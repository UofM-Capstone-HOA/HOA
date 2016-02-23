class Issue < ActiveRecord::Base
  belongs_to :addressId
  belongs_to :homeownerId
  belongs_to :letterId
  belongs_to :userId
  belongs_to :issueCategoryId


  validates :date, :addressId, :user_id, :issueCategory_id, presence: true
  validates :note, length: { in: 1..500}



end
