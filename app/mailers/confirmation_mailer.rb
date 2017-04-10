class ConfirmationMailer < ApplicationMailer

  def send_confirmation_link_to_new_user(user)
    @user = user
    if @user.present?
      mail(to: @user.email, subject: "Message from STEM-LAB: Please confirm your email")
    end
  end

  def send_request_for_user_account_verification_and_activation(user)
    @user = user
    @admin = User.where(role: 'admin');
    if @user.present?
      @admin.each do |admin|
        mail(to: admin.email, subject: "Verify and activate user: #{@user.id}")
      end
    end
  end

end
