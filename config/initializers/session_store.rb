if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_rails_blog", domain: "jdh-rails-blog-herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end