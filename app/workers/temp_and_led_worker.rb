class TempAndLedWorker #< ActiveJob::Base
  
  require 'open-uri'
  require 'json'
  require "uri"
  
  def perform(channel_id, event1, event2, event3, apikey)
    # Do something later
     puts channel_id
     puts event1
     puts event2
     puts event3
     puts apikey
     
     api = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=1'
     #api_1 = 'http://iotser.iots.com.tw:3000/update?api_key='"#{apikey}"'&field3=1'
     api_1 = api.to_s
     
     puts api_1
     
      api2 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field3=0'
      #api_0 = 'http://iotser.iots.com.tw:3000/update?api_key='"#{apikey}"'&field3=0'
      api_0 = api2.to_s
         
      puts api_0
     
      url_1 = 'http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json'
      puts url_1
      
    
     loop do 
            if event3 == 'Open'
                if event1 == '<'
                    puts "==================Doing < Open============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                     
                    if ch < event2
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    end
                elsif event1 == '<='
                    puts "==================Doing <= Open============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch <= event2
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                elsif event1 == '='
                    puts "==================Doing = Open============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch == event2
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                elsif event1 == '>'
                    puts "==================Doing > Open============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    puts ch
                    if ch > event2
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    end
                elsif event1 == '>='
                    puts "==================Doing >= Open============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch >= event2
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                end
            elsif event3 == 'Close'
                if event1 == '<'
                    puts "==================Doing < Close============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch < event2
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    end
                elsif event1 == '<='
                    puts "==================Doing <= Close ============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch <= event2
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                elsif event1 == '='
                    puts "==================Doing = Close============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch == event2
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                elsif event1 == '>'
                    puts "==================Doing > Close============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch > event2
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    end
                elsif event1 == '>='
                    puts "==================Doing >= Close============================"
                    result = JSON.parse(open(url_1).read)
                    ch = result['field1']
                    if ch >= event2
                        uri = URI(api_0)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    end 
                end
                
            end
        end
  end
end
