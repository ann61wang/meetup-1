class AddCommentsCountToWeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :weetups, :comments_count, :integer, :default => 0

    Weetup.pluck(:id).each do |i|
      Weetup.reset_counters(i, :comments) # 全部重算一次
    end
  end
end
