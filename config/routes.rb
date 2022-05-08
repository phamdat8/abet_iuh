# == Route Map
#
#                                  Prefix Verb   URI Pattern                                                                              Controller#Action
#                        new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                            user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                    destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                       new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                      edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                           user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                         PUT    /users/password(.:format)                                                                devise/passwords#update
#                                         POST   /users/password(.:format)                                                                devise/passwords#create
#                cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#                   new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#                  edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                       user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                         PUT    /users(.:format)                                                                         devise/registrations#update
#                                         DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                         POST   /users(.:format)                                                                         devise/registrations#create
#                                    root GET    /                                                                                        homes#index
#                               admin_asd GET    /admin/asd(.:format)                                                                     admin/home#index
#                              admin_root GET    /admin(.:format)                                                                         admin/home#index
#                             admin_users GET    /admin/users(.:format)                                                                   admin/users#index
#                                         POST   /admin/users(.:format)                                                                   admin/users#create
#                          new_admin_user GET    /admin/users/new(.:format)                                                               admin/users#new
#                         edit_admin_user GET    /admin/users/:id/edit(.:format)                                                          admin/users#edit
#                              admin_user GET    /admin/users/:id(.:format)                                                               admin/users#show
#                                         PATCH  /admin/users/:id(.:format)                                                               admin/users#update
#                                         PUT    /admin/users/:id(.:format)                                                               admin/users#update
#                                         DELETE /admin/users/:id(.:format)                                                               admin/users#destroy
#                       admin_user_import GET    /admin/user/import(.:format)                                                             admin/users#import
#                                         POST   /admin/user/import(.:format)                                                             admin/users#import_data
#               admin_subject_score_types GET    /admin/subjects/:subject_id/score_types(.:format)                                        admin/score_types#index
#                                         POST   /admin/subjects/:subject_id/score_types(.:format)                                        admin/score_types#create
#            new_admin_subject_score_type GET    /admin/subjects/:subject_id/score_types/new(.:format)                                    admin/score_types#new
#           edit_admin_subject_score_type GET    /admin/subjects/:subject_id/score_types/:id/edit(.:format)                               admin/score_types#edit
#                admin_subject_score_type GET    /admin/subjects/:subject_id/score_types/:id(.:format)                                    admin/score_types#show
#                                         PATCH  /admin/subjects/:subject_id/score_types/:id(.:format)                                    admin/score_types#update
#                                         PUT    /admin/subjects/:subject_id/score_types/:id(.:format)                                    admin/score_types#update
#                                         DELETE /admin/subjects/:subject_id/score_types/:id(.:format)                                    admin/score_types#destroy
#                          admin_subjects GET    /admin/subjects(.:format)                                                                admin/subjects#index
#                                         POST   /admin/subjects(.:format)                                                                admin/subjects#create
#                       new_admin_subject GET    /admin/subjects/new(.:format)                                                            admin/subjects#new
#                      edit_admin_subject GET    /admin/subjects/:id/edit(.:format)                                                       admin/subjects#edit
#                           admin_subject GET    /admin/subjects/:id(.:format)                                                            admin/subjects#show
#                                         PATCH  /admin/subjects/:id(.:format)                                                            admin/subjects#update
#                                         PUT    /admin/subjects/:id(.:format)                                                            admin/subjects#update
#                                         DELETE /admin/subjects/:id(.:format)                                                            admin/subjects#destroy
#                  admin_original_classes GET    /admin/original_classes(.:format)                                                        admin/original_classes#index
#                                         POST   /admin/original_classes(.:format)                                                        admin/original_classes#create
#                new_admin_original_class GET    /admin/original_classes/new(.:format)                                                    admin/original_classes#new
#               edit_admin_original_class GET    /admin/original_classes/:id/edit(.:format)                                               admin/original_classes#edit
#                    admin_original_class GET    /admin/original_classes/:id(.:format)                                                    admin/original_classes#show
#                                         PATCH  /admin/original_classes/:id(.:format)                                                    admin/original_classes#update
#                                         PUT    /admin/original_classes/:id(.:format)                                                    admin/original_classes#update
#                                         DELETE /admin/original_classes/:id(.:format)                                                    admin/original_classes#destroy
#                          admin_students GET    /admin/students(.:format)                                                                admin/students#index
#                                         POST   /admin/students(.:format)                                                                admin/students#create
#                       new_admin_student GET    /admin/students/new(.:format)                                                            admin/students#new
#                      edit_admin_student GET    /admin/students/:id/edit(.:format)                                                       admin/students#edit
#                           admin_student GET    /admin/students/:id(.:format)                                                            admin/students#show
#                                         PATCH  /admin/students/:id(.:format)                                                            admin/students#update
#                                         PUT    /admin/students/:id(.:format)                                                            admin/students#update
#                                         DELETE /admin/students/:id(.:format)                                                            admin/students#destroy
#         admin_section_class_permissions GET    /admin/section_classes/:section_class_id/permissions(.:format)                           admin/permissions#index
#                                         POST   /admin/section_classes/:section_class_id/permissions(.:format)                           admin/permissions#create
#      new_admin_section_class_permission GET    /admin/section_classes/:section_class_id/permissions/new(.:format)                       admin/permissions#new
#     edit_admin_section_class_permission GET    /admin/section_classes/:section_class_id/permissions/:id/edit(.:format)                  admin/permissions#edit
#          admin_section_class_permission GET    /admin/section_classes/:section_class_id/permissions/:id(.:format)                       admin/permissions#show
#                                         PATCH  /admin/section_classes/:section_class_id/permissions/:id(.:format)                       admin/permissions#update
#                                         PUT    /admin/section_classes/:section_class_id/permissions/:id(.:format)                       admin/permissions#update
#                                         DELETE /admin/section_classes/:section_class_id/permissions/:id(.:format)                       admin/permissions#destroy
# admin_section_class_student_class_index GET    /admin/section_classes/:section_class_id/student_class(.:format)                         admin/student_class#index
#                                         POST   /admin/section_classes/:section_class_id/student_class(.:format)                         admin/student_class#create
#   new_admin_section_class_student_class GET    /admin/section_classes/:section_class_id/student_class/new(.:format)                     admin/student_class#new
#  edit_admin_section_class_student_class GET    /admin/section_classes/:section_class_id/student_class/:id/edit(.:format)                admin/student_class#edit
#       admin_section_class_student_class GET    /admin/section_classes/:section_class_id/student_class/:id(.:format)                     admin/student_class#show
#                                         PATCH  /admin/section_classes/:section_class_id/student_class/:id(.:format)                     admin/student_class#update
#                                         PUT    /admin/section_classes/:section_class_id/student_class/:id(.:format)                     admin/student_class#update
#                                         DELETE /admin/section_classes/:section_class_id/student_class/:id(.:format)                     admin/student_class#destroy
#                   admin_section_classes GET    /admin/section_classes(.:format)                                                         admin/section_classes#index
#                                         POST   /admin/section_classes(.:format)                                                         admin/section_classes#create
#                 new_admin_section_class GET    /admin/section_classes/new(.:format)                                                     admin/section_classes#new
#                edit_admin_section_class GET    /admin/section_classes/:id/edit(.:format)                                                admin/section_classes#edit
#                     admin_section_class GET    /admin/section_classes/:id(.:format)                                                     admin/section_classes#show
#                                         PATCH  /admin/section_classes/:id(.:format)                                                     admin/section_classes#update
#                                         PUT    /admin/section_classes/:id(.:format)                                                     admin/section_classes#update
#                                         DELETE /admin/section_classes/:id(.:format)                                                     admin/section_classes#destroy
#                           lecturer_root GET    /lecturer(.:format)                                                                      lecturer/home#index
#                       lecturer_students GET    /lecturer/students(.:format)                                                             lecturer/students#index
#                                         POST   /lecturer/students(.:format)                                                             lecturer/students#create
#                    new_lecturer_student GET    /lecturer/students/new(.:format)                                                         lecturer/students#new
#                   edit_lecturer_student GET    /lecturer/students/:id/edit(.:format)                                                    lecturer/students#edit
#                        lecturer_student GET    /lecturer/students/:id(.:format)                                                         lecturer/students#show
#                                         PATCH  /lecturer/students/:id(.:format)                                                         lecturer/students#update
#                                         PUT    /lecturer/students/:id(.:format)                                                         lecturer/students#update
#                                         DELETE /lecturer/students/:id(.:format)                                                         lecturer/students#destroy
#                       lecturer_subjects GET    /lecturer/subjects(.:format)                                                             lecturer/subjects#index
#                                         POST   /lecturer/subjects(.:format)                                                             lecturer/subjects#create
#                    new_lecturer_subject GET    /lecturer/subjects/new(.:format)                                                         lecturer/subjects#new
#                   edit_lecturer_subject GET    /lecturer/subjects/:id/edit(.:format)                                                    lecturer/subjects#edit
#                        lecturer_subject GET    /lecturer/subjects/:id(.:format)                                                         lecturer/subjects#show
#                                         PATCH  /lecturer/subjects/:id(.:format)                                                         lecturer/subjects#update
#                                         PUT    /lecturer/subjects/:id(.:format)                                                         lecturer/subjects#update
#                                         DELETE /lecturer/subjects/:id(.:format)                                                         lecturer/subjects#destroy
#                   lecturer_score_boards GET    /lecturer/score_boards(.:format)                                                         lecturer/score_boards#index
#                                         POST   /lecturer/score_boards(.:format)                                                         lecturer/score_boards#create
#                new_lecturer_score_board GET    /lecturer/score_boards/new(.:format)                                                     lecturer/score_boards#new
#               edit_lecturer_score_board GET    /lecturer/score_boards/:id/edit(.:format)                                                lecturer/score_boards#edit
#                    lecturer_score_board GET    /lecturer/score_boards/:id(.:format)                                                     lecturer/score_boards#show
#                                         PATCH  /lecturer/score_boards/:id(.:format)                                                     lecturer/score_boards#update
#                                         PUT    /lecturer/score_boards/:id(.:format)                                                     lecturer/score_boards#update
#                                         DELETE /lecturer/score_boards/:id(.:format)                                                     lecturer/score_boards#destroy
#                lecturer_section_classes GET    /lecturer/section_classes(.:format)                                                      lecturer/section_classes#index
#                                         POST   /lecturer/section_classes(.:format)                                                      lecturer/section_classes#create
#              new_lecturer_section_class GET    /lecturer/section_classes/new(.:format)                                                  lecturer/section_classes#new
#             edit_lecturer_section_class GET    /lecturer/section_classes/:id/edit(.:format)                                             lecturer/section_classes#edit
#                  lecturer_section_class GET    /lecturer/section_classes/:id(.:format)                                                  lecturer/section_classes#show
#                                         PATCH  /lecturer/section_classes/:id(.:format)                                                  lecturer/section_classes#update
#                                         PUT    /lecturer/section_classes/:id(.:format)                                                  lecturer/section_classes#update
#                                         DELETE /lecturer/section_classes/:id(.:format)                                                  lecturer/section_classes#destroy
#                      rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#               rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                      rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#               update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                    rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get '/test', to: 'homes#test'
  get '/new_password', to: 'homes#new_pass'
  post '/new_password', to: 'homes#change_pass'
  get '/measurement_plan', to: 'homes#measurement_plan'
  namespace :admin do
    root 'home#index'
    resources :users
    get '/user/import', to: 'users#import'
    post '/user/import', to: 'users#import_data'
    resources :subjects do
      resources :score_types
      resources :abet_levels
      resources :learning_outcomes do
        resources :lo_types
      end
    end
    resources :original_classes
    resources :students
    resources :section_classes do
      resources :permissions
      resources :student_class
    end
    resources :so do
      resources :pi do
        resources :pi_lo do
        end
      end
    end
  end
  namespace 'lecturer' do
    root 'home#index'
    resources :students
    resources :subjects
    resources :score_boards
    resources :section_classes do
      post :export
      resources :score_boards do
      end
    end
    get 'update_score', to: 'section_classes#update_score'
  end

  namespace 'manage' do
    root 'so#index'
    resources :so
  end
end
