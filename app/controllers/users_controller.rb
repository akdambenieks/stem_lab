class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    @institution = Institution.new
  end

  def confirmation
    token = params[:id]
    user = User.find_by(confirmation_token: token)
    if user.present? && user.confirmation_token_valid?
      user.confirm_user!
      ConfirmationMailer.send_request_for_user_account_verification_and_activation(@user).deliver_later
      redirect_to root_path, notice: 'Your email has been confirmed!  Once we have verified your affiliation to your institution we will activate your account and send you a welcome email.'
    else
      flash.now[:alert] = "We're sorry but your email confirmation was unsuccessful.  If you believe this was in error, please contact us with the subject 'Failed Email Confirmation'"
      render root_path
    end
  end

  def create
    user_params = params.permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
    institution_params = params.permit(:name, :country, :city, :street, :postal_code, :contact_phone)
    @institution = Institution.new(institution_params)
    @user = User.new(user_params)
    if @institution.save
      @user.institution = @institution
      if @user.save
        ConfirmationMailer.send_confirmation_link_to_new_user(@user).deliver_later
        redirect_to root_path, notice: 'Your information has been submitted successfully.  You should receive a confirmation email shortly.  Once you have confirmed your email, we will contact your institution for further confirmation.  Thank you for your understanding and patience.'
      else
        @institution.destroy
        flash.now[:alert] = "Your information has not been submitted.  Please address following errors in the personal form: #{@user.errors.full_messages.join(', ')}"
        render new_user_path
      end
    else
      flash.now[:alert] = "Your information has not been submitted.  Please address following errors in the institution form: #{@institution.errors.full_messages.join(', ')}"
      render new_user_path
    end
  end

end
