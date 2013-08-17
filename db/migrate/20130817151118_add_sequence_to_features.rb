class AddSequenceToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :sequence, :integer
    execute "CREATE SEQUENCE features_sequence_seq OWNED BY features.sequence INCREMENT BY 1 START WITH 1"
  end
end
