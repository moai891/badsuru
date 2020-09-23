# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 親階層
shuttle_need    = Shuttle.create(name: "必要")
shuttle_no_need = Shuttle.create(name: "不要")

# 子階層
shuttle_need1 = shuttle_need.children.create(name: "YONEX：ニューオフィシャル")
shuttle_need2 = shuttle_need.children.create(name: "YONEX：エアロセンサ700")
shuttle_need3 = shuttle_need.children.create(name: "YONEX：スタンダード")
shuttle_need4 = shuttle_need.children.create(name: "第2種検定合格球")
shuttle_need5 = shuttle_need.children.create(name: "特になし")

# ユーザー、プロフィール
user1 = User.new( nickname: "テスト太郎", email: "abcdeg@gmail.com", password: "aaaaaa")
profile1 = Profile.new(phonenumber: "0901234567", old: "20", job: "1", experience: "10",practice_time: "5", detail: "テスト太郎です。よろしく", club: "クラブテスト")
user1.build_profile(profile1.attributes)
user1.save

user2 = User.new( nickname: "テスト二郎", email: "fghijg@gmail.com", password: "aaaaaa")
profile2 = Profile.new(phonenumber: "0909876543", old: "19", job: "2", experience: "11",practice_time: "2", detail: "テスト二郎です。", club: "テストチーム")
user2.build_profile(profile2.attributes)
user2.save

# グループ
group1 = Group.new(name: "テストグループ1", detail: "テストグループ1です。")
group1.users << user1
group1.users << user2
group1.save
user1.groups << group1
user1.save
user2.groups << group1
user2.save

# 練習
practice1 = Practice.new(name: "テスト練習1", group_name: "グループテスト", date: "20200923", start_time: "18:00", end_time: "21:00", prefecture_code: "3", city: "渋谷区", place: "渋谷区総合体育館", detail: "テスト練習会です。", visitor_pay: "500", manager_id: "1", member_limit: "10")
practice1.shuttle = Shuttle.find(1)
practice1.users << user1
practice1.users << user2
practice1.save
user1.practices << practice1
user1.save
user2.practices << practice1
user2.save


