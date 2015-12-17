class TempAndLedAirWorker
  require 'open-uri'
  require 'json'
  require "uri"
    
  def perform(channel_id, event1, event2, event3, event4, event5, event6, apikey)
    puts channel_id
    puts event1
    puts event2
    puts event3
    puts event4
    puts event5
    puts event6
    puts apikey
    
    url_1 = 'http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json'
    
    ##Led
    api = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=1'
    api_1 = api.to_s

    api2 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=0'
    api_0 = api2.to_s

    ##air
    api_3 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field5=1'
    api_4 = api_3.to_s
    
    api_5 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field5=0'
    api_6 = api_5.to_s
    
    loop do
      if event3 == 'Open' && event4 == 'Open'
        if event1 == '>'
          puts "==================Doing > Open============================"
          result = JSON.parse(open(url_1).read)
          ch = result['field1']
          if ch < event2
             uri = URI(api_1)
             Net::HTTP.get(uri)
             uri2 = URI(api_4)
             Net::HTTP.get(uri2)
             sleep event6.to_i
          else
             uri = URI(api_0)
             Net::HTTP.get(uri)
             uri2 = URI(api_6)
             Net::HTTP.get(uri2)
             sleep event6.to_i
          end
        end
        
      end
    end
    
    
    
  end
  
end