# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

  protected
    # アカウント編集後、プロフィール画面に移動する
    def after_update_path_for(resource)
      user_show_path(id: current_user.id)
    end
end
