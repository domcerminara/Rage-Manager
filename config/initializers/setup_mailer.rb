ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :user_name => "dompkt2013",
  :password => "gennaro1",
  :authentication => "plain",
  :enable_starttls_auto => true
}