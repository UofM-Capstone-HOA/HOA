class Letter < ActiveRecord::Base
  belongs_to :issue

validates :letternum, numericality: true
validates :date, numericality: {greater_than_or_equal_to: 2015}
validates :date, numericality: {less_than_or_equal_to: 2100}

end
