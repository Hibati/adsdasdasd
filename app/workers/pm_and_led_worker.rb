class PmAndLedWorker #< ActiveJob::Base
  
  require 'open-uri'
  require 'json'
  require "uri"
  
  def perform(channel_id, event1, event2, event3, apikey)

    api = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=1'
    api_1 = api.to_s
    api2 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=0'
    api_0 = api2.to_s
    url_1 = 'http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json'
    
    loop do 
        result = JSON.parse(open(url_1).read)
        ch = result['field1']
        if event3 == 'Open'
            if event1 == '<'
                puts "==================Doing < Open============================"
                if ch < event2
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                end
                sleep 3
            elsif event1 == '<='
                puts "==================Doing <= Open============================"
                if ch <= event2
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                end 
                sleep 3
            elsif event1 == '='
                puts "==================Doing = Open============================"
                if ch == event2
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                end 
                sleep 3
            elsif event1 == '>'
                puts "==================Doing > Open============================"
                if ch > event2
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                end
                sleep 3
            elsif event1 == '>='
                puts "==================Doing >= Open============================"
                if ch >= event2
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                end 
                sleep 3                
            end
        elsif event3 == 'Close'
            if event1 == '<'
                puts "==================Doing < Close============================"
                if ch < event2
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                end
                sleep 3
            elsif event1 == '<='
                puts "==================Doing <= Close ============================"
                if ch <= event2
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                end 
                sleep 3
            elsif event1 == '='
                puts "==================Doing = Close============================"
                if ch == event2
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                end 
                sleep 3
            elsif event1 == '>'
                puts "==================Doing > Close============================"
                if ch > event2
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                end
                sleep 3
            elsif event1 == '>='
                puts "==================Doing >= Close============================"
                if ch >= event2
                    uri = URI(api_0)
                    Net::HTTP.get(uri)
                else
                    uri = URI(api_1)
                    Net::HTTP.get(uri)
                end 
                sleep 3
            end  
        end
    end
    
  end
end
