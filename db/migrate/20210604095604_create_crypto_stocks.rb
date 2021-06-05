class CreateCryptoStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :crypto_stocks do |t|
      t.string :symbol
      t.decimal :cost_per
      t.decimal :amount_owned
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
