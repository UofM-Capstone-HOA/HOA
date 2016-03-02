class IssueCategory < ActiveRecord::Base

	has_many :issues

	validates :name, length: { in: 1..20}, uniqueness: true


end
