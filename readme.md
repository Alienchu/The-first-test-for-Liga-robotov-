# Задание 1

## Описание задачи
Предметная область — издательство. Спроектировать структуру реляционной БД, содержащую следующие сущности:

- Книги: ID, ISBN, авторы, название, количество страниц, жанры, дата публикации
- Авторы: ID, Имя, Фамилия
- Жанры: ID, название

### Требования к реализации модели предметной области
- Книга может быть написана несколькими авторами
- Книга может относиться к нескольким жанрам

### Требования к выполненному заданию
- Сделан отдельный SQL-скрипт с тестовым набором данных
- Сделан отдельный SQL-скрипт, который выводит название книги и ее авторов для жанра "Фантастика"
- Сделан отдельный SQL-скрипт, который выводит автора, который написал больше всего книг
- Код будет запускаться на MySQL версии не ниже 5.6
- Плюсом будет наличие визуальной схемы БД

# Задание 2

## Описание задачи
Необходимо реализовать форму обратной связи с полями:

- Комментарий
- ФИО (обязательное поле)
- Адрес
- Email
- Мобильный телефон (обязательное поле)

### Дополнительные требования
- Поля ФИО и мобильный телефон обязательны к заполнению
- Добавить валидацию полей мобильного телефона и email
- На стороне бэкенда производить повторную проверку обязательных полей, и если указана почта в домене @gmail.com, то возвращать ошибку с сообщением о невозможности регистрации пользователей с таким почтовым адресом
- Данные успешно заполненных форм хранить на бэкенде в файле или реляционной БД (например, SQLite/MySQL)


### Дополнительный балл от руководителя группы фронтенда
- Для подсказок пользовательского ввода в поля ФИО и адрес использовать бесплатный сервис "Подсказки" от DaData
- Решить задачу с использованием фреймворка Vue.js на клиентской стороне
