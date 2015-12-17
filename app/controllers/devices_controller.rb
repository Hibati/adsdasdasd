class DevicesController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'net/http'
    
    def new
      
     
     
    end
    
    def edit
      
    end
    
    def show
    end
    
    def index
    end
    
    def create
        feed = Feed.new
        @user = current_user || User.find_by_api_key(get_apikey)
        
        channel = @user.channels.create({ 
          :name => params[:device_type], 
          :description => params[:device],
            
          :When_this_stuff_happens => params[:device],
          :Event_1 => 'Null',
          :Event_2 => 'Null',
          :Then_do_these_things_1st => 'Null',
          :Event_3 => 'Null',
          :Then_do_these_things_2st => 'Null',
          :Event_4 => 'Null',
          :Then_do_these_things_3st => 'Null',
          :Event_5 => 'Null',
          :Then_do_these_things_4st => 'Null',
          :Event_6 => 'Null',
          :action_status => 'stop',
          :public_flag => 'true',
          :jid_id => "",
          :latitude => "24.119479",
          :longitude => "120.677673"
          
        })
        
        #channel.set_windows(true)
        #channel.save
        #channel.save_tags(params[:channel][:tags]) if params[:channel][:tags].present?
        channel.save
        channel.add_write_api_key
        channel.set_ranking
        @channel_id = channel.id
        
        
        respond_to do |format|
          #format.json { render :json => channel.to_json(Channel.private_options) }
          #format.xml { render :xml => channel.to_xml(Channel.private_options) }
          format.any { redirect_to url_for(:controller => :channels, :action => :index) }
        end
        
    
    end
end
