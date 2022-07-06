class HomeController < ApplicationController
  def index
    @url_comm_inj = "/command_inj/?" +
      "param_code_inj=puts 'You have been hacked'&" +
      "param_comm_inj=open -a Calculator"
    
    @url_sql_inj = "/sql_inj/?" +
        "param_sql_inj=' or '' = '"

    @url_xss = "/xss/?" +
      "param_script=<img src=x onerror=alert(1)>&" +
      "param_cont_tag=/><script>alert(2)</script>&" +
      "param_href=javascript:alert(3)&" +
      "param_js=alert(4)"
    
    @url_csrf = "/csrf/?" +
      "param_csrf=CSRF Done"

    @url_red = "/open_red/?" +
      "param_red=/bad_redirect"
    
    @url_render = "/dyn_render/?" +
      "param_render=bad"

    @url_ssrf = "/ssrf/?" +
      "param_ssrf=https://example.com"
    
    @url_deser = "/deserialize/?" +
      "param_deser=\x04\bI\"\x11hello world!\x06:\x06ET&" +
      'param_deser2=U: DeserializeController::User{:fullnameI"Mehdi Farsi:ET'
      # "param_deser2=U: DeserializeController::User{:agei/:fullnameI\"Mehdi Farsi:ET"
  end
end
