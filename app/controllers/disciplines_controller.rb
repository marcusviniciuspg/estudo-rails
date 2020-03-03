class DisciplinesController < ApplicationController
  before_action :check_coockie

  def index
    respond_to do |format|
      #byebug
      disciplines = GraphqlDisciplineSearcher.new(cookies[:_somos_matriz_api_session])
      format.json{ render :json => disciplines.search_discipline_names_by_level_id(params[:level_id])}
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