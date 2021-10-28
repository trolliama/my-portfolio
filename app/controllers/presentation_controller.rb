class PresentationController < ApplicationController
  before_action :set_profile, only: [:about, :create]

  def about
    @contact = Contact.new
    return @profile, @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      flash.now[:primary] = ['Message sent!']
    else
      flash.now[:danger] = @contact.errors.full_messages
    end

    @contact = Contact.new
    render "about"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message, :nickname)
  end

  def set_profile
    @profile = Profile.find(1)
  end

end
