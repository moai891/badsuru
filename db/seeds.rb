# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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