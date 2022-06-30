class XssController < ApplicationController
  def index
    # 8 Reflected XSS on view
    @param_script = params[:param_script] || ''
    @param_cont_tag = params[:param_cont_tag] || ''
    @param_href = params[:param_href] || ''
    @param_js = params[:param_js] || ''
  end
end
