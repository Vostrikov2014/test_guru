class FeedbackController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def create
    FeedbackMailer.feedback(current_user, feedback_params).deliver_now
    flash[:notice] = t('.feedback')
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:body)
  end

end
