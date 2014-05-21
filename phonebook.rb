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
  end

  def get_contact(name)
  end

  def first_contact
  end

  def last_contact
  end

  def select_contact
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
