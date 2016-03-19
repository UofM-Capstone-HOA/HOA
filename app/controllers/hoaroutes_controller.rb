class HoaroutesController < ApplicationController

  def index
  	@issues = Issue.all
  	@hash = Gmaps4rails.build_markers(@issues) do |issue, marker|
  		marker.lat issue.address.latitude
  		marker.lng issue.address.longitude
  		marker.infowindow issue.address.full_address + "<br />" + issue.note +
  		"<br />" + "Status: " + issue.issue_status

	end
  end

end
