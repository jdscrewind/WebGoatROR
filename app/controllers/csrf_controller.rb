# frozen_string_literal: true

#
# Csrf Controller
#
class CsrfController < ApplicationController
  # CHECKED by brakeman
  def index
    param_csrf = params[:param_csrf] || ''
    # 1st flow
    rec = Record.find(1)
    rec.desc = "#{param_csrf} - Flow 1"
    rec.save
    # 2nd flow
    rec2 = Record.find(2)
    rec2.update(desc: "#{param_csrf} - Flow 2")
    @records = Record.all
  end
end
