key_file_path = 'config/current_user/key'
if File.exist? key_file_path
  key = File.open(key_file_path) { |f| f.readline }
  ::CurrentUser::Config.instance.key = key
end