class AirWorker #< ActiveJob::Base
  
  require 'open-uri'
  require 'json'
  require "uri"
  require 'time'
  
  # Controller Led
  def perform(channel_id, event1, event2, event4, event6, event7, apikey, client, twitter_check, eventemail)

    api = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field5=1'
    api_1 = api.to_s
    api2 = 'http://iotser.iots.com.tw:3000/update?api_key='+ apikey + '&field5=0'
    api_0 = api2.to_s
    url_1 = 'http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json'
    
    if event6 != "" and event6 != "Null"
        loop do
          time = Time.now
          if twitter_check == '1' and time.strftime("%A") == event6 and time.to_s(:time) == event7
            result = JSON.parse(open(url_1).read)
            ch = result['field1']
              if event4 == 'Open'
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
                  elsif event1 == '>'
                      puts "==================Doing > Open============================"
                      puts ch
                      if ch > event2
                          uri = URI(api_1)
                          Net::HTTP.get(uri)
                      else
                          uri = URI(api_0)
                          Net::HTTP.get(uri)
                      end
                      sleep 3
                      client.update(Time.now)
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
                      client.update(Time.now)
                  end
              elsif event4 == 'Close'
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
                  end
              end
          elsif time.strftime("%A") == event6 and time.to_s(:time) == event7
            result = JSON.parse(open(url_1).read)
            ch = result['field1']
              if event4 == 'Open'
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
              elsif event4 == 'Close'
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
    elsif twitter_check == '1'
        loop do
          result = JSON.parse(open(url_1).read)
          ch = result['field1']
          if event4 == 'Open'
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
                  elsif event1 == '>'
                      puts "==================Doing > Open============================"
                      puts ch
                      if ch > event2
                          uri = URI(api_1)
                          Net::HTTP.get(uri)
                      else
                          uri = URI(api_0)
                          Net::HTTP.get(uri)
                      end
                      sleep 3
                      client.update(Time.now)
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
                      client.update(Time.now)
                  end
          elsif event4 == 'Close'
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
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
                      client.update(Time.now)
                  end
          end
        end
    else
        loop do
            result = JSON.parse(open(url_1).read)
            ch = result['field1']
            if event4 == 'Open'
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
                      puts ch
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
            elsif event4 == 'Close'
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
end
