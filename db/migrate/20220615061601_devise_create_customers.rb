# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      # created_at	作成日			datetime
      # updated_at	更新日			datetime


      t.timestamps null: false
      t.string :family_name, null: false
    # family_name	苗字			string
      t.string :first_name, null: false
    # first_name	氏名			string
      t.string :family_name_kana, null: false
    # family_name_kana	苗字（カナ入力）			string
      t.string :first_name_kana, null: false
    # first_name_kana	氏名(カナ入力)			string
      t.string :postal_code, null: false
    # postal_code	郵便番号			string
      t.string :address, null: false
    # address	住所			string
      t.string :phone_number, null: false
    # phone_number	電話番号			string
      t.boolean :is_deleted,  null: false, default: false
    # is_deleted	退会ステータス			boolean


    end

    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
    # add_index :customers, :confirmation_token,   unique: true
    # add_index :customers, :unlock_token,         unique: true



  end
end
