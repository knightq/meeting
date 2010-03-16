# Loads action_mailer settings from email.yml
# and turns deliveries on if configuration file is found

#filename = File.join(File.dirname(__FILE__), '..', 'email.yml')
#if File.file?(filename)
#  mailconfig = YAML::load_file(filename)

#  if mailconfig.is_a?(Hash) && mailconfig.has_key?(Rails.env)
#    # Enable deliveries
#    ActionMailer::Base.perform_deliveries = true
#    
#    mailconfig[Rails.env].each do |k, v|
#      v.symbolize_keys! if v.respond_to?(:symbolize_keys!)
#      ActionMailer::Base.send("#{k}=", v)
#    end
#  end
#end

#ActionMailer::Base.delivery_method = :sendmail
#ActionMailer::Base.sendmail_settings = {
#  :location       => '/usr/sbin/sendmail',
#  :arguments      => '-i -t'
#}
##ActionMailer::Base.template_root = "mailer/templates"
#  # mailer will look for rhtml templates in that path
#  # example: "mailer/templates/my_mailer/signup_mail.rhtml"
#ActionMailer::Base.perform_deliveries = true # the "deliver_*" methods are available
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default_charset = "utf-8"
#ActionMailer::Base.default_content_type = "text/html" # default: "text/plain"
#ActionMailer::Base.default_mime_version = "1.0"
#ActionMailer::Base.default_implicit_parts_order = [ "text/html", "text/plain"]

