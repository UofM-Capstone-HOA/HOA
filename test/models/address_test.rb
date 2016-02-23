require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "test address for numbers" do
	a1 = addresses(:a1)
	assert_not a1.valid?  #Should return as NOT valid, but we assert_not therefore our response should be true
	end




end
