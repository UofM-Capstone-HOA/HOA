class Issue < ActiveRecord::Base
  belongs_to :addressId
  belongs_to :homeownerId
  belongs_to :letterId
  belongs_to :userId
  belongs_to :issueCategoryId

  # for carrierwave
  mount_uploader :picture, ImageUploader
end
