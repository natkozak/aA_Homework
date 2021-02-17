require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  #good
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  #untested
  def self.find_by_name
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT  
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    return nil unless person.length > 0

    Playwright.new(person.first)
  end

  #untested
  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  #untested
  def create
    #keep forgetting raises
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year) -- don't need self.id in this list
      INSERT INTO
        playwrights (name, birth_year) -- or in this one
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  #untested
  def update
    #keep forgetting raises
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id) -- id is last here because it's called in the WHERE part
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  #untested
  def get_plays
    #keep forgetting raises
    PlayDBConnection.instance.execute(<<-SQL, )
      SELECT
        *
      FROM
        plays
      --JOIN
      --  playwrights BY plays.playwright_id = playwright.id
      --no join here, just do a where
      WHERE
        playwright_id = ?
    SQL
  end
  #then map it:
  plays.map { |play| Play.new(play)}

end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  #untested
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  #untested
  def self.find_by_title(title)
    PlayDBConnection.instance.execute("SELECT title FROM plays WHERE title = ?")
    #forgot to let the user input the title

    #gotta account for bad input (return nil)

    #gotta store it somewhere
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    return nil unless play.length > 0

    Play.new(play.first) # play is stored in an array!
  end

  #untested
  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute("SELECT name FROM playwrights WHERE playwright_id = ?")
    #don't you have to join here? won't this not work?
    #ohhh, it calls Playwright.find_by_name(name)

    Play.new(play.first) #I don't understand why this has to be a map instead
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    raise "#{name} not found in DB" unless playwright

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL

    plays.map { |play| Play.new(play) }
  end


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
