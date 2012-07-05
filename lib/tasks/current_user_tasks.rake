namespace :current_user do
  desc "Show a path to the sign in page"
  task :sign_in_path => :environment  do
    key =  ::CurrentUser.authentication_key

    if key.present?
      include Rails.application.routes.url_helpers
      puts "#{current_user_path}/#{key}/sign_in"
    else
      # TODO: extract KEY_FILE_PATH constant.
      puts 'Error: there is no authentication key. Check out config/current_user/key file.'
    end
  end
end
