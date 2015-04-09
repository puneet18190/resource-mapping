class ContentBlocksController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_content_block, only: [:update, :destroy]
  
  def create
    @content_block = ContentBlock.new(content_block_params)

    respond_to do |format|
      if @content_block.save
        format.html { redirect_to :back, notice: 'Content Block was successfully created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @content_block.update(content_block_params)
        format.html { redirect_to :back, notice: 'Content Block was successfully updated.' }
      end
    end
  end

  def destroy
    @content_block.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Content Block was successfully destroyed.' }
    end
  end

  private
    def set_content_block
      @content_block = ContentBlock.find(params[:id])
    end
  
    def content_block_params
      params.require(:content_block).permit(:title,:tool_id)
    end
end
