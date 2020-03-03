class LevelsController < ApplicationController
  before_action :check_coockie

  def index
    respond_to do |format|
      levels = GraphqlLevelSearcher.new(cookies[:_somos_matriz_api_session])
      format.json{ render :json => levels.search_names(params[:name])}
    end
  end 

  def check_coockie
    if cookies[:_somos_matriz_api_session].nil?
      respond_to do |format|
        format.json{ render :json => 'Access Denied', :status => 401 }
      end
    end
  end

end