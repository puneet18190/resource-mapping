class ComponentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_component, only: [:update, :destroy]
  
  def show
    @component = Component.find(params[:id])
  end

  def edit

    @component = Component.find_by_id(params[:id])
    @section = Section.find(params[:section_id])
    # @component.resources.build
  end
  def new
    @component = Component.new
    @section = Section.find(params[:section_id])
    @component.resources.build
    # @blocks = ContentBlock.all
    # @resources = @component.resources
    # questions = @component.questions
  end

  def create
    # binding.pry

    @component = Section.find(params[:section_id]).components.new(component_params)

    respond_to do |format|
      if @component.save
        format.html { redirect_to add_components_tool_path(params[:tool_id]), notice: 'Component was successfully created.' }
      end
    end
  end

  def update
     # binding.pry
    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to add_components_tool_path(params[:tool_id]), notice: 'Component was successfully updated.' }
      end
    end
  end

  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Component was successfully destroyed.' }
    end
  end

  private
    def set_component
      @component = Component.find(params[:id])
    end
  
    def component_params
      params.require(:component).permit(:title,:description,:section_id,resources_attributes: [:id,:title,:r_type,:url],questions_attributes: [:id,:title,:help])
    end
end
