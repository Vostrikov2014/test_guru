# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Answer.delete_all
#Question.delete_all
#Test.delete_all
#Category.delete_all
#User.delete_all

#if User.count.zero?
#  user = User.create(name: 'Dima')
#  user_1 = User.create(name: 'Petay')
#else
#  user = User.find(1)
#  user_1 = User.find(2)
#end

# !!! ВАЖНО перед началом заполнения (rails db:seed) зарегистрируйте пользователя

if Category.count.zero?
  category = Category.create({ title: 'Тесты для ума' })
  category_1 = Category.create({ title: 'Тесты по наукам' })
  category_2 = Category.create({ title: 'Разные тесты' })
else
  category = Category.find(1)
  category_1 = Category.find(2)
  category_2 = Category.find(3)
end

if Test.count.zero?
  test = Test.create({ title: 'Сможешь назвать столицы этих 25 стран?', level: 0, category_id: category.id, author_id: 1 })
  test_1 = Test.create({ title: 'Литертура - 7 вопросов на которые стыдно не знать ответы', level: 1, category_id: category_1.id, author_id: 1 })
  test_2 = Test.create({ title: 'На какого персонажа мультфильмов вы похожи', level: 2, category_id: category_2.id, author_id: 1 })
else
  test = Test.find(1)
  test_1 = Test.find(2)
  test_2 = Test.find(3)
end

if Question.count.zero?
 questions_test_1 = Question.create({ body: 'Назовите столицу Объединенных Арабских Эмиратов?', test_id: test.id })
  questions_test_2 = Question.create({ body: 'Назовите столицу Германии?', test_id: test.id })
  questions_test_3 = Question.create({ body: 'Рожденный ползать летать не может - кто автор этих строк?', test_id: test_1.id })
  questions_test_4 = Question.create({ body: 'Как звали отца татьяны лариной в романе А.С.Пушкина Евгений Онегин?', test_id: test_1.id })
  questions_test_5 = Question.create({ body: 'Где бы вы хотели провести остатки лета?', test_id: test_2.id })
  questions_test_6 = Question.create({ body: 'Сколько у тебя друзей?', test_id: test_2.id })
else
  questions_test_1 = Question.find(1)
  questions_test_2 = Question.find(2)
  questions_test_3 = Question.find(3)
  questions_test_4 = Question.find(4)
  questions_test_5 = Question.find(5)
  questions_test_6 = Question.find(6)
end

if Answer.count.zero?
  Answer.create(body: 'Пекин', correct: false, question_id: questions_test_1.id)
  Answer.create(body: 'Абу-Даби', correct: true, question_id: questions_test_1.id)
  Answer.create(body: 'Эр-рияд', correct: false, question_id: questions_test_1.id)

  Answer.create(body: 'Москва', correct: false, question_id: questions_test_2.id)
  Answer.create(body: 'Лондон', correct: false, question_id: questions_test_2.id)
  Answer.create(body: 'Берлин', correct: true, question_id: questions_test_2.id)

  Answer.create(body: 'Максим Горький', correct: true, question_id: questions_test_3.id)
  Answer.create(body: 'Александр Пушкин', correct: false, question_id: questions_test_3.id)
  Answer.create(body: 'Михаил Булгаков', correct: false, question_id: questions_test_3.id)

  Answer.create(body: 'Илья', correct: false, question_id: questions_test_4.id)
  Answer.create(body: 'Олег', correct: false, question_id: questions_test_4.id)
  Answer.create(body: 'Дмирий', correct: true, question_id: questions_test_4.id)

  Answer.create(body: 'Дома', correct: false, question_id: questions_test_5.id)
  Answer.create(body: 'На даче', correct: false, question_id: questions_test_5.id)
  Answer.create(body: 'На море', correct: true, question_id: questions_test_5.id)

  Answer.create(body: 'Много, сразу не сосчитать', correct: false, question_id: questions_test_6.id)
  Answer.create(body: 'Всех моих друзей можно сосчитать на пальцах одной руки', correct: true, question_id: questions_test_6.id)
  Answer.create(body: 'Друзей нет одни знакомые', correct: false, question_id: questions_test_6.id)
end


# seeds составлен по материалам сайта https://ustaliy.ru/
# ПРИМЕЧАНИЕ  тест "На какой персонаж мультфильма вы похожи" не являестя корректным с точки зрения самого теста
# взято в учебных целях
