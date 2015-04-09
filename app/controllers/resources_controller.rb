class ResourcesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_resource, only: [:update, :destroy]
  
  def create
    @resource = resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to :back, notice: 'Resource was successfully created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to :back, notice: 'Resource was successfully updated.' }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Resource was successfully destroyed.' }
    end
  end

  
  private
    def set_resource
      @resource = resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :type,:url, :component_id)
    end
end
