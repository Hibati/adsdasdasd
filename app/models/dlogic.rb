class Dlogic < ActiveRecord::Base
  
  cxt = V8::Context.new
  cxt.eval('7 * 6') #=> 42
  
end
