class SqlInjController < ApplicationController
  def index
    param_sql_inj = params[:param_sql_inj] || '1'
    @records = Record.where("id = '" + param_sql_inj + "'");
  end
end
