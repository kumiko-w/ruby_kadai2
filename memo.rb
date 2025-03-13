require 'csv'

loop do
  puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
  memo_type = gets.to_i
    
  if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください(例：テスト.csvを作りたい場合はテストと入力）"
    file_name = gets.chomp
    puts "新しいメモの内容を入力してください（Ctrl+D で保存）"
    memo_content = $stdin.read
    CSV.open("#{file_name}.csv", "w") do |csv|
      memo_content.split("\n").each { |line| csv << [line] }
    end
    puts "#{file_name} を作成しました。"
    break # ループを終了
        
  elsif memo_type == 2
    puts "編集するファイル名を拡張子を除いて入力してください（例：テスト.csv の場合はテストと入力）"
    file_name = gets.chomp
    puts "追記する内容を入力してください（Ctrl+D で保存）"
    memo_content = $stdin.read
    CSV.open("#{file_name}.csv", "a") do |csv|
      memo_content.split("\n").each { |line| csv << [line] }
    end
    puts "#{file_name} に追記しました。"
    break # ループを終了
        
  else
    puts "1か2を入力してください"
  end
end

