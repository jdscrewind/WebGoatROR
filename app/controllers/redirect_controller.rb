class RedirectController < ApplicationController
  def index
    param_red = params[:param_red] || ''

    redirect_to param_red +
      "?param_bad=You were redirected to a vulnerable site!&" +
      "title_bad=Attacker's Redirection"
  end

  def bad
  end

  def renderm
    param_render = params[:param_render] || ''
    # params_aux does not work like this
    params_aux = { :param_bad => "A vulnerable view was rendered!", :title_bad => "Attacker's Render" }
    params[:param_bad] = "A vulnerable view was rendered!"
    params[:title_bad] = "Attacker's Render"

    render param_render, params: params_aux
  end
end
