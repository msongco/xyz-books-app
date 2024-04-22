# XYZ Books App

XYZ Books App is an application wherein you can search for books using it's International Standard Book Number or ISBN. There are two ISBN systems available - these are the ISBN-13 and ISBN-10. This application has the ability to convert ISBN-13 to ISBN-10 and vice versa.

## Built With
* [Ruby on Rails](https://rubyonrails.org/)
* [TailwindCSS](https://tailwindcss.com/)

## Endpoints 

| Endpoint  | Result |
| ------------- | ------------- |
| /api/v1/books  | list of all books in JSON format  |
| /api/v1/books/:isbn_13  | book details using its ISBN-13 in JSON format |
| /api/v1/convert_isbn?isbn=:isbn_13 | convert the stated ISBN-13 to ISBN-10 |
| /api/v1/convert_isbn?isbn=:isbn_10 | convert the stated ISBN-10 to ISBN-13 |
| / | root path of the application; can search for a book using its ISBN-13 or ISBN-10 |
| /books | list of books in a tabular form |
| /books/search?isbn=:isbn_13 | search for a book using its ISBN-13 |
| /books/search?isbn=:isbn_10 | search for a book using its ISBN-10 |

**Seach a book using its ISBN-13 or ISBN-10 on the search bar that's located on the navigation bar**


## Available books in the Database
| Title | ISBN_13 | List Price | Publication Year | Publisher ID | Edition | ISBN-10 <br> <i> (Not a field in the database) </i> |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| American Elf | 978-1-891830-85-3 | 1000.00 | 2004 | 1 | Book 2 | 1-891-83085-6 |
| Cosmoknights	| 978-1-60309-454-2 | 2000.00	| 2019 |	2 | Book 1 | 1-603-09454-7 |
| Essex County	| 978-1-60309-038-4 | 500.00  | 1990 | 3 | | 1-603-09038-X |
| Hey, Mister (Vol 1) | 978-1-891830-02-0 | 1200.00 | 2000 | 3 | After School Special | 1-891-83002-3 |
| The Underwater Welder | 978-1-60309-398-9 | 3000.00 | 2022 | 4 | | 1-603-09398-2 |



## Getting Started
### Prerequisites
* ruby v 3.2.2 (Used rvm to install the version of ruby; any version manager or methods to download this version can be used)
```
rvm install 3.2.2
```
```
rbenv install 3.2.2
```

### Installation
1. Clone the repository
   ```
   git clone git@github.com:msongco/xyz-books-app.git
   ```
2. Install the gems
   ```
   bundle install
   ```
3. Setup the database then initialize data
   ```
   rake db:setup
   rake db:seed
   ```
4. Migrate the table for active storage attachments & blobs
   ```
   rake db:migrate
   ```

### Running the server
```
rails s
go to 127.0.0.0:3000
```

### Run the tests
```
rails test test/models/book_test.rb
```

```
rails test test/models/author_test.rb
```

```
rails test test/models/publisher_test.rb
```
