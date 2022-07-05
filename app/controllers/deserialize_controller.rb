class DeserializeController < ApplicationController
  def index
    param_deser = params[:param_deser] || ''
    user = Record.new(param_deser)
 
    user_dump = Marshal.dump(user) # 'in User#marshal_dump'
    user_dump                      # => "\x04\bU:\tUser{\a:\bagei/:\rfullnameI\"\x10Mehdi Farsi\x06:\x06ET"
    
    original_user = Marshal.load(user_dump)  # 'in User#marshal_load'
    CSV.load(param_deser)
    Marshal.load(param_deser)
    Marshal.restore(param_deser)
    
    o = Klass.new("hello\n")
    data = CSV.dump(o)
    # ruleid: bad-deserialization
    obj = data.object_load()
  end
end
