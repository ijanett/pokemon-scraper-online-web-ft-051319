class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        self.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id= ?", new_hp, self.id)
    end
end
