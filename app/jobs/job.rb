class OpeningJob
require 'open-uri'
require 'json'
require 'net/http'
    
    # event1 = Diot.find(params[:id]).event1 # =
    # event2 = Diot.find(params[:id]).event2 # 28
    # event3 = Diot.find(params[:id]).event3 # Open
    
    def perform(event1, event2, event3)
        loop do
            if event3 == 'Open'
                if event1 == '<'
                    puts "==================Doing < Open============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch < event2
                        puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    end
                elsif event1 == '<='
                    puts "==================Doing <= Open============================"
                  result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                  ch = result['field1']
                    if ch <= event2
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                elsif event1 == '='
                    puts "==================Doing = Open============================"
                  result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                  ch = result['field1']
                    if ch == event2
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                elsif event1 == '>'
                    puts "==================Doing > Open============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch > event2
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    end
                elsif event1 == '>='
                    puts "==================Doing >= Open============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch >= event2
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                end
            elsif event3 == 'Close'
                if event1 == '<'
                    puts "==================Doing < Close============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch < event2
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    end
                elsif event1 == '<='
                    puts "==================Doing <= Close ============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch <= event2
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                elsif event1 == '='
                    puts "==================Doing = Close============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch == event2
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                elsif event1 == '>'
                    puts "==================Doing > Close============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch > event2
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    end
                elsif event1 == '>='
                    puts "==================Doing >= Close============================"
                    result = JSON.parse(open("http://192.168.1.202:3000/channels/33/fields/1/last.json?api_key=0HZ0QXSI02OR1XXW&timezone=Asia/Taipei").read)
                    ch = result['field1']
                    if ch >= event2
                      puts "========= updata 0 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=0')
                        Net::HTTP.get(uri)
                        sleep 5
                    else
                      puts "========= updata 1 =========="
                        uri = URI('http://192.168.1.202:3000/update?key=0HZ0QXSI02OR1XXW&field3=1')
                        Net::HTTP.get(uri)
                        sleep 5
                    end 
                end
                
            end
        end
    end
end