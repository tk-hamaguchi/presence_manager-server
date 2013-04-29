class Constants < Settingslogic
  source "#{Rails.root}/config/constants.yml"
  #http://qiita.com/items/9d81c80dafcc4c73f026
  # こうすることで環境ごとに定数を切り分けられる
  namespace Rails.env
end
