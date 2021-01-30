class ApplicationController < ActionController::API
  before_action :fake_load

  # --- 1秒間、実行を停止 ---
  def fake_load
    sleep(1)
  end

end
