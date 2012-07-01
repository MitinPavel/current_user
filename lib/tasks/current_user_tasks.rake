namespace :current_user do
  desc "Show a path to the sign in page"
  task :sign_in_path => :environment  do
    key =  ::CurrentUser.authentication_key

    unless key.blank?
      # TODO: use route helpers.
      puts "/current_user/keys/#{key}/sign_in/new"
    else
      puts 'Error: there is no authentication key. Check out config/current_user/key file.'
    end
  end
end
