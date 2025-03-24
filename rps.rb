hands = ["グー", "チョキ", "パー"]
directions = ["上", "下", "左", "右"]

def get_valid_input(prompt, valid_range)
  input = nil
  loop do
    puts prompt
    input = gets.chomp
    if input.match?(/^\d+$/) && valid_range.include?(input.to_i)
      break
    else
      puts "無効な入力です。もう一度入力してください。"
    end
  end
  input.to_i
end

loop do
  puts "じゃんけん…"
  rps_type = get_valid_input("0: グー, 1: チョキ, 2: パー, 3: 戦わない", (0..3))

  if rps_type == 3
    puts "終了します"
    break
  end

  computer_hand = rand(3)

  puts "ホイ！"
  puts "---------------"
  puts "あなた：#{hands[rps_type]}"
  puts "相手：#{hands[computer_hand]}"
  puts "---------------"

  if rps_type == computer_hand
    puts "あいこです！もう一度じゃんけん！"
    next
  end

  player_wins = (rps_type == 0 && computer_hand == 1) ||
                (rps_type == 1 && computer_hand == 2) ||
                (rps_type == 2 && computer_hand == 0)

  if player_wins
    puts "あなたの勝ち！"
    winner, loser = "あなた", "相手"
  else
    puts "相手の勝ち！"
    winner, loser = "相手", "あなた"
  end

  puts "あっち向いて…"
  player_direction = get_valid_input("0: 上, 1: 下, 2: 左, 3: 右", (0..3))
  computer_direction = rand(4)

  puts "ホイ！"
  puts "---------------"
  puts "#{winner}：#{directions[player_direction]}"
  puts "#{loser}：#{directions[computer_direction]}"
  puts "---------------"

  if player_direction == computer_direction
    puts "#{winner}の勝ちです！"
    break
  else
    puts "じゃんけん！"
  end
end

