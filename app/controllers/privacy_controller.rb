# frozen_string_literal: true

require 'logger'

#
# Privacy Controller
#
class PrivacyController < ApplicationController
  def index
    log = Logger.new($stdout)
    log.info(password)

    log.debug(pass)
    log.warn(passw)
    log.error("Log: #{pwd}")
    log.error(pwd + 'Log: ')
    log.error("Log: " + pwd)
    log.fatal("Password: ", secret)
    log.fatal("Secret: ", "", secret_key)
  end
end
