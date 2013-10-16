class NotificationsMailer < ActionMailer::Base

  default :to => "rsearl.90@gmail.com"
  default :from => "ContactMessage@mySite.com"

  def new_message(message)
    @message = message
    mail(:subject => "A Contact From Submission has been sent.")
  end

end
