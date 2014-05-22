require "sqlite3"
class Phonebook

  attr_reader :db

  def initialize
    @db = SQLite3::Database.new("test.db")
    drop_old_data
    create_database
  end

  def add_contact(name, phone_number)
    @db.execute("INSERT INTO contacts VALUES (?, ?);", [name, phone_number])
  end

  def all_contacts
    @db.execute("SELECT * FROM contacts;")
  end

  def get_contact(name)
    @db.execute("SELECT phone_number FROM contacts WHERE name = '#{name}';")
  end

  def first_contact
    @db.execute("SELECT * FROM contacts ").first
  end

  def last_contact
    @db.execute("SELECT * FROM contacts ").last
  end

  def select_contact(column,value)
    @db.execute("SELECT * FROM contacts WHERE #{column} = '#{value}';")
  end

private

  def create_database
    rows = @db.execute <<-SQL
      create table contacts (
        name varchar(30),
        phone_number varchar(30)
      );
    SQL
  end

  def drop_old_data
    @db.execute("drop table contacts;") rescue nil
  end

end
