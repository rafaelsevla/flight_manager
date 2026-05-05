class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.string :gateway_transaction_id, null: false
      t.string :payment_method, null: false
      # 'CREDIT_CARD' | 'DEBIT_CARD' | 'PIX' | 'BOLETO' | 'PAYPAL'
      t.string :status, null: false, default: 'PENDING'
      # 'PENDING' | 'APPROVED' | 'DECLINED' | 'REFUNDED'
      t.string :card_last_four, limit: 4
      t.datetime :paid_at

      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
