class PagesController < ApplicationController
  layout 'application', :except => [:home, :social_home]
  
  require 'json'   
  require 'open-uri'
  require 'led_worker.rb'
  require 'air_worker.rb'
  require 'led_air_worker.rb'
  require 'pm_and_led_worker.rb'
  
  $cron_thread = []
  @@a = 0
  
  def home
    @menu = 'Internet of Things'
    render layout: 'home'
    drive_running()
  end
  
  def drive_running
    if @@a == 0
      Channel.all.each do |channels|
        puts channels.id
        @channel_id = channels.id
        @apikeyvalue = ApiKey.where(channel_id: channels.id, write_flag: 1).first.api_key
        @event1 = channels.Event_1
        @event2 = channels.Event_2.to_s
        @event3 = channels.Event_3
        actionstatus = channels.action_status
        when_this_stuff_happens = channels.When_this_stuff_happens
        then_do_these_things_1st = channels.Then_do_these_things_1st
        then_do_these_things_2st = channels.Then_do_these_things_2st
        then_do_these_things_3st = channels.Then_do_these_things_3st
        then_do_these_things_4st = channels.Then_do_these_things_4st
        @event4 = channels.Event_4
        @event5 = channels.Event_5
        @event6 = channels.Event_6.to_i
        @user_id = channels.user_id
        @eventemail = User.find(@user_id).email
        
        @client = Twitter::REST::Client.new do |config|
          config.consumer_key        = Rails.application.config.twitter_key
          config.consumer_secret     = Rails.application.config.twitter_secret
          config.access_token        = channels.twitter_oauth_token
          config.access_token_secret = channels.twitter_oauth_secret
        end
        
        my_thread_id = ""
        if actionstatus == "running"
          if then_do_these_things_1st == "Led" and then_do_these_things_2st == "Airconditioning"
            puts "====================== controller Temperature & Led & Airconditioning ============================"
            @@allthr << Thread.new do
              my_thread_id = Thread.current.object_id
              ob = LedAirWorker.new
              ob.perform(@channel.id, @event1, @event2, @event3, @event4, @event6, @event7, @apikeyvalue, @client, @twitter_check, @eventemail)
            end
          elsif when_this_stuff_happens == 'PM2.5' and then_do_these_things_1st == "Led"
            puts "====================== controller PM2.5 ============================"
            @@allthr << Thread.new do
              my_thread_id = Thread.current.object_id
              ob = PmAndLedWorker.new
              @apikeyvalue2 = ApiKey.where(channel_id: "33", write_flag: 1).first.api_key
              ob.perform(@channel.id, @event1, @event2, @event3, @apikeyvalue2)
            end
          elsif then_do_these_things_1st == "Led"
            puts "====================== controller & Led ============================"
            @@allthr << Thread.new do
              my_thread_id = Thread.current.object_id
              ob = LedWorker.new
              ob.perform(@channel.id, @event1, @event2, @event3, @event6, @event7, @apikeyvalue, @client, @twitter_check, @eventemail)
            end
          elsif then_do_these_things_1st == "Airconditioning"
            puts "====================== controller & Led ============================"
            @@allthr << Thread.new do
              my_thread_id = Thread.current.object_id
              ob = AirWorker.new
              ob.perform(@channel.id, @event1, @event2, @event4, @event6, @event7, @apikeyvalue, @client, @twitter_check, @eventemail)
            end
          end
          Channel.find(@channel_id).update(:action_status => 'running', :jid_id => my_thread_id)
        end
      end
    end
    @@a = @@a + 1
  end




  def social_home; ; end

  def about
    @menu = 'about'
  end

  def headers
  end

  # post contact email
  def contact_us
    # if no email address
    if params[:email].blank? || params[:email].index('@').blank?
      flash[:alert] = t(:contact_us_no_email)
    # if no message
    elsif params[:message].blank?
      flash[:alert] = t(:contact_us_no_message)
    # else send email if not a spambot (user must have javascript enabled)
    elsif params[:userlogin_js] == '6H2W6QYUAJT1Q8EB'
      Mailer.contact_us(params[:email], params[:message]).deliver
      flash[:notice] = t(:contact_us_success)
    end

    redirect_to root_path
  end
  

end

