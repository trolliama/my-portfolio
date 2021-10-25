class PresentationController < ApplicationController
  def about
    @profile = Profile.find(1)
    @profile
  end

  def contact
  end
end
