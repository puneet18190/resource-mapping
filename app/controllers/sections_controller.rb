class SectionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_section, only: [:update, :destroy]
  
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to :back, notice: 'Section was successfully created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to :back, notice: 'Section was successfully updated.' }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Section was successfully destroyed.' }
    end
  end

  
  private
    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:title, :description, :tool_id)
    end
end
