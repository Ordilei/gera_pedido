module CucumberServiceHelper

  require HTTParty
  def conect_service
  	 @config_ped = "#{RAILS_ROOT}/config/config_ped.yml"
     puts "  config_ped => #{config_ped}"
  end
  
  def post_service(json_choice)
  	@conect_service_up = YAML.load_file(config_ped)[:conect_service_up]
    
    resposta2 = HTTParty.post(conect_service_up[:host], 
      {
      :headers => {'Content-Type' => 'application/json'}, 
      :body => File.read(File.join('features/support/fixtures/', post_service)), 
      :basic_auth => {:username => conect_service_up[:name], :password => conect_service_up[:password]} 
      })

    puts resposta2.body, resposta2.code

    res = JSON.parse(resposta2.body)
    @idMkp = res["orderId"]
    puts @idMkp
  end

  def post_service_down(text)

  	@conect_service_fall = YAML.load_file(config_ped)[:conect_service_fall]
    resposta = HTTParty.post(conect_service_fall[:host], 
      {
        :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'}, 
        :body => {:id => text}.to_json, 
        :basic_auth => {:username => conect_service_fall[:name], :password => conect_service_fall[:password]} 
        })

    puts resposta.body, resposta.code
  end

end