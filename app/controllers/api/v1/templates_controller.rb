class Api::V1::TemplatesController < ActionController::API
  
  before_filter :get_cate
  before_filter :get_template, only: :fields

  def index
    render json: Templates::Cate.find(params[:cate_id]).templates
  end

  def fields
    @templates
  end

  private

  def get_cate
    @cate = Templates::Cate.find(params.fetch(:cate_id))
  end

  def get_template
    @cate.templates.find(params.fetch(:id))
  end

end