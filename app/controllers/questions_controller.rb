class QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_question, only: [:update, :destroy]
  
  def create
    @question = question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to :back, notice: 'Question was successfully created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to :back, notice: 'Question was successfully updated.' }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Question was successfully destroyed.' }
    end
  end

  
  private
    def set_question
      @question = question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :help, :component_id)
    end
end
