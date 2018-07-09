Rails.application.routes.draw do
  root to: 'visitors#index'
  get "/student", to: "visitors#student", as: "student"
  get "/marseille", to: "visitors#marseille", as: "marseille"
end
