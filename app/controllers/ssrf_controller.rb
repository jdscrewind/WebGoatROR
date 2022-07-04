# nethttp.rb
require 'uri'
require 'net/http'
# httparty.rb
require 'httparty'
# http.rb
require "http"
# httpx.rb
require "httpx"
# faraday.rb
require "faraday"

class SsrfController < ApplicationController
  def index
    param_ssrf = params[:param_ssrf] || '1'
    # nethttp.rb
    uri = URI(param_ssrf)
    resp = Net::HTTP.get_response(uri)
    @ssrf = resp.body if resp.is_a?(Net::HTTPSuccess)
    # httparty.rb
    resp2 = HTTParty.get(param_ssrf)
    @ssrf_2 = resp2.body if resp2.code == 200
    # http.rb
    resp3 = HTTP.get(param_ssrf, :params => {:api_key => "DEMO_KEY"})
    @ssrf_3 = resp3.body
    # httpx.rb
    resp4 = HTTPX.get(param_ssrf)
    @ssrf_4 = resp4.body if resp4.status == 200
    # faraday.rb
    resp5 = Faraday.get(param_ssrf)
    @ssrf_5 = resp5.body if resp5.status == 200
  end
end
