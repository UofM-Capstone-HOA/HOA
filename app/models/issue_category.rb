class IssueCategory < ActiveRecord::Base
	has_many :issues
end
