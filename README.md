# XYZ Books App

## Built With
* [Ruby on Rails](https://rubyonrails.org/)
* [TailwindCSS](https://tailwindcss.com/)

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
   rake db:seeds
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
