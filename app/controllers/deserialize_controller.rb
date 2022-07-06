class DeserializeController < ApplicationController

  User = Struct.new(:age, :fullname) do
    def marshal_dump
      {}.tap do |result|
        # result[:age]      = age
        result[:fullname] = fullname
      end
    end

    def marshal_load(serialized_user)
      # self.age      = serialized_user[:age]
      self.fullname = serialized_user[:fullname]
    end
  end

  def index
    param_deser = params[:param_deser] || ''
    param_deser2 = params[:param_deser2] || ''
    # STRING
    # serialized_string = Marshal.dump(param_deser) # => "\x04\bI\"\x11hello world!\x06:\x06ET"
    # serialized_string.class                       # => String
    
    deserialized_str = Marshal.load(param_deser) # => "hello world!"

    # RECORD MODEL
    rec = Record.find(1)
    # rec_dump = Marshal.dump(rec) # 'in Record#marshal_dump'
    # rec_dump                     
    
    # Marshal.load(param_deser2)
    # Marshal.restore(param_deser2)

    # USER STRUCT
    user = User.new(42, 'Mehdi Farsi')
    user_dump = Marshal.dump(user) # 'in User#marshal_dump'
    puts user_dump              # "\x04\bU: DeserializeController::User{\a:\bagei/:\rfullnameI\"\x10Mehdi Farsi\x06:\x06ET"
    user2 = Marshal.load(user_dump) # => "USER"
    puts param_deser2.to_str

    # CHANGE RECORD TO USER
    # serialized_param = Marshal.dump(param_deser2)
    user = Marshal.load(param_deser2) # TRIGGERS AN ERROR

    o = Klass.new("hello\n")
    data = CSV.dump(o)
    # ruleid: bad-deserialization
    obj = data.object_load()
  end
end
