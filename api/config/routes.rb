Rails.application.routes.draw do
  #namespaceを設定した場合、controllerを配置するディレクトリに注意
  #今回の場合はapp/controllers/api/v1/に配置
  namespace :api do
    namespace :v1 do
      resources :restaurants do
        resources :foods, only: %i[index]
      end
      resources :line_foods, only: %i[index create]
      #'line_foods/replace'にPUTリクエストが送られたら、line_foods_controllerのreplaceメソッドを呼ぶ
      put 'line_foods/replace', to: 'line_foods#replace'
      resources :orders, only: %i[create]
    end
  end
end
