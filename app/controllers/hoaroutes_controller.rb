class HoaroutesController < ApplicationController
  before_action :authenticate_user!

  def index

  	@issues = Issue.all
  	@hash = Gmaps4rails.build_markers(@issues) do |issue, marker|
  		marker.lat issue.address.latitude
  		marker.lng issue.address.longitude
  		marker.infowindow issue.address.full_address + "<br />" + issue.note +
  		"<br />" + "Status: " + issue.issue_status_category_id.to_s



  		if issue.issue_status_category_id == 1
      		marker.picture({
  			:url => "/assets/IssueOpen.gif",
  			:width => 32,
  			:height => 32
  			})
    	elsif issue.issue_status_category_id == 2
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
    # send_file(Rails.root.join('app' , 'assets', 'kml', 'current_route.xml'))
    # send_file "app/assets/kml/current_route.xml"
  end

  def postroute
    params[:hoaroute][:user_id] = current_user.id
    coord = Hoaroute.new(hoaroute_params)
    coord.save!
    coord = Hoaroute.where(['user_id = (?)', current_user]).select(:lat, :long)
    # coord = Hoaroute.all.select(:lat, :long)
    coord = coord.as_json  
    coord = coord.map{ |i| {"lng": i["long"], "lat": i["lat"]}}

    render json: [coord]
  end

  def getkml
    # .where(['user_id = (?)', nil])
    coord = Hoaroute.where(['user_id = (?)', current_user]).select(:lat, :long)
    # coord = Hoaroute.all.select(:lat, :long)
    coord = coord.as_json
    coord = coord.map{ |i| {"lng": i["long"], "lat": i["lat"]}}
    render json: [coord]
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def hoaroute_params
      params.require(:hoaroute).permit(:user_id, 
            :lat, 
            :long
            )
    end
end
