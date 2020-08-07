class BadgesController < ApplicationController

  def index
    #@user_badges = current_user.badges
    @user_badges = Badge.all
    @badges = Badge.all
  end
end
