Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  user_name: ENV['gmail_username'],
  password: ENV['gmail_password'],
  authentication: "plain",
  enable_starttls_auto: true
}
