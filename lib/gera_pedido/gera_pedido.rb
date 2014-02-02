module CucumberServiceHelper

  require HTTParty
  
  def post_checkout(json_checkout)
    resposta2 = HTTParty.post('http://napsao-nix-d-pan02.dev.vmcommerce.intra:9092/services/checkout/pvt/orders', 
      {
      :headers => {'Content-Type' => 'application/json'}, 
      :body => File.read(File.join('features/support/fixtures/', json_checkout)), 
      :basic_auth => {:username => 'services', :password => '123456'} 
      })

    puts resposta2.body, resposta2.code

    res = JSON.parse(resposta2.body)
    @idMkp = res["orderId"]
    puts @idMkp
  end

  def post_croupier(text) 
    resposta = HTTParty.post('http://vip-croupier-app-qa.qa.vmcommerce.intra/v1/down/order/number', 
      {
        :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'}, 
        :body => {:id => text}.to_json, 
        :basic_auth => {:username => 'pstore', :password => 'pSt0r3'} 
        })

    puts resposta.body, resposta.code
  end

end