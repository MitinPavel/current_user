module CurrentUser
  module Controller
    module Helpers
      def authenticate_user!
        if current_user.nil?
          render_unauthorized
        end
      end

      def current_user
        user_id = session[::CurrentUser::USER_SESSION_KEY]

        ::User.find_by_id user_id
      end

      def sign_in(user)
        session[::CurrentUser::USER_SESSION_KEY] = user.id
      end

      def sign_out
        session[::CurrentUser::USER_SESSION_KEY] = nil
      end

      def signed_in?; end
      def user_signed_in?; end

      private

      def render_unauthorized
        render :text => 'Unauthorized', :status => :unauthorized
      end
    end
  end
end