class DevicesController < ApplicationController
    
    
    def new
         @user = current_user || User.find_by_api_key(get_apikey)
         
         @newdevice = @user.channels.new
         
         
        
    end
    def show
    
    end
    
    def index
    end
    
    def create
        
        @user = current_user || User.find_by_api_key(get_apikey)
        
        channel = @user.channels.create({ :name => params[:channel][:name], :description => params[:channel][:description] })
        # make updating attributes easier
        #params[:channel] = params
     
    
        #channel.set_windows(true)
        channel.save
        #channel.save_tags(params[:channel][:tags]) if params[:channel][:tags].present?
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
