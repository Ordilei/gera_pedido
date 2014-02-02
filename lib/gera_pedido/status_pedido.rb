module CucumberSigeConnectionHelpers
  require 'oci8'

  def conection
    config_ped = "#{RAILS_ROOT}/config/config_ped.yml"
      puts "  config_ped => #{config_ped}"

    @conect_banco = YAML.load_file(config_ped)[:conect_banco]
    puts "  @conf => #{@conf[0][:conf]}"      

    @conn = OCI8.new(conect_banco[:name], conect_banco[:password], conect_banco[:database])

  end 

  def proc_1(text1)
    @conn
    cursor = conn.parse("BEGIN pc_sige_pagto.procmarcafraude(:idpedido); END;")
    cursor.bind_param(':idpedido', text1)
    cursor.exec()
    p cursor[':idpedido']
    conn.commit
    sleep 3;
    conn.logoff
  end

  def proc_2(text2)
    @conn
    cursor2 = conn.parse("BEGIN pc_sige_pagto.procretfraude(:idpedido,'AP'); END;")
    cursor2.bind_param(':idpedido', text2)
    cursor2.exec()
    p cursor2[':idpedido']
    conn.commit
    sleep 3;
    conn.logoff
  end

  def proc_3(text3)
    @conn
    cursor3 = conn.parse("BEGIN pc_sige_pagto.procmarcapag(:idpedido); END;")
    cursor3.bind_param(':idpedido', text3)
    cursor3.exec()
    p cursor3[':idpedido']
    conn.commit
    sleep 3;
    conn.logoff
  end

  def proc_4(text4)
    @conn
    cursor4 = conn.parse("BEGIN pc_sige_pagto.procretpag(:idpedido, 1, 'AP', null, null, 012, 1421, 1421, trunc(sysdate), null, null, null, null, null, null, '999.99', '999.99', 1, null); END;")
    cursor4.bind_param(':idpedido', text4)
    cursor4.exec()
    p cursor4[':idpedido']
    conn.commit
    sleep 3;
    conn.logoff
  end

  def proc_5(text5)
    @conn    
    cursor4 = conn.parse("BEGIN pc_npro_marketplace.retorno_entrega(p_id_cia => 1, p_id_pedido => :idpedido, p_status => 'S', p_in_erro => null, p_mens_erro => null); END;")
    cursor4.bind_param(':idpedido', text4)
    cursor4.exec()
    p cursor4[':idpedido']
    conn.commit
    sleep 3;
    conn.logoff
  end

end
