# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150814140415) do

  create_table "accesory_component_by_budgets", :force => true do |t|
    t.integer  "product_by_budget_id"
    t.integer  "accessory_component_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accesory_component_by_invoices", :force => true do |t|
    t.integer  "product_by_invoice_id"
    t.integer  "accessory_component_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accessory_component_types", :force => true do |t|
    t.string  "name",                                        :null => false
    t.string  "full_name",                                   :null => false
    t.string  "tag_name",                                    :null => false
    t.float   "amount",                   :default => 0.0,   :null => false
    t.boolean "amount_per_square_meter",  :default => false
    t.boolean "amount_per_square_lineal", :default => false
    t.boolean "amount_per_unit",          :default => false
    t.boolean "amount_per_quarter_sheet", :default => false
    t.boolean "amount_per_quantity",      :default => false
    t.boolean "amount_per_distance",      :default => false
    t.integer "raw_material_id"
  end

  create_table "account_payable_incoming_invoice_document_types", :force => true do |t|
    t.string  "name",                                      :null => false
    t.string  "fullname",                                  :null => false
    t.string  "tag_name",                                  :null => false
    t.boolean "require_purchase_oden", :default => false
    t.string  "model_relationship",    :default => "None"
  end

  create_table "account_payable_incoming_invoice_positions", :force => true do |t|
    t.integer  "account_payable_incoming_invoice_id",                                               :null => false
    t.integer  "material_raw_material_id"
    t.integer  "material_order_measure_unit_id",                                                    :null => false
    t.float    "quantity",                                                                          :null => false
    t.float    "sub_total",                                                                         :null => false
    t.float    "total",                                                                             :null => false
    t.string   "description",                                                                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_id",                                                             :default => 3
    t.decimal  "tax_amount",                          :precision => 20, :scale => 2
    t.decimal  "taxable",                             :precision => 20, :scale => 2
    t.decimal  "total_amount",                        :precision => 20, :scale => 2
  end

  create_table "account_payable_incoming_invoice_retentions", :force => true do |t|
    t.integer  "account_payable_incoming_invoice_id",                                                 :null => false
    t.integer  "accounting_withholding_taxe_type_id",                                                 :null => false
    t.float    "percentage",                                                                          :null => false
    t.decimal  "subject_retention_amount",            :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "retained_amount",                     :precision => 20, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_incoming_invoice_status_types", :force => true do |t|
    t.string  "name",                        :null => false
    t.string  "tag_name",                    :null => false
    t.boolean "default",  :default => false
  end

  create_table "account_payable_incoming_invoice_taxes", :force => true do |t|
    t.integer  "account_payable_incoming_invoice_id",                                               :null => false
    t.decimal  "taxable",                             :precision => 20, :scale => 2,                :null => false
    t.integer  "tax_id",                                                             :default => 3, :null => false
    t.decimal  "tax_amount",                          :precision => 20, :scale => 2,                :null => false
    t.decimal  "total_amount",                        :precision => 20, :scale => 2,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_incoming_invoices", :force => true do |t|
    t.integer  "material_purchase_order_id"
    t.integer  "currency_type_id",                                                                                    :null => false
    t.integer  "account_payable_incoming_invoice_document_type_id",                                                   :null => false
    t.integer  "tenderer_id",                                                                                         :null => false
    t.string   "tenderer_type",                                                                                       :null => false
    t.integer  "create_by_id",                                                                                        :null => false
    t.string   "posting_date"
    t.string   "invoice_date",                                                                                        :null => false
    t.string   "reference",                                                                                           :null => false
    t.string   "control_number"
    t.string   "description",                                                                                         :null => false
    t.decimal  "sub_total_amount",                                  :precision => 20, :scale => 2,                    :null => false
    t.decimal  "tax",                                               :precision => 20, :scale => 2,                    :null => false
    t.decimal  "total_amount",                                      :precision => 20, :scale => 2,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance",                                           :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "no_deductible",                                                                    :default => false
    t.boolean  "associated_purchase_ledgers",                                                      :default => true
    t.boolean  "municipal_tax",                                                                    :default => false
    t.boolean  "legal_contractual_voluntary_obligation",                                           :default => false
    t.integer  "supplier_id",                                                                                         :null => false
    t.boolean  "tax_exempt",                                                                       :default => false
    t.decimal  "tax_amount",                                        :precision => 20, :scale => 2
    t.decimal  "retained_amount",                                   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_amount_general",                                :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_amount_reduced",                                :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_amount_additional",                             :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "amount_exempt",                                     :precision => 20, :scale => 2, :default => 0.0
    t.string   "purchase_ledger_period"
    t.decimal  "amount_general",                                    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "amount_reduced",                                    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "amount_additional",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "amount_total_to_paid",                              :precision => 20, :scale => 2, :default => 0.0
  end

  create_table "account_payable_payment_frequencies", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
    t.float  "factor"
  end

  create_table "account_payable_payment_order_document_types", :force => true do |t|
    t.string "name",                                   :null => false
    t.string "fullname",                               :null => false
    t.string "tag_name",                               :null => false
    t.string "model_relationship", :default => "None", :null => false
  end

  create_table "account_payable_payment_order_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "account_payable_payment_orders", :force => true do |t|
    t.integer  "accounting_accounting_concept_id",                                                               :null => false
    t.integer  "cash_bank_bank_id",                                                                              :null => false
    t.integer  "cash_bank_bank_account_id",                                                                      :null => false
    t.integer  "accounting_accountant_account_id",                                                               :null => false
    t.integer  "tenderer_id",                                                                                    :null => false
    t.string   "tenderer_type",                                                                                  :null => false
    t.integer  "cash_bank_involvement_type_id",                                                                  :null => false
    t.decimal  "account_balance_to_date",                        :precision => 20, :scale => 2
    t.string   "description",                                                                                    :null => false
    t.string   "posting_date",                                                                                   :null => false
    t.decimal  "amount",                                                                                         :null => false
    t.decimal  "amount_withheld_committed",                      :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "amount_withheld",                                :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.integer  "account_payable_payment_order_document_type_id"
    t.integer  "doc_id"
    t.string   "doc_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "create_by_id"
  end

  create_table "account_payable_payment_schedule_positions", :force => true do |t|
    t.integer  "account_payable_payment_schedule_id",                                                   :null => false
    t.integer  "number",                                                                                :null => false
    t.string   "expiration_date",                                                                       :null => false
    t.decimal  "amount",                              :precision => 20, :scale => 2,                    :null => false
    t.boolean  "paid",                                                               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_payment_schedules", :force => true do |t|
    t.integer  "cash_bank_bank_id",                                                                      :null => false
    t.integer  "cash_bank_bank_account_id",                                                              :null => false
    t.integer  "account_payable_incoming_invoice_id"
    t.integer  "tenderer_id",                                                                            :null => false
    t.string   "tenderer_type",                                                                          :null => false
    t.integer  "currency_type_id",                                                                       :null => false
    t.integer  "account_payable_payment_frequency_id",                                                   :null => false
    t.integer  "create_by_id",                                                                           :null => false
    t.integer  "share",                                                                                  :null => false
    t.decimal  "total_amount",                         :precision => 20, :scale => 2,                    :null => false
    t.decimal  "balance_amount",                       :precision => 20, :scale => 2,                    :null => false
    t.string   "init_date",                                                                              :null => false
    t.string   "end_date",                                                                               :null => false
    t.string   "description"
    t.boolean  "paid",                                                                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_purchase_requisition_positions", :force => true do |t|
    t.integer  "material_purchase_order_id",     :null => false
    t.integer  "material_order_measure_unit_id", :null => false
    t.integer  "material_raw_material_id"
    t.float    "quantity",                       :null => false
    t.date     "delivery_date"
    t.float    "sub_total",                      :null => false
    t.float    "total",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_purchase_requisitions", :force => true do |t|
    t.integer  "create_by_id",  :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_status_incoming_invoices", :force => true do |t|
    t.integer  "account_payable_incoming_invoice_status_type_id",                   :null => false
    t.integer  "account_payable_incoming_invoice_id",                               :null => false
    t.integer  "create_by_id",                                                      :null => false
    t.text     "note"
    t.boolean  "actual",                                          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_payable_supplier_credit_notes", :force => true do |t|
    t.integer  "supplier_id",                                     :null => false
    t.integer  "create_by_id",                                    :null => false
    t.string   "date",                                            :null => false
    t.string   "posting_date",                                    :null => false
    t.decimal  "sub_total_amount", :precision => 20, :scale => 2, :null => false
    t.decimal  "tax",              :precision => 20, :scale => 2, :null => false
    t.decimal  "tax_amount",       :precision => 20, :scale => 2, :null => false
    t.decimal  "total_amount",     :precision => 20, :scale => 2, :null => false
    t.decimal  "balance",          :precision => 20, :scale => 2, :null => false
    t.string   "description"
    t.string   "reference",                                       :null => false
    t.string   "control_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_accountant_accounts", :force => true do |t|
    t.integer  "currency_type_id",                    :null => false
    t.string   "name",                                :null => false
    t.string   "fullname",                            :null => false
    t.string   "code",                                :null => false
    t.float    "debit",             :default => 0.0
    t.float    "assets",            :default => 0.0
    t.string   "open_date",                           :null => false
    t.string   "close_date"
    t.boolean  "active",            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_account_id", :default => 0
  end

  create_table "accounting_accounting_concept_operation_types", :force => true do |t|
    t.integer "accounting_ledger_type_id",                    :null => false
    t.string  "name",                                         :null => false
    t.string  "fullname",                                     :null => false
    t.string  "description"
    t.string  "tag_name",                                     :null => false
    t.boolean "is_debit",                  :default => false
  end

  create_table "accounting_accounting_concepts", :force => true do |t|
    t.integer  "accounting_accounting_concept_operation_type_id", :null => false
    t.integer  "accounting_accountant_account_id",                :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_advances", :force => true do |t|
    t.integer  "client_id",                                                              :null => false
    t.integer  "doc_id",                                                                 :null => false
    t.string   "doc_type",                                                               :null => false
    t.integer  "user_id",                                                                :null => false
    t.text     "note"
    t.string   "date",                                                                   :null => false
    t.integer  "amount",     :limit => 20, :precision => 20, :scale => 0, :default => 0, :null => false
    t.integer  "balance",    :limit => 20, :precision => 20, :scale => 0, :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_basic_config_accounting_concepts", :force => true do |t|
    t.integer "accounting_accounting_concept_id"
    t.string  "name",                             :null => false
    t.string  "tag_name",                         :null => false
  end

  create_table "accounting_ledger_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "accounting_payable_accounts", :force => true do |t|
    t.integer  "doc_id",                                                                :null => false
    t.string   "doc_type",                                                              :null => false
    t.integer  "tenderer_id",                                                           :null => false
    t.string   "tenderer_type",                                                         :null => false
    t.string   "reference",                                                             :null => false
    t.string   "control_number"
    t.string   "date_doc",                                                              :null => false
    t.string   "date_doc_expiration",                                                   :null => false
    t.text     "note"
    t.decimal  "total",               :precision => 20, :scale => 2,                    :null => false
    t.decimal  "paid",                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "balance",             :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "cashed",                                             :default => false
    t.boolean  "canceled",                                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_receivable_accounts", :force => true do |t|
    t.integer  "doc_id",                                                                   :null => false
    t.string   "doc_type",                                                                 :null => false
    t.integer  "client_id",                                                                :null => false
    t.integer  "payment_method_type_id"
    t.string   "date_doc",                                                                 :null => false
    t.string   "date_doc_expiration",                                                      :null => false
    t.text     "note"
    t.decimal  "sub_total",              :precision => 20, :scale => 2,                    :null => false
    t.decimal  "tax",                    :precision => 20, :scale => 2,                    :null => false
    t.decimal  "total",                  :precision => 20, :scale => 2,                    :null => false
    t.decimal  "paid",                   :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "balance",                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "cashed",                                                :default => false
    t.boolean  "canceled",                                              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_retention_accounting_types", :force => true do |t|
    t.integer  "accounting_accountant_account_id",                  :null => false
    t.float    "retention_percentage",             :default => 0.0
    t.float    "reduction_tax_base",               :default => 0.0
    t.float    "reduction_taxable_lessened",       :default => 0.0
    t.string   "name",                                              :null => false
    t.string   "fullname",                                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_service_order_positions", :force => true do |t|
    t.integer  "accounting_purchase_order_id", :null => false
    t.string   "concept",                      :null => false
    t.float    "quantity",                     :null => false
    t.date     "delivery_date"
    t.float    "sub_total",                    :null => false
    t.float    "total",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_service_orders", :force => true do |t|
    t.integer  "supplier_id",      :null => false
    t.integer  "currency_type_id", :null => false
    t.integer  "create_by_id",     :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_transaction_movement_accounting_concepts", :force => true do |t|
    t.integer  "accounting_accountant_account_id",                                                 :null => false
    t.integer  "create_by_id",                                                                     :null => false
    t.integer  "reference_document_id"
    t.string   "reference_document_type"
    t.decimal  "debit",                            :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "credit",                           :precision => 20, :scale => 2, :default => 0.0
    t.string   "date",                                                                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounting_withholding_taxe_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "code",                          :null => false
    t.boolean  "is_natural", :default => false
    t.float    "percentage",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_component_types", :force => true do |t|
    t.string  "name",                                       :null => false
    t.string  "full_name",                                  :null => false
    t.string  "tag_name",                                   :null => false
    t.float   "quantity",                :default => 0.0
    t.boolean "amount_per_square_meter", :default => false
    t.float   "side_dimension_x",        :default => 0.0
    t.float   "side_dimension_y",        :default => 0.0
  end

  create_table "app_configs", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
    t.text   "value",    :null => false
  end

  create_table "assigments", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "binding_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "full_name",                    :null => false
    t.string  "tag_name",                     :null => false
    t.boolean "default",   :default => false
    t.float   "amount",                       :null => false
  end

  create_table "budgets", :force => true do |t|
    t.integer  "client_id",                                                                       :null => false
    t.decimal  "sub_total",                      :precision => 20, :scale => 2,                   :null => false
    t.decimal  "total",                          :precision => 20, :scale => 2,                   :null => false
    t.float    "discount",                                                      :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "delivery_date"
    t.decimal  "advance_payment",                :precision => 20, :scale => 2, :default => 0.0
    t.integer  "payment_method_type_id"
    t.string   "transaction_number"
    t.string   "transaction_date"
    t.integer  "user_id",                                                                         :null => false
    t.boolean  "with_advance_payment",                                          :default => true
    t.string   "responsible"
    t.float    "discount_percent",                                              :default => 0.0
    t.float    "increase_percent",                                              :default => 0.0
    t.integer  "cash_bank_pos_card_terminal_id"
    t.string   "delivery_time"
    t.integer  "invoice_printing_type_id"
    t.integer  "invoice_of_advance_payment_id"
    t.decimal  "tax",                            :precision => 20, :scale => 2, :default => 0.0,  :null => false
    t.decimal  "balance",                        :precision => 20, :scale => 2, :default => 0.0,  :null => false
  end

  create_table "cases", :force => true do |t|
    t.string   "subject",    :null => false
    t.text     "note",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_bank_account_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "cash_bank_bank_accounts", :force => true do |t|
    t.integer  "cash_bank_bank_id",                                                                  :null => false
    t.integer  "bank_account_type_id"
    t.integer  "accounting_accountant_account_id",                                                   :null => false
    t.string   "name"
    t.string   "number"
    t.string   "open_date",                                                                          :null => false
    t.string   "close_date"
    t.decimal  "initial_balance",                  :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "current_balance",                  :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "deferred_balance",                 :precision => 20, :scale => 2, :default => 0.0
    t.boolean  "used_checkbook",                                                  :default => false
    t.boolean  "active",                                                          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_bank_autoreconciliation_by_descriptions", :force => true do |t|
    t.integer  "cash_bank_bank_id", :null => false
    t.string   "name",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_bank_movement_operation_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "fullname",                     :null => false
    t.string  "tag_name",                     :null => false
    t.boolean "is_debit",  :default => false
    t.boolean "is_revert", :default => false
    t.boolean "visible",   :default => true
  end

  create_table "cash_bank_bank_movement_positions", :force => true do |t|
    t.integer  "cash_bank_bank_movement_id",                                                      :null => false
    t.integer  "reference_document_id"
    t.string   "reference_document_type"
    t.string   "control_number",                                               :default => "N/A"
    t.string   "reference",                                                    :default => "N/A"
    t.text     "description"
    t.decimal  "amount",                        :precision => 20, :scale => 2,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cash_bank_involvement_type_id",                                                   :null => false
    t.integer  "beneficiary_id",                                                                  :null => false
  end

  create_table "cash_bank_bank_movement_retention_positions", :force => true do |t|
    t.integer  "cash_bank_bank_movement_id",                                                              :null => false
    t.integer  "accounting_retention_accounting_type_id",                                                 :null => false
    t.decimal  "amount_subject_retention",                :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "amount_retained",                         :precision => 20, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_bank_movements", :force => true do |t|
    t.integer  "cash_bank_bank_movement_operation_type_id"
    t.integer  "accounting_accounting_concept_id",                                                                        :null => false
    t.integer  "cash_bank_bank_id",                                                                                       :null => false
    t.integer  "cash_bank_bank_account_id",                                                                               :null => false
    t.integer  "accounting_accountant_account_id",                                                                        :null => false
    t.decimal  "account_balance_to_date",                   :precision => 20, :scale => 2
    t.integer  "cash_bank_involvement_type_id"
    t.string   "description",                                                                                             :null => false
    t.integer  "reference_document_id"
    t.string   "reference_document_type",                                                  :default => "IncomingInvoice"
    t.string   "vale",                                                                                                    :null => false
    t.string   "date",                                                                                                    :null => false
    t.decimal  "amount",                                    :precision => 20, :scale => 2,                                :null => false
    t.decimal  "amount_withheld_committed",                 :precision => 20, :scale => 2, :default => 0.0,               :null => false
    t.decimal  "amount_withheld",                           :precision => 20, :scale => 2, :default => 0.0,               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cash_bank_checkbook_id"
    t.integer  "beneficiary_id",                                                                                          :null => false
    t.boolean  "printed",                                                                  :default => false
    t.integer  "create_by_id"
  end

  create_table "cash_bank_bank_reconciliation_bank_statements", :force => true do |t|
    t.integer "cash_bank_bank_reconciliation_id",                                :null => false
    t.string  "date",                                                            :null => false
    t.string  "reference",                                                       :null => false
    t.string  "description",                                                     :null => false
    t.decimal "debit_amount",                     :precision => 20, :scale => 2, :null => false
    t.decimal "credit_amount",                    :precision => 20, :scale => 2, :null => false
    t.decimal "balance",                          :precision => 20, :scale => 2
    t.string  "movement_operation",                                              :null => false
  end

  create_table "cash_bank_bank_reconciliations", :force => true do |t|
    t.string   "initial_date",                                                                             :null => false
    t.string   "final_date",                                                                               :null => false
    t.string   "period",                                                                                   :null => false
    t.integer  "cash_bank_bank_id",                                                                        :null => false
    t.integer  "cash_bank_bank_account_id",                                                                :null => false
    t.integer  "accounting_accountant_account_id",                                                         :null => false
    t.decimal  "account_balance_to_date",                  :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.string   "upload_filename_reconciliation",                                          :default => "0", :null => false
    t.decimal  "balance_according_bank",                   :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "balance_according_book",                   :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "transaction_not_registered_at_bank",       :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "transaction_not_registered_at_book",       :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "automatic_reconciled_transaction_at_bank", :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "automatic_reconciled_transaction_at_book", :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "error_at_bank",                            :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "error_at_book",                            :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "balance_movement_reconciliation",          :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_banks", :force => true do |t|
    t.string   "code",                                                                                    :null => false
    t.string   "name",                                                                                    :null => false
    t.string   "fullname",                                                                                :null => false
    t.boolean  "active",                                                          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "col_sep_bank_recon_file",                            :limit => 1, :default => ";"
    t.string   "format_date_bank_recon_file",                                     :default => "ddmmyyyy"
    t.string   "formt_curre_bank_recon_file",                                     :default => "DDDDdd"
    t.float    "format_check_amount_px",                                          :default => 492.0
    t.float    "format_check_amount_py",                                          :default => 20.0
    t.float    "format_check_supplier_px",                                        :default => 115.0
    t.float    "format_check_supplier_py",                                        :default => 95.0
    t.float    "format_check_amount_letter_1_px",                                 :default => 115.0
    t.float    "format_check_amount_letter_1_py",                                 :default => 115.0
    t.float    "format_check_amount_letter_2_px",                                 :default => 585.0
    t.float    "format_check_amount_letter_2_py",                                 :default => 75.0
    t.float    "format_check_city_date_px",                                       :default => 45.0
    t.float    "format_check_city_date_py",                                       :default => 160.0
    t.float    "format_check_year_px",                                            :default => 220.0
    t.float    "format_check_year_py",                                            :default => 160.0
    t.float    "format_check_not_endorsable_px",                                  :default => 522.0
    t.float    "format_check_not_endorsable_py",                                  :default => 20.0
    t.integer  "column_position_date_bank_recon_file",                            :default => 0
    t.integer  "column_position_reference_bank_recon_file",                       :default => 1
    t.integer  "column_position_description_bank_recon_file",                     :default => 2
    t.integer  "column_position_debit_amount_bank_recon_file",                    :default => 3
    t.integer  "column_position_credit_amount_bank_recon_file",                   :default => 4
    t.integer  "column_position_balance_bank_recon_file",                         :default => 5
    t.integer  "column_position_movement_operation_bank_recon_file",              :default => 6
  end

  create_table "cash_bank_cash_count_movements", :force => true do |t|
    t.integer  "cash_bank_daily_cash_closing_id"
    t.float    "total_amount_cash",               :null => false
    t.float    "diference_amount_cash",           :null => false
    t.float    "note_amount_cash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_cash_count_positions", :force => true do |t|
    t.integer  "cash_bank_cash_count_movement_id"
    t.integer  "measure_change_denomination_id"
    t.integer  "quantity"
    t.float    "total_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_cash_journal_count_positions", :force => true do |t|
    t.integer  "cash_bank_cash_journal_count_id", :null => false
    t.integer  "measure_change_denomination_id",  :null => false
    t.integer  "quantity",                        :null => false
    t.float    "total_amount",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_cash_journal_counts", :force => true do |t|
    t.integer  "cash_bank_cash_journal_id",   :null => false
    t.string   "date",                        :null => false
    t.float    "total_amount_register",       :null => false
    t.float    "difference_amount_count",     :null => false
    t.float    "total_amount_count",          :null => false
    t.integer  "responsible_id",              :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cash_journal_balance_amount"
  end

  create_table "cash_bank_cash_journal_position_category_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "tag_name",                      :null => false
    t.boolean  "is_debit",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_cash_journal_position_concept_types", :force => true do |t|
    t.integer "cash_bank_cash_journal_position_category_type_id",                    :null => false
    t.integer "concept_reference_id"
    t.string  "concept_reference_type"
    t.boolean "associate_to_external_concept",                    :default => false
    t.string  "name",                                                                :null => false
  end

  create_table "cash_bank_cash_journal_positions", :force => true do |t|
    t.integer  "cash_bank_cash_journal_id",                                                                          :null => false
    t.integer  "cash_bank_cash_journal_position_concept_type_id",                                                    :null => false
    t.integer  "cash_bank_cash_journal_position_category_type_id",                                                   :null => false
    t.decimal  "total",                                            :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.integer  "create_by_id",                                                                                       :null => false
    t.boolean  "is_fiscal",                                                                       :default => false
    t.decimal  "invoice_sub_total",                                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "invoice_tax",                                      :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.integer  "invoice_tenderer_id"
    t.string   "invoice_tenderer_type"
    t.string   "invoice_control_number"
    t.string   "invoice_reference"
    t.string   "invoice_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "count",                                                                           :default => false
    t.integer  "cash_bank_cash_journal_count_id"
  end

  create_table "cash_bank_cash_journals", :force => true do |t|
    t.integer  "cash_bank_cash_id",                                                                 :null => false
    t.integer  "create_by_id",                                                                      :null => false
    t.decimal  "current_balance_amount",          :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "opening_balance_amount",          :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_cash_receipts_amount",      :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_check_receipts_amount",     :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_cash_payment_amount",       :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "closing_balance_amount",          :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.string   "last_date_rehearing"
    t.boolean  "closed",                                                         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accounting_concept_rehearing_id",                                                   :null => false
    t.integer  "accounting_concept_create_id"
  end

  create_table "cash_bank_cash_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "cash_bank_cashes", :force => true do |t|
    t.integer  "accounting_accountant_account_id",                    :null => false
    t.integer  "responsible_id",                                      :null => false
    t.string   "name",                                                :null => false
    t.boolean  "active",                           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_fiscal_printer",               :default => false
    t.integer  "cash_bank_cash_type_id",                              :null => false
  end

  create_table "cash_bank_check_offereds", :force => true do |t|
    t.integer  "cash_bank_checkbook_id",                                                      :null => false
    t.integer  "cash_bank_check_status_type_id",                                              :null => false
    t.integer  "reference_id"
    t.integer  "responsible_id",                                                              :null => false
    t.integer  "number",                         :limit => 20, :precision => 20, :scale => 0, :null => false
    t.float    "amount",                                                                      :null => false
    t.string   "date",                                                                        :null => false
    t.string   "beneficiary",                                                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_check_status_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "cash_bank_checkbooks", :force => true do |t|
    t.integer  "cash_bank_bank_account_id",                                                                :null => false
    t.integer  "initial_check_number",      :limit => 20, :precision => 20, :scale => 0,                   :null => false
    t.integer  "final_check_number",        :limit => 20, :precision => 20, :scale => 0,                   :null => false
    t.boolean  "active",                                                                 :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_daily_cash_closings", :force => true do |t|
    t.integer  "cash_bank_cash_id",                                                                               :null => false
    t.string   "report_z_number",                                                                                 :null => false
    t.string   "date",                                                                                            :null => false
    t.decimal  "total_amount_sales",                              :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_amount_cash",                               :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_amount_credit",                             :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_amount_debit",                              :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_amount_check",                              :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_amount_deposit",                            :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_with_advance_payment",         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_cash_with_advance_payment",    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_credit_with_advance_payment",  :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_debit_with_advance_payment",   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_check_with_advance_payment",   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_order_amount_deposit_with_advance_payment", :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_sales_fiscal",                       :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_cash_fiscal",                        :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_credit_fiscal",                      :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_debit_fiscal",                       :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_check_fiscal",                       :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_deposit_fiscal",                     :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_sales_free_form",                    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_cash_free_form",                     :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_credit_free_form",                   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_debit_free_form",                    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_check_free_form",                    :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_amount_deposit_free_form",                  :precision => 20, :scale => 2, :default => 0.0
    t.integer  "cash_bank_daily_cash_opening_id",                                                                 :null => false
    t.integer  "responsible_id",                                                                                  :null => false
  end

  create_table "cash_bank_daily_cash_openings", :force => true do |t|
    t.integer  "cash_bank_cash_id",                    :null => false
    t.boolean  "closed",            :default => false
    t.boolean  "closed_by_system",  :default => false
    t.boolean  "closed_by_fiscal",  :default => false
    t.string   "date",                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_involvement_types", :force => true do |t|
    t.string  "name",                                          :null => false
    t.string  "fullname",                                      :null => false
    t.string  "tag_name",                                      :null => false
    t.boolean "is_debit",                   :default => false
    t.boolean "require_reference_document", :default => true
  end

  create_table "cash_bank_pos_card_terminal_movements", :force => true do |t|
    t.integer  "cash_bank_daily_cash_closing_id"
    t.float    "total_amount_credit_debit",       :null => false
    t.float    "diference_amount_credit_debit",   :null => false
    t.float    "note_amount_credit_debit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_pos_card_terminal_positions", :force => true do |t|
    t.integer  "cash_bank_pos_card_terminal_movement_id",                                                               :null => false
    t.integer  "cash_bank_pos_card_terminal_id",                                                                        :null => false
    t.integer  "lot_number",                              :limit => 20, :precision => 20, :scale => 0,                  :null => false
    t.float    "debit_total",                                                                          :default => 0.0, :null => false
    t.float    "credit_total",                                                                         :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_pos_card_terminals", :force => true do |t|
    t.integer  "cash_bank_bank_account_id",                                                                :null => false
    t.integer  "current_lot_number",        :limit => 20, :precision => 20, :scale => 0,                   :null => false
    t.boolean  "active",                                                                 :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "entity_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_discount_types", :force => true do |t|
    t.string  "name",                       :null => false
    t.boolean "default", :default => false
  end

  create_table "client_reputation_types", :force => true do |t|
    t.string  "name",                       :null => false
    t.boolean "default", :default => false
  end

  create_table "client_types", :force => true do |t|
    t.string  "name",                       :null => false
    t.boolean "default", :default => false
  end

  create_table "clients", :force => true do |t|
    t.integer "client_type_id"
    t.integer "price_list_id"
    t.integer "client_discount_type_id"
    t.integer "client_reputation_type_id"
    t.boolean "is_national",               :default => true
    t.boolean "is_retention_agent"
    t.boolean "is_taxpayer"
    t.float   "rate_retention"
    t.string  "bank"
    t.string  "bank_account_number"
    t.string  "bank_account_name"
  end

  create_table "color_mode_types", :force => true do |t|
    t.string "name",      :null => false
    t.string "full_name", :null => false
    t.string "tag_name",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "category_id",   :null => false
    t.string   "category_type", :null => false
    t.integer  "user_id",       :null => false
    t.text     "note",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commercialization_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "tag_name",                     :null => false
    t.boolean "fixed_size", :default => true, :null => false
  end

  create_table "config_panel_module_categories", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "config_panel_modules", :force => true do |t|
    t.integer "config_panel_module_category_id",                    :null => false
    t.string  "name",                                               :null => false
    t.string  "tag_name",                                           :null => false
    t.integer "orden",                                              :null => false
    t.string  "icon_path"
    t.string  "url"
    t.text    "description"
    t.boolean "active",                          :default => false
  end

  create_table "config_panel_submodules", :force => true do |t|
    t.integer "config_panel_module_id",                                        :null => false
    t.string  "name",                                                          :null => false
    t.string  "tag_name",                                                      :null => false
    t.string  "url",                                                           :null => false
    t.integer "orden",                                                         :null => false
    t.string  "icon_path"
    t.text    "description"
    t.boolean "active",                 :default => true
    t.string  "controller_module",      :default => "Backend::BaseController"
  end

  create_table "contact_categories", :force => true do |t|
    t.integer "contact_id",      :null => false
    t.integer "category_id",     :null => false
    t.string  "category_type",   :null => false
    t.integer "contact_type_id", :null => false
  end

  create_table "contact_types", :force => true do |t|
    t.string "name",       :null => false
    t.string "class_name", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string  "fullname",                                                                          :null => false
    t.string  "phone",                                                                             :null => false
    t.integer "identification_document_type_id"
    t.string  "identification_document"
    t.string  "email",                                                                             :null => false
    t.text    "address"
    t.string  "cellphone"
    t.string  "website"
    t.boolean "active",                                                         :default => true
    t.boolean "islr_retained",                                                  :default => false
    t.decimal "retention_rate_islr",             :precision => 20, :scale => 2, :default => 0.0
    t.decimal "retention_rate_islr_2",           :precision => 20, :scale => 2, :default => 0.0
    t.integer "salulation_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_note_emision_types", :force => true do |t|
    t.string  "name",                                :null => false
    t.string  "tag_name",                            :null => false
    t.boolean "invoice_required", :default => false, :null => false
  end

  create_table "credit_note_entries", :force => true do |t|
    t.integer  "incoming_invoice_id"
    t.integer  "create_by_id",        :null => false
    t.date     "posting_date"
    t.date     "credit_note_date",    :null => false
    t.string   "reference",           :null => false
    t.string   "description",         :null => false
    t.string   "control_number",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_notes", :force => true do |t|
    t.integer  "client_id",                                                                   :null => false
    t.decimal  "sub_total",                   :precision => 20, :scale => 2
    t.decimal  "total",                       :precision => 20, :scale => 2
    t.integer  "credit_note_emision_type_id",                                                 :null => false
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "administrative_expenses",     :precision => 20, :scale => 2, :default => 0.0
  end

  create_table "crm_account_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_accounts", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "website"
    t.integer  "crm_sector_account_type_id", :null => false
    t.integer  "crm_account_type_id",        :null => false
    t.integer  "assigned_to_id",             :null => false
    t.string   "office_phone"
    t.integer  "member_of_id"
    t.string   "billing_address"
    t.string   "shipping_address"
    t.string   "principal_email"
    t.string   "alternative_email"
    t.string   "fax"
    t.text     "description"
    t.string   "postal_code"
    t.string   "ticker_symbol"
    t.string   "annual_revenue"
    t.integer  "employees"
    t.string   "ownership"
    t.string   "rating"
    t.string   "other_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_activities", :force => true do |t|
    t.integer  "priority_id",                                :null => false
    t.integer  "crm_contact_id",                             :null => false
    t.string   "subject",                                    :null => false
    t.string   "due_date",                                   :null => false
    t.integer  "assigned_to_id",                             :null => false
    t.integer  "related_to_id",                              :null => false
    t.string   "related_to_type",                            :null => false
    t.boolean  "send_notification_email", :default => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_call_invitees", :force => true do |t|
    t.integer  "related_to_id",   :null => false
    t.string   "related_to_type", :null => false
    t.integer  "crm_call_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_calls", :force => true do |t|
    t.string   "subject",            :null => false
    t.integer  "related_to_id",      :null => false
    t.string   "related_to_type",    :null => false
    t.string   "start_date",         :null => false
    t.string   "start_time",         :null => false
    t.integer  "reminders_popup"
    t.integer  "email_all_invitees"
    t.integer  "duration_hours",     :null => false
    t.text     "description"
    t.integer  "assigned_to_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_contacts", :force => true do |t|
    t.integer  "salulation_id"
    t.integer  "crm_account_id"
    t.string   "first_name",         :null => false
    t.string   "last_name",          :null => false
    t.string   "title"
    t.string   "cellphone"
    t.string   "department"
    t.boolean  "do_not_call"
    t.string   "principal_email"
    t.string   "alternative_email"
    t.text     "primary_address"
    t.string   "office_phone"
    t.string   "fax"
    t.text     "description"
    t.integer  "report_to_id"
    t.integer  "crm_lead_source_id"
    t.integer  "assigned_to_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_contract_statuses", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_contracts", :force => true do |t|
    t.string   "name",                        :null => false
    t.integer  "crm_contract_status_type_id", :null => false
    t.integer  "crm_account_id",              :null => false
    t.integer  "crm_opportunity_id"
    t.string   "reference_code"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "customer_signed_date"
    t.string   "company_signed_date"
    t.string   "contract_value"
    t.string   "expiration_notice"
    t.text     "description"
    t.integer  "assigned_to_id",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_emails", :force => true do |t|
    t.integer  "from_user_id",    :null => false
    t.integer  "related_to_id",   :null => false
    t.string   "related_to_type", :null => false
    t.string   "subject",         :null => false
    t.text     "body"
    t.string   "to",              :null => false
    t.string   "cc"
    t.string   "bcc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_lead_sources", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_lead_status_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_leads", :force => true do |t|
    t.integer  "salulation_id"
    t.integer  "crm_account_id"
    t.string   "first_name",                                                              :null => false
    t.string   "last_name",                                                               :null => false
    t.string   "title"
    t.string   "cellphone"
    t.string   "department"
    t.boolean  "do_not_call"
    t.string   "principal_email"
    t.string   "alternative_email"
    t.text     "primary_address"
    t.string   "office_phone"
    t.string   "fax"
    t.text     "description"
    t.integer  "report_to_id"
    t.integer  "crm_lead_source_id"
    t.text     "lead_description"
    t.integer  "crm_lead_status_type_id"
    t.text     "lead_status_description"
    t.decimal  "opportunity_amount",      :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.integer  "assigned_to_id",                                                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_meeting_invitees", :force => true do |t|
    t.integer  "related_to_id",   :null => false
    t.string   "related_to_type", :null => false
    t.integer  "crm_meeting_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_meeting_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_meetings", :force => true do |t|
    t.string   "subject",             :null => false
    t.integer  "related_to_id",       :null => false
    t.string   "related_to_type",     :null => false
    t.integer  "crm_meeting_type_id", :null => false
    t.integer  "crm_contact_id"
    t.string   "start_date",          :null => false
    t.string   "start_time",          :null => false
    t.integer  "reminders_popup"
    t.integer  "email_all_invitees"
    t.integer  "duration_hours",      :null => false
    t.string   "location"
    t.text     "description"
    t.integer  "assigned_to_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_notes", :force => true do |t|
    t.string   "subject",         :null => false
    t.integer  "assigned_to_id",  :null => false
    t.integer  "crm_contact_id",  :null => false
    t.integer  "related_to_id",   :null => false
    t.string   "related_to_type", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_opportunities", :force => true do |t|
    t.string   "name",                                                                           :null => false
    t.text     "description",                                                                    :null => false
    t.integer  "crm_account_id",                                                                 :null => false
    t.integer  "crm_apportunity_type_id",                                                        :null => false
    t.integer  "crm_opportunity_status_type_id",                                                 :null => false
    t.integer  "crm_lead_source_id"
    t.integer  "assigned_to_id",                                                                 :null => false
    t.decimal  "expected_revenue",               :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.string   "date_close",                                                                     :null => false
    t.float    "probability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_opportunity_status_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_opportunity_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_projects", :force => true do |t|
    t.integer  "client_id",                                                                   :null => false
    t.integer  "crm_projects_executive_id",                                                   :null => false
    t.integer  "entity_id",                                                                   :null => false
    t.integer  "city_id",                                                                     :null => false
    t.string   "name",                                                                        :null => false
    t.string   "address",                                                                     :null => false
    t.string   "init_date",                                                                   :null => false
    t.string   "end_date"
    t.text     "note"
    t.boolean  "data_complete",                                            :default => false
    t.decimal  "contribution_amount",       :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "quote_ready",                                              :default => false
    t.boolean  "quote_sent",                                               :default => false
    t.boolean  "chance",                                                   :default => false
    t.boolean  "approved",                                                 :default => false
    t.boolean  "lost",                                                     :default => false
    t.decimal  "commission",                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_amount",              :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_projects_call_manager_registers", :force => true do |t|
    t.integer  "crm_project_id", :null => false
    t.string   "phone",          :null => false
    t.text     "comment",        :null => false
    t.string   "next_call_date"
    t.string   "next_call_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_projects_executives", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_projects_lift_category_types", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_projects_lift_manufacturing_phase_lift_models", :force => true do |t|
    t.integer "crm_projects_lift_manufacturing_phase_id", :null => false
    t.integer "crm_projects_lift_model_id",               :null => false
  end

  create_table "crm_projects_lift_manufacturing_phases", :force => true do |t|
    t.string "name", :null => false
    t.text   "note"
  end

  create_table "crm_projects_lift_material_for_manufacturing_phases", :force => true do |t|
    t.integer "crm_projects_lift_manufacturing_phase_id", :null => false
    t.integer "material_raw_material_id",                 :null => false
    t.float   "quantity",                                 :null => false
    t.integer "crm_projects_lift_model_id",               :null => false
  end

  create_table "crm_projects_lift_models", :force => true do |t|
    t.integer "crm_projects_lift_category_type_id", :null => false
    t.string  "name",                               :null => false
  end

  create_table "crm_projects_lifts", :force => true do |t|
    t.integer  "crm_project_id",                                      :null => false
    t.integer  "crm_projects_lift_category_type_id",                  :null => false
    t.string   "module",                                              :null => false
    t.string   "tower",                                               :null => false
    t.float    "route",                              :default => 0.0, :null => false
    t.float    "about_travel",                       :default => 0.0, :null => false
    t.float    "levels",                             :default => 0.0, :null => false
    t.float    "stops",                              :default => 0.0, :null => false
    t.integer  "passenger_capacity",                 :default => 0,   :null => false
    t.float    "load_capacity",                      :default => 0.0, :null => false
    t.float    "width_pit",                          :default => 0.0, :null => false
    t.float    "fund_pit",                           :default => 0.0, :null => false
    t.float    "moat",                               :default => 0.0, :null => false
    t.float    "well",                               :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crm_projects_lift_model_id",                          :null => false
  end

  create_table "crm_quote_positions", :force => true do |t|
    t.integer  "crm_quote_id",                                                 :null => false
    t.integer  "product_id",                                                   :null => false
    t.integer  "quantity",                                                     :null => false
    t.decimal  "unit_price",   :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_price",  :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_quote_stage_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "crm_quotes", :force => true do |t|
    t.integer  "crm_account_id",                                                          :null => false
    t.integer  "crm_opportunity_id"
    t.integer  "crm_quote_stage_type_id",                                                 :null => false
    t.integer  "crm_contact_id"
    t.string   "name",                                                                    :null => false
    t.string   "valid_until_date",                                                        :null => false
    t.string   "billing_account_name"
    t.string   "shipping_account_name"
    t.string   "billing_contact_name"
    t.string   "shipping_contact_name"
    t.string   "billing_address"
    t.string   "billing_street"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_postal_code"
    t.string   "billing_country"
    t.string   "shipping_address"
    t.string   "shipping_street"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_postal_code"
    t.string   "shipping_country"
    t.boolean  "copy_address_from_left"
    t.integer  "assigned_to_id",                                                          :null => false
    t.text     "term_conditions"
    t.text     "description"
    t.decimal  "sub_total",               :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",                     :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",                   :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_sector_account_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "currency_types", :force => true do |t|
    t.string "name",    :null => false
    t.string "iso4217", :null => false
    t.string "symbol",  :null => false
  end

  create_table "custom_design_category_types", :force => true do |t|
    t.integer "custom_design_type_id"
    t.string  "name",                  :null => false
    t.string  "icon_path"
  end

  create_table "custom_design_types", :force => true do |t|
    t.string  "name",         :null => false
    t.integer "product_id"
    t.string  "icon_path"
    t.string  "external_url"
  end

  create_table "custom_designs", :force => true do |t|
    t.integer  "type_design"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category_design", :default => "none"
  end

  create_table "delivery_notes", :force => true do |t|
    t.integer  "order_id",   :null => false
    t.integer  "quantity",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "designs", :force => true do |t|
    t.text     "note",                :null => false
    t.string   "attach_file_name",    :null => false
    t.string   "attach_content_type", :null => false
    t.integer  "attach_file_size",    :null => false
    t.datetime "attach_updated_at",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "digital_card_fields", :force => true do |t|
    t.integer "digital_card_id"
    t.string  "input_text",                       :null => false
    t.string  "position_top",    :default => "0", :null => false
    t.string  "position_right",  :default => "0", :null => false
    t.string  "position_button", :default => "0", :null => false
    t.string  "position_left",   :default => "0", :null => false
    t.string  "font_color"
    t.string  "font_family"
    t.string  "font_size"
  end

  create_table "digital_card_models", :force => true do |t|
    t.integer  "digital_card_type_id", :null => false
    t.string   "partial_template",     :null => false
    t.string   "name",                 :null => false
    t.integer  "quantity_fields",      :null => false
    t.string   "image_file_name",      :null => false
    t.string   "image_content_type",   :null => false
    t.integer  "image_file_size",      :null => false
    t.datetime "image_updated_at",     :null => false
  end

  create_table "digital_card_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "digital_cards", :force => true do |t|
    t.string   "image"
    t.integer  "product_by_budget_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docs", :force => true do |t|
    t.integer  "case_id",                          :null => false
    t.integer  "category_id",                      :null => false
    t.string   "category_type",                    :null => false
    t.boolean  "principal",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dossier_types", :force => true do |t|
    t.string  "name",                      :null => false
    t.string  "tag_name",                  :null => false
    t.integer "convertion", :default => 1, :null => false
  end

  create_table "element_for_products", :force => true do |t|
    t.integer "product_id"
    t.integer "product_component_type_id"
    t.integer "element_id",                :null => false
    t.string  "element_type",              :null => false
  end

  create_table "employees", :force => true do |t|
    t.string  "in_case_of_emergency_notify"
    t.string  "emergency_phone"
    t.date    "join_date"
    t.integer "position_id"
    t.float   "salary"
    t.integer "payroll_personal_type_id",    :default => 1,            :null => false
    t.string  "status",                      :default => "A",          :null => false
    t.string  "entry_date",                  :default => "01/01/1999", :null => false
    t.string  "discharge_date"
  end

  create_table "entities", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_form_colors", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "field_form_font_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "field_form_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "finish_product_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "full_name",                    :null => false
    t.string  "tag_name",                     :null => false
    t.boolean "default",   :default => false
    t.float   "amount_t",                     :null => false
    t.float   "amount_tr",                    :null => false
  end

  create_table "finished_product_category_types", :force => true do |t|
    t.string "name",      :null => false
    t.string "full_name", :null => false
    t.string "tag_name",  :null => false
  end

  create_table "finished_products", :force => true do |t|
    t.integer  "finished_product_category_type_id",                   :null => false
    t.integer  "raw_material_id",                                     :null => false
    t.integer  "presentation_unit_type_id",                           :null => false
    t.boolean  "fixed_size",                        :default => true, :null => false
    t.float    "side_dimension_x",                  :default => 0.0,  :null => false
    t.float    "side_dimension_y",                  :default => 0.0,  :null => false
    t.float    "presentation_unit_type_quantity",   :default => 0.0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_movement_positions", :force => true do |t|
    t.integer  "goods_movement_id",   :null => false
    t.integer  "raw_material_id"
    t.integer  "packing_material_id", :null => false
    t.float    "quantity",            :null => false
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_movement_reasons", :force => true do |t|
    t.integer "goods_movement_type_id", :null => false
    t.string  "name",                   :null => false
    t.string  "fullname",               :null => false
    t.string  "tag_name",               :null => false
  end

  create_table "goods_movement_types", :force => true do |t|
    t.string  "name",                             :null => false
    t.string  "fullname",                         :null => false
    t.string  "tag_name",                         :null => false
    t.boolean "goods_receipt", :default => false
  end

  create_table "goods_movements", :force => true do |t|
    t.integer  "goods_movement_type_id",   :null => false
    t.integer  "goods_movement_reason_id", :null => false
    t.integer  "doc_id",                   :null => false
    t.string   "doc_type",                 :null => false
    t.integer  "supplier_id",              :null => false
    t.integer  "create_by_id",             :null => false
    t.integer  "location_inventory_id"
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_receipt_positions", :force => true do |t|
    t.integer  "goods_receipt_id",    :null => false
    t.integer  "raw_material_id"
    t.integer  "packing_material_id", :null => false
    t.float    "quantity",            :null => false
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_receipts", :force => true do |t|
    t.integer  "purchase_order_id"
    t.integer  "supplier_id",           :null => false
    t.integer  "create_by_id",          :null => false
    t.integer  "location_inventory_id"
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "home_page_slides", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identification_document_types", :force => true do |t|
    t.string  "name",                          :null => false
    t.string  "short_name",                    :null => false
    t.boolean "default",    :default => false, :null => false
    t.boolean "is_natural", :default => false
  end

  create_table "incoming_invoice_billings", :force => true do |t|
    t.integer  "invoice_id",                                                                       :null => false
    t.decimal  "amount",                         :precision => 20, :scale => 2,                    :null => false
    t.integer  "payment_method_type_id",                                                           :null => false
    t.string   "transaction_reference"
    t.string   "transaction_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_advance_payment",                                            :default => false
    t.integer  "cash_bank_pos_card_terminal_id"
  end

  create_table "incoming_invoice_document_types", :force => true do |t|
    t.string  "name",                                     :null => false
    t.string  "fullname",                                 :null => false
    t.string  "tag_name",                                 :null => false
    t.boolean "require_purchase_oden", :default => false
  end

  create_table "incoming_invoice_payments", :force => true do |t|
    t.integer  "incoming_invoice_id",    :null => false
    t.float    "amount",                 :null => false
    t.integer  "payment_method_type_id", :null => false
    t.string   "transaction_reference"
    t.string   "transaction_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incoming_invoice_positions", :force => true do |t|
    t.integer  "incoming_invoice_id", :null => false
    t.integer  "raw_material_id"
    t.float    "quantity",            :null => false
    t.float    "sub_total",           :null => false
    t.float    "total",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "packing_material_id"
  end

  create_table "incoming_invoices", :force => true do |t|
    t.integer  "purchase_order_id"
    t.integer  "currency_type_id"
    t.integer  "supplier_id",                                              :null => false
    t.integer  "create_by_id",                                             :null => false
    t.date     "posting_date"
    t.date     "invoice_date",                                             :null => false
    t.string   "reference",                                                :null => false
    t.string   "description",                                              :null => false
    t.float    "tax",                                                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "control_number"
    t.integer  "incoming_invoice_document_type_id",                        :null => false
    t.string   "status",                            :default => "payable"
  end

  create_table "inventories", :force => true do |t|
    t.integer  "category_id",                        :null => false
    t.string   "category_type",                      :null => false
    t.integer  "reason_inventory_id"
    t.integer  "quantity"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.float    "unit_cost"
    t.string   "reference_number"
    t.date     "expiration_date"
    t.integer  "remainder",           :default => 0
  end

  create_table "invoice_printing_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "logo_src", :null => false
    t.string "tag_name", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "client_id",                                                                  :null => false
    t.integer  "from_budget_id"
    t.decimal  "sub_total",                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total",                    :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_method_type_id"
    t.integer  "user_id",                                                                    :null => false
    t.float    "advance_payment",                                         :default => 0.0
    t.string   "transaction_number"
    t.string   "transaction_date"
    t.boolean  "printed",                                                 :default => false
    t.integer  "currency_type_id",                                                           :null => false
    t.boolean  "only_issue",                                              :default => false
    t.integer  "invoice_printing_type_id"
    t.decimal  "discount_percent",         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "increase_percent",         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "balance",                  :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "retention_islr",           :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax",                      :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "retention_islr_2",         :precision => 20, :scale => 2, :default => 0.0
    t.boolean  "is_advance_payment",                                      :default => false
    t.string   "date"
  end

  create_table "location_inventories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_cycle_inventory_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_ean_categories", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_expiry_time_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_goods_movement_positions", :force => true do |t|
    t.integer "material_goods_movement_id", :null => false
    t.integer "material_raw_material_id"
    t.float   "quantity",                   :null => false
    t.date    "delivery_date"
  end

  create_table "material_goods_movement_reasons", :force => true do |t|
    t.integer "material_goods_movement_type_id",                   :null => false
    t.string  "name",                                              :null => false
    t.string  "tag_name",                                          :null => false
    t.boolean "visible",                         :default => true
  end

  create_table "material_goods_movement_types", :force => true do |t|
    t.string  "name",                             :null => false
    t.string  "tag_name",                         :null => false
    t.boolean "goods_receipt", :default => false
  end

  create_table "material_goods_movements", :force => true do |t|
    t.integer  "material_goods_movement_type_id",   :null => false
    t.integer  "material_goods_movement_reason_id", :null => false
    t.integer  "doc_id",                            :null => false
    t.string   "doc_type",                          :null => false
    t.integer  "supplier_id"
    t.integer  "create_by_id",                      :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_goods_receipt_positions", :force => true do |t|
    t.integer  "material_goods_receipt_id", :null => false
    t.integer  "material_raw_material_id"
    t.float    "quantity",                  :null => false
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_goods_receipts", :force => true do |t|
    t.integer  "material_purchase_order_id"
    t.integer  "supplier_id",                :null => false
    t.integer  "create_by_id",               :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_hazardou_substance_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_inventory_blocking_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_measure_unit_convertions", :force => true do |t|
    t.integer "material_raw_material_id",   :null => false
    t.integer "material_x_measure_unit_id", :null => false
    t.float   "value_x",                    :null => false
    t.integer "material_y_measure_unit_id", :null => false
    t.float   "value_y",                    :null => false
  end

  create_table "material_measure_units", :force => true do |t|
    t.string "name",        :null => false
    t.text   "description"
  end

  create_table "material_payment_method_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_picking_areas", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_prescription_container_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_price_control_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_price_determination_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_product_types", :force => true do |t|
    t.string  "name",            :null => false
    t.string  "full_name",       :null => false
    t.string  "tag_name",        :null => false
    t.integer "raw_material_id", :null => false
  end

  create_table "material_production_order_positions", :force => true do |t|
    t.integer  "material_production_order_id",                  :null => false
    t.integer  "material_raw_material_id",                      :null => false
    t.float    "quantity",                     :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_production_order_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_production_orders", :force => true do |t|
    t.integer  "material_production_orden_type_id", :null => false
    t.string   "delivery_date",                     :null => false
    t.text     "description",                       :null => false
    t.integer  "requesting_unit_id",                :null => false
    t.string   "requesting_unit_type",              :null => false
    t.string   "proyect_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_purchase_order_positions", :force => true do |t|
    t.integer  "material_purchase_order_id",                                                   :null => false
    t.integer  "material_order_measure_unit_id",                                               :null => false
    t.integer  "material_raw_material_id"
    t.float    "quantity",                                                                     :null => false
    t.date     "delivery_date"
    t.float    "sub_total",                                                                    :null => false
    t.float    "total",                                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_id",                                                        :default => 3
    t.decimal  "tax_amount",                     :precision => 20, :scale => 2
    t.decimal  "taxable",                        :precision => 20, :scale => 2
    t.decimal  "total_amount",                   :precision => 20, :scale => 2
  end

  create_table "material_purchase_orders", :force => true do |t|
    t.integer  "supplier_id",      :null => false
    t.integer  "currency_type_id", :null => false
    t.integer  "create_by_id",     :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_purchase_requisition_position_status_types", :force => true do |t|
    t.string  "name",                        :null => false
    t.string  "tag_name",                    :null => false
    t.boolean "default",  :default => false
  end

  create_table "material_purchase_requisition_positions", :force => true do |t|
    t.integer  "material_purchase_requisition_id",                                       :null => false
    t.integer  "material_purchase_requisition_position_status_type_id", :default => 1,   :null => false
    t.integer  "material_raw_material_id",                                               :null => false
    t.integer  "material_order_measure_unit_id",                                         :null => false
    t.integer  "verified_by_id"
    t.integer  "approved_by_id"
    t.string   "reason",                                                                 :null => false
    t.float    "quantity",                                              :default => 0.0, :null => false
    t.float    "verified_quantity",                                     :default => 0.0
    t.float    "approved_quantity",                                     :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_purchase_requisition_status_types", :force => true do |t|
    t.string  "name",                                                  :null => false
    t.string  "tag_name",                                              :null => false
    t.boolean "default",  :default => false
    t.string  "icon",     :default => "icons/bullet_square_green.png"
  end

  create_table "material_purchase_requisitions", :force => true do |t|
    t.integer  "create_by_id",                                                :null => false
    t.date     "posting_date",                                                :null => false
    t.date     "delivery_date",                                               :null => false
    t.text     "note"
    t.integer  "material_purchase_requisition_status_type_id", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_purchasing_groups", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_quotation_requisition_position_status_types", :force => true do |t|
    t.string  "name",                        :null => false
    t.string  "tag_name",                    :null => false
    t.boolean "default",  :default => false
  end

  create_table "material_quotation_requisition_positions", :force => true do |t|
    t.integer  "material_quotation_requisition_id",                                                                      :null => false
    t.integer  "material_purchase_requisition_position_id",                                                              :null => false
    t.integer  "material_payment_method_type_id"
    t.integer  "material_raw_material_id",                                                                               :null => false
    t.integer  "material_order_measure_unit_id",                                                                         :null => false
    t.integer  "material_quotation_requisition_quality_type_id"
    t.integer  "supplier_1_id",                                                                                          :null => false
    t.decimal  "sub_total_supplier_1",                                   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_supplier_1",                                         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_supplier_1",                                       :precision => 20, :scale => 2, :default => 0.0
    t.integer  "supplier_2_id"
    t.decimal  "sub_total_supplier_2",                                   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_supplier_2",                                         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_supplier_2",                                       :precision => 20, :scale => 2, :default => 0.0
    t.integer  "supplier_3_id"
    t.decimal  "sub_total_supplier_3",                                   :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_supplier_3",                                         :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_supplier_3",                                       :precision => 20, :scale => 2, :default => 0.0
    t.float    "quantity",                                                                              :default => 0.0, :null => false
    t.integer  "selected_supplier_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_quotation_requisition_position_status_type_id",                                :default => 1
  end

  create_table "material_quotation_requisition_quality_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_quotation_requisitions", :force => true do |t|
    t.integer  "create_by_id",                                        :null => false
    t.date     "posting_date",                                        :null => false
    t.date     "delivery_date",                                       :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",                        :default => false
    t.integer  "material_purchase_requisition_id"
  end

  create_table "material_raw_material_categories", :force => true do |t|
    t.string "name",                                   :null => false
    t.string "model_relationship", :default => "None"
    t.text   "description"
  end

  create_table "material_raw_material_freight_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_raw_material_packaging_categories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_raw_materials", :force => true do |t|
    t.integer  "material_base_measure_unit_id",                                                                 :null => false
    t.integer  "material_raw_material_category_id",                                                             :null => false
    t.integer  "material_external_raw_material_category_id",                                                    :null => false
    t.integer  "material_weight_unit_id"
    t.integer  "material_volume_unit_id"
    t.integer  "material_ean_category_id"
    t.integer  "material_raw_material_packaging_category_id"
    t.string   "name",                                                                                          :null => false
    t.integer  "old_id"
    t.string   "valid_from"
    t.float    "gross_weight",                                                               :default => 0.0
    t.float    "net_weight",                                                                 :default => 0.0
    t.float    "volume",                                                                     :default => 0.0
    t.string   "side_dimension"
    t.integer  "ean_upc_code"
    t.integer  "material_order_measure_unit_id",                                                                :null => false
    t.integer  "material_purchasing_group_id"
    t.integer  "material_raw_material_freight_type_id"
    t.boolean  "tax_exempt",                                                                 :default => false
    t.boolean  "automatic_po",                                                               :default => false
    t.integer  "goods_receipt_processing_time"
    t.integer  "material_issue_measure_unit_id",                                                                :null => false
    t.integer  "material_picking_area_id"
    t.integer  "material_temperature_condition_id"
    t.integer  "material_storage_condition_id"
    t.integer  "material_hazardou_substance_type_id"
    t.integer  "material_prescription_container_type_id"
    t.integer  "material_cycle_inventory_type_id"
    t.integer  "material_time_unit_id"
    t.integer  "material_expiry_time_type_id"
    t.string   "storage",                                                                    :default => "ND"
    t.string   "max_storage_period",                                                         :default => "0"
    t.float    "min_remaining_shelf_life",                                                   :default => 0.0
    t.float    "total_shelf_life",                                                           :default => 0.0
    t.boolean  "dossier_dependence",                                                         :default => false
    t.integer  "raw_material_category_id"
    t.integer  "packing_material_id"
    t.integer  "material_valoration_category_id"
    t.integer  "material_valoration_type_id",                                                                   :null => false
    t.integer  "material_price_control_type_id",                                                                :null => false
    t.integer  "material_price_determination_type_id"
    t.decimal  "price_unit",                                  :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "moving_price",                                :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "standard_price",                              :precision => 20, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "future_price",                                :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "previous_price",                              :precision => 20, :scale => 2, :default => 0.0
    t.string   "last_price_change"
    t.decimal  "total_stock",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "total_value",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_price_1",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "commercial_price_1",                          :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_price_2",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "commercial_price_2",                          :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "tax_price_3",                                 :precision => 20, :scale => 2, :default => 0.0
    t.decimal  "commercial_price_3",                          :precision => 20, :scale => 2, :default => 0.0
    t.integer  "material_inventory_blocking_type_id"
    t.float    "unrestricted_use_stock",                                                     :default => 0.0
    t.float    "min_stock",                                                                  :default => 0.0
    t.float    "max_stock",                                                                  :default => 0.0
    t.float    "unrestricted_consignment",                                                   :default => 0.0
    t.float    "restricted_use_stock",                                                       :default => 0.0
    t.float    "restricted_consignment",                                                     :default => 0.0
    t.float    "in_quality_inspection",                                                      :default => 0.0
    t.float    "consignment_inspection",                                                     :default => 0.0
    t.float    "blocked",                                                                    :default => 0.0
    t.float    "blocked_consignment",                                                        :default => 0.0
    t.float    "returns",                                                                    :default => 0.0
    t.float    "stock_transfer",                                                             :default => 0.0
    t.float    "transfer",                                                                   :default => 0.0
    t.float    "stock_transit",                                                              :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_storage_conditions", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_temperature_conditions", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_time_units", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_valoration_categories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_valoration_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "material_volume_units", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "material_weight_units", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "measure_change_denominations", :force => true do |t|
    t.integer "measure_change_type_id",                   :null => false
    t.float   "value",                                    :null => false
    t.boolean "active",                 :default => true
  end

  create_table "measure_change_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "multimedia_files", :force => true do |t|
    t.integer  "proxy_id"
    t.string   "proxy_type"
    t.string   "attach_file_name",    :null => false
    t.string   "attach_content_type", :null => false
    t.integer  "attach_file_size",    :null => false
    t.datetime "attach_updated_at",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "category_id",                         :null => false
    t.string   "category_type",                       :null => false
    t.integer  "transmitter_id",                      :null => false
    t.string   "transmitter_type",                    :null => false
    t.string   "subject",                             :null => false
    t.text     "note",                                :null => false
    t.boolean  "read",             :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "client_id",                                                 :null => false
    t.integer  "user_id"
    t.string   "credit_debit_card_number"
    t.string   "credit_debit_card_name"
    t.string   "credit_debit_card_expiry_date"
    t.string   "mercantil_transfer_deposit_bank_number"
    t.string   "mercantil_transfer_deposit_bank_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "canceled",                               :default => false
    t.date     "delivery_date"
    t.integer  "associate_id"
    t.string   "associate_type"
  end

  create_table "packing_materials", :force => true do |t|
    t.string  "name",                                  :null => false
    t.integer "presentation_unit_type_id",             :null => false
    t.integer "presentation_unit_type_measure_id",     :null => false
    t.integer "presentation_unit_type_measurement_id", :null => false
    t.integer "quantity",                              :null => false
    t.integer "raw_material_category_id"
  end

  create_table "page_size_types", :force => true do |t|
    t.string  "name",                                  :null => false
    t.string  "full_name",                             :null => false
    t.string  "tag_name",                              :null => false
    t.float   "side_dimension_x",                      :null => false
    t.float   "side_dimension_y",                      :null => false
    t.boolean "variable_dimension", :default => false
    t.boolean "base_dimension",     :default => false
  end

  create_table "paper_types", :force => true do |t|
    t.string  "name",            :null => false
    t.string  "full_name",       :null => false
    t.string  "tag_name",        :null => false
    t.integer "raw_material_id", :null => false
  end

  create_table "payment_method_types", :force => true do |t|
    t.string  "name",                                              :null => false
    t.string  "full_name",                                         :null => false
    t.string  "tag_name",                                          :null => false
    t.boolean "require_additional_information", :default => false
    t.boolean "is_immediately_pay",             :default => true
    t.integer "expiration_days",                :default => 0
  end

  create_table "payroll_amount_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_concept_personal_types", :force => true do |t|
    t.integer "payroll_concept_id",                                                                          :null => false
    t.integer "payroll_personal_type_id",                                                                    :null => false
    t.integer "payroll_amount_type_id",                                                                      :null => false
    t.integer "payroll_payment_frequency_id",                                                                :null => false
    t.float   "value",                                                                                       :null => false
    t.integer "unit",                         :limit => 20, :precision => 20, :scale => 0, :default => 0,    :null => false
    t.boolean "retains_sso",                                                               :default => true
    t.boolean "retains_spf",                                                               :default => true
    t.boolean "retains_faov",                                                              :default => true
    t.boolean "retains_fju",                                                               :default => true
    t.boolean "retains_islr",                                                              :default => true
  end

  create_table "payroll_concepts", :force => true do |t|
    t.string  "name",                               :null => false
    t.string  "fullname",                           :null => false
    t.string  "tag_name",                           :null => false
    t.boolean "is_basic_salary", :default => false
    t.boolean "is_allocation",   :default => true
    t.boolean "is_editable",     :default => false
  end

  create_table "payroll_departments", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_employee_status_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_employees", :force => true do |t|
    t.integer "payroll_staff_id",                                                                 :null => false
    t.integer "payroll_position_id",                                                              :null => false
    t.integer "payroll_personal_type_id",                                                         :null => false
    t.integer "payroll_employee_status_type_id",                                                  :null => false
    t.integer "payroll_department_id",                                                            :null => false
    t.decimal "salary",                          :precision => 20, :scale => 2,                   :null => false
    t.string  "income_date",                                                                      :null => false
    t.string  "discharge_date"
    t.decimal "islr_percentage",                 :precision => 20, :scale => 2, :default => 0.0
    t.boolean "faov_listed",                                                                      :null => false
    t.boolean "sso_listed",                                                                       :null => false
    t.boolean "fju_listed",                                                                       :null => false
    t.boolean "spf_listed",                                                                       :null => false
    t.integer "payroll_payment_method_type_id",                                                   :null => false
    t.string  "account_number"
    t.string  "access_code",                                                                      :null => false
    t.boolean "assistance_validate",                                            :default => true
  end

  create_table "payroll_fixed_concepts", :force => true do |t|
    t.integer  "payroll_concept_personal_type_id", :null => false
    t.integer  "payroll_employee_id",              :null => false
    t.float    "amount",                           :null => false
    t.float    "unit",                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payroll_payment_frequency_id",     :null => false
    t.text     "note"
  end

  create_table "payroll_genders", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_historical_payrolls", :force => true do |t|
    t.integer  "payroll_concept_personal_type_id",                                                             :null => false
    t.integer  "payroll_employee_id",                                                                          :null => false
    t.integer  "payroll_payment_frequency_id",                                                                 :null => false
    t.float    "unit",                                                                                         :null => false
    t.float    "amount_allocated",                                                                             :null => false
    t.float    "amount_deducted",                                                                              :null => false
    t.integer  "year"
    t.integer  "month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payroll_regular_payroll_check_id"
    t.integer  "amount_base",                      :limit => 20, :precision => 20, :scale => 0, :default => 0, :null => false
    t.text     "note"
  end

  create_table "payroll_historical_personal_type_changes", :force => true do |t|
    t.integer  "payroll_employee_id",                                    :null => false
    t.integer  "user_id",                                                :null => false
    t.integer  "payroll_old_personal_type_id",                           :null => false
    t.integer  "payroll_new_personal_type_id",                           :null => false
    t.string   "date",                         :default => "2015-08-11"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payroll_historical_wage_adjustments", :force => true do |t|
    t.integer  "payroll_employee_id",                                                          :null => false
    t.integer  "user_id",                                                                      :null => false
    t.decimal  "old_salary",          :precision => 20, :scale => 2,                           :null => false
    t.decimal  "new_salary",          :precision => 20, :scale => 2,                           :null => false
    t.string   "date",                                               :default => "2015-01-09"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payroll_last_payrolls", :force => true do |t|
    t.integer  "payroll_concept_personal_type_id",                                                             :null => false
    t.integer  "payroll_employee_id",                                                                          :null => false
    t.integer  "payroll_payment_frequency_id",                                                                 :null => false
    t.float    "unit",                                                                                         :null => false
    t.float    "amount_allocated",                                                                             :null => false
    t.float    "amount_deducted",                                                                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payroll_regular_payroll_check_id",                                                             :null => false
    t.integer  "amount_base",                      :limit => 20, :precision => 20, :scale => 0, :default => 0, :null => false
    t.text     "note"
  end

  create_table "payroll_monitoring_assistances", :force => true do |t|
    t.integer  "payroll_employee_id",                    :null => false
    t.string   "date",                                   :null => false
    t.string   "time_check_in",                          :null => false
    t.string   "time_check_out"
    t.boolean  "absent_with_pass"
    t.boolean  "retardation_with_pass"
    t.string   "extra_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_lunch_in"
    t.string   "time_lunch_out"
    t.float    "diff_time_check_in",    :default => 0.0
  end

  create_table "payroll_payment_frequencies", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
    t.float  "factor"
  end

  create_table "payroll_payment_method_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_personal_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
    t.string "tag_name", :null => false
  end

  create_table "payroll_position_types", :force => true do |t|
    t.string "name",      :null => false
    t.string "full_name", :null => false
    t.string "tag_name",  :null => false
  end

  create_table "payroll_positions", :force => true do |t|
    t.integer "payroll_position_type_id", :null => false
    t.string  "name",                     :null => false
    t.string  "full_name",                :null => false
    t.string  "code"
  end

  create_table "payroll_regular_payroll_checks", :force => true do |t|
    t.integer  "year",                                        :null => false
    t.integer  "month",                                       :null => false
    t.string   "init_date",                                   :null => false
    t.string   "end_date",                                    :null => false
    t.integer  "fortnight",                                   :null => false
    t.string   "process_date",                                :null => false
    t.integer  "user_id",                                     :null => false
    t.integer  "payroll_personal_type_id",                    :null => false
    t.boolean  "paid",                     :default => false
    t.boolean  "test",                     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paid_by_id"
  end

  create_table "payroll_staffs", :force => true do |t|
    t.string  "identification_document", :null => false
    t.string  "first_name",              :null => false
    t.string  "last_name",               :null => false
    t.string  "email",                   :null => false
    t.string  "birthday",                :null => false
    t.integer "payroll_gender_id",       :null => false
    t.string  "rif",                     :null => false
    t.string  "second_name"
    t.string  "second_last_name"
    t.string  "telephone"
    t.string  "cellphone"
  end

  create_table "payroll_variable_concepts", :force => true do |t|
    t.integer  "payroll_concept_personal_type_id", :null => false
    t.integer  "payroll_employee_id",              :null => false
    t.float    "amount",                           :null => false
    t.float    "unit",                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payroll_payment_frequency_id",     :null => false
    t.text     "note"
  end

  create_table "permissions", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "permissions_user_groups", :id => false, :force => true do |t|
    t.integer "permission_id", :null => false
    t.integer "user_group_id", :null => false
  end

  create_table "positions", :force => true do |t|
    t.string "name",      :null => false
    t.string "full_name", :null => false
  end

  create_table "presentation_types", :force => true do |t|
    t.string  "name",                    :null => false
    t.string  "tag_name",                :null => false
    t.integer "quantity", :default => 1
  end

  create_table "presentation_unit_type_conversions", :force => true do |t|
    t.integer "presentation_unit_type_from_id"
    t.integer "presentation_unit_type_to_id"
    t.float   "proportion",                     :null => false
  end

  create_table "presentation_unit_type_measurements", :force => true do |t|
    t.integer "presentation_unit_type_id", :null => false
    t.string  "name",                      :null => false
    t.string  "full_name",                 :null => false
  end

  create_table "presentation_unit_type_measures", :force => true do |t|
    t.integer "presentation_unit_type_id", :null => false
    t.float   "side_dimension_x",          :null => false
    t.float   "side_dimension_y",          :null => false
  end

  create_table "presentation_unit_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.boolean "measurable", :default => true, :null => false
  end

  create_table "price_definition_set_by_component_types", :force => true do |t|
    t.string "name",                                   :null => false
    t.string "tag_name",                               :null => false
    t.string "model_relationship", :default => "none", :null => false
  end

  create_table "price_definition_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "price_list_component_accesories", :force => true do |t|
    t.integer  "component_accesory_id",                     :null => false
    t.string   "component_accesory_type",                   :null => false
    t.float    "amount",                                    :null => false
    t.integer  "currency_type_id"
    t.integer  "lower_limit",             :default => 1,    :null => false
    t.integer  "upper_limit"
    t.boolean  "active",                  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_list_products", :force => true do |t|
    t.integer  "product_id",                      :null => false
    t.float    "amount",                          :null => false
    t.integer  "currency_type_id"
    t.integer  "lower_limit",      :default => 1, :null => false
    t.integer  "upper_limit"
    t.integer  "price_list_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_lists", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "default",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printing_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "full_name",                    :null => false
    t.string  "tag_name",                     :null => false
    t.integer "quantity",                     :null => false
    t.boolean "default",   :default => false
  end

  create_table "printing_types_for_products", :id => false, :force => true do |t|
    t.integer "product_id",       :null => false
    t.integer "printing_type_id", :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "product_by_budgets", :force => true do |t|
    t.integer  "budget_id",                                                          :null => false
    t.integer  "product_id",                                                         :null => false
    t.integer  "quantity",                                                           :null => false
    t.float    "side_dimension_x",                                                   :null => false
    t.float    "side_dimension_y",                                                   :null => false
    t.decimal  "unit_price",                          :precision => 20, :scale => 2, :null => false
    t.decimal  "total_price",                         :precision => 20, :scale => 2, :null => false
    t.integer  "total_presentation_unit_type_to_use",                                :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_page_sheet"
  end

  create_table "product_by_credit_notes", :force => true do |t|
    t.integer  "credit_note_id",                                                                    :null => false
    t.integer  "product_id",                                                                        :null => false
    t.integer  "quantity",                                                                          :null => false
    t.float    "side_dimension_x",                                                                  :null => false
    t.float    "side_dimension_y",                                                                  :null => false
    t.decimal  "unit_price",                          :precision => 20, :scale => 2,                :null => false
    t.decimal  "total_price",                         :precision => 20, :scale => 2,                :null => false
    t.integer  "total_presentation_unit_type_to_use",                                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_page_sheet",                                                :default => 0
  end

  create_table "product_by_invoices", :force => true do |t|
    t.integer  "invoice_id",                                                         :null => false
    t.integer  "product_id",                                                         :null => false
    t.integer  "quantity",                                                           :null => false
    t.float    "side_dimension_x",                                                   :null => false
    t.float    "side_dimension_y",                                                   :null => false
    t.decimal  "unit_price",                          :precision => 20, :scale => 2, :null => false
    t.decimal  "total_price",                         :precision => 20, :scale => 2, :null => false
    t.integer  "total_presentation_unit_type_to_use",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_page_sheet"
    t.text     "note"
    t.string   "product_name"
  end

  create_table "product_component_by_budgets", :force => true do |t|
    t.integer  "product_by_budget_id"
    t.integer  "product_component_type_id"
    t.integer  "element_id",                :null => false
    t.string   "element_type",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_component_by_invoices", :force => true do |t|
    t.integer  "product_by_invoice_id"
    t.integer  "product_component_type_id"
    t.integer  "element_id",                :null => false
    t.string   "element_type",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_component_types", :force => true do |t|
    t.string  "name",                           :null => false
    t.string  "full_name",                      :null => false
    t.string  "tag_name",                       :null => false
    t.integer "quantity",                       :null => false
    t.boolean "is_multiple", :default => false
    t.boolean "default",     :default => false
  end

  create_table "product_component_types_for_product_types", :id => false, :force => true do |t|
    t.integer "product_type_id"
    t.integer "product_component_type_id"
  end

  create_table "product_price_definition_set_by_components", :force => true do |t|
    t.integer  "product_id",                                                  :null => false
    t.integer  "price_definition_set_by_component_type_id",                   :null => false
    t.integer  "price_list_id",                                               :null => false
    t.integer  "component_id"
    t.string   "component_type"
    t.integer  "currency_type_id"
    t.float    "amount_t",                                                    :null => false
    t.float    "amount_tr",                                                   :null => false
    t.integer  "lower_limit",                               :default => 1,    :null => false
    t.integer  "upper_limit"
    t.boolean  "active",                                    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_price_definition_sets", :force => true do |t|
    t.integer  "product_id",                         :null => false
    t.integer  "price_list_id",                      :null => false
    t.integer  "currency_type_id"
    t.float    "amount",           :default => 0.0,  :null => false
    t.integer  "lower_limit",      :default => 1,    :null => false
    t.integer  "upper_limit"
    t.boolean  "active",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string  "name",                         :null => false
    t.string  "full_name",                    :null => false
    t.string  "tag_name",                     :null => false
    t.boolean "default",   :default => false
  end

  create_table "products", :force => true do |t|
    t.integer  "commercialization_type_id",                            :null => false
    t.integer  "finished_product_category_type_id",                    :null => false
    t.integer  "product_type_id"
    t.string   "name",                                                 :null => false
    t.string   "reference_code",                                       :null => false
    t.string   "barcode"
    t.boolean  "instalation_require",               :default => false, :null => false
    t.boolean  "with_instalation",                  :default => true,  :null => false
    t.boolean  "tax_exempt",                        :default => false, :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_visible",                        :default => true
    t.integer  "presentation_type_id",                                 :null => false
    t.integer  "price_definition_type_id",                             :null => false
    t.integer  "min_quantity_page_component_type",  :default => 1
    t.integer  "min_quantity",                      :default => 1
    t.integer  "dossier_type_id"
    t.boolean  "by_price_definition_set",           :default => false
    t.boolean  "show_as_shortcut",                  :default => false
  end

  create_table "products_accessories", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "accessory_component_type_id"
  end

  create_table "purchase_order_positions", :force => true do |t|
    t.integer  "purchase_order_id",   :null => false
    t.integer  "raw_material_id"
    t.integer  "packing_material_id", :null => false
    t.float    "quantity",            :null => false
    t.date     "delivery_date"
    t.float    "sub_total",           :null => false
    t.float    "total",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", :force => true do |t|
    t.integer  "supplier_id",      :null => false
    t.integer  "currency_type_id", :null => false
    t.integer  "create_by_id",     :null => false
    t.date     "posting_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raw_material_categories", :force => true do |t|
    t.string "name",                                   :null => false
    t.string "tag_name",                               :null => false
    t.string "model_relationship", :default => "none"
  end

  create_table "raw_material_price_definition_set_black_by_components", :force => true do |t|
    t.integer  "raw_material_id",                     :null => false
    t.integer  "price_list_id",                       :null => false
    t.integer  "component_id"
    t.string   "component_type"
    t.integer  "currency_type_id"
    t.float    "amount_t",                            :null => false
    t.float    "amount_tr",                           :null => false
    t.boolean  "base_amount",      :default => false
    t.boolean  "active",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raw_material_price_definition_set_color_by_components", :force => true do |t|
    t.integer  "raw_material_id",                     :null => false
    t.integer  "price_list_id",                       :null => false
    t.integer  "component_id"
    t.string   "component_type"
    t.integer  "currency_type_id"
    t.float    "amount_t",                            :null => false
    t.float    "amount_tr",                           :null => false
    t.boolean  "base_amount",      :default => false
    t.boolean  "active",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raw_materials", :force => true do |t|
    t.string   "name",                                        :null => false
    t.integer  "packing_material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "raw_material_category_id"
    t.boolean  "dossier_dependence",       :default => false
  end

  create_table "reason_inventories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "salulations", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname"
  end

  create_table "security_permissions", :force => true do |t|
    t.integer "security_role_id",          :null => false
    t.integer "config_panel_submodule_id", :null => false
    t.text    "action_name",               :null => false
    t.integer "config_panel_module_id"
  end

  create_table "security_roles", :force => true do |t|
    t.string  "name",                       :null => false
    t.string  "tag_name",                   :null => false
    t.text    "note"
    t.boolean "visible",  :default => true
  end

  create_table "security_roles_users", :id => false, :force => true do |t|
    t.integer "security_role_id"
    t.integer "user_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "standard_measures", :force => true do |t|
    t.string "name",             :null => false
    t.string "full_name",        :null => false
    t.float  "side_dimension_x", :null => false
    t.float  "side_dimension_y", :null => false
  end

  create_table "state_by_user_groups", :force => true do |t|
    t.integer "state_id",                         :null => false
    t.integer "user_group_id",                    :null => false
    t.boolean "principal",     :default => false
  end

  create_table "state_matrices", :force => true do |t|
    t.integer "state_from_id", :null => false
    t.integer "state_to_id",   :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name",                        :null => false
    t.string  "apply_to",                    :null => false
    t.integer "sequence",                    :null => false
    t.boolean "initial",  :default => false, :null => false
    t.boolean "final",    :default => false, :null => false
  end

  create_table "supplier_types", :force => true do |t|
    t.string "name",     :null => false
    t.string "tag_name", :null => false
  end

  create_table "supplier_withholding_taxes", :force => true do |t|
    t.integer  "supplier_id",                                                                         :null => false
    t.integer  "accounting_withholding_taxe_type_id",                                                 :null => false
    t.decimal  "min_amount",                          :precision => 20, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "subtrahend",                          :precision => 20, :scale => 2, :default => 0.0
  end

  create_table "suppliers", :force => true do |t|
    t.string  "person_name_contact"
    t.string  "person_phone_contact"
    t.integer "supplier_type_id",                        :null => false
    t.string  "street_avenue"
    t.integer "postal_code"
    t.string  "phone"
    t.string  "phone_ext"
    t.string  "cellphone"
    t.string  "fax"
    t.string  "email"
    t.string  "comments"
    t.boolean "is_national",          :default => true
    t.boolean "is_retention_agent"
    t.boolean "is_taxpayer"
    t.float   "rate_retention"
    t.string  "bank"
    t.string  "bank_account_number"
    t.string  "bank_account_name"
    t.boolean "owner",                :default => false
    t.boolean "is_natural",           :default => false
    t.boolean "active",               :default => true
  end

  create_table "taxes", :force => true do |t|
    t.string   "name",                                                         :null => false
    t.decimal  "amount",     :precision => 20, :scale => 2,                    :null => false
    t.boolean  "general",                                   :default => false
    t.boolean  "exempt",                                    :default => false
    t.boolean  "reduced",                                   :default => false
    t.boolean  "additional",                                :default => false
    t.boolean  "active",                                    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackers", :force => true do |t|
    t.integer  "tracking_state_id",                    :null => false
    t.integer  "category_id",                          :null => false
    t.string   "category_type",                        :null => false
    t.boolean  "actual",            :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_states", :force => true do |t|
    t.integer  "state_id",                      :null => false
    t.integer  "proxy_id",                      :null => false
    t.string   "proxy_type",                    :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "actual",     :default => false, :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_types", :force => true do |t|
    t.string "name",       :null => false
    t.string "short_name", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string "name",      :null => false
    t.string "full_name", :null => false
  end

  create_table "user_groups_users", :id => false, :force => true do |t|
    t.integer "user_group_id", :null => false
    t.integer "user_id",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                                  :null => false
    t.string   "crypted_password",                                       :null => false
    t.string   "password_salt",                                          :null => false
    t.string   "persistence_token",                                      :null => false
    t.string   "single_access_token",                                    :null => false
    t.string   "perishable_token",                                       :null => false
    t.integer  "login_count",         :default => 0,                     :null => false
    t.integer  "failed_login_count",  :default => 0,                     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",              :default => true
    t.string   "avatar_file_name",    :default => "",                    :null => false
    t.string   "avatar_content_type", :default => "",                    :null => false
    t.integer  "avatar_file_size",    :default => 0,                     :null => false
    t.datetime "avatar_updated_at",   :default => '2015-01-06 09:57:43', :null => false
    t.boolean  "change_password",     :default => false
  end

  create_table "value_quarter_sheet_black_raw_materials", :force => true do |t|
    t.integer  "raw_material_id",                   :null => false
    t.float    "base_value"
    t.float    "v_10_t",          :default => 0.0
    t.float    "v_10_tr",         :default => 0.0
    t.float    "v_25_t",          :default => 0.0
    t.float    "v_25_tr",         :default => 0.0
    t.float    "v_50_t",          :default => 0.0
    t.float    "v_50_tr",         :default => 0.0
    t.float    "v_100_t",         :default => 0.0
    t.float    "v_100_tr",        :default => 0.0
    t.float    "v_200_t",         :default => 0.0
    t.float    "v_200_tr",        :default => 0.0
    t.float    "v_300_t",         :default => 0.0
    t.float    "v_300_tr",        :default => 0.0
    t.float    "v_400_t",         :default => 0.0
    t.float    "v_400_tr",        :default => 0.0
    t.float    "v_500_t",         :default => 0.0
    t.float    "v_500_tr",        :default => 0.0
    t.float    "v_600_t",         :default => 0.0
    t.float    "v_600_tr",        :default => 0.0
    t.float    "v_700_t",         :default => 0.0
    t.float    "v_700_tr",        :default => 0.0
    t.float    "v_800_t",         :default => 0.0
    t.float    "v_800_tr",        :default => 0.0
    t.float    "v_900_t",         :default => 0.0
    t.float    "v_900_tr",        :default => 0.0
    t.float    "v_1000_t",        :default => 0.0
    t.float    "v_1000_tr",       :default => 0.0
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "value_quarter_sheet_color_raw_materials", :force => true do |t|
    t.integer  "raw_material_id",                   :null => false
    t.float    "base_value",      :default => 0.0
    t.float    "v_10_t",          :default => 0.0
    t.float    "v_10_tr",         :default => 0.0
    t.float    "v_25_t",          :default => 0.0
    t.float    "v_25_tr",         :default => 0.0
    t.float    "v_50_t",          :default => 0.0
    t.float    "v_50_tr",         :default => 0.0
    t.float    "v_100_t",         :default => 0.0
    t.float    "v_100_tr",        :default => 0.0
    t.float    "v_200_t",         :default => 0.0
    t.float    "v_200_tr",        :default => 0.0
    t.float    "v_300_t",         :default => 0.0
    t.float    "v_300_tr",        :default => 0.0
    t.float    "v_400_t",         :default => 0.0
    t.float    "v_400_tr",        :default => 0.0
    t.float    "v_500_t",         :default => 0.0
    t.float    "v_500_tr",        :default => 0.0
    t.float    "v_600_t",         :default => 0.0
    t.float    "v_600_tr",        :default => 0.0
    t.float    "v_700_t",         :default => 0.0
    t.float    "v_700_tr",        :default => 0.0
    t.float    "v_800_t",         :default => 0.0
    t.float    "v_800_tr",        :default => 0.0
    t.float    "v_900_t",         :default => 0.0
    t.float    "v_900_tr",        :default => 0.0
    t.float    "v_1000_t",        :default => 0.0
    t.float    "v_1000_tr",       :default => 0.0
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "value_quarter_sheet_white_raw_materials", :force => true do |t|
    t.integer  "raw_material_id",                   :null => false
    t.float    "base_value",      :default => 0.0
    t.float    "v_10_t",          :default => 0.0
    t.float    "v_10_tr",         :default => 0.0
    t.float    "v_25_t",          :default => 0.0
    t.float    "v_25_tr",         :default => 0.0
    t.float    "v_50_t",          :default => 0.0
    t.float    "v_50_tr",         :default => 0.0
    t.float    "v_100_t",         :default => 0.0
    t.float    "v_100_tr",        :default => 0.0
    t.float    "v_200_t",         :default => 0.0
    t.float    "v_200_tr",        :default => 0.0
    t.float    "v_300_t",         :default => 0.0
    t.float    "v_300_tr",        :default => 0.0
    t.float    "v_400_t",         :default => 0.0
    t.float    "v_400_tr",        :default => 0.0
    t.float    "v_500_t",         :default => 0.0
    t.float    "v_500_tr",        :default => 0.0
    t.float    "v_600_t",         :default => 0.0
    t.float    "v_600_tr",        :default => 0.0
    t.float    "v_700_t",         :default => 0.0
    t.float    "v_700_tr",        :default => 0.0
    t.float    "v_800_t",         :default => 0.0
    t.float    "v_800_tr",        :default => 0.0
    t.float    "v_900_t",         :default => 0.0
    t.float    "v_900_tr",        :default => 0.0
    t.float    "v_1000_t",        :default => 0.0
    t.float    "v_1000_tr",       :default => 0.0
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "value_square_meter_raw_materials", :force => true do |t|
    t.integer  "raw_material_id",                   :null => false
    t.float    "base_value",      :default => 0.0
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "web_page_portfolios", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
