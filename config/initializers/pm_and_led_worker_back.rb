require 'json'   
require 'open-uri'
require 'thread'

a = Channel.all.size
i = 0
$cron_thread_palwb = []
  
Channel.all.each do |channels|
    puts channels.id
    channel_id = channels.id
    apikey = ApiKey.where(channel_id: 33, write_flag: 1).first.api_key
    event1 = channels.Event_1
    event2 = channels.Event_2.to_s
    event3 = channels.Event_3
    actionstatus = channels.action_status
    when_this_stuff_happens = channels.When_this_stuff_happens
    then_do_these_things_1st = channels.Then_do_these_things_1st
    
     
    puts apikey
    puts apikey.to_s
    
    
    if actionstatus == "running" && when_this_stuff_happens == "PM2.5" && then_do_these_things_1st == "Led"
      $cron_thread_palwb << Thread.new do
        my_thread_id = Thread.current.object_id
        puts my_thread_id
        Channel.find(channels.id).update(:jid_id => my_thread_id)
        
        api_1 = 'http://iotser.iots.com.tw:3000/update?api_key='"#{apikey}"'&field3=1'
        puts api_1
        #api_1 = api.to_s
        puts api_1.to_s
       
        #puts api_1
       
        api_0 = 'http://iotser.iots.com.tw:3000/update?api_key='"#{apikey}"'&field3=0'
        #api_0 = api2.to_s
        puts api_0
        puts api_0.to_s
         
        #puts api_0
     
        
        url_1 = 'http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json'
        puts url_1
        puts url_1.to_s
        
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
                    result = JSON.parse(open('http://iotser.iots.com.tw:3000/channels/'"#{channel_id}"'/field/1/last.json').read)
                    ch = result['field1']
                    if ch > event2
                      puts "============ > running 1 =============="
                        uri = URI(api_1)
                        Net::HTTP.get(uri)
                        sleep 3
                    else
                      puts "============ > running 0 =============="
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

end
