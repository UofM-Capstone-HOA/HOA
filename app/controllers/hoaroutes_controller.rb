class HoaroutesController < ApplicationController

  def index
  	@issues = Issue.all
  	@hash = Gmaps4rails.build_markers(@issues) do |issue, marker|
  		marker.lat issue.address.latitude
  		marker.lng issue.address.longitude
  		marker.infowindow issue.address.full_address + "<br />" + issue.note +
  		"<br />" + "Status: " + issue.issue_status



  		if issue.lien == false && issue.resolved == false
      		marker.picture({
  			:url => "/assets/IssueOpen.gif",
  			:width => 32,
  			:height => 32
  			})
    	elsif issue.resolved == true
      		marker.picture({
  			:url => "/assets/IssueResolved.gif",
  			:width	=> 32,
  			:height => 27
  			})
    	else
      		marker.picture({
  			:url => "/assets/IssueLien.gif",
  			:width	=> 32,
  			:height => 32
  			})
    	end
  	end
  end

  def getroute
    send_file(Rails.root.join('app' , 'assets', 'kml', 'current_route.xml'))
    # send_file "app/assets/kml/current_route.xml"
  end

  def postroute
    # send_file(Rails.root.join('app' , 'assets', 'kml', 'current_route.xml'))
    # send_file "app/assets/kml/current_route.xml"

    puts params.inspect
  end
  
end
